package com.jeeplus.modules.preview.web;

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

import com.google.common.collect.Lists;
import com.jeeplus.common.utils.DateUtils;
import com.jeeplus.common.utils.MyBeanUtils;
import com.jeeplus.common.config.Global;
import com.jeeplus.common.persistence.Page;
import com.jeeplus.common.web.BaseController;
import com.jeeplus.common.utils.StringUtils;
import com.jeeplus.common.utils.excel.ExportExcel;
import com.jeeplus.common.utils.excel.ImportExcel;
import com.jeeplus.modules.preview.entity.StudentReportformRecords;
import com.jeeplus.modules.preview.service.StudentReportformRecordsService;

/**
 * 学生报告单记录Controller
 * @author loyd
 * @version 2017-08-08
 */
@Controller
@RequestMapping(value = "${adminPath}/preview/studentReportformRecords")
public class StudentReportformRecordsController extends BaseController {

	@Autowired
	private StudentReportformRecordsService studentReportformRecordsService;
	
	@ModelAttribute
	public StudentReportformRecords get(@RequestParam(required=false) String id) {
		StudentReportformRecords entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = studentReportformRecordsService.get(id);
		}
		if (entity == null){
			entity = new StudentReportformRecords();
		}
		return entity;
	}
	
	/**
	 * 学生报告单记录列表页面
	 */
	@RequiresPermissions("preview:studentReportformRecords:list")
	@RequestMapping(value = {"list", ""})
	public String list(StudentReportformRecords studentReportformRecords, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<StudentReportformRecords> page = studentReportformRecordsService.findPage(new Page<StudentReportformRecords>(request, response), studentReportformRecords); 
		model.addAttribute("page", page);
		return "modules/preview/studentReportformRecordsList";
	}

	/**
	 * 查看，增加，编辑学生报告单记录表单页面
	 */
	@RequiresPermissions(value={"preview:studentReportformRecords:view","preview:studentReportformRecords:add","preview:studentReportformRecords:edit"},logical=Logical.OR)
	@RequestMapping(value = "form")
	public String form(StudentReportformRecords studentReportformRecords, Model model) {
		model.addAttribute("studentReportformRecords", studentReportformRecords);
		return "modules/preview/studentReportformRecordsForm";
	}

	/**
	 * 保存学生报告单记录
	 */
	@RequiresPermissions(value={"preview:studentReportformRecords:add","preview:studentReportformRecords:edit"},logical=Logical.OR)
	@RequestMapping(value = "save")
	public String save(StudentReportformRecords studentReportformRecords, Model model, RedirectAttributes redirectAttributes) throws Exception{
		if (!beanValidator(model, studentReportformRecords)){
			return form(studentReportformRecords, model);
		}
		if(!studentReportformRecords.getIsNewRecord()){//编辑表单保存
			StudentReportformRecords t = studentReportformRecordsService.get(studentReportformRecords.getId());//从数据库取出记录的值
			MyBeanUtils.copyBeanNotNull2Bean(studentReportformRecords, t);//将编辑表单中的非NULL值覆盖数据库记录中的值
			studentReportformRecordsService.save(t);//保存
		}else{//新增表单保存
			studentReportformRecordsService.save(studentReportformRecords);//保存
		}
		addMessage(redirectAttributes, "保存学生报告单记录成功");
		return "redirect:"+Global.getAdminPath()+"/preview/studentReportformRecords/?repage";
	}
	
	/**
	 * 删除学生报告单记录
	 */
	@RequiresPermissions("preview:studentReportformRecords:del")
	@RequestMapping(value = "delete")
	public String delete(StudentReportformRecords studentReportformRecords, RedirectAttributes redirectAttributes) {
		studentReportformRecordsService.delete(studentReportformRecords);
		addMessage(redirectAttributes, "删除学生报告单记录成功");
		return "redirect:"+Global.getAdminPath()+"/preview/studentReportformRecords/?repage";
	}
	
	/**
	 * 批量删除学生报告单记录
	 */
	@RequiresPermissions("preview:studentReportformRecords:del")
	@RequestMapping(value = "deleteAll")
	public String deleteAll(String ids, RedirectAttributes redirectAttributes) {
		String idArray[] =ids.split(",");
		for(String id : idArray){
			studentReportformRecordsService.delete(studentReportformRecordsService.get(id));
		}
		addMessage(redirectAttributes, "删除学生报告单记录成功");
		return "redirect:"+Global.getAdminPath()+"/preview/studentReportformRecords/?repage";
	}
	
	/**
	 * 导出excel文件
	 */
	@RequiresPermissions("preview:studentReportformRecords:export")
    @RequestMapping(value = "export", method=RequestMethod.POST)
    public String exportFile(StudentReportformRecords studentReportformRecords, HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
            String fileName = "学生报告单记录"+DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
            Page<StudentReportformRecords> page = studentReportformRecordsService.findPage(new Page<StudentReportformRecords>(request, response, -1), studentReportformRecords);
    		new ExportExcel("学生报告单记录", StudentReportformRecords.class).setDataList(page.getList()).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导出学生报告单记录记录失败！失败信息："+e.getMessage());
		}
		return "redirect:"+Global.getAdminPath()+"/preview/studentReportformRecords/?repage";
    }

	/**
	 * 导入Excel数据

	 */
	@RequiresPermissions("preview:studentReportformRecords:import")
    @RequestMapping(value = "import", method=RequestMethod.POST)
    public String importFile(MultipartFile file, RedirectAttributes redirectAttributes) {
		try {
			int successNum = 0;
			int failureNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 1, 0);
			List<StudentReportformRecords> list = ei.getDataList(StudentReportformRecords.class);
			for (StudentReportformRecords studentReportformRecords : list){
				try{
					studentReportformRecordsService.save(studentReportformRecords);
					successNum++;
				}catch(ConstraintViolationException ex){
					failureNum++;
				}catch (Exception ex) {
					failureNum++;
				}
			}
			if (failureNum>0){
				failureMsg.insert(0, "，失败 "+failureNum+" 条学生报告单记录记录。");
			}
			addMessage(redirectAttributes, "已成功导入 "+successNum+" 条学生报告单记录记录"+failureMsg);
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入学生报告单记录失败！失败信息："+e.getMessage());
		}
		return "redirect:"+Global.getAdminPath()+"/preview/studentReportformRecords/?repage";
    }
	
	/**
	 * 下载导入学生报告单记录数据模板
	 */
	@RequiresPermissions("preview:studentReportformRecords:import")
    @RequestMapping(value = "import/template")
    public String importFileTemplate(HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
            String fileName = "学生报告单记录数据导入模板.xlsx";
    		List<StudentReportformRecords> list = Lists.newArrayList(); 
    		new ExportExcel("学生报告单记录数据", StudentReportformRecords.class, 1).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入模板下载失败！失败信息："+e.getMessage());
		}
		return "redirect:"+Global.getAdminPath()+"/preview/studentReportformRecords/?repage";
    }
	
	
	

}