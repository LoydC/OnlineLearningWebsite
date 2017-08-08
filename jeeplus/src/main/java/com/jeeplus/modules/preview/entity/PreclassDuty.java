package com.jeeplus.modules.preview.entity;

import com.jeeplus.modules.filemanagement.entity.EducationResource;
import javax.validation.constraints.NotNull;

import com.jeeplus.common.persistence.DataEntity;
import com.jeeplus.common.utils.excel.annotation.ExcelField;

/**
 * 预习报告单Entity
 * @author loyd
 * @version 2017-08-06
 */
public class PreclassDuty extends DataEntity<PreclassDuty> {
	
	private static final long serialVersionUID = 1L;
	private ReportForm reportForm;		// 预习报告单id 父类
	private EducationResource learningResource;		// 学习资源
	private String learningTarget;		// 学习目标
	private String questionAndThinking;		// 问题与思考
	private String doubt;		// 疑问
	
	public PreclassDuty() {
		super();
	}

	public PreclassDuty(String id){
		super(id);
	}

	public PreclassDuty(ReportForm reportForm){
		this.reportForm = reportForm;
	}

	public ReportForm getReportForm() {
		return reportForm;
	}

	public void setReportForm(ReportForm reportForm) {
		this.reportForm = reportForm;
	}
	
	@NotNull(message="学习资源不能为空")
	@ExcelField(title="学习资源", align=2, sort=2)
	public EducationResource getLearningResource() {
		return learningResource;
	}

	public void setLearningResource(EducationResource learningResource) {
		this.learningResource = learningResource;
	}
	
	@ExcelField(title="学习目标", align=2, sort=3)
	public String getLearningTarget() {
		return learningTarget;
	}

	public void setLearningTarget(String learningTarget) {
		this.learningTarget = learningTarget;
	}
	
	@ExcelField(title="问题与思考", align=2, sort=4)
	public String getQuestionAndThinking() {
		return questionAndThinking;
	}

	public void setQuestionAndThinking(String questionAndThinking) {
		this.questionAndThinking = questionAndThinking;
	}
	
	@ExcelField(title="疑问", align=2, sort=5)
	public String getDoubt() {
		return doubt;
	}

	public void setDoubt(String doubt) {
		this.doubt = doubt;
	}
	
}