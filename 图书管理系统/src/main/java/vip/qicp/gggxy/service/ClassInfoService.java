package vip.qicp.gggxy.service;

import vip.qicp.gggxy.domain.ClassInfo;

public interface ClassInfoService {
    /**
     * 删除操作
     * @param allCb
     * @param bid
     */
    void deleteByCid(Integer[] allCb,Integer bid);

    /**
     * 添加操作
     * @param classInfo
     */
    void addClassInfo(ClassInfo classInfo);

    /**
     * 更新操作
     * @param classInfo
     */
    void updateClassInfo(ClassInfo classInfo);
}
