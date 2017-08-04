package com.jeeplus.modules.filemanagement.entity;

import java.util.Date;

public class PauseBehavior {
	
	Date systemTime;
	
	Double currentTime;

	public Date getSystemTime() {
		return systemTime;
	}

	public void setSystemTime(Date systemTime) {
		this.systemTime = systemTime;
	}

	public Double getCurrentTime() {
		return currentTime;
	}

	public PauseBehavior(Date systemTime, Double currentTime) {
		super();
		this.systemTime = systemTime;
		this.currentTime = currentTime;
	}

	public void setCurrentTime(Double currentTime) {
		this.currentTime = currentTime;
	}
	
}
