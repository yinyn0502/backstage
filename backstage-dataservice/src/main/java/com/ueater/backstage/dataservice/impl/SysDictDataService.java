package com.ueater.backstage.dataservice.impl;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.ueater.backstage.common.model.SysDict;
import com.ueater.backstage.dao.ISysDictDao;
import com.ueater.backstage.dataservice.ISysDictDataService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

/**
 * Created by caoli on 2017/8/22.
 */
@Slf4j
@Service
public class SysDictDataService implements ISysDictDataService{
    @Resource
    private ISysDictDao sysDictDao;
    @Override
    public List<String> findTypeList() {
        return sysDictDao.findTypeList();
    }
    @Override
    public SysDict findById(Long id){
        return sysDictDao.selectByPrimaryKey(id);
    }

    @Override
    public int save(SysDict dict) {
        return sysDictDao.insert(dict);
    }

    @Override
    public int delete(SysDict dict) {
        return sysDictDao.deleteByPrimaryKey(dict.getId());
    }

    @Override
    public int update(SysDict dict) {
        return sysDictDao.updateByPrimaryKey(dict);
    }

    @Override
    public List<SysDict> findAllList() {
        return sysDictDao.findAllList();
    }

    @Override
    public String getDictLabel(String value, String type, String defaultValue){
        if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(value)){
            for (SysDict dict : getDictList(type)){
                if (type.equals(dict.getType()) && value.equals(dict.getValue())){
                    return dict.getLabel();
                }
            }
        }
        return defaultValue;
    }

    @Override
    public List<SysDict> findByProperties(String type, String description) {
        List<SysDict> list = sysDictDao.findByProperties(type,description);
        return list;
    }

    @Override
    public List<SysDict> getDictList(String type){
        @SuppressWarnings("unchecked") Map<String, List<SysDict>> dictMap = null;
        if (dictMap==null){
            dictMap = Maps.newHashMap();
            for (SysDict dict : sysDictDao.findAllList()){
                List<SysDict> dictList = dictMap.get(dict.getType());
                if (dictList != null){
                    dictList.add(dict);
                }else{
                    dictMap.put(dict.getType(), Lists.newArrayList(dict));
                }
            }

        }
        List<SysDict> dictList = dictMap.get(type);
        if (dictList == null){
            dictList = Lists.newArrayList();
        }
        return dictList;
    }


    @Override
    public String getDictLabels(String values, String type, String defaultValue){
        if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(values)){
            List<String> valueList = Lists.newArrayList();
            for (String value : StringUtils.split(values, ",")){
                valueList.add(getDictLabel(value, type, defaultValue));
            }
            return StringUtils.join(valueList, ",");
        }
        return defaultValue;
    }
    @Override
    public String getDictValue(String label, String type, String defaultLabel){
        if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(label)){
            for (SysDict dict : getDictList(type)){
                if (type.equals(dict.getType()) && label.equals(dict.getLabel())){
                    return dict.getValue();
                }
            }
        }
        return defaultLabel;
    }


    /*
	 * 反射根据对象和属性名获取属性值
	 */
    @Override
    public Object getValue(Object obj, String filed) {
        try {
            Class clazz = obj.getClass();
            PropertyDescriptor pd = new PropertyDescriptor(filed, clazz);
            Method getMethod = pd.getReadMethod();//获得get方法

            if (pd != null) {

                Object o = getMethod.invoke(obj);//执行get方法返回一个Object
                return o;

            }
        } catch (SecurityException e) {
            e.printStackTrace();
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
        } catch (IntrospectionException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        return null;
    }

}
