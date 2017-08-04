package com.jeeplus.modules.filemanagement.web;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jeeplus.common.web.BaseController;

import kafka.api.Request;

/**
 * 文件管理Controller
 * 
 * @author loyd
 * @version 2017-07-23
 */
@Controller
@RequestMapping(value = "${adminPath}/video")
public class VideoController extends BaseController {

	@RequestMapping(value = { "list", "" })
	public String play(String videoPath, HttpServletRequest request, HttpServletResponse response,Model model) {
		
		videoPath = "/jeeplus/file/" + videoPath;

		try {
			videoPath= java.net.URLDecoder.decode(videoPath , "UTF-8");	
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} 
		
		model.addAttribute("videoPath",videoPath);
		return "modules/filemanagement/video";

	}

}