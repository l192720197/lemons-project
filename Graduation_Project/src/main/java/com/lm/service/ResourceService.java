package com.lm.service;

import com.lm.domain.Permission;

import java.util.List;

public interface ResourceService {

    public List<Permission> findAllPermission() throws Exception;
}
