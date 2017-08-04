package com.jeeplus.modules.filemanagement.dao;

import com.jeeplus.common.persistence.CrudDao;
import com.jeeplus.common.persistence.annotation.MyBatisDao;
import com.jeeplus.modules.filemanagement.entity.FileManagement;

/**
 * 文件管理DAO接口
 * @author loyd
 * @version 2017-07-23
 */
@MyBatisDao
public interface FileManagementDao extends CrudDao<FileManagement> {

	
}