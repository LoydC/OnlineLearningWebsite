package com.jeeplus.modules.preview.entity;

import javax.validation.constraints.NotNull;
import java.util.List;
import com.google.common.collect.Lists;

import com.jeeplus.common.persistence.DataEntity;
import com.jeeplus.common.utils.excel.annotation.ExcelField;

/**
 * 学生报告单记录Entity
 * @author loyd
 * @version 2017-08-08
 */
public class StudentReportformRecords extends DataEntity<StudentReportformRecords> {
	
	private static final long serialVersionUID = 1L;
	private String reportForm;		// 实验报告单
	private Double spendTime;		// 学习花费时间
	private String learnDifficulty;		// 学习难度
	private String learnTarget;		// 学习目标完成度
	private String existProblem;		// 存在问题
	private String advice;		// 建议
	private List<StudentRecordsDoubt> studentRecordsDoubtList = Lists.newArrayList();		// 子表列表
	
	public StudentReportformRecords() {
		super();
	}

	public StudentReportformRecords(String id){
		super(id);
	}

	@ExcelField(title="实验报告单", align=2, sort=6)
	public String getReportForm() {
		return reportForm;
	}

	public void setReportForm(String reportForm) {
		this.reportForm = reportForm;
	}
	
	@NotNull(message="学习花费时间不能为空")
	@ExcelField(title="学习花费时间", align=2, sort=7)
	public Double getSpendTime() {
		return spendTime;
	}

	public void setSpendTime(Double spendTime) {
		this.spendTime = spendTime;
	}
	
	@ExcelField(title="学习难度", dictType="learning_difficulty", align=2, sort=8)
	public String getLearnDifficulty() {
		return learnDifficulty;
	}

	public void setLearnDifficulty(String learnDifficulty) {
		this.learnDifficulty = learnDifficulty;
	}
	
	@ExcelField(title="学习目标完成度", dictType="learning_target_degree", align=2, sort=9)
	public String getLearnTarget() {
		return learnTarget;
	}

	public void setLearnTarget(String learnTarget) {
		this.learnTarget = learnTarget;
	}
	
	@ExcelField(title="存在问题", align=2, sort=10)
	public String getExistProblem() {
		return existProblem;
	}

	public void setExistProblem(String existProblem) {
		this.existProblem = existProblem;
	}
	
	@ExcelField(title="建议", align=2, sort=11)
	public String getAdvice() {
		return advice;
	}

	public void setAdvice(String advice) {
		this.advice = advice;
	}
	
	public List<StudentRecordsDoubt> getStudentRecordsDoubtList() {
		return studentRecordsDoubtList;
	}

	public void setStudentRecordsDoubtList(List<StudentRecordsDoubt> studentRecordsDoubtList) {
		this.studentRecordsDoubtList = studentRecordsDoubtList;
	}
}