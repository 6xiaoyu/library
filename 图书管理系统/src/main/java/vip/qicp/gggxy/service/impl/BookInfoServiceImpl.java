package vip.qicp.gggxy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vip.qicp.gggxy.dao.BookInfoDao;
import vip.qicp.gggxy.dao.BorrowDao;
import vip.qicp.gggxy.dao.ClassInfoDao;
import vip.qicp.gggxy.domain.BookInfo;
import vip.qicp.gggxy.domain.ClassInfo;
import vip.qicp.gggxy.domain.PageBean;
import vip.qicp.gggxy.service.BookInfoService;
import vip.qicp.gggxy.utils.PageBeanUtil;

import java.util.List;
@Service
public class BookInfoServiceImpl implements BookInfoService {
    @Autowired
    BookInfoDao bookInfoDao;
    @Autowired
    PageBeanUtil<BookInfo> pbu;
    @Autowired
    ClassInfoDao classInfoDao;
    @Autowired
    BorrowDao borrowDao;
    @Override
    public List<BookInfo> findAll() {
        return bookInfoDao.findAll();
    }

    @Override
    public PageBean<BookInfo> findBooksByPage(int row, int currentPage,String bookName,String bookAuthor,Integer cid) {
        /*PageBean bpb=new PageBean();
        //设置条数和当前页码
        bpb.setRow(row);
        bpb.setCurrentPage(currentPage);
        //查询总条数
        int count=bookInfoDao.findCount(bookName,bookAuthor);
        //设置总条数
        bpb.setTotalCount(count);
        //查询list
        //索引开头
        int beginSerch=(currentPage-1)*row;
        List<BookInfo> bl=bookInfoDao.findListByPage(beginSerch,row, bookName, bookAuthor);
        //设置list
        bpb.setList(bl);
        //设置总记录条数 （查询）总记录数%每页显示行数==0？总记录数/每页显示行数：总记录数/每页显示行数+1
        int totalPage=count%row==0?count/row:count/row+1;
        bpb.setTotalPage(totalPage);
        return bpb;*/


        //索引开头
        Integer beginSerch = pbu.getBeginSerch(row, currentPage);
        //查询list
        List<BookInfo> bl=bookInfoDao.findListByPage(beginSerch,row, bookName, bookAuthor,cid);
        //查询总条数
        int totalCount=bookInfoDao.findCount(bookName,bookAuthor,cid);
        //封装
        PageBean<BookInfo> pb = pbu.getPageBean(row, currentPage, totalCount, bl);
        return pb;

    }

    @Override
    public void bookNumDown(Integer cb) {
        bookInfoDao.StockDown(cb);
    }

    @Override
    public List<ClassInfo> findClassInfos() {
        return classInfoDao.findAll();
    }

    @Override
    public void deleteBookById(Integer bid, Integer[] allCb) {
        if (bid!=null){
            bookInfoDao.deleteById(bid);
        }

        if (allCb!=null){
            for (Integer id:allCb){

                bookInfoDao.deleteById(id);
            }
        }
    }

    @Override
    public void updateBookInfoByBookId(BookInfo bookInfo) {
        bookInfoDao.updateBookInfoByBookId(bookInfo);
    }

    @Override
    public void addBookInfoByBookId(BookInfo bookInfo) {
        bookInfoDao.insertBookInfo(bookInfo);
    }

    @Override
    public void bookNumUp(Integer sernum) {
        Integer bookId = borrowDao.findBookIdBySernum(sernum);
        bookInfoDao.StockUp(bookId);
    }
}
