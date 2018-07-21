package com.ueater.backstage.service;

import com.ueater.backstage.common.model.SysArea;

import java.util.Date;
import java.util.List;

/**
 * Created by caoli on 2017/8/21.
 */
public interface ISysAreaService {
    public List<SysArea> findAll();

    public int save(SysArea area);

    public int delete(SysArea area) ;

    public int update(SysArea area);

    public SysArea findById(Long id);

    public List<SysArea> findAllNotRoot();

    Date queryNowTimeFromDB();
}
