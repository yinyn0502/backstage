package com.ueater.backstage.service;

import com.ueater.backstage.common.model.SysLogExample;
import com.ueater.backstage.common.model.SysLogWithBLOBs;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by caoli on 2017/11/13.
 */
public interface ISysLogService {
    List<SysLogWithBLOBs> findAll();

    List<SysLogWithBLOBs> findByProperties(String bizType);

    int save(SysLogWithBLOBs record);

    int update(SysLogWithBLOBs record,  SysLogExample example);

    int save(String bizType,Long userId,HttpServletRequest request);

    Integer save(String bizType, Integer logType, Long userId,HttpServletRequest request);
}
