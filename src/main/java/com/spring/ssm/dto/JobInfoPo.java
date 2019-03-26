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
     * 公司ID
     */
    private Long companyId;
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
     * 获取:company
     *
     * @return company
     **/
    public String getCompany() {
        return company;
    }

    /**
     * 设置:company
     *
     * @param company
     **/
    public void setCompany(String company) {
        this.company = company;
    }

    /**
     * 获取:local
     *
     * @return local
     **/
    public String getLocal() {
        return local;
    }

    /**
     * 设置:local
     *
     * @param local
     **/
    public void setLocal(String local) {
        this.local = local;
    }

    /**
     * 获取:salary
     *
     * @return salary
     **/
    public String getSalary() {
        return salary;
    }

    /**
     * 设置:salary
     *
     * @param salary
     **/
    public void setSalary(String salary) {
        this.salary = salary;
    }

    /**
     * 获取:number
     *
     * @return number
     **/
    public Integer getNumber() {
        return number;
    }

    /**
     * 设置:number
     *
     * @param number
     **/
    public void setNumber(Integer number) {
        this.number = number;
    }

    /**
     * 获取:date
     *
     * @return date
     **/
    public Long getDate() {
        return date;
    }

    /**
     * 设置:date
     *
     * @param date
     **/
    public void setDate(Long date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "JobInfoPo{" +
                "id=" + id +
                ", companyId=" + companyId +
                ", position='" + position + '\'' +
                ", company='" + company + '\'' +
                ", local='" + local + '\'' +
                ", salary='" + salary + '\'' +
                ", number=" + number +
                ", date=" + date +
                '}';
    }
}
