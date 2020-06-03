package com.lm.service.impl;

import com.lm.dao.RoleDao;
import com.lm.domain.Role;
import com.lm.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDao roleDao;

    @Override
    public List<Role> findAllRole() throws Exception {
        return roleDao.findAllRole();
    }
}
