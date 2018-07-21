package com.ueater.backstage.service.impl;

import com.ueater.backstage.common.model.SysRole;
import com.ueater.backstage.common.model.SysRoleMenuKey;
import com.ueater.backstage.common.model.SysUserRoleKey;
import com.ueater.backstage.dataservice.ISysRoleDataService;
import com.ueater.backstage.service.ISysRoleService;
import com.ueater.tool.annotation.SystemLog;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by caoli on 2017/8/26.
 */
@Slf4j
@Service
public class SysRoleService implements ISysRoleService {
    @Resource
    private ISysRoleDataService sysRoleDataService;

    @SystemLog
	@Override
    public List<SysRole> getRoleList(Long userId) {
        return sysRoleDataService.getRoleList(userId);
    }

    @SystemLog
	@Override
    public List<SysRole> findAll() {
        return sysRoleDataService.findAll();
    }

    @SystemLog
	@Override
    public SysRole findById(Long id) {
        return sysRoleDataService.findById(id);
    }

    @SystemLog
	@Override
    public SysRole getRoleByName(String roleName) {
        return sysRoleDataService.getRoleByName(roleName);
    }

    @SystemLog
	@Override
    public SysRole getRoleByEnName(String roleEnName) {
        return sysRoleDataService.getRoleByEnName(roleEnName);
    }

    @SystemLog
	@Override
    public int update(SysRole role) {
        return sysRoleDataService.update(role);
    }

    @SystemLog
	@Override
    public int save(SysRole role) {
        return sysRoleDataService.save(role);
    }

    @SystemLog
	@Override
    public int delete(SysRole role) {
        return sysRoleDataService.delete(role);
    }

    @SystemLog
	@Override
    public int assignUserToRole(Long roleId, Long userId) {
        return sysRoleDataService.assignUserToRole(roleId,userId);
    }

    @SystemLog
	@Override
    public int outUserInRole(Long roleId, Long userId) {
        return sysRoleDataService.outUserInRole(roleId,userId);
    }

    @SystemLog
	@Override
    public List<SysRoleMenuKey> findRoleMenuKeyListByRoleId(Long roleId) {
        return sysRoleDataService.findRoleMenuKeyListByRoleId(roleId);
    }

    @SystemLog
	@Override
    public String getRoleMenuStringByRoleId(Long roleId) {
        String r=sysRoleDataService.getRoleMenuStringByRoleId(roleId);
        if(StringUtils.isBlank(r)){
            return "";
        }
        return r;
    }
    @SystemLog
	@Override
    public int saveMenuToRole(Long menuId,Long roleId){
        return sysRoleDataService.saveMenuToRole(menuId,roleId);
    }

    @SystemLog
	@Override
    public int deleteMenuToRole(Long menuId, Long roleId) {
        return sysRoleDataService.deleteMenuToRole(menuId, roleId);
    }

    @SystemLog
	@Override
    public void deleteMenusToRole(String menuIds, Long roleId) {
        sysRoleDataService.deleteMenusToRole(menuIds,roleId);
    }

    @SystemLog
	@Override
    public void deleteMenusToRole(List<SysRoleMenuKey> menuIds, Long roleId) {
        sysRoleDataService.deleteMenusToRole(menuIds,roleId);
    }

    @SystemLog
	@Override
    public List<SysUserRoleKey> findUserRoleKeyByRoleId(Long roleId) {
        return sysRoleDataService.findUserRoleKeyByRoleId(roleId);
    }

    @SystemLog
	@Override
    public List<SysRole> findRoleByName(String roleName) {
        return sysRoleDataService.findRoleByName(roleName);
    }


}
