package com.ueater.backstage.dataservice.impl;


import com.ueater.backstage.common.model.SysArea;
import com.ueater.backstage.dao.ISysAreaDao;
import com.ueater.backstage.dataservice.ISysAreaDataService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by caoli on 2017/8/21.
 */
@Slf4j
@Service
public class SysAreaDataService implements ISysAreaDataService{
    @Resource
    private ISysAreaDao sysAreaDao;

    @Override
    public List<SysArea> findAll() {
        return sysAreaDao.findAllList();
    }

    @Override
    public int save(SysArea area) {
        return sysAreaDao.insert(area);
    }

    @Override
    public int delete(SysArea area) {
        return sysAreaDao.deleteByPrimaryKey(area.getId());
    }

    @Override
    public int update(SysArea area) {
        return sysAreaDao.updateByPrimaryKey(area);
    }

    @Override
    public List<SysArea> findAllList() {
        return sysAreaDao.findAllList();
    }

    @Override
    public SysArea findById(Long id) {
        SysArea area=sysAreaDao.selectByPrimaryKey(id);
        if(area!=null) {
            Long parentId = area.getParentId();
            SysArea parent = null;
            if (parentId != null) {
                parent = sysAreaDao.selectByPrimaryKey(parentId);
            }
            area.setParent(parent);
        }
        return area;
    }

    @Override
    public List<SysArea> findAllNotRoot() {
        return sysAreaDao.findAllNotRoot();
    }

    @Override
    public Date queryNowTimeFromDB() {
        return sysAreaDao.queryNowTimeFromDB();
    }
}
