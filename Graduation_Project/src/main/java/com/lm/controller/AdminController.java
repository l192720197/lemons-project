package com.lm.controller;

import com.github.pagehelper.PageInfo;
import com.lm.domain.Role;
import com.lm.domain.UserInfo;
import com.lm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private UserService userService;

    /**
     * 查询指定id的用户
     */
    @RequestMapping("/findById.do")
    public ModelAndView findById(Integer id) throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        UserInfo userInfo = userService.findById(id);
        modelAndView.addObject("user",userInfo);
        modelAndView.setViewName("user_show");
        return modelAndView;
    }

    /**
     * 查询所有用户
     * @return
     * @throws Exception
     */
    @RequestMapping("/findAllUser.do")
    public ModelAndView findAllUser(@RequestParam(name = "page",required = true,defaultValue = "1")int page,
                                    @RequestParam(name = "size",required = true,defaultValue = "4")int size) throws Exception {

        ModelAndView modelAndView = new ModelAndView();

        List<UserInfo> userList = userService.findAllUser(page,size);

        //pageInfo是一个分页Bean
        PageInfo pageInfo = new PageInfo(userList);
        modelAndView.addObject("pageInfo",pageInfo);
        modelAndView.setViewName("user_list");
        return modelAndView;
    }

    /**
     * 添加用户
     */
    @RequestMapping("/saveUser.do")
    public String saveUser(UserInfo userInfo) throws Exception{
        userService.saveUser(userInfo);
        return "redirect:findAllUser.do";
    }

    /**
     * 为用户添加角色,查询用户以及用户可以添加的角色
     */
    @RequestMapping("/findUserByIdAndRole.do")
    public ModelAndView findUserByIdAndRole(@RequestParam(name = "id",required = true) Integer userId) throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        //1、根据用户id查询用户
        UserInfo userInfo = userService.findById(userId);
        //2、根据用户id查询可以添加的角色
        List<Role> otherRoles=userService.findOtherRoles(userId);
        modelAndView.addObject("user",userInfo);
        modelAndView.addObject("roleList",otherRoles);
        modelAndView.setViewName("user_role_add");
        return modelAndView;
    }

}
