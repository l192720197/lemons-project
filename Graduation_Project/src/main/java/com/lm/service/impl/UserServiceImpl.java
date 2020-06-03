package com.lm.service.impl;

import com.github.pagehelper.PageHelper;
import com.lm.dao.UserDao;
import com.lm.domain.Role;
import com.lm.domain.UserInfo;
import com.lm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
    @Autowired
    HttpSession session;

    /**
     * 用户关联角色操作
     */
    @Override
    public UserInfo findById(Integer id) throws Exception {
        return userDao.findById(id);
    }

    @Override
    public List<Role> findOtherRoles(Integer userId) throws Exception {
        return userDao.findOtherRoles(userId);
    }

    /**
     * 用户注册
     */
    @Override
    public void register(UserInfo userInfo) throws Exception {

        //密码加密
        userInfo.setPassword(passwordEncoder.encode(userInfo.getPassword()));

        userDao.saveUser(userInfo);

    }

    /**
     * 管理员添加用户,对密码进行加密处理
     */
    public void saveUser(UserInfo userInfo) throws Exception {
        //密码加密
        userInfo.setPassword(passwordEncoder.encode(userInfo.getPassword()));

        userDao.saveUser(userInfo);
    }

    /**
     * 管理员查询所有用户
     */
    @Override
    public List<UserInfo> findAllUser(int page, int size) throws Exception {
        //参数pageNum是页码值，参数pageSize是每页显示条数
        PageHelper.startPage(page, size);
        return userDao.findAllUser();
    }


    /**
     * 用户登录
     *
     * @param username
     * @return
     * @throws UsernameNotFoundException
     */
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserInfo userInfo = null;
        session.setAttribute("username",username);
        try {
            userInfo = userDao.findByUsername(username);
            System.out.println("============================="+userInfo.getRoles().size());
        } catch (Exception e) {
            e.printStackTrace();
        }
        //处理自己的用户对象封装成UserDetails
        //User user = new User(userInfo.getUsername(),"{noop}"+userInfo.getPassword(),getAuthority());
        User user = new User(userInfo.getUsername(),
                userInfo.getPassword(),
                true, true, true, true,
                getAuthority(userInfo.getRoles())
        );
        return user;
    }


    public List<SimpleGrantedAuthority> getAuthority(List<Role> roles) {
        List<SimpleGrantedAuthority> list = new ArrayList<>();
        UserInfo userInfo = new UserInfo();

        for (Role role : roles) {

            list.add(new SimpleGrantedAuthority("ROLE_" + role.getRoleName()));
        }




        return list;
    }
}
