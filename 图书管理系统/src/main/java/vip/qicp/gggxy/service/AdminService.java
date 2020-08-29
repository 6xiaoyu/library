package vip.qicp.gggxy.service;


import vip.qicp.gggxy.domain.Admin;


import java.util.List;


public interface AdminService {
    /**
     * 查询所有
     * @return
     */

    List<Admin> findAll();

    /**
     * 插入
     */

    void insert(Admin admin);


    /**
     * 登入功能
     * @param admin
     * @return
     */
    Admin login(Admin admin);

    /**
     * 修改管理员密码
     * @param id
     * @param password2
     */
    void changePassword(Integer id, String password2);
}
