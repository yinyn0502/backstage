package com.ueater.backstage.dao;

import com.ueater.backstage.common.model.SysMenu;
import com.ueater.backstage.common.model.SysMenuExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ISysMenuDao {
    int countByExample(SysMenuExample example);

    int deleteByExample(SysMenuExample example);

    int deleteByPrimaryKey(Long id);

    int insert(SysMenu record);

    int insertSelective(SysMenu record);

    List<SysMenu> selectByExample(SysMenuExample example);

    SysMenu selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") SysMenu record, @Param("example") SysMenuExample example);

    int updateByExample(@Param("record") SysMenu record, @Param("example") SysMenuExample example);

    int updateByPrimaryKeySelective(SysMenu record);

    int updateByPrimaryKey(SysMenu record);

    List<SysMenu> findByUserId(@Param("userId") Long userId);

    List<SysMenu> getAll(@Param("id") Long id);

    List<SysMenu> findByParentIdsLike(@Param("parentIds") String parentIds);

    List<SysMenu> getAllList();

    List<SysMenu> getAllByParentId(@Param("id") Long id);

    List<SysMenu> findByUserIdAndTopMenu(@Param("userId") Long userId);
}