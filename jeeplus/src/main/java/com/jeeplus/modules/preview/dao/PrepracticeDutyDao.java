package com.jeeplus.modules.preview.dao;

import com.jeeplus.modules.filemanagement.entity.EducationResource;
import java.util.List;
import com.jeeplus.common.persistence.CrudDao;
import com.jeeplus.common.persistence.annotation.MyBatisDao;
import com.jeeplus.modules.preview.entity.PrepracticeDuty;

/**
 * 预习报告单DAO接口
 * @author loyd
 * @version 2017-08-06
 */
@MyBatisDao
public interface PrepracticeDutyDao extends CrudDao<PrepracticeDuty> {

	public List<EducationResource> findListBypracticeDuty(EducationResource practiceDuty);
	
}