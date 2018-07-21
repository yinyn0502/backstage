package com.ueater.backstage.service.impl;

import com.ueater.backstage.common.model.SysDict;
import com.ueater.backstage.dataservice.impl.SysDictDataService;
import com.ueater.backstage.service.ISysDictService;
import com.ueater.tool.annotation.SystemLog;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by caoli on 2017/8/22.
 */
@Slf4j
@Service
public class SysDictService implements ISysDictService{
    @Resource
    private SysDictDataService sysDictDataService;

    @SystemLog
	@Override
    public List<SysDict> findByProperties(String type, String description) {
        return sysDictDataService.findByProperties(type,description);
    }

    @SystemLog
	@Override
    public List<String> findTypeList() {
        return sysDictDataService.findTypeList();
    }

    @SystemLog
	@Override
    public int save(SysDict dict) {
        return sysDictDataService.save(dict);
    }

    @SystemLog
	@Override
    public int delete(SysDict dict) {
        return sysDictDataService.delete(dict);
    }

    @SystemLog
	@Override
    public int update(SysDict dict) {
        return sysDictDataService.update(dict);
    }

    @SystemLog
	@Override
    public List<SysDict> findAllList() {
        return sysDictDataService.findAllList();
    }

    @SystemLog
	@Override
    public String getDictLabel(String value, String type, String defaultValue) {
        return sysDictDataService.getDictLabel(value,type,defaultValue);
    }

    @SystemLog
	@Override
    public List<SysDict> getDictList(String type) {
        return sysDictDataService.getDictList(type);
    }

    @SystemLog
	@Override
    public String getDictLabels(String values, String type, String defaultValue) {
        return sysDictDataService.getDictLabels(values,type,defaultValue);
    }

    @SystemLog
	@Override
    public String getDictValue(String label, String type, String defaultLabel) {
        return sysDictDataService.getDictValue(label,type,defaultLabel);
    }

    @SystemLog
	@Override
    public Object getValue(Object obj, String filed) {
        return sysDictDataService.getValue(obj,filed);
    }

    @SystemLog
	@Override
    public SysDict findById(Long id) {
        return sysDictDataService.findById(id);
    }
}
