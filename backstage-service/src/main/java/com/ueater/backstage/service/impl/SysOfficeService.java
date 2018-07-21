package com.ueater.backstage.service.impl;

import com.ueater.backstage.common.model.SysOffice;
import com.ueater.backstage.dataservice.ISysOfficeDataService;
import com.ueater.backstage.service.ISysOfficeService;
import com.ueater.tool.annotation.SystemLog;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by caoli on 2017/8/24.
 */
@Slf4j
@Service
public class SysOfficeService implements ISysOfficeService {
    @Resource
    private ISysOfficeDataService sysOfficeDataService;
    @SystemLog
	@Override
    public List<SysOffice> findAll() {
        return sysOfficeDataService.findAll();
    }

    @SystemLog
	@Override
    public List<SysOffice> findList(Boolean isAll) {
        return sysOfficeDataService.findList(isAll);
    }

    @SystemLog
	@Override
    public List<SysOffice> findList(SysOffice office) {
        return sysOfficeDataService.findList(office);
    }

    @SystemLog
	@Override
    public SysOffice getByCode(String code) {
        return sysOfficeDataService.getByCode(code);
    }

    @SystemLog
	@Override
    public int save(SysOffice office) {
        return sysOfficeDataService.save(office);
    }

    @SystemLog
	@Override
    public int delete(SysOffice office) {
        return sysOfficeDataService.delete(office);
    }

    @SystemLog
	@Override
    public int update(SysOffice office) {
        return sysOfficeDataService.update(office);
    }

    @SystemLog
	@Override
    public List<SysOffice> findAllList() {
        return sysOfficeDataService.findAllList();
    }

    @SystemLog
	@Override
    public SysOffice findById(Long id) {
        return sysOfficeDataService.findById(id);
    }

    @SystemLog
	@Override
    public List<SysOffice> findByParentId(Long parentId) {
        return sysOfficeDataService.findByParentId(parentId);
    }
}
