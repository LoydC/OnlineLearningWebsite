package com.jeeplus.modules.filemanagement.entity;


import com.jeeplus.common.persistence.DataEntity;
import com.jeeplus.common.utils.excel.annotation.ExcelField;

/**
 * 教学资源Entity
 * @author loyd
 * @version 2017-08-05
 */
public class EducationResource extends DataEntity<EducationResource> {
    
    private static final long serialVersionUID = 1L;
    private String course;      // 课程
    public String resourceName;        // 资源名称
    private String displayPath;     // 资源的展示路径
    private String serverPath;      // 服务器路径
    private String type;        // 资源类型
    private String courseNumber;        // 课程编号
    private String chapter;     // 章
    private String section;     // 节
    private String konwledgePoint;      // 知识点
    private String introduction;        // 内容介绍
    private String keyWords;        // 关键词
    private String author;      // 资源编著者
    private String authorUnit;      // 编著者单位
    
    public EducationResource() {
        super();
    }

    public EducationResource(String id){
        super(id);
    }

    @ExcelField(title="课程", align=2, sort=6)
    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }
    
    @ExcelField(title="资源名称", align=2, sort=7)
    public String getResourceName() {
        return resourceName;
    }

    public void setResourceName(String resourceName) {
        this.resourceName = resourceName;
    }
    
    @ExcelField(title="资源的展示路径", align=2, sort=8)
    public String getDisplayPath() {
        return displayPath;
    }

    public void setDisplayPath(String displayPath) {
        this.displayPath = displayPath;
    }
    
    @ExcelField(title="服务器路径", align=2, sort=9)
    public String getServerPath() {
        return serverPath;
    }

    public void setServerPath(String serverPath) {
        this.serverPath = serverPath;
    }
    
    @ExcelField(title="资源类型", dictType="resource_type", align=2, sort=10)
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    
    @ExcelField(title="课程编号", align=2, sort=11)
    public String getCourseNumber() {
        return courseNumber;
    }

    public void setCourseNumber(String courseNumber) {
        this.courseNumber = courseNumber;
    }
    
    @ExcelField(title="章", align=2, sort=12)
    public String getChapter() {
        return chapter;
    }

    public void setChapter(String chapter) {
        this.chapter = chapter;
    }
    
    @ExcelField(title="节", align=2, sort=13)
    public String getSection() {
        return section;
    }

    public void setSection(String section) {
        this.section = section;
    }
    
    @ExcelField(title="知识点", align=2, sort=14)
    public String getKonwledgePoint() {
        return konwledgePoint;
    }

    public void setKonwledgePoint(String konwledgePoint) {
        this.konwledgePoint = konwledgePoint;
    }
    
    @ExcelField(title="内容介绍", align=2, sort=15)
    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }
    
    @ExcelField(title="关键词", align=2, sort=16)
    public String getKeyWords() {
        return keyWords;
    }

    public void setKeyWords(String keyWords) {
        this.keyWords = keyWords;
    }
    
    @ExcelField(title="资源编著者", align=2, sort=17)
    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }
    
    @ExcelField(title="编著者单位", align=2, sort=18)
    public String getAuthorUnit() {
        return authorUnit;
    }

    public void setAuthorUnit(String authorUnit) {
        this.authorUnit = authorUnit;
    }
    
}