package vip.qicp.gggxy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vip.qicp.gggxy.dao.BorrowDao;
import vip.qicp.gggxy.dao.UserDao;
import vip.qicp.gggxy.domain.PageBean;
import vip.qicp.gggxy.domain.User;
import vip.qicp.gggxy.service.UserService;
import vip.qicp.gggxy.utils.PageBeanUtil;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Autowired
    PageBeanUtil<User> pbu;
    @Autowired
    BorrowDao borrowDao;
    @Override
    public List<User> findAll() {
        return userDao.findAll();
    }

    @Override
    public void insert(User user) {
        userDao.insert(user);
    }

    @Override
    public User login(User user) {
        return userDao.findUserByUsernameAndPassword(user);
    }

    @Override
    public void changePassword(Integer uid, String password) {
        userDao.update(uid,password);
    }

    @Override
    public PageBean<User> findUsersByPage(Integer row, Integer currentPage, String username, Integer uid) {
        //索引开头
        Integer beginSerch = pbu.getBeginSerch(row, currentPage);
        //查询list
        List<User> us=userDao.findListByPage(beginSerch,row, username ,uid);

        //查询总条数
        int totalCount=userDao.findCount(username ,uid);
        //封装
        PageBean<User> pb = pbu.getPageBean(row, currentPage, totalCount,us);
        return pb;
    }

    @Override
    public void deleteUserByUid(Integer uid) {
        List<Integer> bookIdByUid = borrowDao.findBookIdByUid(uid);
        if (bookIdByUid.isEmpty()) {
            userDao.deleteUserById(uid);
        }

    }

    @Override
    public void addUser(User user) {
        userDao.addUser(user);
    }

    @Override
    public void updateUserByUid(User user) {
        userDao.updateUserByUid(user);
    }
}
