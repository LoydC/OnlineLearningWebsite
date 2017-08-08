package com.jeeplus.modules.preview.dao;

import com.jeeplus.modules.filemanagement.entity.EducationResource;
import java.util.List;
import com.jeeplus.common.persistence.CrudDao;
import com.jeeplus.common.persistence.annotation.MyBatisDao;
import com.jeeplus.modules.preview.entity.PreclassDuty;

/**
 * 预习报告单DAO接口
 * @author loyd
 * @version 2017-08-06
 */
@MyBatisDao
public interface PreclassDutyDao extends CrudDao<PreclassDuty> {

	public List<EducationResource> findListBylearningResource(EducationResource learningResource);
	
}