package vip.qicp.gggxy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vip.qicp.gggxy.dao.ClassInfoDao;
import vip.qicp.gggxy.domain.ClassInfo;
import vip.qicp.gggxy.service.ClassInfoService;
@Service
public class ClassInfoServiceImpl implements ClassInfoService {
    @Autowired
    ClassInfoDao classInfoDao;

    @Override
    public void deleteByCid(Integer[] allCb, Integer cid) {
        if (cid!=null){
            classInfoDao.deleteById(cid);
        }

        if (allCb!=null){
            for (Integer id:allCb){

                classInfoDao.deleteById(id);
            }
        }
    }

    @Override
    public void addClassInfo(ClassInfo classInfo) {
        classInfoDao.addClassInfo(classInfo);
    }

    @Override
    public void updateClassInfo(ClassInfo classInfo) {
        classInfoDao.updateClassInfo(classInfo);
    }
}
