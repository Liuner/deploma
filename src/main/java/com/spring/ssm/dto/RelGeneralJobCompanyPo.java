package com.spring.ssm.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName: RelGeneralJobCompanyPo
 * @Description：普通用户 职位 公司 关系表
 * @Author: liuguisheng
 * @Date: 2019/3/23 9:05:10
 * @Copyright:2019 www.tydic.com Inc. All rights reserved.
 * 注意：本内容仅限于北京天源迪科信息技术有限公司内部传阅，禁止外泄以及用于其他商业目的
 */
public class RelGeneralJobCompanyPo implements Serializable {

    private static final long serialVersionUID = 4562655222005950158L;

    private Long id;

    private Long generalId;

    private Long companyId;

    private Long resumeId;

    private Long jobId;

    private String position;

    private Date date;

    private String flag;

    /**
     * 获取:id
     *
     * @return id
     **/
    public Long getId() {
        return id;
    }

    /**
     * 设置:id
     *
     * @param id
     **/
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 获取:generalId
     *
     * @return generalId
     **/
    public Long getGeneralId() {
        return generalId;
    }

    /**
     * 设置:generalId
     *
     * @param generalId
     **/
    public void setGeneralId(Long generalId) {
        this.generalId = generalId;
    }

    /**
     * 获取:companyId
     *
     * @return companyId
     **/
    public Long getCompanyId() {
        return companyId;
    }

    /**
     * 设置:companyId
     *
     * @param companyId
     **/
    public void setCompanyId(Long companyId) {
        this.companyId = companyId;
    }

    /**
     * 获取:resumeId
     *
     * @return resumeId
     **/
    public Long getResumeId() {
        return resumeId;
    }

    /**
     * 设置:resumeId
     *
     * @param resumeId
     **/
    public void setResumeId(Long resumeId) {
        this.resumeId = resumeId;
    }

    /**
     * 获取:jobId
     *
     * @return jobId
     **/
    public Long getJobId() {
        return jobId;
    }

    /**
     * 设置:jobId
     *
     * @param jobId
     **/
    public void setJobId(Long jobId) {
        this.jobId = jobId;
    }

    /**
     * 获取:position
     *
     * @return position
     **/
    public String getPosition() {
        return position;
    }

    /**
     * 设置:position
     *
     * @param position
     **/
    public void setPosition(String position) {
        this.position = position;
    }

    /**
     * 获取:date
     *
     * @return date
     **/
    public Date getDate() {
        return date;
    }

    /**
     * 设置:date
     *
     * @param date
     **/
    public void setDate(Date date) {
        this.date = date;
    }

    /**
     * 获取:flag
     *
     * @return flag
     **/
    public String getFlag() {
        return flag;
    }

    /**
     * 设置:flag
     *
     * @param flag
     **/
    public void setFlag(String flag) {
        this.flag = flag;
    }

    @Override
    public String toString() {
        return "RelGeneralJobCompanyPo{" +
                "id=" + id +
                ", generalId=" + generalId +
                ", companyId=" + companyId +
                ", resumeId=" + resumeId +
                ", jobId=" + jobId +
                ", position='" + position + '\'' +
                ", date=" + date +
                ", flag='" + flag + '\'' +
                '}';
    }
}
