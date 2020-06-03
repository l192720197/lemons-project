package com.lm.dao;

import com.lm.domain.Role;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 查询角色
 */
public interface RoleDao {

    //根据用户id，查询所有对应角色
    @Select("select * from b_role where id in(select roleId from user_role where userId=#{userId})")
    public List<Role> findRoleByUserId(Integer userid) throws Exception;

    //查询所有角色
    @Select("select * from b_role")
    public List<Role> findAllRole() throws Exception;
}
