package com.spring.ssm.service.Bo;

/**
 * @ClassName: UserInfoRspBo
 * @Description：普通用户信息表 出参
 * @Author: liuguisheng
 * @Date: 2019/2/2 11:29:01
 * @Copyright:2019 www.tydic.com Inc. All rights reserved.
 * 注意：本内容仅限于北京天源迪科信息技术有限公司内部传阅，禁止外泄以及用于其他商业目的
 */
public class UserInfoRspBo extends BaseRspBo{

    private static final long serialVersionUID = -7171522450204620705L;

    private String id;
    private String name;
    private String password;
    private int age;
    private String sex;
    private String phone;
    private String e_maile;
    private String idNumber;
    private String local;
    private int status;

    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getAge() {
        return this.age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getSex() {
        return this.sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return this.phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getE_maile() {
        return this.e_maile;
    }

    public void setE_maile(String e_maile) {
        this.e_maile = e_maile;
    }

    public String getIdNumber() {
        return this.idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber;
    }

    public String getLocal() {
        return this.local;
    }

    public void setLocal(String local) {
        this.local = local;
    }

    public int getStatus() {
        return this.status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "UserInfoRspBo{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", age=" + age +
                ", sex='" + sex + '\'' +
                ", phone='" + phone + '\'' +
                ", e_maile='" + e_maile + '\'' +
                ", idNumber='" + idNumber + '\'' +
                ", local='" + local + '\'' +
                ", status=" + status +
                '}'+ super.toString();
    }
}
