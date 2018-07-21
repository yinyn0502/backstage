package com.ueater.backstage.dataservice.impl;

import com.ueater.backstage.common.model.SysLogExample;
import com.ueater.backstage.common.model.SysLogWithBLOBs;
import com.ueater.backstage.common.model.SysMenu;
import com.ueater.backstage.common.model.SysMenuExample;
import com.ueater.backstage.dao.ISysLogDao;
import com.ueater.backstage.dataservice.ISysLogDataService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by caoli on 2017/11/13.
 */
@Slf4j
@Service
public class SysLogDataService implements ISysLogDataService{
    @Resource
    ISysLogDao sysLogDao;

    @Override
    public List<SysLogWithBLOBs> findAll() {
        SysLogExample example=new SysLogExample();
        return sysLogDao.selectByExampleWithBLOBs(example);
    }

    @Override
    public List<SysLogWithBLOBs> findByProperties(String bizType) {
        SysLogExample example=new SysLogExample();
        SysLogExample.Criteria criteria = example.createCriteria();
        criteria.andBizTypeEqualTo(bizType);
        List<SysLogWithBLOBs> list= sysLogDao.selectByExampleWithBLOBs(example);
        return list;
    }

    @Override
    public int save(SysLogWithBLOBs record) {
        return sysLogDao.insert(record);
    }

    @Override
    public int update(SysLogWithBLOBs record,  SysLogExample example){
        return sysLogDao.updateByExampleWithBLOBs(record,example);
    }
}
