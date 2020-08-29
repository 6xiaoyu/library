package vip.qicp.gggxy.domain;

import java.io.Serializable;
import java.util.List;

public class  PageBean <T> implements Serializable {
    private int totalCount; //总记录条数 （查询）
    private int totalPage; //总页数     (计算) 总记录数%每页显示行数==0？总记录数/每页显示行数：总记录数/每页显示行数+1
    private List<T> list; //封装的对象  （查询）
    private int currentPage; //当前页数（参数）
    private int row; //每页显示行数     （参数）

    @Override
    public String toString() {
        return "PageBean{" +
                "totalCount=" + totalCount +
                ", totalPage=" + totalPage +
                ", list=" + list +
                ", currentPage=" + currentPage +
                ", row=" + row +
                '}';
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getRow() {
        return row;
    }

    public void setRow(int row) {
        this.row = row;
    }
}
