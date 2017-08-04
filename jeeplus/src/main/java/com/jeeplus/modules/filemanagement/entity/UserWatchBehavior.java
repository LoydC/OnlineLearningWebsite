package com.jeeplus.modules.filemanagement.entity;

import java.util.List;

public class UserWatchBehavior {

	String userId;
	
	String videoId;
	
	String courseId;
	
	Double totalTime;
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getVideoId() {
		return videoId;
	}

	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}

	public String getCourseId() {
		return courseId;
	}

	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}

	public Double getTotalTime() {
		return totalTime;
	}

	public void setTotalTime(Double totalTime) {
		this.totalTime = totalTime;
	}

	public List<PlayBehavior> getPlayList() {
		return playList;
	}

	public void setPlayList(List<PlayBehavior> playList) {
		this.playList = playList;
	}

	public List<PauseBehavior> getPauseList() {
		return pauseList;
	}

	public void setPauseList(List<PauseBehavior> pauseList) {
		this.pauseList = pauseList;
	}

	public VideotTimeupdate getVideoTimeupdate() {
		return videoTimeupdate;
	}

	public void setVideoTimeupdate(VideotTimeupdate videoTimeupdate) {
		this.videoTimeupdate = videoTimeupdate;
	}

	public UserWatchBehavior(String userId, String videoId, String courseId, Double totalTime) {
		super();
		this.userId = userId;
		this.videoId = videoId;
		this.courseId = courseId;
		this.totalTime = totalTime;
	}

	List<PlayBehavior> playList;
	
	List<PauseBehavior> pauseList;
	
	VideotTimeupdate videoTimeupdate;
}
