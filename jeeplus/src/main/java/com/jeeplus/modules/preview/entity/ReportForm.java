package com.jeeplus.modules.preview.entity;

import java.util.List;
import com.google.common.collect.Lists;

import com.jeeplus.common.persistence.DataEntity;
import com.jeeplus.common.utils.excel.annotation.ExcelField;

/**
 * 预习报告单Entity
 * @author loyd
 * @version 2017-08-06
 */
public class ReportForm extends DataEntity<ReportForm> {
	
	private static final long serialVersionUID = 1L;
	private String reportFormNum;		// 任务单名称
	private String learningContent;		// 学习内容
	private List<PreclassDuty> preclassDutyList = Lists.newArrayList();		// 子表列表
	private List<PrepracticeDuty> prepracticeDutyList = Lists.newArrayList();		// 子表列表
	
	public ReportForm() {
		super();
	}

	public ReportForm(String id){
		super(id);
	}

	@ExcelField(title="任务单名称", align=2, sort=6)
	public String getReportFormNum() {
		return reportFormNum;
	}

	public void setReportFormNum(String reportFormNum) {
		this.reportFormNum = reportFormNum;
	}
	
	@ExcelField(title="学习内容", align=2, sort=7)
	public String getLearningContent() {
		return learningContent;
	}

	public void setLearningContent(String learningContent) {
		this.learningContent = learningContent;
	}
	
	public List<PreclassDuty> getPreclassDutyList() {
		return preclassDutyList;
	}

	public void setPreclassDutyList(List<PreclassDuty> preclassDutyList) {
		this.preclassDutyList = preclassDutyList;
	}
	public List<PrepracticeDuty> getPrepracticeDutyList() {
		return prepracticeDutyList;
	}

	public void setPrepracticeDutyList(List<PrepracticeDuty> prepracticeDutyList) {
		this.prepracticeDutyList = prepracticeDutyList;
	}
}