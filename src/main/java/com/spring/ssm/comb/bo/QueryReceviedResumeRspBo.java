package com.spring.ssm.comb.bo;

import com.spring.ssm.service.bo.BaseRspBo;

/**
 * @ClassName: QueryReceviedResumeRspBo
 * @Description：查询收到的简历信息 出参
 * @Author: liuguisheng
 * @Date: 2019/3/26 9:08:39
 * @Copyright:2019 www.tydic.com Inc. All rights reserved.
 * 注意：本内容仅限于北京天源迪科信息技术有限公司内部传阅，禁止外泄以及用于其他商业目的
 */
public class QueryReceviedResumeRspBo extends BaseRspBo {

    private static final long serialVersionUID = 3399948563447789663L;

    /**
     * 唯一标识
     */
    private String id;

    /**
     * 普通用户id
     */
    private String generalId;

    /**
     * 姓名
     */
    private String name;

    /**
     * 年龄
     */
    private String age;

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
     * 投递时间（关系表中获取）
     */
    private String postDate;

    /**
     * 投递职位（关系表中获取）
     */
    private String intentionJob;

    /**
     * 关系表id(修改投递状态时使用)
     */
    private String relInfoId;

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
    public String getAge() {
        return age;
    }

    /**
     * 设置:age
     *
     * @param age
     **/
    public void setAge(String age) {
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

    /**
     * 获取:postDate
     *
     * @return postDate
     **/
    public String getPostDate() {
        return postDate;
    }

    /**
     * 设置:postDate
     *
     * @param postDate
     **/
    public void setPostDate(String postDate) {
        this.postDate = postDate;
    }

    /**
     * 获取:intentionJob
     *
     * @return intentionJob
     **/
    public String getIntentionJob() {
        return intentionJob;
    }

    /**
     * 设置:intentionJob
     *
     * @param intentionJob
     **/
    public void setIntentionJob(String intentionJob) {
        this.intentionJob = intentionJob;
    }

    /**
     * 获取:relInfoId
     *
     * @return relInfoId
     **/
    public String getRelInfoId() {
        return relInfoId;
    }

    /**
     * 设置:relInfoId
     *
     * @param relInfoId
     **/
    public void setRelInfoId(String relInfoId) {
        this.relInfoId = relInfoId;
    }

    @Override
    public String toString() {
        return "QueryReceviedResumeRspBo{" +
                "id='" + id + '\'' +
                ", generalId='" + generalId + '\'' +
                ", name='" + name + '\'' +
                ", age='" + age + '\'' +
                ", sex='" + sex + '\'' +
                ", phone='" + phone + '\'' +
                ", eMail='" + eMail + '\'' +
                ", local='" + local + '\'' +
                ", major='" + major + '\'' +
                ", favrite='" + favrite + '\'' +
                ", slaray='" + slaray + '\'' +
                ", remark='" + remark + '\'' +
                ", postDate='" + postDate + '\'' +
                ", intentionJob='" + intentionJob + '\'' +
                ", relInfoId='" + relInfoId + '\'' +
                super.toString() +
                '}';
    }
}
