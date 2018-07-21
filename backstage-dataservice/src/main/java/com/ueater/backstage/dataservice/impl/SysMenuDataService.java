package com.ueater.backstage.dataservice.impl;


import com.ueater.backstage.common.model.SysMenu;
import com.ueater.backstage.common.model.SysMenuExample;
import com.ueater.backstage.common.model.SysRoleMenuExample;
import com.ueater.backstage.common.model.SysRoleMenuKey;
import com.ueater.backstage.dao.ISysMenuDao;
import com.ueater.backstage.dao.ISysRoleMenuDao;
import com.ueater.backstage.dataservice.ISysMenuDataService;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by caoli on 2017/8/14.
 */
@Service
public class SysMenuDataService implements ISysMenuDataService {
    @Resource
    private ISysMenuDao sysMenuDao;

    @Resource
    private ISysRoleMenuDao sysRoleMenuDao;
    @Override
    public SysMenu get(Long id) {
        return sysMenuDao.selectByPrimaryKey(id);
    }

    @Override
    public List<SysMenu> findAll() {
        SysMenuExample example = new SysMenuExample();
        SysMenuExample.Criteria criteria = example.createCriteria();
        criteria.andDelFlagEqualTo("0");
        List<SysMenu> menuList = sysMenuDao.selectByExample(example);
        for (SysMenu s : menuList) {
            List<SysMenu> subSysMenu = getChildren(s.getId());
            if (subSysMenu != null && subSysMenu.size() > 0) {
                s.setSubSysMenu(subSysMenu);
                s.setHasSubSysMenu(true);
            }

        }
        return menuList;
    }

    @Override
    public List<SysMenu> findByUserId(Long userId) {
        return sysMenuDao.findByUserId(userId);
    }

    @Override
    public int save(SysMenu menu) {
        return sysMenuDao.insert(menu);
    }

    @Override
    public int update(SysMenu menu) {
        return sysMenuDao.updateByPrimaryKey(menu);
    }

    @Override
    public int delete(SysMenu menu) {
        return sysMenuDao.deleteByPrimaryKey(menu.getId());
    }

    @Override
    public List<SysMenu> findByParentIdsLike(String parentIds) {
        return sysMenuDao.findByParentIdsLike(parentIds);
    }

    @Override
    public List<SysMenu> getChildren(Long parentId) {
        SysMenuExample example = new SysMenuExample();
        SysMenuExample.Criteria criteria = example.createCriteria();
        criteria.andParentIdEqualTo(parentId);
        criteria.andIsShowEqualTo("1");
        List<SysMenu> list = sysMenuDao.selectByExample(example);
        return list;
    }

    @Override
    public List<SysMenu> getAllList() {
        return sysMenuDao.getAllList();
    }

    public List<SysMenu> getAll(Long id) {
        return sysMenuDao.getAll(id);
    }

    @Override
    public List<SysMenu> getAllByParentId(Long id) {
        return sysMenuDao.getAllByParentId(id);
    }

    @Override
    public Map<String, Object> queryMenuList(Long rootId) {

        // 原始的数据
        SysMenuExample example = new SysMenuExample();
        SysMenuExample.Criteria criteria = example.createCriteria();
        criteria.andDelFlagEqualTo("0");
        criteria.andParentIdEqualTo(rootId);
        List<SysMenu> rootMenu = sysMenuDao.selectByExample(example);


        // 查看结果
        for (SysMenu menu : rootMenu) {
            System.out.println(menu);
        }
        // 最后的结果
        List<SysMenu> menuList = new ArrayList<SysMenu>();
        // 先找到所有的一级菜单
        for (int i = 0; i < rootMenu.size(); i++) {
            // 一级菜单没有parentId
            if (StringUtils.isBlank(rootMenu.get(i).getParentId().toString())) {
                menuList.add(rootMenu.get(i));
            }
        }
        // 为一级菜单设置子菜单，getChild是递归调用的
        for (SysMenu menu : menuList) {
            menu.setSubSysMenu(getChild(menu.getId(), rootMenu));
        }
        Map<String, Object> jsonMap = new HashMap<>();
        jsonMap.put("menu", menuList);
        return jsonMap;
    }


    /**
     * 递归查找子菜单
     *
     * @param id
     *            当前菜单id
     * @param rootMenu
     *            要查找的列表
     * @return
     */
    @Override
    public List<SysMenu> getChild(Long id, List<SysMenu> rootMenu) {
        // 子菜单
        List<SysMenu> childList = new ArrayList<SysMenu>();
        for (SysMenu menu : rootMenu) {
            // 遍历所有节点，将父菜单id与传过来的id比较
            if (StringUtils.isNotBlank(menu.getParentId().toString())) {
                if (menu.getParentId().equals(id)) {
                    childList.add(menu);
                }
            }
        }
        // 把子菜单的子菜单再循环一遍
        for (SysMenu menu : childList) {// 没有url子菜单还有子菜单
            if (StringUtils.isBlank(menu.getHref())) {
                // 递归
                menu.setSubSysMenu(getChild(menu.getId(), rootMenu));
            }
        } // 递归退出条件
        if (childList.size() == 0) {
            return null;
        }
        return childList;
    }
    @Override
    public List<SysMenu> getMenuList(Long roleId){
        List<SysMenu> list=new ArrayList<SysMenu>();
        SysRoleMenuExample example = new SysRoleMenuExample();
        SysRoleMenuExample.Criteria criteria = example.createCriteria();
        criteria.andRoleIdEqualTo(roleId);
        List<SysRoleMenuKey> roleMenuKeys=sysRoleMenuDao.selectByExample(example);
        if(roleMenuKeys!=null&&roleMenuKeys.size()>0) {
            for (SysRoleMenuKey k : roleMenuKeys) {
                SysMenu menu = sysMenuDao.selectByPrimaryKey(k.getMenuId());
                list.add(menu);
            }
        }
        return list;
    }

    @Override
    public List<SysMenu> findByUserIdAndTopMenu(Long userId) {
        return sysMenuDao.findByUserIdAndTopMenu(userId);
    }
}
