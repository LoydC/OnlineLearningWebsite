package com.jeeplus.modules.preview.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeeplus.common.persistence.Page;
import com.jeeplus.common.service.CrudService;
import com.jeeplus.common.utils.StringUtils;
import com.jeeplus.modules.preview.entity.ReportForm;
import com.jeeplus.modules.preview.dao.ReportFormDao;


import com.jeeplus.modules.preview.entity.PreclassDuty;
import com.jeeplus.modules.preview.dao.PreclassDutyDao;
import com.jeeplus.modules.preview.entity.PrepracticeDuty;
import com.jeeplus.modules.preview.dao.PrepracticeDutyDao;

/**
 * 预习报告单Service
 * @author loyd
 * @version 2017-08-06
 */
@Service
@Transactional(readOnly = true)
public class ReportFormService extends CrudService<ReportFormDao, ReportForm> {

	@Autowired
	private PreclassDutyDao preclassDutyDao;
	@Autowired
	private PrepracticeDutyDao prepracticeDutyDao;
	
	public ReportForm get(String id) {
		ReportForm reportForm = super.get(id);
		reportForm.setPreclassDutyList(preclassDutyDao.findList(new PreclassDuty(reportForm)));
		reportForm.setPrepracticeDutyList(prepracticeDutyDao.findList(new PrepracticeDuty(reportForm)));
		return reportForm;
	}
	
	public List<ReportForm> findList(ReportForm reportForm) {
		return super.findList(reportForm);
	}
	
	public Page<ReportForm> findPage(Page<ReportForm> page, ReportForm reportForm) {
		return super.findPage(page, reportForm);
	}
	
	@Transactional(readOnly = false)
	public void save(ReportForm reportForm) {
		super.save(reportForm);
		for (PreclassDuty preclassDuty : reportForm.getPreclassDutyList()){
			if (preclassDuty.getId() == null){
				continue;
			}
			if (PreclassDuty.DEL_FLAG_NORMAL.equals(preclassDuty.getDelFlag())){
				if (StringUtils.isBlank(preclassDuty.getId())){
					preclassDuty.setReportForm(reportForm);
					preclassDuty.preInsert();
					preclassDutyDao.insert(preclassDuty);
				}else{
					preclassDuty.preUpdate();
					preclassDutyDao.update(preclassDuty);
				}
			}else{
				preclassDutyDao.delete(preclassDuty);
			}
		}
		for (PrepracticeDuty prepracticeDuty : reportForm.getPrepracticeDutyList()){
			if (prepracticeDuty.getId() == null){
				continue;
			}
			if (PrepracticeDuty.DEL_FLAG_NORMAL.equals(prepracticeDuty.getDelFlag())){
				if (StringUtils.isBlank(prepracticeDuty.getId())){
					prepracticeDuty.setReportForm(reportForm);
					prepracticeDuty.preInsert();
					prepracticeDutyDao.insert(prepracticeDuty);
				}else{
					prepracticeDuty.preUpdate();
					prepracticeDutyDao.update(prepracticeDuty);
				}
			}else{
				prepracticeDutyDao.delete(prepracticeDuty);
			}
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(ReportForm reportForm) {
		super.delete(reportForm);
		preclassDutyDao.delete(new PreclassDuty(reportForm));
		prepracticeDutyDao.delete(new PrepracticeDuty(reportForm));
	}
	
	
}