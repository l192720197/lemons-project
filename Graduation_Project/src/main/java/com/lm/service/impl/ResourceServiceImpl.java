package com.lm.service.impl;

import com.lm.dao.ResourceDao;
import com.lm.domain.Permission;
import com.lm.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ResourceServiceImpl implements ResourceService {

    @Autowired
    private ResourceDao resourceDao;

    @Override
    public List<Permission> findAllPermission() throws Exception {
        return resourceDao.findAllPermission();
    }
}
