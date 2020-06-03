package com.lm.service;

import com.lm.domain.Role;
import com.lm.domain.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface UserService extends UserDetailsService {

    /**
     * 管理员查询所有用户,分页代码
     */
    List<UserInfo> findAllUser(int page,int size) throws Exception;

    /**
     * 管理员添加所有用户
     */
    void saveUser(UserInfo userInfo) throws Exception;

    /**
     * 用户注册
     */
    void register(UserInfo userInfo) throws Exception;

    /**
     * 根据id查询
     */
    UserInfo findById(Integer id) throws Exception;

    List<Role> findOtherRoles(Integer userId) throws Exception;
}
