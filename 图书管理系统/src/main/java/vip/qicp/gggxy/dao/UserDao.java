package vip.qicp.gggxy.dao;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import vip.qicp.gggxy.domain.User;

import java.util.List;

@Repository
public interface UserDao {
    /**
     * 查询所有
     * @return
     */
    @Select("select * from user")
    List<User> findAll();

    /**
     * 插入
     */
    @Insert("insert into user (username,password,age,email,phone,sex,birthday,relname) values (#{username},#{password},#{age},#{email},#{phone},#{sex},#{birthday},#{relname})")
    void insert(User user);

    /**
     * 根据用户名密码查询
     * @param user
     * @return
     */
    @Select("select * from user where username=#{username} and password=#{password}")
    User findUserByUsernameAndPassword(User user);

    /**
     *
     * @param uid
     * @param password
     */
    @Update("update user set password=#{password} where uid=#{uid}")
    void update(@Param("uid") Integer uid, @Param("password") String password);

    /**
     * 分页查询总条数
     * @param username
     * @param uid
     * @return
     */
    @Select("<script>"+
            "select count(*) from user where 1=1"+
            "<if test='username!=null'> and username like concat(#{username},'%')</if>"+
            "<if test='uid!=null'> and uid = #{uid}</if>"+
            "</script>")
    int findCount(@Param("username") String username,@Param("uid") Integer uid);

    /**
     * 分页复杂查询
     * @param beginSerch
     * @param row
     * @param username
     * @param uid
     * @return
     */
    @Select("<script>"+
            "select * from user where 1=1 "+
            " <if test='username!=null'>and username like concat(#{username},'%') </if>"+
            " <if test='uid!=null'>and uid=#{uid} </if>"+
            " limit #{beginSerch},#{row}"+
            "</script>")
    List<User> findListByPage(@Param("beginSerch")Integer beginSerch,@Param("row") Integer row,@Param("username") String username, @Param("uid")Integer uid);

    /***
     * 根据id删除
     * @param uid
     */
    @Delete("delete from user where uid=#{uid}")
    void deleteUserById(Integer uid);

    /**
     * 添加功能
     * @param user
     */
    @Insert("insert into user (uid,username,password,email,phone,sex,birthday,relname,age) values(#{uid},#{username},#{password},#{email},#{phone},#{sex},#{birthday},#{relname},#{age})")
    void addUser(User user);

    /**
     * 根据id更新
     * @param user
     */
    @Update("<script>"+
            "update user "+
            "<set>"+
            " <if test='username!=null'> username =#{username}  ,</if>"+
            " <if test='password!=null'> password =#{password} , </if>"+
            " <if test='email!=null'> email =#{email}  ,</if>"+
            " <if test='phone!=null'> phone =#{phone}  ,</if>"+
            " <if test='sex!=null'> sex =#{sex} , </if>"+
            " <if test='birthday!=null'> birthday =#{birthday} , </if>"+
            " <if test='relname!=null'> relname =#{relname} , </if>"+
            " <if test='age!=null'> age =#{age} , </if>"+
            "</set>"+
            "where uid=#{uid}"+
            "</script>")
    void updateUserByUid(User user);
}
