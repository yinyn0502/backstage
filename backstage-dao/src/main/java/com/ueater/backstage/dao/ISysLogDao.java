package com.ueater.backstage.dao;

import com.ueater.backstage.common.model.SysLog;
import com.ueater.backstage.common.model.SysLogExample;
import com.ueater.backstage.common.model.SysLogWithBLOBs;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ISysLogDao {
    int countByExample(SysLogExample example);

    int deleteByExample(SysLogExample example);

    int deleteByPrimaryKey(Long id);

    int insert(SysLogWithBLOBs record);

    int insertSelective(SysLogWithBLOBs record);

    List<SysLogWithBLOBs> selectByExampleWithBLOBs(SysLogExample example);

    List<SysLog> selectByExample(SysLogExample example);

    SysLogWithBLOBs selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") SysLogWithBLOBs record, @Param("example") SysLogExample example);

    int updateByExampleWithBLOBs(@Param("record") SysLogWithBLOBs record, @Param("example") SysLogExample example);

    int updateByExample(@Param("record") SysLog record, @Param("example") SysLogExample example);

    int updateByPrimaryKeySelective(SysLogWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(SysLogWithBLOBs record);

    int updateByPrimaryKey(SysLog record);
}
