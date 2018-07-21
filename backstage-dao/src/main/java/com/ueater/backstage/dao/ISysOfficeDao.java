package com.ueater.backstage.dao;

import com.ueater.backstage.common.model.SysOffice;
import com.ueater.backstage.common.model.SysOfficeExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ISysOfficeDao {
    int countByExample(SysOfficeExample example);

    int deleteByExample(SysOfficeExample example);

    int deleteByPrimaryKey(Long id);

    int insert(SysOffice record);

    int insertSelective(SysOffice record);

    List<SysOffice> selectByExample(SysOfficeExample example);

    SysOffice selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") SysOffice record, @Param("example") SysOfficeExample example);

    int updateByExample(@Param("record") SysOffice record, @Param("example") SysOfficeExample example);

    int updateByPrimaryKeySelective(SysOffice record);

    int updateByPrimaryKey(SysOffice record);

    List<SysOffice> findAllList();
}