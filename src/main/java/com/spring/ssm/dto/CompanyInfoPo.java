package com.spring.ssm.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName: CompanyInfoPo
 * @Description：公司用户信息表 PO
 * @Author: liuguisheng
 * @Date: 2019/2/7 15:03:32
 * @Copyright:2019 www.tydic.com Inc. All rights reserved.
 * 注意：本内容仅限于北京天源迪科信息技术有限公司内部传阅，禁止外泄以及用于其他商业目的
 */
public class CompanyInfoPo implements Serializable {

    private static final long serialVersionUID = 5219637872691886073L;

    private Long id;
    private String name;
    private String password;
    private String e_maile;
    private String city;
    private Date date;
    private String nature;
    private String number;

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

    public Date getDate() {
        return this.date;
    }

    public void setDate(Date date) {
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
        return "CompanyInfoPo{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", e_maile='" + e_maile + '\'' +
                ", city='" + city + '\'' +
                ", date=" + date +
                ", nature='" + nature + '\'' +
                ", number='" + number + '\'' +
                '}';
    }
}
