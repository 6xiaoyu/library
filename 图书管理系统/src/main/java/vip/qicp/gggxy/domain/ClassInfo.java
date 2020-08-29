package vip.qicp.gggxy.domain;

import java.io.Serializable;

public class ClassInfo implements Serializable {
    private Integer cid;
    private String cname;

    @Override
    public String toString() {
        return "classInfoDao{" +
                "cid=" + cid +
                ", cname='" + cname + '\'' +
                '}';
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }
}
