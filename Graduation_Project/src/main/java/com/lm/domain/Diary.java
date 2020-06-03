package com.lm.domain;

import com.lm.utils.DateUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Diary {

    private Integer id;
    private String diaryUser;
    private String diaryName;
    private String diaryContent;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date diaryTime;
    private String diaryTimeStr;
    private String diaryWeather;
    private String diaryComment;
    private String diaryDoc;


    //一个日记属于一个用户
    private UserInfo userInfo;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDiaryUser() {
        return diaryUser;
    }

    public void setDiaryUser(String diaryUser) {
        this.diaryUser = diaryUser;
    }

    public String getDiaryName() {
        return diaryName;
    }

    public void setDiaryName(String diaryName) {
        this.diaryName = diaryName;
    }

    public String getDiaryContent() {
        return diaryContent;
    }

    public void setDiaryContent(String diaryContent) {
        this.diaryContent = diaryContent;
    }

    public String getDiaryWeather() {
        return diaryWeather;
    }

    public void setDiaryWeather(String diaryWeather) {
        this.diaryWeather = diaryWeather;
    }

    public Date getDiaryTime() {
        return diaryTime;
    }

    public void setDiaryTime(Date diaryTime) {
        this.diaryTime = diaryTime;
    }

    public String getDiaryTimeStr() {
        if(diaryTime!=null){
            diaryTimeStr = DateUtils.date2String(diaryTime,"yyyy-MM-dd HH:mm:ss");
        }
        return diaryTimeStr;
    }

    public void setDiaryTimeStr(String diaryTimeStr) {
        this.diaryTimeStr = diaryTimeStr;
    }

    public String getDiaryComment() {
        return diaryComment;
    }

    public void setDiaryComment(String diaryComment) {
        this.diaryComment = diaryComment;
    }

    public String getDiaryDoc() {
        return diaryDoc;
    }

    public void setDiaryDoc(String diaryDoc) {
        this.diaryDoc = diaryDoc;
    }

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }


}
