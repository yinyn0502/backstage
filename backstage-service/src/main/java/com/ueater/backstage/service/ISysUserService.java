package com.ueater.backstage.service;

import com.ueater.backstage.common.model.SysUser;

import java.util.List;

/**
 * Created by caoli on 2017/8/26.
 */
public interface ISysUserService {
    /**
     * 根据登录名称查询用户
     * @param loginName
     * @return
     */
    public SysUser getByLoginName(String loginName);

    /**
     * 通过OfficeId获取用户列表，仅返回用户id和name（树查询用户时用）
     * @param officeId
     * @return
     */
    public List<SysUser> findUserByOfficeId(Long officeId);

    /**
     * 查询全部用户数目
     * @return
     */
    public long findAllCount();

    /**
     * 更新用户密码
     * @param user
     * @return
     */
    public int update(SysUser user);



    /**
     * 删除用户角色关联数据
     * @param user
     * @return
     */
    public int deleteUserRole(SysUser user);

    /**
     * 插入用户角色关联数据
     * @return
     */
    public int insertUserRole(Long userId, Long roleId);


    /**
     *
     * 查询用户-->用来添加到常用联系人s
     *
     */
    public List<SysUser> searchUsers(SysUser user);

    /**
     *
     */
    public List<SysUser>  findListByOffice(SysUser user);


    public SysUser findById(Long id);


    public List<SysUser> findListByRoleId(Long roleId);


    public List<SysUser> findAll();


    public SysUser findByLoginNameAndAdFlag(String loginName, String adFlag);

    public int save(SysUser user);

    public List<SysUser> findLikeLoginName(String loginName,String name,Long officeId,Long compayId);

    public List<SysUser> initOffice(List<SysUser> list);
}
