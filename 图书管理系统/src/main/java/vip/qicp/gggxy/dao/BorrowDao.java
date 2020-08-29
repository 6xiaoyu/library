package vip.qicp.gggxy.dao;

import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import vip.qicp.gggxy.domain.UserBook;

import java.util.Date;
import java.util.List;

public interface BorrowDao {
    /**
     * 根据uid和bookId查询
     * @param uid
     * @param bookId
     * @return
     */
    @Select("select * from user_book where uid=#{uid} and book_id=#{bookId}")
    @Results({
            @Result(id = true, column = "book_id" ,property = "bookId"),
            @Result(id = true, column = "uid" ,property = "uid")
    }
    )
    UserBook findByUidAndBookId(@Param("uid") Integer uid, @Param("bookId") Integer bookId);

    /**
     * 借阅时候插入
     * @param sernum
     * @param uid
     * @param cb
     * @param date
     * @param addDate
     */
    @Insert("insert into user_book (sernum,uid,book_id,date,back_date,state)values(#{sernum},#{uid},#{cb},#{date},#{addDate},0) ")
    void save(@Param("sernum") Integer sernum,@Param("uid")Integer uid, @Param("cb")Integer cb,@Param("date") Date date,@Param("addDate") Date addDate);

    /**
     * 通过uid查book_id
     * @param uid
     * @return
     */
    @Select("select book_id from user_book where uid=#{uid} and state!=1")
    List<Integer> findBookIdByUid(Integer uid);

    /**
     * 插入罚款
     * @param fine
     */
    @Update("update  user_book set fine=#{fine} where uid=#{uid} and book_id=#{bookId}")
    void saveFine(@Param("fine") String fine,@Param("uid")Integer uid,@Param("bookId") Integer bookId);


    /**
     * 分页查询条数
     * @param
     * @param
     * @return
     */
    @Select("<script>"+
            "select count(*) from user_book where 1=1 "+
            "<if test='uid!=null'>and uid =#{uid} </if>"+
            "<if test='state!=null'> and state = #{state}</if>"+
            "<if test='bookId!=null'> and book_id =#{bookId}</if>"+
            "</script>")
    int findCount(@Param("bookId") Integer bookId,@Param("state")Integer state,@Param("uid") Integer uid);

    /**
     * 分页复杂查询
     * @param
     * @param
     * @param
     * @param
     * @return
     */
    @Select("<script>"+
            "select * from user_book where 1=1 "+
            " <if test='uid!=null'>and uid =#{uid} </if>"+
            " <if test='bookId!=null'>and book_id =#{bookId} </if>"+
            " <if test='state!=null'>and state =#{state} </if>"+
            " limit #{beginSerch},#{row}"+
            "</script>")
    @Results({

            @Result(id = true, column = "book_id" ,property = "bookId"),
            @Result(column = "class_id", property = "classId"),
            @Result(column = "back_date", property = "backDate"),
            @Result(column = "book_id",property = "bookNames" ,one=@One(select="vip.qicp.gggxy.dao.BookInfoDao.findBookNameByBookId" ,fetchType = FetchType.EAGER))
    }
    )
    List<UserBook> findListByPage(@Param("beginSerch") Integer beginSerch, @Param("row")int row, @Param("bookId")Integer bookId,@Param("state") Integer state,@Param("uid")Integer uid);

    /**
     * 修改state为2
     * @param uid
     * @param bid
     */
    @Update("update  user_book set state=2 where uid=#{uid} and book_id=#{bid}")
    void updateState(@Param("uid") Integer uid,@Param("bid") Integer bid);

    /**
     * 修改state为1
     * @param sernum
     */
    @Update("update  user_book set state=1 where sernum=#{sernum} ")
    void updateStateTo1(Integer sernum);

    /**
     * 根据sernum查询bookID
     * @param sernum
     * @return
     */
    @Select("select book_id from user_book where sernum=#{sernum} ")
    Integer findBookIdBySernum(Integer sernum);
}
