package com.lm.service;

import com.lm.domain.Diary;
import com.lm.domain.UserInfo;

import java.util.List;

public interface DiaryService {

    List<Diary> findDiaryByUsername(String username,int page,int size) throws Exception;

    List<Diary> findDiaryByDiaryName(String diaryName) throws Exception;

    void diaryAdd(Diary diary) throws Exception;

    void diaryAddComment(Diary diary) throws Exception;

    void deleteDiary(Integer diaryId) throws Exception;

    List<UserInfo> findOneUser(String username) throws Exception;

    void updateUser(UserInfo userInfo) throws Exception;
}
