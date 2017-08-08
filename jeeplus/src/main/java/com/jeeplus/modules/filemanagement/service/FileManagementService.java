/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.filemanagement.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeeplus.common.persistence.Page;
import com.jeeplus.common.service.CrudService;
import com.jeeplus.common.utils.StringUtils;
import com.jeeplus.modules.filemanagement.dao.FileManagementDao;
import com.jeeplus.modules.filemanagement.dao.FilesDao;
import com.jeeplus.modules.filemanagement.entity.CourseFile;
import com.jeeplus.modules.filemanagement.entity.EducationResource;
import com.jeeplus.modules.filemanagement.entity.FileManagement;
import com.jeeplus.modules.filemanagement.entity.Files;
import com.jeeplus.modules.filemanagement.entity.State;

/**
 * 文件管理Service
 * 
 * @author loyd
 * @version 2017-07-23
 */
@Service
@Transactional(readOnly = true)
public class FileManagementService extends CrudService<FileManagementDao, FileManagement> {

	@Autowired
	private FilesDao filesDao;

	public FileManagement get(String id) {
		FileManagement fileManagement = super.get(id);
		fileManagement.setFilesList(filesDao.findList(new Files(fileManagement)));
		return fileManagement;
	}

	public List<FileManagement> findList(FileManagement fileManagement) {
		return super.findList(fileManagement);
	}

	public Page<FileManagement> findPage(Page<FileManagement> page, FileManagement fileManagement) {
		return super.findPage(page, fileManagement);
	}

	/*
	 * 遍历文件夹
	 */
	public void traverseFolder(String path, CourseFile cf) {
		List<CourseFile> list = new ArrayList<CourseFile>();
		File file = new File(path);
		if (file.exists()) {
			File[] files = file.listFiles();
			if (files.length != 0) {
				for (File file2 : files) {
					if (file2.isDirectory()) {
						CourseFile cfDir = new CourseFile(file2.getName(), new State(false));
						list.add(cfDir);
						traverseFolder(file2.getAbsolutePath(), cfDir);
					} else {
						CourseFile cfFile = new CourseFile(file2.getName());
						list.add(cfFile);
					}
				}
			}
		} else {
			System.out.println("文件不存在!");
		}
		cf.setChildren(list);
	}

	@Transactional(readOnly = false)
	public void save(FileManagement fileManagement) {
		super.save(fileManagement);
		for (Files files : fileManagement.getFilesList()) {
			if (files.getId() == null) {
				continue;
			}
			if (Files.DEL_FLAG_NORMAL.equals(files.getDelFlag())) {
				if (StringUtils.isBlank(files.getId())) {
					files.setFM_id(fileManagement);
					files.preInsert();
					filesDao.insert(files);
				} else {
					files.preUpdate();
					filesDao.update(files);
				}
			} else {
				filesDao.delete(files);
			}
		}
	}

	@Transactional(readOnly = false)
	public void delete(FileManagement fileManagement) {
		super.delete(fileManagement);
		filesDao.delete(new Files(fileManagement));
	}

	/*
	 * 根据所有的教学资源返回CourseFile，进而生成文件树
	 * @param 全部的教学资源
	 */
	public CourseFile getCourseFileList(List<EducationResource> resourceList){
		
		int count = 1;
		
		CourseFile root = new CourseFile("root",new State(true));
		root.setId(count+"");
		root.setPid("0");
		root.setPids("0");
		root.setText("课程资源");
		
		for(EducationResource er : resourceList){
			String[] path = er.getDisplayPath().split("\\\\");
			CourseFile temp = root;
			for(String p : path){
				//如果不存在children，new list，新创建一个文件夹并添加
				count++;
				if(temp.getChildren() == null){
					List<CourseFile> children = new ArrayList<CourseFile>();
					CourseFile folder = new CourseFile(p,new State(false));
					folder.setId(count+"");
					folder.setPid(temp.getId());
					folder.setPids(temp.getPids() + "," + temp.getId());
					children.add(folder);
					temp.setChildren(children);
					temp = folder;
				}
				//存在children
				else{
					//获取名字为p的文件夹
					CourseFile folder = isChildrenExist(temp,p);
					if(folder == null){
						CourseFile folder1 = new CourseFile(p,new State(false));
						folder1.setId(count+"");
						folder1.setPid(temp.getId());
						folder1.setPids(temp.getPids() + "," + temp.getId());
						temp.getChildren().add(folder1);
						temp = folder1;
					}else{
						temp = folder;
					}
				}
			}
			count++;
			if(temp.getChildren() == null){
				List<CourseFile> children = new ArrayList<CourseFile>();
				CourseFile file = new CourseFile(er.getResourceName());
				file.setId(er.getId());
				file.setPid(temp.getId());
				file.setPids(temp.getPids() + "," + temp.getId());
				children.add(file);
				temp.setChildren(children);
			}else{
				CourseFile file = new CourseFile(er.getResourceName());
				file.setId(er.getId());
				file.setPid(temp.getId());
				file.setPids(temp.getPids() + "," + temp.getId());
				temp.getChildren().add(file);
			}
		}
		
		return root;
	} 
	
	/*
	 * 判断CourseFile文件夹下有没有这个文件夹
	 */
	private CourseFile isChildrenExist(CourseFile cf,String childrenName){
		
		List<CourseFile> children = cf.getChildren();
		
		for(CourseFile f : children){
			if(f.getText().equals(childrenName))
			{
				return f;
			}	
		}
		return null;
	}
}