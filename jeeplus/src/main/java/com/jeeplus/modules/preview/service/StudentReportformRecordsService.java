package com.jeeplus.modules.preview.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeeplus.common.persistence.Page;
import com.jeeplus.common.service.CrudService;
import com.jeeplus.common.utils.StringUtils;
import com.jeeplus.modules.preview.entity.StudentReportformRecords;
import com.jeeplus.modules.preview.dao.StudentReportformRecordsDao;


import com.jeeplus.modules.preview.entity.StudentRecordsDoubt;
import com.jeeplus.modules.preview.dao.StudentRecordsDoubtDao;

/**
 * 学生报告单记录Service
 * @author loyd
 * @version 2017-08-08
 */
@Service
@Transactional(readOnly = true)
public class StudentReportformRecordsService extends CrudService<StudentReportformRecordsDao, StudentReportformRecords> {

	@Autowired
	private StudentRecordsDoubtDao studentRecordsDoubtDao;
	
	public StudentReportformRecords get(String id) {
		StudentReportformRecords studentReportformRecords = super.get(id);
		studentReportformRecords.setStudentRecordsDoubtList(studentRecordsDoubtDao.findList(new StudentRecordsDoubt(studentReportformRecords)));
		return studentReportformRecords;
	}
	
	public List<StudentReportformRecords> findList(StudentReportformRecords studentReportformRecords) {
		return super.findList(studentReportformRecords);
	}
	
	public Page<StudentReportformRecords> findPage(Page<StudentReportformRecords> page, StudentReportformRecords studentReportformRecords) {
		return super.findPage(page, studentReportformRecords);
	}
	
	@Transactional(readOnly = false)
	public void save(StudentReportformRecords studentReportformRecords) {
		super.save(studentReportformRecords);
		for (StudentRecordsDoubt studentRecordsDoubt : studentReportformRecords.getStudentRecordsDoubtList()){
			if (studentRecordsDoubt.getId() == null){
				continue;
			}
			if (StudentRecordsDoubt.DEL_FLAG_NORMAL.equals(studentRecordsDoubt.getDelFlag())){
				if (StringUtils.isBlank(studentRecordsDoubt.getId())){
					studentRecordsDoubt.setStudentReportformRecords(studentReportformRecords);
					studentRecordsDoubt.preInsert();
					studentRecordsDoubtDao.insert(studentRecordsDoubt);
				}else{
					studentRecordsDoubt.preUpdate();
					studentRecordsDoubtDao.update(studentRecordsDoubt);
				}
			}else{
				studentRecordsDoubtDao.delete(studentRecordsDoubt);
			}
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(StudentReportformRecords studentReportformRecords) {
		super.delete(studentReportformRecords);
		studentRecordsDoubtDao.delete(new StudentRecordsDoubt(studentReportformRecords));
	}
	
	
}