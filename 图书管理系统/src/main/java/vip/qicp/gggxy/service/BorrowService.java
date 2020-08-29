package vip.qicp.gggxy.service;

import org.springframework.beans.factory.annotation.Autowired;
import vip.qicp.gggxy.domain.PageBean;
import vip.qicp.gggxy.domain.UserBook;

import java.text.ParseException;
import java.util.List;

public interface BorrowService {

    /**
     * 根据uid和bookId查询
     * @param uid
     * @param bookId
     * @return
     */
    boolean findByUidAndBookId(Integer uid,Integer bookId);

    /**
     * 借阅操作
     * @param uid
     * @param cb
     */
    void save(Integer uid, Integer cb);

    /**
     * 根据uid查bookId
     * @param uid
     * @return
     */
    List<Integer> findBookIdByUid(Integer uid);


    /**
     * 分页查询封装pb
     * @param row
     * @param currentPage
     * @param bookId
     * @param state
     * @param uid
     * @return
     */
    PageBean<UserBook> findBorrowByPage(int row,int currentPage,Integer bookId,Integer state,Integer uid ) throws ParseException;


    /**
     * 还书预处理
     * @param uid
     * @param bid
     */
    void updateState(Integer uid, Integer bid);

    /**
     * 管理者封装借阅记录的PageBean
     * @param currentPage
     * @param row
     * @param uid
     * @param bookId
     * @param state
     * @return
     */
    PageBean<UserBook> findAdminBorrowByPage(Integer currentPage, Integer row, Integer uid, Integer bookId, Integer state);

    /**
     * 更改状态为1
     * @param sernum
     */
    void updateStateTo1(Integer sernum);
}
