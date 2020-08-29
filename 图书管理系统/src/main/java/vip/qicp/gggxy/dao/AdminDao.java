package vip.qicp.gggxy.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import vip.qicp.gggxy.domain.Admin;


import java.util.List;

@Repository
public interface AdminDao {
    /**
     * 查询所有
     * @return
     */
    @Select("select * from admin")
    List<Admin> findAll();

    /**
     * 插入
     */
    @Insert("insert into admin name,password values (#{name},#{password})")
    void insert(Admin admin);

    /**
     * 根据用户名密码查询
     * @param admin
     * @return
     */
    @Select("select * from admin where username=#{username} and password=#{password}")
    Admin findAdminByNameAndPassword(Admin admin);

    /**
     * 更新操作
     * @param id
     * @param password
     */
    @Update("update admin set password=#{password} where id=#{id}")
    void update( @Param("id") Integer id,@Param("password") String password);
}
