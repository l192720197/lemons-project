package com.lm.controller;

import com.github.pagehelper.PageInfo;
import com.lm.domain.Diary;
import com.lm.domain.UserInfo;
import com.lm.service.DiaryService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/diary")
public class DiaryController {

    @Autowired
    private DiaryService diaryService;

    //查询指定账号的用户
    @RequestMapping("/findByUsername.do")
    public ModelAndView findByUsername(String username,
                                       @RequestParam(name = "page", required = true, defaultValue = "1") int page,
                                       @RequestParam(name = "size", required = true, defaultValue = "4") int size
    ) throws Exception {

        ModelAndView modelAndView = new ModelAndView();
        List<Diary> diaryList = diaryService.findDiaryByUsername(username, page, size);
        //pageInfo是一个分页Bean
        PageInfo pageInfo = new PageInfo(diaryList);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.setViewName("diary_list");
        return modelAndView;
    }

    /**
     * 查询细节
     * @param diaryName
     * @return
     * @throws Exception
     */
    @RequestMapping("/findByDiaryname.do")
    public ModelAndView findByDiaryname(String diaryName) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        List<Diary> diaries = diaryService.findDiaryByDiaryName(diaryName);
        modelAndView.addObject("diares", diaries);
        modelAndView.setViewName("diary_details");
        return modelAndView;
    }

    /**
     * 日记添加
     * @param diary
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/diaryAdd.do")
    public String diaryAdd(Diary diary, HttpServletRequest request) throws Exception {
        String path = request.getSession().getServletContext().getRealPath("/res/diaryDoc/");
        File filepath = new File(path);
        CommonsMultipartResolver resolver=new CommonsMultipartResolver(request.getServletContext());
        if (resolver.isMultipart(request)){
            MultipartRequest multipartRequest= (MultipartRequest) request;
            Iterator iterator=multipartRequest.getFileNames();
            while (iterator.hasNext()){
                MultipartFile file=multipartRequest.getFile(iterator.next().toString());
                if (file!=null){
                    String uuid = UUID.randomUUID().toString().replace("-", "");
                    String filename = uuid+"_"+".jpg";
                    File appendimg=new File(filepath,filename);
//                    appendimg.createNewFile();
                    file.transferTo(appendimg);
                    diary.setDiaryDoc("/res/diaryDoc/"+filename);
                }
            }
        }
        diaryService.diaryAdd(diary);
        return "redirect:/pages/diary_index.jsp";
    }


    /**
     * 日记评论
     * @param diary
     * @return
     * @throws Exception
     */
    @RequestMapping("/diaryAddComment.do")
    public String diaryAddComment(Diary diary) throws Exception {
        diaryService.diaryAddComment(diary);
        return "redirect:/pages/diary_index.jsp";
    }

    /**
     *
     * 删除日记
     * @param diaryId
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteDiary.do")
    public String deleteDiary(
            @RequestParam(name = "id",required = true)Integer diaryId
    ) throws Exception{
        diaryService.deleteDiary(diaryId);

        return "redirect:/pages/diary_index.jsp";
    }

    @RequestMapping("/findOneUser.do")
    public ModelAndView findOneUser(String username) throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        List<UserInfo> users=diaryService.findOneUser(username);
        modelAndView.addObject("userInfo",users);
        modelAndView.setViewName("diary_mine");
        return modelAndView;
    }

    /**
     * 修改个人数据
     */
    @RequestMapping("/updateUser.do")
    public String updateUser(UserInfo userInfo) throws Exception{
        diaryService.updateUser(userInfo);
        System.out.println("--------------------"+userInfo.toString()+"--------------------");
        return "redirect:/pages/diary_index.jsp";
    }

}
