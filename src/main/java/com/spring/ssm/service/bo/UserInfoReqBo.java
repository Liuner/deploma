package com.spring.ssm.service.bo;

import java.io.Serializable;

/**
 * @ClassName: UserInfoReqBo
 * @Description：普通用户信息表 入参
 * @Author: liuguisheng
 * @Date: 2019/2/2 11:27:24
 */
public class UserInfoReqBo implements Serializable {

    private static final long serialVersionUID = 153757357315410402L;

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
        return "UserInfoReqBo{" +
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
                '}';
    }
}
