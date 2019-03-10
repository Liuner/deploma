package com.spring.ssm.service.bo;

/**
 * @ClassName: JobInfoRspBo
 * @Description：职位信息 出参
 * @Author: liuguisheng
 * @Date: 2019/3/8 16:47:23
 * @Copyright:2019 www.tydic.com Inc. All rights reserved.
 * 注意：本内容仅限于北京天源迪科信息技术有限公司内部传阅，禁止外泄以及用于其他商业目的
 */
public class JobInfoRspBo extends BaseRspBo{

    private static final long serialVersionUID = -6530939702728481359L;

    /**
     * ID唯一标识
     */
    private String id;

    /**
     * 职位名称
     */
    private String position;

    /**
     * 公司名称
     */
    private String company;

    /**
     * 工作地址
     */
    private String local;

    /**
     * 薪酬
     */
    private String salary;

    /**
     * 招聘人数
     */
    private String number;

    /**
     * 发布时间
     */
    private String date;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getLocal() {
        return local;
    }

    public void setLocal(String local) {
        this.local = local;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "JobInfoPo{" +
                "id=" + id +
                ", position='" + position + '\'' +
                ", company='" + company + '\'' +
                ", local='" + local + '\'' +
                ", salary='" + salary + '\'' +
                ", number=" + number +
                ", date=" + date +
                '}';
    }
}
