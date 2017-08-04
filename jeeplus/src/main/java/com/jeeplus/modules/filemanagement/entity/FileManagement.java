package com.jeeplus.modules.filemanagement.entity;

import java.io.File;
import java.util.List;

import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.google.common.collect.Lists;
import com.jeeplus.common.persistence.DataEntity;
import com.jeeplus.common.utils.excel.annotation.ExcelField;

/**
 * 文件管理Entity
 * @author loyd
 * @version 2017-07-23
 */
public class FileManagement extends DataEntity<FileManagement> {
	
	private static final long serialVersionUID = 1L;
	private FileManagement parent;		// 父级编号
	private String parentIds;		// 所有父级编号
	private String name;		// 名称
	private Integer sort;		// 排序
	private List<Files> filesList = Lists.newArrayList();		// 子表列表
	
	public FileManagement() {
		super();
	}

	public FileManagement(String id){
		super(id);
	}

	@JsonBackReference
	@NotNull(message="父级编号不能为空")
	@ExcelField(title="父级编号", align=2, sort=6)
	public FileManagement getParent() {
		return parent;
	}

	public void setParent(FileManagement parent) {
		this.parent = parent;
	}
	
	@ExcelField(title="所有父级编号", align=2, sort=7)
	public String getParentIds() {
		return parentIds;
	}

	public void setParentIds(String parentIds) {
		this.parentIds = parentIds;
	}
	
	@ExcelField(title="名称", align=2, sort=8)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@NotNull(message="排序不能为空")
	@ExcelField(title="排序", align=2, sort=9)
	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}
	
	public List<Files> getFilesList() {
		return filesList;
	}

	public void setFilesList(List<Files> filesList) {
		this.filesList = filesList;
	}
}