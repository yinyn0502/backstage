package com.ueater.backstage.service;

import com.ueater.backstage.common.model.SysOffice;

import java.util.List;

/**
 * Created by caoli on 2017/8/24.
 */
public interface ISysOfficeService {

    public List<SysOffice> findAll();

    public List<SysOffice> findList(Boolean isAll);

    public List<SysOffice> findList(SysOffice office);

    public SysOffice getByCode(String code);

    public int save(SysOffice office);

    public int delete(SysOffice office);

    public int update(SysOffice office);

    public List<SysOffice> findAllList();

    public SysOffice findById(Long id);

    /**
     * 查找一个机构下的所有子机构
     * @param parentId
     * @return
     */
    public List<SysOffice> findByParentId(Long parentId);
}
