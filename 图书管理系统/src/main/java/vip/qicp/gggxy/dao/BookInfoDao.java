package vip.qicp.gggxy.dao;

import org.apache.ibatis.annotations.*;
import vip.qicp.gggxy.domain.BookInfo;

import java.util.List;

public interface BookInfoDao {
    /**
     * 查询所有
     * @return
     */
    @Select("select * from book_info")
    List<BookInfo> findAll();

    /**
     * 分页查询条数
     * @param bookName
     * @param bookAuthor
     * @return
     */
    @Select("<script>"+
            "select count(*) from book_info where 1=1"+
            "<if test='bookName!=null'> and name like concat(#{bookName},'%')</if>"+
            "<if test='bookAuthor!=null'> and author like concat(#{bookAuthor},'%')</if>"+
            "<if test='cid!=null'> and class_id = #{cid}</if>"+
            "</script>")
    int findCount(@Param("bookName") String bookName,@Param("bookAuthor")String bookAuthor,@Param("cid") Integer cid);

    /**
     * 分页复杂查询
     * @param beginSerch
     * @param row
     * @param bookName
     * @param bookAuthor
     * @return
     */
    /*@Select("select * from book_info limit #{beginSerch},#{row}")*/
    @Select("<script>"+
            "select * from book_info where 1=1 "+
            " <if test='bookName!=null'>and name like concat(#{bookName},'%') </if>"+
            " <if test='bookAuthor!=null'>and author like concat(#{bookAuthor},'%') </if>"+
            " <if test='cid!=null'>and class_id=#{cid} </if>"+
            " limit #{beginSerch},#{row}"+
            "</script>")
    @Results({
            @Result(id = true, column = "book_id" ,property = "bookId"),
            @Result(column = "class_id", property = "classId"),
    }
    )
    List<BookInfo> findListByPage(@Param("beginSerch") int beginSerch,@Param("row") int row,@Param("bookName") String bookName,@Param("bookAuthor") String bookAuthor,@Param("cid") Integer cid);

    /**
     * 书本数量减一
     * @param cb
     */
    @Update("update book_info set stock=stock-1 where book_id=#{bookId}")
    void StockDown(@Param("bookId") Integer cb);

    /**
     * 根据bookId查bookName
     * @return
     */
    @Select("select name from book_info where book_id=#{bookId}")
    String findBookNameByBookId();

    /**
     * 根据id删除
     * @param bid
     */
    @Delete("delete from book_info where book_id=#{bid} ")
    void deleteById(Integer bid);

    /**
     * 更新
     * @param bookInfo
     */
    @Update("<script>"+
            "update book_info "+
            "<set>"+
            " <if test='name!=null'> name =#{name}  ,</if>"+
            " <if test='author!=null'> author =#{author} , </if>"+
            " <if test='publish!=null'> publish =#{publish}  ,</if>"+
            " <if test='ISBN!=null'> ISBN =#{ISBN}  ,</if>"+
            " <if test='introduction!=null'> introduction =#{introduction} , </if>"+
            " <if test='language!=null'> language =#{language} , </if>"+
            " <if test='price!=null'> price =#{price} , </if>"+
            " <if test='pubDate!=null'> pubdate =#{pubDate} , </if>"+
            " <if test='classId!=null'> class_id =#{classId} , </if>"+
            "</set>"+
            "where book_id=#{bookId}"+
            "</script>")
    @Results({
            @Result(id = true,property = "bookId", column = "book_id"),
            @Result(property = "pubDate", column = "pubdate"),
            @Result(property = "classId", column = "class_id")
    })
    void updateBookInfoByBookId(BookInfo bookInfo);

    @Insert("insert into book_info (book_id,name,author,publish,ISBN,introduction,language,price,pubdate,class_id,stock,state) values (#{bookId},#{name},#{author},#{publish},#{ISBN},#{introduction},#{language},#{price},#{pubDate},#{classId},#{stock},#{state})")
    @Results({
            @Result(id = true,property = "bookId", column = "book_id"),
            @Result(property = "pubDate", column = "pubdate"),
            @Result(property = "classId", column = "class_id"),
            @Result(property = "name",column = "name"),
            @Result(property = "author",column = "author"),
            @Result(property = "publish",column = "publish"),
            @Result(property = "ISBN",column = "ISBN"),
            @Result(property = "introduction",column = "introduction"),
            @Result(property = "price",column = "price"),
            @Result(property = "language",column = "language"),
            @Result(property = "stock",column = "stock"),
            @Result(property = "state",column = "state")

    })
    void insertBookInfo(BookInfo bookInfo);

    /**
     * 图书+1
     * @param bookId
     */
    @Update("update book_info set stock=stock+1 where book_id=#{bookId}")
    void StockUp(Integer bookId);
}
