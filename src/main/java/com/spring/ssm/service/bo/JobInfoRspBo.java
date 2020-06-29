package com.spring.ssm.service.bo;

/**
 * @ClassName: JobInfoRspBo
 * @Description：职位信息 出参
 * @Author: liuguisheng
 * @Date: 2019/3/8 16:47:23
 */
public class JobInfoRspBo extends BaseRspBo{

    private static final long serialVersionUID = -6530939702728481359L;

    /**
     * ID唯一标识
     */
    private String id;

    /**
     * 公司ID
     */
    private String companyId;

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

    @Override
    public String toString() {
        return "JobInfoRspBo{" +
                "id='" + id + '\'' +
                ", companyId='" + companyId + '\'' +
                ", position='" + position + '\'' +
                ", company='" + company + '\'' +
                ", local='" + local + '\'' +
                ", salary='" + salary + '\'' +
                ", number='" + number + '\'' +
                ", date='" + date + '\'' +
                super.toString() +
                '}';
    }
}
