package com.ueater.backstage.dao;

import com.ueater.backstage.common.model.SysUserFriend;
import com.ueater.backstage.common.model.SysUserFriendExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ISysUserFriendDao {
    int countByExample(SysUserFriendExample example);

    int deleteByExample(SysUserFriendExample example);

    int deleteByPrimaryKey(Long id);

    int insert(SysUserFriend record);

    int insertSelective(SysUserFriend record);

    List<SysUserFriend> selectByExample(SysUserFriendExample example);

    SysUserFriend selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") SysUserFriend record, @Param("example") SysUserFriendExample example);

    int updateByExample(@Param("record") SysUserFriend record, @Param("example") SysUserFriendExample example);

    int updateByPrimaryKeySelective(SysUserFriend record);

    int updateByPrimaryKey(SysUserFriend record);
}