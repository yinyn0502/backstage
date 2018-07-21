package com.ueater.backstage.dao;

import com.ueater.backstage.common.model.SysRoleMenuExample;
import com.ueater.backstage.common.model.SysRoleMenuKey;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ISysRoleMenuDao {
    int countByExample(SysRoleMenuExample example);

    int deleteByExample(SysRoleMenuExample example);

    int deleteByPrimaryKey(SysRoleMenuKey key);

    int insert(SysRoleMenuKey record);

    int insertSelective(SysRoleMenuKey record);

    List<SysRoleMenuKey> selectByExample(SysRoleMenuExample example);

    int updateByExampleSelective(@Param("record") SysRoleMenuKey record, @Param("example") SysRoleMenuExample example);

    int updateByExample(@Param("record") SysRoleMenuKey record, @Param("example") SysRoleMenuExample example);
}