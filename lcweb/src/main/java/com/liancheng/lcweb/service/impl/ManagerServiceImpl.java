package com.liancheng.lcweb.service.impl;

import com.liancheng.lcweb.domain.Manager;
import com.liancheng.lcweb.repository.ManagerRepository;
import com.liancheng.lcweb.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ManagerServiceImpl implements ManagerService {

    @Autowired
    private ManagerRepository managerRepository;

    @Override
    public List<Manager> findAll() {
        return null;
    }

    @Override
    public Manager findOne(Integer id) {
        return null;
    }

    @Override
    public Manager getManager(String name, String password) {
        return null;
    }

    @Override
    public Manager insertManager(Manager manager) {
        return null;
    }
}
