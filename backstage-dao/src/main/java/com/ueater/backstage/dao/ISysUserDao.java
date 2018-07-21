package com.ueater.backstage.dao;

import com.github.pagehelper.Page;
import com.ueater.backstage.common.model.SysUser;
import com.ueater.backstage.common.model.SysUserExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ISysUserDao {
    int countByExample(SysUserExample example);

    int deleteByExample(SysUserExample example);

    int deleteByPrimaryKey(Long id);

    int insert(SysUser record);

    int insertSelective(SysUser record);

    List<SysUser> selectByExample(SysUserExample example);

    SysUser selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") SysUser record, @Param("example") SysUserExample example);

    int updateByExample(@Param("record") SysUser record, @Param("example") SysUserExample example);

    int updateByPrimaryKeySelective(SysUser record);

    int updateByPrimaryKey(SysUser record);

    /**
     * 删除用户角色关联数据
     * @param id
     * @return
     */
    public int deleteUserRole(@Param("id") Long id);

    /**
     * 插入用户角色关联数据
     * @param userId
     * @return
     */
    public int insertUserRole(@Param("userId") Long userId, @Param("roleId") Long roleId);

    public List<SysUser> findListByRoleId(@Param("roleId") Long roleId);

    public Page<SysUser> findByPage();

    public List<SysUser> findLikeLoginName(@Param("loginName") String loginName,@Param("name") String name,@Param("officeId") Long officeId,@Param("companyId") Long companyId);


}