package com.ueater.backstage.dataservice;

import com.ueater.backstage.common.model.SysUser;

import java.util.List;

/**
 * Created by caoli on 2017/8/24.
 */
    public interface ISysUserDataService {


    /**
     * 根据登录名称查询用户
     * @param loginName
     * @return
     */
    SysUser getByLoginName(String loginName);

    /**
     * 通过OfficeId获取用户列表，仅返回用户id和name（树查询用户时用）
     * @param officeId
     * @return
     */
    List<SysUser> findUserByOfficeId(Long officeId);

    /**
     * 查询全部用户数目
     * @return
     */
    long findAllCount();

    /**
     * 更新用户密码
     * @param user
     * @return
     */
    int update(SysUser user);


    int save(SysUser user);



    /**
     * 删除用户角色关联数据
     * @param user
     * @return
     */
    int deleteUserRole(SysUser user);

    /**
     * 插入用户角色关联数据
     * @return
     */
    int insertUserRole(Long userId, Long roleId);


    /**
     *
     * 查询用户-->用来添加到常用联系人
     *
     */
    List<SysUser> searchUsers(SysUser user);

    /**
     *
     */
    List<SysUser>  findListByOffice(SysUser user);


    SysUser findById(Long id);

    /**
     * 查询某个角色下的所有用户
     * @param roleId
     * @return
     */
    List<SysUser> findListByRoleId(Long roleId);

    List<SysUser> findAll();

    SysUser findByLoginNameAndAdFlag(String loginName, String adFlag);

    List<SysUser> findLikeLoginName(String loginName, String name, Long officeId, Long companyId);



}
