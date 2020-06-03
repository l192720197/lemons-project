package com.lm.dao;

import com.lm.domain.Diary;
import com.lm.domain.UserInfo;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface DiaryDao {

    @Select("select * from b_diary where diaryUser=#{username}")
    public List<Diary> findDiaryByUsername(String username) throws Exception;

    @Select("select * from b_diary where diaryName=#{diaryName}")
    public List<Diary> findDiaryByDiaryName(String diaryName) throws Exception;

    @Insert("insert into b_diary(diaryUser,diaryName,diaryContent,diaryWeather,diaryDoc) values(#{diaryUser},#{diaryName},#{diaryContent},#{diaryWeather},#{diaryDoc}) ")
    public void diaryAll(Diary diary) throws Exception;

    @Update("update b_diary set diaryComment=#{diaryComment} where diaryName=#{diaryName}")
    public void diaryAddComment(Diary diary)throws Exception;

    @Delete("delete from b_diary where id=#{diaryId}")
    public void deleteDiary(Integer diaryId) throws Exception;

    @Select("select * from b_user where username=#{username}")
    public List<UserInfo> findOneUser(String username) throws Exception;

    @Update("update b_user set uname=#{uname},sex=#{sex},email=#{email},address=#{address} where username=#{username}")
    public void updateUser(UserInfo userInfo) throws Exception;

    @Update("update b_user set uname=#{uname},sex=#{sex} where username=#{username}")
    public void updateUserTest(UserInfo userInfo) throws Exception;
}
