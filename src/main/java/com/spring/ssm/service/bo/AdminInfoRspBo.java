package com.spring.ssm.service.bo;

/**
 * @ClassName: AdminInfoRspBo
 * @Description：管理员信息表 出参
 * @Author: liuguisheng
 * @Date: 2019/2/11 18:10:51
 */
public class AdminInfoRspBo extends BaseRspBo{

    private static final long serialVersionUID = -3499161657742995364L;

    private String id;
    private String name;
    private String password;
    private String phone;
    private String sex;
    private Integer age;

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
        return "AdminInfoRspBo{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", sex='" + sex + '\'' +
                ", age=" + age +
                '}' + super.toString();
    }
}
