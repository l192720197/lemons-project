package com.lm.controller;

import com.lm.domain.UserInfo;
import com.lm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 注册用户
     */
    @RequestMapping("/register.do")
    public String register(UserInfo userInfo) throws Exception{
        userService.register(userInfo);
        return "redirect:/login.jsp";
    }
}
