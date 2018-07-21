package com.ueater.backstage.dataservice;

import com.ueater.backstage.common.model.SysArea;

import java.util.Date;
import java.util.List;

/**
 * Created by caoli on 2017/8/21.
 */
public interface ISysAreaDataService {

    public List<SysArea> findAll();

    public int save(SysArea area);

    public int delete(SysArea area) ;

    public int update(SysArea area);

    public List<SysArea> findAllList();

    public SysArea findById(Long id);
    /**
     * 不包括根节点
     * @return
     */
    List<SysArea> findAllNotRoot();

    Date queryNowTimeFromDB();
}
