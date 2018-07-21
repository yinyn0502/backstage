package com.ueater.backstage.service;

import com.ueater.backstage.common.model.SysDict;

import java.util.List;

/**
 * Created by caoli on 2017/8/22.
 */
public interface ISysDictService {

    /**
     * 查询字段类型列表
     * @return
     */
    public List<String> findTypeList();

    public int save(SysDict dict);

    public int delete(SysDict dict);

    public int update(SysDict dict);

    public List<SysDict> findAllList();

    public String getDictLabel(String value, String type, String defaultValue);

    public List<SysDict> getDictList(String type);

    public String getDictLabels(String values, String type, String defaultValue);

    public String getDictValue(String label, String type, String defaultLabel);

    public Object getValue(Object obj, String filed);

    public SysDict findById(Long id);

    public List<SysDict> findByProperties(String type, String description);
}
