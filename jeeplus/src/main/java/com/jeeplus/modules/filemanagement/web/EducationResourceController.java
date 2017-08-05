package com.jeeplus.modules.filemanagement.web;

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
import com.jeeplus.modules.filemanagement.entity.EducationResource;
import com.jeeplus.modules.filemanagement.service.EducationResourceService;

/**
 * 教学资源Controller
 * @author loyd
 * @version 2017-08-05
 */
@Controller
@RequestMapping(value = "${adminPath}/filemanagement/educationResource")
public class EducationResourceController extends BaseController {

    @Autowired
    private EducationResourceService educationResourceService;
    
    @ModelAttribute
    public EducationResource get(@RequestParam(required=false) String id) {
        EducationResource entity = null;
        if (StringUtils.isNotBlank(id)){
            entity = educationResourceService.get(id);
        }
        if (entity == null){
            entity = new EducationResource();
        }
        return entity;
    }
    
    /**
     * 教学资源增删改查列表页面
     */
    @RequiresPermissions("filemanagement:educationResource:list")
    @RequestMapping(value = {"list", ""})
    public String list(EducationResource educationResource, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<EducationResource> page = educationResourceService.findPage(new Page<EducationResource>(request, response), educationResource); 
        model.addAttribute("page", page);
        return "modules/filemanagement/educationResourceList";
    }

    /**
     * 查看，增加，编辑教学资源增删改查表单页面
     */
    @RequiresPermissions(value={"filemanagement:educationResource:view","filemanagement:educationResource:add","filemanagement:educationResource:edit"},logical=Logical.OR)
    @RequestMapping(value = "form")
    public String form(EducationResource educationResource, Model model) {
        model.addAttribute("educationResource", educationResource);
        return "modules/filemanagement/educationResourceForm";
    }

    /**
     * 保存教学资源增删改查
     */
    @RequiresPermissions(value={"filemanagement:educationResource:add","filemanagement:educationResource:edit"},logical=Logical.OR)
    @RequestMapping(value = "save")
    public String save(EducationResource educationResource, Model model, RedirectAttributes redirectAttributes) throws Exception{
        if (!beanValidator(model, educationResource)){
            return form(educationResource, model);
        }
        if(!educationResource.getIsNewRecord()){//编辑表单保存
            EducationResource t = educationResourceService.get(educationResource.getId());//从数据库取出记录的值
            MyBeanUtils.copyBeanNotNull2Bean(educationResource, t);//将编辑表单中的非NULL值覆盖数据库记录中的值
            educationResourceService.save(t);//保存
        }else{//新增表单保存
            educationResourceService.save(educationResource);//保存
        }
        addMessage(redirectAttributes, "保存教学资源增删改查成功");
        return "redirect:"+Global.getAdminPath()+"/filemanagement/educationResource/?repage";
    }
    
    /**
     * 删除教学资源增删改查
     */
    @RequiresPermissions("filemanagement:educationResource:del")
    @RequestMapping(value = "delete")
    public String delete(EducationResource educationResource, RedirectAttributes redirectAttributes) {
        educationResourceService.delete(educationResource);
        addMessage(redirectAttributes, "删除教学资源增删改查成功");
        return "redirect:"+Global.getAdminPath()+"/filemanagement/educationResource/?repage";
    }
    
    /**
     * 批量删除教学资源增删改查
     */
    @RequiresPermissions("filemanagement:educationResource:del")
    @RequestMapping(value = "deleteAll")
    public String deleteAll(String ids, RedirectAttributes redirectAttributes) {
        String idArray[] =ids.split(",");
        for(String id : idArray){
            educationResourceService.delete(educationResourceService.get(id));
        }
        addMessage(redirectAttributes, "删除教学资源增删改查成功");
        return "redirect:"+Global.getAdminPath()+"/filemanagement/educationResource/?repage";
    }
    
    /**
     * 导出excel文件
     */
    @RequiresPermissions("filemanagement:educationResource:export")
    @RequestMapping(value = "export", method=RequestMethod.POST)
    public String exportFile(EducationResource educationResource, HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {
        try {
            String fileName = "教学资源增删改查"+DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
            Page<EducationResource> page = educationResourceService.findPage(new Page<EducationResource>(request, response, -1), educationResource);
            new ExportExcel("教学资源增删改查", EducationResource.class).setDataList(page.getList()).write(response, fileName).dispose();
            return null;
        } catch (Exception e) {
            addMessage(redirectAttributes, "导出教学资源增删改查记录失败！失败信息："+e.getMessage());
        }
        return "redirect:"+Global.getAdminPath()+"/filemanagement/educationResource/?repage";
    }

    /**
     * 导入Excel数据

     */
    @RequiresPermissions("filemanagement:educationResource:import")
    @RequestMapping(value = "import", method=RequestMethod.POST)
    public String importFile(MultipartFile file, RedirectAttributes redirectAttributes) {
        try {
            int successNum = 0;
            int failureNum = 0;
            StringBuilder failureMsg = new StringBuilder();
            ImportExcel ei = new ImportExcel(file, 1, 0);
            List<EducationResource> list = ei.getDataList(EducationResource.class);
            for (EducationResource educationResource : list){
                try{
                    educationResourceService.save(educationResource);
                    successNum++;
                }catch(ConstraintViolationException ex){
                    failureNum++;
                }catch (Exception ex) {
                    failureNum++;
                }
            }
            if (failureNum>0){
                failureMsg.insert(0, "，失败 "+failureNum+" 条教学资源增删改查记录。");
            }
            addMessage(redirectAttributes, "已成功导入 "+successNum+" 条教学资源增删改查记录"+failureMsg);
        } catch (Exception e) {
            addMessage(redirectAttributes, "导入教学资源增删改查失败！失败信息："+e.getMessage());
        }
        return "redirect:"+Global.getAdminPath()+"/filemanagement/educationResource/?repage";
    }
    
    /**
     * 下载导入教学资源增删改查数据模板
     */
    @RequiresPermissions("filemanagement:educationResource:import")
    @RequestMapping(value = "import/template")
    public String importFileTemplate(HttpServletResponse response, RedirectAttributes redirectAttributes) {
        try {
            String fileName = "教学资源增删改查数据导入模板.xlsx";
            List<EducationResource> list = Lists.newArrayList(); 
            new ExportExcel("教学资源增删改查数据", EducationResource.class, 1).setDataList(list).write(response, fileName).dispose();
            return null;
        } catch (Exception e) {
            addMessage(redirectAttributes, "导入模板下载失败！失败信息："+e.getMessage());
        }
        return "redirect:"+Global.getAdminPath()+"/filemanagement/educationResource/?repage";
    }
    
    
    

}