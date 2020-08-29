package vip.qicp.gggxy.utils;

import org.springframework.stereotype.Component;
import vip.qicp.gggxy.domain.BookInfo;
import vip.qicp.gggxy.domain.PageBean;

import java.util.List;
@Component
public class PageBeanUtil <T>{
    /**
     * 计算查询开始索引
     * @param row
     * @param currentPage
     * @return
     */
    public Integer getBeginSerch(Integer row, Integer currentPage){
        return (currentPage-1)*row;
    }

    /**
     * 封装PageBean对象
     * @param row 每页几行 （参数）
     * @param currentPage 当前页码（参数）
     * @param TotalCount 总页码（查询）
     * @param bl         每页显示记录（查询）
     * @return 对象
     */
    public PageBean<T> getPageBean(Integer row, Integer currentPage, int TotalCount, List<T> bl){
        PageBean bpb=new PageBean();
        //设置条数和当前页码
        bpb.setRow(row);
        bpb.setCurrentPage(currentPage);
        /*//查询总条数
        int count=bookInfoDao.findCount(bookName,bookAuthor);*/
        //设置总条数
        bpb.setTotalCount(TotalCount);
        //查询list
        /*//索引开头
        int beginSerch=(currentPage-1)*row;
        List<BookInfo> bl=bookInfoDao.findListByPage(beginSerch,row, bookName, bookAuthor);*/
        //设置list
        bpb.setList(bl);
        //设置总记录条数 （查询）总记录数%每页显示行数==0？总记录数/每页显示行数：总记录数/每页显示行数+1
        int totalPage=TotalCount%row==0?TotalCount/row:TotalCount/row+1;
        bpb.setTotalPage(totalPage);
        return bpb;

    }
}
