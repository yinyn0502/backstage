package com.ueater.backstage.dao;

import com.ueater.backstage.common.model.SysArea;
import com.ueater.backstage.common.model.SysAreaExample;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface ISysAreaDao {
    int countByExample(SysAreaExample example);

    int deleteByExample(SysAreaExample example);

    int deleteByPrimaryKey(Long id);

    int insert(SysArea record);

    int insertSelective(SysArea record);

    List<SysArea> selectByExample(SysAreaExample example);

    SysArea selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") SysArea record, @Param("example") SysAreaExample example);

    int updateByExample(@Param("record") SysArea record, @Param("example") SysAreaExample example);

    int updateByPrimaryKeySelective(SysArea record);

    int updateByPrimaryKey(SysArea record);

    List<SysArea> findAllList();

    /**
     * 不包括根节点
     * @return
     */
    List<SysArea> findAllNotRoot();

    Date queryNowTimeFromDB();
}