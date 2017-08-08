package com.jeeplus.modules.filemanagement.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeeplus.common.persistence.Page;
import com.jeeplus.common.service.CrudService;
import com.jeeplus.modules.filemanagement.entity.CourseFile;
import com.jeeplus.modules.filemanagement.entity.EducationResource;
import com.jeeplus.modules.filemanagement.dao.EducationResourceDao;

/**
 * 教学资源Service
 * @author loyd
 * @version 2017-08-05
 */
@Service
@Transactional(readOnly = true)
public class EducationResourceService extends CrudService<EducationResourceDao, EducationResource> {

    public EducationResource get(String id) {
        return super.get(id);
    }
    
    public List<EducationResource> findList(EducationResource educationResource) {
        return super.findList(educationResource);
    }
    
    public Page<EducationResource> findPage(Page<EducationResource> page, EducationResource educationResource) {
        return super.findPage(page, educationResource);
    }
    
    @Transactional(readOnly = false)
    public void save(EducationResource educationResource) {
        super.save(educationResource);
    }
    
    @Transactional(readOnly = false)
    public void delete(EducationResource educationResource) {
        super.delete(educationResource);
    }

    
}