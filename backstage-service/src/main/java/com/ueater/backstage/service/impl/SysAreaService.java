package com.ueater.backstage.service.impl;

import com.ueater.backstage.common.model.SysArea;
import com.ueater.backstage.dataservice.ISysAreaDataService;
import com.ueater.backstage.service.ISysAreaService;
import com.ueater.tool.annotation.SystemLog;
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
public class SysAreaService implements ISysAreaService {
    @Resource
    private ISysAreaDataService sysAreaDataService;
    @SystemLog
	@Override
    public List<SysArea> findAll() {
        return sysAreaDataService.findAll();
    }

    @SystemLog
	@Override
    public int save(SysArea area) {
        return sysAreaDataService.save(area);
    }

    @SystemLog
	@Override
    public int delete(SysArea area) {
        return sysAreaDataService.delete(area);
    }

    @SystemLog
	@Override
    public int update(SysArea area) {
        return sysAreaDataService.update(area);
    }

    @SystemLog
	@Override
    public SysArea findById(Long id) {
        return sysAreaDataService.findById(id);
    }

    @SystemLog
	@Override
    public List<SysArea> findAllNotRoot() {
        return sysAreaDataService.findAllNotRoot();
    }

    @Override
    public Date queryNowTimeFromDB() {
        return sysAreaDataService.queryNowTimeFromDB();
    }


}
