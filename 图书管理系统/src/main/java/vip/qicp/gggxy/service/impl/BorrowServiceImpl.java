package vip.qicp.gggxy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vip.qicp.gggxy.dao.BorrowDao;
import vip.qicp.gggxy.domain.BookInfo;
import vip.qicp.gggxy.domain.PageBean;
import vip.qicp.gggxy.domain.UserBook;
import vip.qicp.gggxy.service.BorrowService;
import vip.qicp.gggxy.utils.DateCountUtil;
import vip.qicp.gggxy.utils.PageBeanUtil;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

@Service
public class BorrowServiceImpl implements BorrowService {

    @Autowired
    private BorrowDao borrowDao;
    @Autowired
    PageBeanUtil<UserBook> pbu;
    @Override
    public boolean findByUidAndBookId(Integer uid,Integer bookId) {
        return borrowDao.findByUidAndBookId(uid,bookId)==null;
    }

    @Override
    public void save(Integer uid, Integer cb) {
        String sn=uid.toString()+cb.toString();
        Integer sernum=Integer.parseInt(sn);
        Date date=new Date();
        Date addDate=DateCountUtil.addDate(date);
        borrowDao.save(sernum,uid,cb,date,addDate);
    }

    @Override
    public List<Integer> findBookIdByUid(Integer uid) {
        return borrowDao.findBookIdByUid(uid);
    }

    @Override
    public PageBean<UserBook> findBorrowByPage(int row, int currentPage, Integer bookId, Integer state,Integer uid) throws ParseException {

        //索引开头
        Integer beginSerch = pbu.getBeginSerch(row, currentPage);
        //查询list
        List<UserBook> ubs=borrowDao.findListByPage(beginSerch,row, bookId, state,uid);
        //罚款设置
        for (UserBook ub : ubs) {
            //判断是不是已经还书
            if (ub.getState()==0){
                long day=DateCountUtil.overdueDate(ub.getBackDate());
                if (day>0.0){
                    ub.setFine(day*0.3+"");
                    borrowDao.saveFine(day*0.3+"",uid,ub.getBookId());
                }
            }

        }
        //查询总条数
        int totalCount=borrowDao.findCount(bookId,state,uid);
        //封装
        PageBean<UserBook> pb = pbu.getPageBean(row, currentPage, totalCount, ubs);
        return pb;

    }

    @Override
    public void updateState(Integer uid, Integer bid) {
        borrowDao.updateState(uid,bid);
    }

    @Override
    public PageBean<UserBook> findAdminBorrowByPage(Integer currentPage, Integer row, Integer uid, Integer bookId, Integer state) {

        //索引开头
        Integer beginSerch = pbu.getBeginSerch(row, currentPage);
        //查询list
        List<UserBook> ubs=borrowDao.findListByPage(beginSerch,row, bookId, state,uid);

        //查询总条数
        int totalCount=borrowDao.findCount(bookId,state,uid);
        //封装
        PageBean<UserBook> pb = pbu.getPageBean(row, currentPage, totalCount, ubs);
        return pb;
    }

    @Override
    public void updateStateTo1(Integer sernum) {
        borrowDao.updateStateTo1(sernum);
    }


}
