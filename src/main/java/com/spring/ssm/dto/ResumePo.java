package com.spring.ssm.dto;

/**
 * @ClassName: ResumePo
 * @Description：简历信息表 po
 * @Author: liuguisheng
 * @Date: 2019/3/25 15:55:21
 */
public class ResumePo {
    /**
     * 唯一标识
     */
    private Long id;

    /**
     * 普通用户id
     */
    private Long generalId;

    /**
     * 姓名
     */
    private String name;

    /**
     * 年龄
     */
    private Integer age;

    /**
     * 性别
     */
    private String sex;

    /**
     * 联系电话
     */
    private String phone;

    /**
     * 邮箱
     */
    private String eMail;

    /**
     * 地址
     */
    private String local;

    /**
     * 专业
     */
    private String major;

    /**
     * 爱好
     */
    private String favrite;

    /**
     * 期望薪资
     */
    private String slaray;

    /**
     * 自我简介
     */
    private String remark;

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
     * 获取:name
     *
     * @return name
     **/
    public String getName() {
        return name;
    }

    /**
     * 设置:name
     *
     * @param name
     **/
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取:age
     *
     * @return age
     **/
    public Integer getAge() {
        return age;
    }

    /**
     * 设置:age
     *
     * @param age
     **/
    public void setAge(Integer age) {
        this.age = age;
    }

    /**
     * 获取:sex
     *
     * @return sex
     **/
    public String getSex() {
        return sex;
    }

    /**
     * 设置:sex
     *
     * @param sex
     **/
    public void setSex(String sex) {
        this.sex = sex;
    }

    /**
     * 获取:phone
     *
     * @return phone
     **/
    public String getPhone() {
        return phone;
    }

    /**
     * 设置:phone
     *
     * @param phone
     **/
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * 获取:eMail
     *
     * @return eMail
     **/
    public String geteMail() {
        return eMail;
    }

    /**
     * 设置:eMail
     *
     * @param eMail
     **/
    public void seteMail(String eMail) {
        this.eMail = eMail;
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
     * 获取:major
     *
     * @return major
     **/
    public String getMajor() {
        return major;
    }

    /**
     * 设置:major
     *
     * @param major
     **/
    public void setMajor(String major) {
        this.major = major;
    }

    /**
     * 获取:favrite
     *
     * @return favrite
     **/
    public String getFavrite() {
        return favrite;
    }

    /**
     * 设置:favrite
     *
     * @param favrite
     **/
    public void setFavrite(String favrite) {
        this.favrite = favrite;
    }

    /**
     * 获取:slaray
     *
     * @return slaray
     **/
    public String getSlaray() {
        return slaray;
    }

    /**
     * 设置:slaray
     *
     * @param slaray
     **/
    public void setSlaray(String slaray) {
        this.slaray = slaray;
    }

    /**
     * 获取:remark
     *
     * @return remark
     **/
    public String getRemark() {
        return remark;
    }

    /**
     * 设置:remark
     *
     * @param remark
     **/
    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "ResumePo{" +
                "id=" + id +
                ", generalId=" + generalId +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", sex='" + sex + '\'' +
                ", phone='" + phone + '\'' +
                ", eMail='" + eMail + '\'' +
                ", local='" + local + '\'' +
                ", major='" + major + '\'' +
                ", favrite='" + favrite + '\'' +
                ", slaray='" + slaray + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
