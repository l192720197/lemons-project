package com.lm.controller;

import com.lm.domain.Role;
import com.lm.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @RequestMapping("/findAllRole.do")
    public ModelAndView findAllRole() throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        List<Role> roleList = roleService.findAllRole();
        modelAndView.addObject("roleList",roleList);
        modelAndView.setViewName("role_list");
        return modelAndView;
    }
}
