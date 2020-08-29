package vip.qicp.gggxy.service;

import vip.qicp.gggxy.domain.BookInfo;
import vip.qicp.gggxy.domain.ClassInfo;
import vip.qicp.gggxy.domain.PageBean;
import vip.qicp.gggxy.domain.User;

import java.util.List;

public interface BookInfoService {
    List<BookInfo> findAll();

    /**
     * 分页查询
     */
    PageBean<BookInfo> findBooksByPage(int row,int currentPage,String bookName,String bookAuthor,Integer cid);

    /**
     * 书的数量减一
     * @param cb
     */
    void bookNumDown(Integer cb);

    /**
     * 查询所有类别
     * @return
     */
    List<ClassInfo> findClassInfos();

    /**
     * 删除book操作
     * @param id
     * @param ids
     */
    void deleteBookById(Integer id,Integer[] ids);

    /**
     * 通过bookId更新
     * @param bookInfo
     */
    void updateBookInfoByBookId(BookInfo bookInfo);

    /**
     * 添加图书
     * @param bookInfo
     */
    void addBookInfoByBookId(BookInfo bookInfo);

    /**
     * 归还图书+1
     * @param sernum
     */
    void bookNumUp(Integer sernum);
}

