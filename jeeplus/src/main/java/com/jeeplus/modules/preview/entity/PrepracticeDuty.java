package com.jeeplus.modules.preview.entity;


import com.jeeplus.common.persistence.DataEntity;
import com.jeeplus.common.utils.excel.annotation.ExcelField;

/**
 * 预习报告单Entity
 * @author loyd
 * @version 2017-08-02
 */
public class PrepracticeDuty extends DataEntity<PrepracticeDuty> {
	
	private static final long serialVersionUID = 1L;
	private ReportForm reportForm;		// 预习报告单Id 父类
	private String practiceDuty;		// 实习任务
	private String contentAndTarget;		// 内容与目标
	private String doubt;		// 疑问
	
	public PrepracticeDuty() {
		super();
	}

	public PrepracticeDuty(String id){
		super(id);
	}

	public PrepracticeDuty(ReportForm reportForm){
		this.reportForm = reportForm;
	}

	public ReportForm getReportForm() {
		return reportForm;
	}

	public void setReportForm(ReportForm reportForm) {
		this.reportForm = reportForm;
	}
	
	@ExcelField(title="实习任务", align=2, sort=2)
	public String getPracticeDuty() {
		return practiceDuty;
	}

	public void setPracticeDuty(String practiceDuty) {
		this.practiceDuty = practiceDuty;
	}
	
	@ExcelField(title="内容与目标", align=2, sort=3)
	public String getContentAndTarget() {
		return contentAndTarget;
	}

	public void setContentAndTarget(String contentAndTarget) {
		this.contentAndTarget = contentAndTarget;
	}
	
	@ExcelField(title="疑问", align=2, sort=4)
	public String getDoubt() {
		return doubt;
	}

	public void setDoubt(String doubt) {
		this.doubt = doubt;
	}
	
}