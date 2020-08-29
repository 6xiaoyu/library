package vip.qicp.gggxy.service;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;
import vip.qicp.gggxy.domain.PageBean;
import vip.qicp.gggxy.domain.User;

import java.util.List;


public interface UserService {
    /**
     * 查询所有
     * @return
     */

    List<User> findAll();

    /**
     * 插入
     */

    void insert(User user);

    /**
     * 登入功能
     * @param user
     * @return
     */
    User login(User user);

    /**
     * 修改密码
     * @param uid
     * @param password
     */
    void changePassword(Integer uid,String password);

    /**
     * 查询USER的分页复杂条件查询
     * @param row
     * @param currentPage
     * @param username
     * @param uid
     * @return
     */
    PageBean<User> findUsersByPage(Integer row, Integer currentPage, String username, Integer uid);

    /**
     * 根据id删除User
     * @param uid
     */
    void deleteUserByUid(Integer uid);

    /**
     * 添加用户
     * @param user
     */
    void addUser(User user);

    /**
     * 根据uid编辑用户
     * @param user
     */
    void updateUserByUid(User user);
}
