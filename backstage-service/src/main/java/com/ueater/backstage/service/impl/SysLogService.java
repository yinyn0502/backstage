package com.ueater.backstage.service.impl;

import com.ueater.backstage.common.model.SysLogExample;
import com.ueater.backstage.common.model.SysLogWithBLOBs;
import com.ueater.backstage.common.util.Tools;
import com.ueater.backstage.dataservice.ISysLogDataService;
import com.ueater.backstage.service.ISysLogService;
import com.ueater.tool.annotation.SystemLog;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * Created by caoli on 2017/11/13.
 */
@Slf4j
@Service
public class SysLogService implements ISysLogService{
    @Resource
    ISysLogDataService sysLogDataService;
    @SystemLog
	@Override
    public List<SysLogWithBLOBs> findAll() {
        return sysLogDataService.findAll();
    }

    @SystemLog
	@Override
    public List<SysLogWithBLOBs> findByProperties(String bizType) {
        return sysLogDataService.findByProperties(bizType);
    }

    @SystemLog
	@Override
    public int save(SysLogWithBLOBs record) {
        return sysLogDataService.save(record);
    }

    @SystemLog
	@Override
    public int update(SysLogWithBLOBs record, SysLogExample example) {
        return sysLogDataService.update(record,example);
    }

    //@SystemLog
	@Override
    public int save(String bizType, Long userId, HttpServletRequest request) {
        SysLogWithBLOBs sysLogWithBLOBs=new SysLogWithBLOBs();
        sysLogWithBLOBs.setParams(Tools.getParameters(request));
        sysLogWithBLOBs.setRequestUri(request.getRequestURI());
        sysLogWithBLOBs.setBizType(bizType);
        sysLogWithBLOBs.setCreateBy(userId);
        sysLogWithBLOBs.setMethod(request.getMethod());
        sysLogWithBLOBs.setType("1");
        sysLogWithBLOBs.setCreateDate(new Date());
        sysLogWithBLOBs.setRemoteAddr(Tools.getIp(request));
        sysLogWithBLOBs.setUserAgent(null);
        sysLogWithBLOBs.setException(null);
        sysLogWithBLOBs.setId(null);
        return save(sysLogWithBLOBs);
    }

    @Override
    public Integer save(String bizType, Integer logType, Long userId, HttpServletRequest request) {
        SysLogWithBLOBs sysLogWithBLOBs=new SysLogWithBLOBs();
        sysLogWithBLOBs.setParams(Tools.getParameters(request));
        sysLogWithBLOBs.setRequestUri(request.getRequestURI());
        sysLogWithBLOBs.setBizType(bizType);
        sysLogWithBLOBs.setCreateBy(userId);
        sysLogWithBLOBs.setMethod(request.getMethod());
        sysLogWithBLOBs.setType(logType.toString());
        sysLogWithBLOBs.setCreateDate(new Date());
        sysLogWithBLOBs.setRemoteAddr(Tools.getIp(request));
        sysLogWithBLOBs.setUserAgent(null);
        sysLogWithBLOBs.setException(null);
        sysLogWithBLOBs.setId(null);
        return save(sysLogWithBLOBs);
    }
}
