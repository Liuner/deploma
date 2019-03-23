package com.spring.ssm.service.bo;

/**
 * @ClassName: RelGeneralJobCompanyRspBo
 * @Description：普通用户 职位 公司 关系表 Mapper(这里用一句话描述这个类的作用)
 * @Author: liuguisheng
 * @Date: 2019/3/23 12:54:53
 * @Copyright:2019 www.tydic.com Inc. All rights reserved.
 * 注意：本内容仅限于北京天源迪科信息技术有限公司内部传阅，禁止外泄以及用于其他商业目的
 */
public class RelGeneralJobCompanyRspBo extends BaseRspBo{

    private static final long serialVersionUID = -6247214238694601349L;

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
        return "RelGeneralJobCompanyRspBo{" +
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
