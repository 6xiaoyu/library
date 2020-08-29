package vip.qicp.gggxy.domain;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;

public class UserBook implements Serializable {
    private Integer sernum;
    private Integer uid;
    private Integer bookId;
    private String date;
    private String backDate;
    private Integer state;
    private String fine;
    private List<String> bookNames;

    public List<String> getBookNames() {
        return bookNames;
    }

    public void setBookNames(List<String> bookNames) {
        this.bookNames = bookNames;
    }

    @Override
    public String toString() {
        return "UserBook{" +
                "sernum=" + sernum +
                ", uid=" + uid +
                ", bookId=" + bookId +
                ", date='" + date + '\'' +
                ", backDate=" + backDate +
                ", state=" + state +
                ", fine=" + fine +
                ", bookNames='" + bookNames + '\'' +
                '}';
    }

    public Integer getSernum() {
        return sernum;
    }

    public void setSernum(Integer sernum) {
        this.sernum = sernum;
    }

    public String getBackDate() {
        return backDate;
    }

    public void setBackDate(String backDate) {
        this.backDate = backDate;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getFine() {
        return fine;
    }

    public void setFine(String fine) {
        this.fine = fine;
    }


    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
