package com.ueater.backstage.dataservice;

import com.ueater.backstage.common.model.SysDict;
import com.ueater.backstage.common.model.SysLogExample;
import com.ueater.backstage.common.model.SysLogWithBLOBs;

import java.util.List;

/**
 * Created by caoli on 2017/11/13.
 */
public interface ISysLogDataService {
    public List<SysLogWithBLOBs> findAll();

    public List<SysLogWithBLOBs> findByProperties(String bizType);

    public int save(SysLogWithBLOBs record);

    public int update(SysLogWithBLOBs record,  SysLogExample example);
}
