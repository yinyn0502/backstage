package com.ueater.backstage.dao;

import com.ueater.backstage.common.model.SysUserRoleExample;
import com.ueater.backstage.common.model.SysUserRoleKey;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ISysUserRoleDao {
    int countByExample(SysUserRoleExample example);

    int deleteByExample(SysUserRoleExample example);

    int deleteByPrimaryKey(SysUserRoleKey key);

    int insert(SysUserRoleKey record);

    int insertSelective(SysUserRoleKey record);

    List<SysUserRoleKey> selectByExample(SysUserRoleExample example);

    int updateByExampleSelective(@Param("record") SysUserRoleKey record, @Param("example") SysUserRoleExample example);

    int updateByExample(@Param("record") SysUserRoleKey record, @Param("example") SysUserRoleExample example);
}