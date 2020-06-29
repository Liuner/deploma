package com.spring.ssm.service.bo;

import java.io.Serializable;

/**
 * @ClassName: RelGeneralJobCompanyReqBo
 * @Description：普通用户 职位 公司关系表 入参
 * @Author: liuguisheng
 * @Date: 2019/3/23 12:51:23
 */
public class RelGeneralJobCompanyReqBo implements Serializable {

    private static final long serialVersionUID = 4352232451867686836L;

    private String id;

    private String generalId;

    private String companyId;

    private String resumeId;

    private String jobId;

    private String position;

    private String date;

    private String flag;

    /**
     * 获取:id
     *
     * @return id
     **/
    public String getId() {
        return id;
    }

    /**
     * 设置:id
     *
     * @param id
     **/
    public void setId(String id) {
        this.id = id;
    }

    /**
     * 获取:generalId
     *
     * @return generalId
     **/
    public String getGeneralId() {
        return generalId;
    }

    /**
     * 设置:generalId
     *
     * @param generalId
     **/
    public void setGeneralId(String generalId) {
        this.generalId = generalId;
    }

    /**
     * 获取:companyId
     *
     * @return companyId
     **/
    public String getCompanyId() {
        return companyId;
    }

    /**
     * 设置:companyId
     *
     * @param companyId
     **/
    public void setCompanyId(String companyId) {
        this.companyId = companyId;
    }

    /**
     * 获取:jobId
     *
     * @return jobId
     **/
    public String getJobId() {
        return jobId;
    }

    /**
     * 设置:jobId
     *
     * @param jobId
     **/
    public void setJobId(String jobId) {
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
    public String getDate() {
        return date;
    }

    /**
     * 设置:date
     *
     * @param date
     **/
    public void setDate(String date) {
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

    /**
     * 获取:resumeId
     *
     * @return resumeId
     **/
    public String getResumeId() {
        return resumeId;
    }

    /**
     * 设置:resumeId
     *
     * @param resumeId
     **/
    public void setResumeId(String resumeId) {
        this.resumeId = resumeId;
    }

    @Override
    public String toString() {
        return "RelGeneralJobCompanyReqBo{" +
                "id='" + id + '\'' +
                ", generalId='" + generalId + '\'' +
                ", companyId='" + companyId + '\'' +
                ", resumeId='" + resumeId + '\'' +
                ", jobId='" + jobId + '\'' +
                ", position='" + position + '\'' +
                ", date='" + date + '\'' +
                ", flag='" + flag + '\'' +
                super.toString() +
                '}';
    }
}
