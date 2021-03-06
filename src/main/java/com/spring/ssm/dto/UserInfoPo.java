package com.spring.ssm.dto;

import java.io.Serializable;

/**
 * @ClassName: UserInfoPo
 * @Description：普通用户信息Po
 * @Author: liuguisheng
 * @Date: 2019/2/2 11:22:07
 */
public class UserInfoPo implements Serializable {

    private static final long serialVersionUID = 780509046962758650L;

    private Long id;
    private String name;
    private String password;
    private Integer age;
    private String sex;
    private String phone;
    private String e_maile;
    private String idNumber;
    private String local;
    private Integer status;

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
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

    public Integer getAge() {
        return this.age;
    }

    public void setAge(Integer age) {
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

    public Integer getStatus() {
        return this.status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "UserInfoPo{" +
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
