package com.ueater.backstage.dataservice.impl;

import com.ueater.backstage.common.model.*;
import com.ueater.backstage.common.util.Tools;
import com.ueater.backstage.dao.ISysOfficeDao;
import com.ueater.backstage.dao.ISysRoleDao;
import com.ueater.backstage.dao.ISysRoleMenuDao;
import com.ueater.backstage.dao.ISysUserRoleDao;
import com.ueater.backstage.dataservice.ISysRoleDataService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by caoli on 2017/8/25.
 */
@Slf4j
@Service
public class SysRoleDataService implements ISysRoleDataService {
    @Resource
    private ISysRoleDao sysRoleDao;
    @Resource
    private ISysUserRoleDao sysUserRoleDao;
    @Resource
    private ISysOfficeDao sysOfficeDao;
    @Resource
    private ISysRoleMenuDao sysRoleMenuDao;

    @Override
    public List<SysRole> getRoleList(Long userId) {
        List<SysRole> roleList=new ArrayList<SysRole>();
        SysUserRoleExample example = new SysUserRoleExample();
        SysUserRoleExample.Criteria criteria = example.createCriteria();
        criteria.andUserIdEqualTo(userId);
        List<SysUserRoleKey> list = sysUserRoleDao.selectByExample(example);
        if(list!=null&&list.size()>0) {
            for (SysUserRoleKey k : list) {
                SysRole role = sysRoleDao.selectByPrimaryKey(k.getRoleId());
                roleList.add(role);
            }
        }
        return roleList;
    }

    @Override
    public List<SysRole> findAll() {
        SysRoleExample example = new SysRoleExample();
        SysRoleExample.Criteria criteria = example.createCriteria();
        criteria.andDelFlagEqualTo("0");
        List<SysRole> list = sysRoleDao.selectByExample(example);
        if(list!=null&&list.size()>0) {
            for (SysRole s : list) {
                if (s.getOfficeId() != null) {
                    s.setOffice(sysOfficeDao.selectByPrimaryKey(s.getOfficeId()));
                }
            }
        }
        return list;
    }

    @Override
    public SysRole findById(Long id) {
        return sysRoleDao.selectByPrimaryKey(id);
    }

    @Override
    public SysRole getRoleByName(String roleName) {
        SysRoleExample example = new SysRoleExample();
        SysRoleExample.Criteria criteria = example.createCriteria();
        List<SysRole> list = sysRoleDao.selectByExample(example);
        criteria.andNameEqualTo(roleName);
        if(list!=null&&list.size()>0){
            return list.get(0);
        }
       return null;
    }

    @Override
    public SysRole getRoleByEnName(String roleEnName) {
        SysRoleExample example = new SysRoleExample();
        SysRoleExample.Criteria criteria = example.createCriteria();
        List<SysRole> list = sysRoleDao.selectByExample(example);
        criteria.andEnnameEqualTo(roleEnName);
        if(list!=null&&list.size()>0){
            return list.get(0);
        }
        return null;
    }

    @Override
    public int update(SysRole role) {
        return sysRoleDao.updateByPrimaryKey(role);
    }

    @Override
    public int save(SysRole role) {
        return sysRoleDao.insert(role);
    }

    @Override
    public int delete(SysRole role) {
        return sysRoleDao.deleteByPrimaryKey(role.getId());
    }

    @Override
    public int assignUserToRole(Long roleId, Long userId) {
        int result=0;
        SysUserRoleExample example = new SysUserRoleExample();
        SysUserRoleExample.Criteria criteria = example.createCriteria();
        criteria.andUserIdEqualTo(userId);
        criteria.andRoleIdEqualTo(roleId);
        List<SysUserRoleKey> userRoleList=sysUserRoleDao.selectByExample(example);
        if(userRoleList!=null&&userRoleList.size()>0) {
            return 0;
        }else{
            SysUserRoleKey key=new SysUserRoleKey();
            key.setRoleId(roleId);
            key.setUserId(userId);
            result=sysUserRoleDao.insert(key);
            return result;
        }
    }
    @Override
    public int  outUserInRole(Long roleId,Long userId){
        int result=0;
        SysUserRoleExample example = new SysUserRoleExample();
        SysUserRoleExample.Criteria criteria = example.createCriteria();
        criteria.andUserIdEqualTo(userId);
        criteria.andRoleIdEqualTo(roleId);
        List<SysUserRoleKey> userRoleList=sysUserRoleDao.selectByExample(example);
        if(userRoleList!=null&&userRoleList.size()>0) {
           result= sysUserRoleDao.deleteByExample(example);
           return result;
        }else{
            return 0;
        }
    }

    @Override
    public List<SysRoleMenuKey> findRoleMenuKeyListByRoleId(Long roleId) {
        SysRoleMenuExample example = new SysRoleMenuExample();
        SysRoleMenuExample.Criteria criteria = example.createCriteria();
        criteria.andRoleIdEqualTo(roleId);
        return sysRoleMenuDao.selectByExample(example);
    }

    @Override
    public String getRoleMenuStringByRoleId(Long roleId){
        List<SysRoleMenuKey> list=findRoleMenuKeyListByRoleId(roleId);
        if(list!=null&&list.size()>0) {
            StringBuffer sb=new StringBuffer();
            for (SysRoleMenuKey k : list) {
                sb.append(k.getMenuId());
                sb.append(",");
            }
            return sb.toString().substring(0,sb.toString().length()-1);
        }
        return null;
    }

    @Override
    public int saveMenuToRole(Long menuId,Long roleId) {
        SysRoleMenuExample example = new SysRoleMenuExample();
        SysRoleMenuExample.Criteria criteria = example.createCriteria();
        criteria.andMenuIdEqualTo(menuId);
        criteria.andRoleIdEqualTo(roleId);
        List<SysRoleMenuKey> list=sysRoleMenuDao.selectByExample(example);
        if(list!=null&&list.size()>0) {
            return 0;
        }else {
            SysRoleMenuKey key = new SysRoleMenuKey();
            key.setMenuId(menuId);
            key.setRoleId(roleId);
            return sysRoleMenuDao.insert(key);
        }
    }

    @Override
    public int deleteMenuToRole(Long menuId, Long roleId) {
        int result=0;
        SysRoleMenuExample example = new SysRoleMenuExample();
        SysRoleMenuExample.Criteria criteria = example.createCriteria();
        criteria.andMenuIdEqualTo(menuId);
        criteria.andRoleIdEqualTo(roleId);
        List<SysRoleMenuKey> list=sysRoleMenuDao.selectByExample(example);
        if(list!=null&&list.size()>0) {
            result= sysRoleMenuDao.deleteByExample(example);
            return result;
        }else{
            return 0;
        }
    }
    @Override
    public void deleteMenusToRole(String menuIds,Long roleId){
       List<String> list= Tools.stringToList(menuIds);
       for(String s:list){
           deleteMenuToRole(Long.parseLong(s),roleId);
       }
    }
    @Override
    public void deleteMenusToRole(List<SysRoleMenuKey> menuIds, Long roleId){
        for(SysRoleMenuKey s:menuIds){
            deleteMenuToRole(s.getMenuId(),roleId);
        }
    }

    @Override
    public List<SysUserRoleKey> findUserRoleKeyByRoleId(Long roleId) {
        SysUserRoleExample example = new SysUserRoleExample();
        SysUserRoleExample.Criteria criteria = example.createCriteria();
        criteria.andRoleIdEqualTo(roleId);
        return sysUserRoleDao.selectByExample(example);
    }

    @Override
    public List<SysRole> findRoleByName(String roleName) {
        SysRoleExample example = new SysRoleExample();
        SysRoleExample.Criteria criteria = example.createCriteria();
        criteria.andDelFlagEqualTo("0");
        criteria.andNameLike(roleName);
        return sysRoleDao.selectByExample(example);
    }


}
