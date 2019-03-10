package com.spring.ssm.dto;

import java.io.Serializable;

/**
 * @ClassName: JobInfoPo
 * @Description：职位信息Po
 * @Author: liuguisheng
 * @Date: 2019/3/8 16:18:54
 * @Copyright:2019 www.tydic.com Inc. All rights reserved.
 * 注意：本内容仅限于北京天源迪科信息技术有限公司内部传阅，禁止外泄以及用于其他商业目的
 */
public class JobInfoPo implements Serializable {

    private static final long serialVersionUID = 5435303540876416398L;

    /**
     * ID唯一标识
     */
    private Long id;

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
    private Integer number;

    /**
     * 发布时间
     */
    private Long date;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
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

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Long getDate() {
        return date;
    }

    public void setDate(Long date) {
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
