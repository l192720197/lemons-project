package com.lm.service.impl;

import com.github.pagehelper.PageHelper;
import com.lm.dao.DiaryDao;
import com.lm.dao.UserDao;
import com.lm.domain.Diary;
import com.lm.domain.UserInfo;
import com.lm.service.DiaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@Controller
public class DiaryServiceImpl implements DiaryService {

    @Autowired
    private DiaryDao diaryDao;

    @Override
    public List<Diary> findDiaryByUsername(String username, int page, int size) throws Exception {

        //参数pageNum是页码值，参数pageSize是每页显示条数
        PageHelper.startPage(page,size);
        return diaryDao.findDiaryByUsername(username);
    }

    @Override
    public List<Diary> findDiaryByDiaryName(String diaryName) throws Exception {
        return diaryDao.findDiaryByDiaryName(diaryName);
    }


    @Override
    public void diaryAdd(Diary diary) throws Exception {
        diaryDao.diaryAll(diary);
    }

    @Override
    public void diaryAddComment(Diary diary) throws Exception {
        diaryDao.diaryAddComment(diary);
    }

    @Override
    public void deleteDiary(Integer diaryId) throws Exception {
        diaryDao.deleteDiary(diaryId);
    }

    @Override
    public List<UserInfo> findOneUser(String username) throws Exception {
        return diaryDao.findOneUser(username);
    }

    @Override
    public void updateUser(UserInfo userInfo) throws Exception {
        diaryDao.updateUserTest(userInfo);
        System.out.println("====================="+userInfo.toString()+"========================================");
    }
}
