package com.jeeplus.modules.filemanagement.web;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jeeplus.common.web.BaseController;
import com.jeeplus.modules.filemanagement.entity.EducationResource;
import com.jeeplus.modules.filemanagement.service.EducationResourceService;

/**
 * 文件管理Controller
 * 
 * @author loyd
 * @version 2017-07-23
 */
@Controller
@RequestMapping(value = "${adminPath}/video")
public class VideoController extends BaseController {
	
    @Autowired
    private EducationResourceService educationResourceService;
	
    @RequestMapping(value = { "list", "" })
	public String play(String videoId, HttpServletRequest request, HttpServletResponse response,Model model) {
		
    	EducationResource er = educationResourceService.get(videoId);

    	model.addAttribute("videoId",er.getId());
    	model.addAttribute("videoPath","http://video-js.zencoder.com/oceans-clip.mp4");
		//model.addAttribute("videoPath",er.getServerPath());

    	return "modules/filemanagement/video";

	}

	/*
	 * 点击教学资源展示的form
	 */
    @RequestMapping(value = "form")
    public String form(String videoId, HttpServletRequest request, HttpServletResponse response,Model model) {
        model.addAttribute("educationResource", educationResourceService.get(videoId));
        return "modules/filemanagement/videoResourceForm";
    }
}