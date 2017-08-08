package com.jeeplus.modules.filemanagement.entity;

import java.util.List;

public class CourseFile {
	private String text;
	
	private String icon;

	private List<CourseFile> children;

	private State state;

	private String id;
	
	private String pid;
	
	private String pids;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getPids() {
		return pids;
	}

	public void setPids(String pids) {
		this.pids = pids;
	}

	public State getState() {
		return state;
	}

	public void setState(State state) {
		this.state = state;
	}

	public CourseFile(String text, State state) {
		this.text = text;
		this.state = state;
	}

	public CourseFile(String text) {
		this.text = text;
		if (text.contains(".pdf")) {
			this.icon = "fa fa-file-pdf-o";
		} else if (text.contains(".doc") || text.contains(".docx")) {
			this.icon = "fa fa-file-word-o";
		}else if (text.contains(".png") || text.contains(".jpg")) {
			this.icon = "fa fa-file-picture-o";	
		}else if (text.contains(".ppt") || text.contains(".pptx")) {
			this.icon = "fa fa-file-powerpoint-o";
		}
		else if (text.contains(".html") ||text.contains(".java") || text.contains(".css")|| text.contains(".js")|| text.contains(".c")|| text.contains(".cpp")|| text.contains(".vb")) {
			this.icon = "fa fa-file-code-o";
		}else if (text.contains(".zip") || text.contains(".rar")) {
			this.icon = "fa fa-file-zip-o";
		}else if (text.contains(".xlsx") || text.contains(".xls")) {
			this.icon = "fa fa-file-excel-o";
		}else if (text.contains(".mp4") || text.contains(".avi")|| text.contains(".mov")|| text.contains(".mpeg4")|| text.contains(".mpg")|| text.contains(".wmv")|| text.contains(".rmvb")) {
			this.icon = "fa fa-file-movie-o";
		}
		else{
			this.icon = "fa fa-file-o";
		}
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
	
	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public List<CourseFile> getChildren() {
		return children;
	}

	public void setChildren(List<CourseFile> children) {
		this.children = children;
	}

}
