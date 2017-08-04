package com.jeeplus.modules.filemanagement.web;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import com.jeeplus.common.config.Global;
import com.jeeplus.common.persistence.Page;
import com.jeeplus.common.utils.DateUtils;
import com.jeeplus.common.utils.EctractZip;
import com.jeeplus.common.utils.MyBeanUtils;
import com.jeeplus.common.utils.StringUtils;
import com.jeeplus.common.utils.excel.ExportExcel;
import com.jeeplus.common.utils.excel.ImportExcel;
import com.jeeplus.common.web.BaseController;
import com.jeeplus.modules.filemanagement.entity.CourseFile;
import com.jeeplus.modules.filemanagement.entity.FileManagement;
import com.jeeplus.modules.filemanagement.entity.PauseBehavior;
import com.jeeplus.modules.filemanagement.entity.PlayBehavior;
import com.jeeplus.modules.filemanagement.entity.State;
import com.jeeplus.modules.filemanagement.entity.UserWatchBehavior;
import com.jeeplus.modules.filemanagement.entity.VideotTimeupdate;
import com.jeeplus.modules.filemanagement.service.FileManagementService;

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
		
		VideotTimeupdate vt = new VideotTimeupdate();
		
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
		
		vt.setTimeupdate(timeupdate);
		
		uwb.setPlayList(playList);
		uwb.setPauseList(pauseList);
		uwb.setVideoTimeupdate(vt);
		
		String jsonString1 = JSON.toJSONString(uwb);  

		System.out.println(jsonString1);
		
		
		/*结束*/
		
		
        model.addAttribute("nodeJson", jsonString);
		return "modules/filemanagement/fileManagementList";

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

	/**
	 * 查看，增加，编辑文件管理表单页面
	 */
	@RequiresPermissions(value = { "filemanagement:fileManagement:view", "filemanagement:fileManagement:add",
			"filemanagement:fileManagement:edit" }, logical = Logical.OR)
	@RequestMapping(value = "form")
	public String form(FileManagement fileManagement, Model model) {
		model.addAttribute("fileManagement", fileManagement);
		return "modules/filemanagement/fileManagementForm";
	}

	/**
	 * 保存文件管理
	 */
	@RequiresPermissions(value = { "filemanagement:fileManagement:add",
			"filemanagement:fileManagement:edit" }, logical = Logical.OR)
	@RequestMapping(value = "save")
	public String save(FileManagement fileManagement, Model model, RedirectAttributes redirectAttributes)
			throws Exception {
		if (!beanValidator(model, fileManagement)) {
			return form(fileManagement, model);
		}
		if (!fileManagement.getIsNewRecord()) {// 编辑表单保存
			FileManagement t = fileManagementService.get(fileManagement.getId());// 从数据库取出记录的值
			MyBeanUtils.copyBeanNotNull2Bean(fileManagement, t);// 将编辑表单中的非NULL值覆盖数据库记录中的值
			fileManagementService.save(t);// 保存
		} else {// 新增表单保存
			fileManagementService.save(fileManagement);// 保存
		}
		addMessage(redirectAttributes, "保存文件管理成功");
		return "redirect:" + Global.getAdminPath() + "/filemanagement/fileManagement/?repage";
	}

	/**
	 * 删除文件管理
	 */
	@RequiresPermissions("filemanagement:fileManagement:del")
	@RequestMapping(value = "delete")
	public String delete(FileManagement fileManagement, RedirectAttributes redirectAttributes) {
		fileManagementService.delete(fileManagement);
		addMessage(redirectAttributes, "删除文件管理成功");
		return "redirect:" + Global.getAdminPath() + "/filemanagement/fileManagement/?repage";
	}

	/**
	 * 批量删除文件管理
	 */
	@RequiresPermissions("filemanagement:fileManagement:del")
	@RequestMapping(value = "deleteAll")
	public String deleteAll(String ids, RedirectAttributes redirectAttributes) {
		String idArray[] = ids.split(",");
		for (String id : idArray) {
			fileManagementService.delete(fileManagementService.get(id));
		}
		addMessage(redirectAttributes, "删除文件管理成功");
		return "redirect:" + Global.getAdminPath() + "/filemanagement/fileManagement/?repage";
	}

	/**
	 * 导出excel文件
	 */
	@RequiresPermissions("filemanagement:fileManagement:export")
	@RequestMapping(value = "export", method = RequestMethod.POST)
	public String exportFile(FileManagement fileManagement, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes redirectAttributes) {
		try {
			String fileName = "文件管理" + DateUtils.getDate("yyyyMMddHHmmss") + ".xlsx";
			Page<FileManagement> page = fileManagementService.findPage(new Page<FileManagement>(request, response, -1),
					fileManagement);
			new ExportExcel("文件管理", FileManagement.class).setDataList(page.getList()).write(response, fileName)
					.dispose();
			return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导出文件管理记录失败！失败信息：" + e.getMessage());
		}
		return "redirect:" + Global.getAdminPath() + "/filemanagement/fileManagement/?repage";
	}

	/**
	 * 导入Excel数据
	 * 
	 */
	@RequiresPermissions("filemanagement:fileManagement:import")
	@RequestMapping(value = "import", method = RequestMethod.POST)
	public String importFile(MultipartFile file, RedirectAttributes redirectAttributes) {
		try {
			int successNum = 0;
			int failureNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 1, 0);
			List<FileManagement> list = ei.getDataList(FileManagement.class);
			for (FileManagement fileManagement : list) {
				try {
					fileManagementService.save(fileManagement);
					successNum++;
				} catch (ConstraintViolationException ex) {
					failureNum++;
				} catch (Exception ex) {
					failureNum++;
				}
			}
			if (failureNum > 0) {
				failureMsg.insert(0, "，失败 " + failureNum + " 条文件管理记录。");
			}
			addMessage(redirectAttributes, "已成功导入 " + successNum + " 条文件管理记录" + failureMsg);
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入文件管理失败！失败信息：" + e.getMessage());
		}
		return "redirect:" + Global.getAdminPath() + "/filemanagement/fileManagement/?repage";
	}

	/**
	 * 下载导入文件管理数据模板
	 */
	@RequiresPermissions("filemanagement:fileManagement:import")
	@RequestMapping(value = "import/template")
	public String importFileTemplate(HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
			String fileName = "文件管理数据导入模板.xlsx";
			List<FileManagement> list = Lists.newArrayList();
			new ExportExcel("文件管理数据", FileManagement.class, 1).setDataList(list).write(response, fileName).dispose();
			return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入模板下载失败！失败信息：" + e.getMessage());
		}
		return "redirect:" + Global.getAdminPath() + "/filemanagement/fileManagement/?repage";
	}

}