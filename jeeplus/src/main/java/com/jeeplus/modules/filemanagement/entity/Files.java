package com.jeeplus.modules.filemanagement.entity;


import com.jeeplus.common.persistence.DataEntity;
import com.jeeplus.common.utils.excel.annotation.ExcelField;

/**
 * 文件管理Entity
 * @author loyd
 * @version 2017-07-23
 */
public class Files extends DataEntity<Files> {
	
	private static final long serialVersionUID = 1L;
	private String filePath;		// 文件路径
	private String fileInstraction;		// 文件介绍
	private FileManagement FM_id;		// 文件管理的id 父类
	
	public Files() {
		super();
	}

	public Files(String id){
		super(id);
	}

	public Files(FileManagement FM_id){
		this.FM_id = FM_id;
	}

	@ExcelField(title="文件路径", align=2, sort=6)
	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	@ExcelField(title="文件介绍", align=2, sort=7)
	public String getFileInstraction() {
		return fileInstraction;
	}

	public void setFileInstraction(String fileInstraction) {
		this.fileInstraction = fileInstraction;
	}
	
	public FileManagement getFM_id() {
		return FM_id;
	}

	public void setFM_id(FileManagement FM_id) {
		this.FM_id = FM_id;
	}
	
}