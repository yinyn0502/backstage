package com.ueater.backstage.dao;

import com.ueater.backstage.common.model.SysDict;
import com.ueater.backstage.common.model.SysDictExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ISysDictDao {
    int countByExample(SysDictExample example);

    int deleteByExample(SysDictExample example);

    int deleteByPrimaryKey(Long id);

    int insert(SysDict record);

    int insertSelective(SysDict record);

    List<SysDict> selectByExample(SysDictExample example);

    SysDict selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") SysDict record, @Param("example") SysDictExample example);

    int updateByExample(@Param("record") SysDict record, @Param("example") SysDictExample example);

    int updateByPrimaryKeySelective(SysDict record);

    int updateByPrimaryKey(SysDict record);

    List<SysDict> findAllList();

    List<String> findTypeList();

    List<SysDict> findByProperties(@Param("type")String type, @Param("description")String description);

}