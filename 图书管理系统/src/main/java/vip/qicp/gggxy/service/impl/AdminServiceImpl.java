package vip.qicp.gggxy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vip.qicp.gggxy.dao.AdminDao;
import vip.qicp.gggxy.domain.Admin;
import vip.qicp.gggxy.service.AdminService;

import java.util.List;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDao dao;


    @Override
    public List<Admin> findAll() {
        return dao.findAll();
    }

    @Override
    public void insert(Admin admin) {
        dao.insert(admin);
    }

    @Override
    public Admin login(Admin admin) {
        return dao.findAdminByNameAndPassword(admin);
    }

    @Override
    public void changePassword(Integer id, String password2) {
        dao.update(id,password2);
    }
}
