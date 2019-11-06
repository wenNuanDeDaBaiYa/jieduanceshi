package com.baizhi.service;

import com.baizhi.dao.AdminDao;
import com.baizhi.entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AdminServiceImpl implements AdminService{
    @Autowired
    private AdminDao adminDao;
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Admin login(Admin admin) {
        Admin login = adminDao.login(admin.getName());

        System.out.println(login+"----------");

        if(login==null)
            throw new RuntimeException("该用户不存在");
        if(!login.getPassword().equals(admin.getPassword()))
            throw new RuntimeException("密码错误");
        return login;
    }
}
