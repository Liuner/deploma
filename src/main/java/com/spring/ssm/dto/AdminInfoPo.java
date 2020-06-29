package com.spring.ssm.dto;

import java.io.Serializable;

/**
 * @ClassName: AdminInfoPo
 * @Description：管理员信息表 Po
 * @Author: liuguisheng
 * @Date: 2019/2/11 18:06:13
 */
public class AdminInfoPo implements Serializable {

    private static final long serialVersionUID = -3637958724224260930L;

    private Long id;
    private String name;
    private String password;
    private String phone;
    private String sex;
    private Integer age;

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

    public String getPhone() {
        return this.phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSex() {
        return this.sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Integer getAge() {
        return this.age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return "AdminInfoPo{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", sex='" + sex + '\'' +
                ", age=" + age +
                '}';
    }
}
