package com.ueater.backstage.service;

import com.ueater.backstage.common.model.SysRole;
import com.ueater.backstage.common.model.SysRoleMenuKey;
import com.ueater.backstage.common.model.SysUserRoleKey;

import java.util.List;

/**
 * Created by caoli on 2017/8/26.
 */
public interface ISysRoleService {
    /**
     * 根据用户ID获取角色列表
     * @param userId
     * @return
     */
    public List<SysRole> getRoleList(Long userId);

    /**
     * 获取所有角色
     * @return
     */
    public List<SysRole> findAll();

    public SysRole findById(Long id);

    public SysRole getRoleByName(String roleName);

    public SysRole getRoleByEnName(String roleEnName);

    public int update(SysRole role);

    public int save(SysRole role);

    public int delete(SysRole role);

    public int assignUserToRole(Long roleId, Long userId);

    public int  outUserInRole(Long roleId, Long userId);

    public List<SysRoleMenuKey> findRoleMenuKeyListByRoleId(Long roleId);

    public String getRoleMenuStringByRoleId(Long roleId);

    public int saveMenuToRole(Long menuId, Long roleId);
/**/
    public int deleteMenuToRole(Long menuId, Long roleId);

    public void deleteMenusToRole(String menuIds, Long roleId);

    public void deleteMenusToRole(List<SysRoleMenuKey> menuIds, Long roleId);

    public List<SysUserRoleKey> findUserRoleKeyByRoleId(Long roleId);

    public List<SysRole> findRoleByName(String roleName);
}
