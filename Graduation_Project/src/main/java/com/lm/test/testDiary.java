package com.lm.test;

import com.lm.dao.DiaryDao;
import com.lm.domain.Diary;
import com.lm.service.DiaryService;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.File;
import java.io.InputStream;
import java.util.List;

public class testDiary {

    public static void main(String[] args) {
        File file = new File("/res/diaryDoc");
        String path=new File(file, "filename").getPath();
        System.out.println(path);
    }

}
