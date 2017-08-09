package com.jeeplus.modules.preview.entity;

import javax.validation.constraints.NotNull;

import com.jeeplus.common.persistence.DataEntity;
import com.jeeplus.common.utils.excel.annotation.ExcelField;

/**
 * 学生报告单记录Entity
 * @author loyd
 * @version 2017-08-08
 */
public class StudentRecordsDoubt extends DataEntity<StudentRecordsDoubt> {
	
	private static final long serialVersionUID = 1L;
	private StudentReportformRecords studentReportformRecords;		// 学生预习报告单记录的id 父类
	private String previewDutyId;		// 预习任务
	private Integer flag;		// 是课前学习任务（1）还是实习前学习任务（0）
	private String doubt;		// 疑问
	
	public StudentRecordsDoubt() {
		super();
	}

	public StudentRecordsDoubt(String id){
		super(id);
	}

	public StudentRecordsDoubt(StudentReportformRecords studentReportformRecords){
		this.studentReportformRecords = studentReportformRecords;
	}

	public StudentReportformRecords getStudentReportformRecords() {
		return studentReportformRecords;
	}

	public void setStudentReportformRecords(StudentReportformRecords studentReportformRecords) {
		this.studentReportformRecords = studentReportformRecords;
	}
	
	@ExcelField(title="预习任务", align=2, sort=7)
	public String getPreviewDutyId() {
		return previewDutyId;
	}

	public void setPreviewDutyId(String previewDutyId) {
		this.previewDutyId = previewDutyId;
	}
	
	@NotNull(message="是课前学习任务（1）还是实习前学习任务（0）不能为空")
	@ExcelField(title="是课前学习任务（1）还是实习前学习任务（0）", align=2, sort=8)
	public Integer getFlag() {
		return flag;
	}

	public void setFlag(Integer flag) {
		this.flag = flag;
	}
	
	@ExcelField(title="疑问", align=2, sort=9)
	public String getDoubt() {
		return doubt;
	}

	public void setDoubt(String doubt) {
		this.doubt = doubt;
	}
	
}