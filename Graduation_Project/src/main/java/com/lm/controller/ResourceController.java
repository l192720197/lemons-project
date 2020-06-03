package com.lm.controller;

import com.lm.domain.Permission;
import com.lm.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/permission")
public class ResourceController {

    @Autowired
    private ResourceService resourceService;

    @RequestMapping("/findAllPermission.do")
    public ModelAndView findAllPermission() throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        List<Permission> permissionList = resourceService.findAllPermission();
        modelAndView.addObject("permissionList",permissionList);
        modelAndView.setViewName("permission_list");
        return modelAndView;
    }
}
