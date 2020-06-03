package com.lm.domain;

import com.lm.utils.DateUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

public class UserInfo {

    private Integer id;
    private String username;
    private String password;
    private String uname;
    private String sex;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date brithday;
    private String brithdayStr;
    private String email;
    private String address;
    private String photo;

    //一对多映射，一个用户多篇日记
    private List<Diary> diaries;
    private List<Role> roles;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date getBrithday() {
        return brithday;
    }

    public void setBrithday(Date brithday) {
        this.brithday = brithday;
    }

    public String getBrithdayStr() {
        if(brithday!=null){
            brithdayStr = DateUtils.date2String(brithday,"yyyy-MM-dd HH:mm:ss");
        }
        return brithdayStr;
    }

    public void setBrithdayStr(String brithdayStr) {
        this.brithdayStr = brithdayStr;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public List<Diary> getDiaries() {
        return diaries;
    }

    public void setDiaries(List<Diary> diaries) {
        this.diaries = diaries;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", uname='" + uname + '\'' +
                ", sex='" + sex + '\'' +
                ", brithday=" + brithday +
                ", brithdayStr='" + brithdayStr + '\'' +
                ", email='" + email + '\'' +
                ", address='" + address + '\'' +
                ", photo='" + photo + '\'' +
                ", diaries=" + diaries +
                ", roles=" + roles +
                '}';
    }
}
