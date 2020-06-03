package com.lm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/test")
public class testController {
    @ResponseBody
    @RequestMapping("/test1.do")
    public String ajaxtest(String test){
        return "success:"+test;
    }
}
