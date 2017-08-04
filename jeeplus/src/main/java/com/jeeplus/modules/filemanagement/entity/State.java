package com.jeeplus.modules.filemanagement.entity;

public class State {
	private boolean opened;

	public State(boolean opened){
		this.opened = opened;
	}
	
	public boolean isOpened() {
		return opened;
	}

	public void setOpened(boolean opened) {
		this.opened = opened;
	}
}
