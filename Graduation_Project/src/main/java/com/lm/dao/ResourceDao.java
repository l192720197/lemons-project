package com.lm.dao;

import com.lm.domain.Permission;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ResourceDao {

    @Select("select * from b_resouce")
    List<Permission> findAllPermission() throws Exception;
}
