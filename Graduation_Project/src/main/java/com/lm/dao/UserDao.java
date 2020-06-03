package com.lm.dao;

import com.lm.domain.Role;
import com.lm.domain.UserInfo;
import org.apache.ibatis.annotations.*;
import org.springframework.security.core.userdetails.User;

import java.util.List;

public interface UserDao {
   /*
     根据用户名，用户查日记

    @Select("select * from b_user where username=#{username}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "username",column = "username"),
            @Result(property = "password",column = "password"),
            @Result(property = "uname",column = "uname"),
            @Result(property = "sex",column = "sex"),
            @Result(property = "brithday",column = "brithday"),
            @Result(property = "email",column = "email"),
            @Result(property = "address",column = "address"),
            @Result(property = "status",column = "status"),
            @Result(property = "diaries",column = "username",javaType = java.util.List.class,
                    many = @Many(select = "com.lm.dao.DiaryDao.findDiaryByUserId")
            )
    })
    UserInfo findDiaryByUsername(String username) throws Exception;
*/
    /**
     * 根据Id查用户
     */
    @Select("select * from b_user where id=#{id}")
    @Results({
                    @Result(id = true,property = "id",column = "id"),
                    @Result(property = "username",column = "username"),
                    @Result(property = "password",column = "password"),
                    @Result(property = "uname",column = "uname"),
                    @Result(property = "sex",column = "sex"),
                    @Result(property = "brithday",column = "brithday"),
                    @Result(property = "email",column = "email"),
                    @Result(property = "address",column = "address"),
                    @Result(property = "status",column = "status"),
            @Result(property = "roles",column = "id",javaType = java.util.List.class,many = @Many(select = "com.lm.dao.RoleDao.findRoleByUserId"))

    })
    UserInfo findById(Integer id) throws Exception;


    @Select("select * from b_role where id not in(select roleId from user_role where userId=#{userId})")
    List<Role> findOtherRoles(Integer userId);

    /**
     * 用户注册
     */
    @Insert("insert into b_user(username,password,uname,email) values(#{username},#{password},#{uname},#{email})")
    void register(UserInfo userInfo) throws Exception;


    /**
     * 用户及管理员登录
     * @param username
     * @return
     * @throws Exception
     */
    @Select("select * from b_user where username=#{username}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "username",column = "username"),
            @Result(property = "password",column = "password"),
            @Result(property = "uname",column = "uname"),
            @Result(property = "sex",column = "sex"),
            @Result(property = "brithday",column = "brithday"),
            @Result(property = "email",column = "email"),
            @Result(property = "address",column = "address"),
            @Result(property = "status",column = "status"),
            @Result(property = "roles",column = "id", javaType = java.util.List.class,
                    many = @Many(select = "com.lm.dao.RoleDao.findRoleByUserId"))
    })
    public UserInfo findByUsername(String username) throws Exception;


    /**
     * 管理员查询所有用户
     */
    @Select("select * from b_user")
    List<UserInfo> findAllUser() throws Exception;


    /**
     * 管理员添加所有用户
     */
    @Insert("insert into b_user(username,password,uname,sex,brithday,email,address) values(#{username},#{password},#{uname},#{sex},#{brithday},#{email},#{address})")
    void saveUser(UserInfo userInfo) throws Exception;
}
