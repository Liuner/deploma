package com.spring.ssm.comb.bo;

import com.spring.ssm.service.bo.BaseRspBo;

/**
 * @ClassName: QurySendedRspBo
 * @Description：查看已投递职位 入参
 * @Author: liuguisheng
 * @Date: 2019/3/23 17:02:18
 * @Copyright:2019 www.tydic.com Inc. All rights reserved.
 * 注意：本内容仅限于北京天源迪科信息技术有限公司内部传阅，禁止外泄以及用于其他商业目的
 */
public class QurySendedRspBo extends BaseRspBo {

    private static final long serialVersionUID = -8174685444849745948L;

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

    /**
     * 投递状态 0：未读 1：已读 2：邀请面试
     */
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
    public String getNumber() {
        return number;
    }

    /**
     * 设置:number
     *
     * @param number
     **/
    public void setNumber(String number) {
        this.number = number;
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

    @Override
    public String toString() {
        return "QurySendedRspBo{" +
                "id='" + id + '\'' +
                ", position='" + position + '\'' +
                ", company='" + company + '\'' +
                ", local='" + local + '\'' +
                ", salary='" + salary + '\'' +
                ", number='" + number + '\'' +
                ", date='" + date + '\'' +
                ", flag='" + flag + '\'' +
                super.toString() +
                '}';
    }
}
