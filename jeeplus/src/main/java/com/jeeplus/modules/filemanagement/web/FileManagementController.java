package com.jeeplus.modules.filemanagement.web;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.jeeplus.common.config.Global;
import com.jeeplus.common.utils.EctractZip;
import com.jeeplus.common.utils.StringUtils;
import com.jeeplus.common.web.BaseController;
import com.jeeplus.modules.filemanagement.entity.CourseFile;
import com.jeeplus.modules.filemanagement.entity.EducationResource;
import com.jeeplus.modules.filemanagement.entity.FileManagement;
import com.jeeplus.modules.filemanagement.entity.PauseBehavior;
import com.jeeplus.modules.filemanagement.entity.PlayBehavior;
import com.jeeplus.modules.filemanagement.entity.State;
import com.jeeplus.modules.filemanagement.entity.UserWatchBehavior;
import com.jeeplus.modules.filemanagement.service.EducationResourceService;
import com.jeeplus.modules.filemanagement.service.FileManagementService;
import com.jeeplus.modules.sys.utils.UserUtils;

/**
 * 文件管理Controller
 * 
 * @author loyd
 * @version 2017-07-23
 */
@Controller
@RequestMapping(value = "${adminPath}/filemanagement/fileManagement")
public class FileManagementController extends BaseController {

	@Autowired
	private FileManagementService fileManagementService;

    @Autowired
    private EducationResourceService educationResourceService;
    
	@ModelAttribute
	public FileManagement get(@RequestParam(required = false) String id) {
		FileManagement entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = fileManagementService.get(id);
		}
		if (entity == null) {
			entity = new FileManagement();
		}
		return entity;
	}

	/**
	 * 文件管理列表页面
	 * 
	 * @return String
	 */
	@RequiresPermissions("filemanagement:fileManagement:list")
	@RequestMapping(value = { "list", "" })
	public String list(FileManagement fileManagement, HttpServletRequest request, HttpServletResponse response,
			Model model) {
		
		//遍历文件夹，将文件夹的json加入model
		List<CourseFile> listJson = new ArrayList<CourseFile>();
		//CourseFile cf1 = new CourseFile("file",new State(false));
		//cf1.setUrl(request.getServletContext().getRealPath("/static"));
		//fileManagementService.traverseFolder(request.getServletContext().getRealPath("/file"), cf1);
		
		File root = new File(request.getServletContext().getRealPath("/file"));
		
		File[] files = root.listFiles();
		
		for (File f : files) {
			if(f.isDirectory()){
				CourseFile cf1 = new CourseFile(f.getName(),new State(false));
				fileManagementService.traverseFolder(f.getAbsolutePath(), cf1);
				listJson.add(cf1);
			}else{
				CourseFile cf1 = new CourseFile(f.getName());
				listJson.add(cf1);
			}
		}

		String jsonString = JSON.toJSONString(listJson);  

		System.out.println(jsonString);
		
		
		/*开始*/
		
		UserWatchBehavior uwb = new UserWatchBehavior("admin","S1023012","VB",480.32);
		
		List<PlayBehavior> playList = new ArrayList<PlayBehavior>();
		playList.add(new PlayBehavior(new Date(),23.5));
		playList.add(new PlayBehavior(new Date(),47.5));
		List<PauseBehavior> pauseList = new ArrayList<PauseBehavior>();
		pauseList.add(new PauseBehavior(new Date(),53.5));
		pauseList.add(new PauseBehavior(new Date(),57.5));
		pauseList.add(new PauseBehavior(new Date(),76.5));
		
		List<Double> timeupdate = new ArrayList<Double>();
		timeupdate.add(23.43);
		timeupdate.add(24.13);
		timeupdate.add(25.43);
		timeupdate.add(26.43);
		timeupdate.add(27.43);
		timeupdate.add(28.43);
		timeupdate.add(29.43);
		timeupdate.add(13.43);
		timeupdate.add(14.43);
		timeupdate.add(15.43);
		timeupdate.add(16.43);
		
		
		uwb.setPlayList(playList);
		uwb.setPauseList(pauseList);
		uwb.setTimeupdate(timeupdate);
		
		String jsonString1 = JSON.toJSONString(uwb);  

		System.out.println(jsonString1);
		
		
		/*结束*/
		
		/***************开始*****************/
		List<EducationResource> resourceList = educationResourceService.findList(new EducationResource());
		CourseFile cf = fileManagementService.getCourseFileList(resourceList);
		jsonString = JSON.toJSONString(cf);  

		System.out.println(jsonString);
		
		
		/******************结束**************/
		
        model.addAttribute("nodeJson", jsonString);
		return "modules/filemanagement/fileManagementList";

	}

	/**
	 * 学生展示列表页面
	 * 
	 * @return String
	 */
	@RequestMapping(value = "student")
	public String studentView(FileManagement fileManagement, HttpServletRequest request, HttpServletResponse response,
			Model model) {
		/***************开始*****************/
		EducationResource er =  new EducationResource();
		er.setCourse(UserUtils.getUser().getPhone());
		List<EducationResource> resourceList = educationResourceService.findList(er);
		CourseFile cf = fileManagementService.getCourseFileList(resourceList);
		List<CourseFile> cfList = cf.getChildren().get(0).getChildren();
		//Collections.sort();
		String jsonString = JSON.toJSONString(cfList);  

		System.out.println(jsonString);
		
		/******************结束**************/
		
        model.addAttribute("nodeJson", jsonString);
		return "modules/filemanagement/studentViewLearningResource";

	}
	
	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public String upload(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("file") MultipartFile file, Model model) throws Exception, IOException {
		
		if (!file.isEmpty()) {

			/**************上传***************/
			String path = request.getServletContext().getRealPath("/file/");
			String filename = file.getOriginalFilename();
			File filepath = new File(path, filename);
			if (!filepath.getParentFile().exists()) {
				filepath.getParentFile().mkdirs();
			}
			file.transferTo(new File(path + File.separator + filename));


			/**************压缩***************/
			EctractZip.Ectract(path+filename,request.getServletContext().getRealPath("/file/"));
			
			/**************删除压缩包***************/
			File zipFile = new File(path+filename);
			zipFile.delete();
			File _MACOSX = new File(path + "_MACOSX");
			if(_MACOSX.exists()){
				_MACOSX.delete();
			}
			
		}

		System.out.println(request.getServletContext().getRealPath("/file/"));
		
		return "redirect:"+Global.getAdminPath()+"/filemanagement/fileManagement";		
	}

}