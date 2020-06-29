package com.spring.ssm.service.bo;

/**
 * @ClassName: CompanyInfoRspBo
 * @Description：公司用户信息表 出参
 * @Author: liuguisheng
 * @Date: 2019/2/7 15:01:47
 */
public class CompanyInfoRspBo extends BaseRspBo{

    private static final long serialVersionUID = 3853518244968361324L;

    private String id;
    private String name;
    private String password;
    private String e_maile;
    private String city;
    private String date;
    private String nature;
    private String number;

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

    public String getE_maile() {
        return this.e_maile;
    }

    public void setE_maile(String e_maile) {
        this.e_maile = e_maile;
    }

    public String getCity() {
        return this.city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDate() {
        return this.date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getNumber() {
        return this.number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getNature() {
        return this.nature;
    }

    public void setNature(String nature) {
        this.nature = nature;
    }

    @Override
    public String toString() {
        return "CompanyInfoRspBo{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", e_maile='" + e_maile + '\'' +
                ", city='" + city + '\'' +
                ", date='" + date + '\'' +
                ", nature='" + nature + '\'' +
                ", number='" + number + '\'' +
                '}';
    }
}
