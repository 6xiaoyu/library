package vip.qicp.gggxy.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import vip.qicp.gggxy.domain.ClassInfo;

import java.util.List;

public interface ClassInfoDao {

    /**
     * 查询所有类别
     * @return
     */
    @Select("select * from class_info")
    List<ClassInfo> findAll();

    /**
     * 删除
     * @param cid
     */
    @Delete("delete from class_info where cid=#{cid}")
    void deleteById(Integer cid);

    /**
     * 插入
     * @param classInfo
     */
    @Insert("insert into class_info (cid,cname) values (#{cid},#{cname})")
    void addClassInfo(ClassInfo classInfo);

    /**
     * 更新
     * @param classInfo
     */
    @Update("update class_info set cname=#{cname} where cid=#{cid}")
    void updateClassInfo(ClassInfo classInfo);
}
