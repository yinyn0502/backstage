package com.ueater.backstage.service.impl;

import com.ueater.backstage.common.model.SysMenu;
import com.ueater.backstage.dataservice.ISysMenuDataService;
import com.ueater.backstage.service.ISysMenuService;
import com.ueater.tool.annotation.SystemLog;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by Caoli on 2017/8/14.
 */
@Slf4j
@Service
 public class SysMemuService implements ISysMenuService {
    @Resource
    private ISysMenuDataService sysMenuDataServie;

    @SystemLog
	@Override
    public SysMenu get(Long id) {
        return sysMenuDataServie.get(id);
    }

    @SystemLog
	@Override
    public List<SysMenu> findAll() {
        return sysMenuDataServie.findAll();
    }

    @SystemLog
	@Override
    public List<SysMenu> findByUserId(Long userId) {
        return sysMenuDataServie.findByUserId(userId);
    }

    @SystemLog
	@Override
    public int save(SysMenu menu) {
        return sysMenuDataServie.save(menu);
    }

    @SystemLog
	@Override
    public int update(SysMenu menu) {
        return sysMenuDataServie.update(menu);
    }

    @SystemLog
	@Override
    public int delete(SysMenu menu) {
        return sysMenuDataServie.delete(menu);
    }

    @SystemLog
	@Override
    public List<SysMenu> findByParentIdsLike(String parentIds) {
        return sysMenuDataServie.findByParentIdsLike(parentIds);
    }

    @SystemLog
	@Override
    public List<SysMenu> getChildren(Long parentId) {
        return sysMenuDataServie.getChildren(parentId);
    }

    @SystemLog
	@Override
    public List<SysMenu> getAllList() {
        return sysMenuDataServie.getAllList();
    }
    @SystemLog
	@Override
    public List<SysMenu> getAll(Long id){
        return sysMenuDataServie.getAll(id);
    }

    @SystemLog
	@Override
    public List<SysMenu> getAllByParentId(Long id) {
        return sysMenuDataServie.getAllByParentId(id);
    }

    @SystemLog
	@Override
    public List<SysMenu> getChild(Long id, List<SysMenu> rootMenu) {
        return sysMenuDataServie.getChild(id,rootMenu);
    }

    @SystemLog
	@Override
    public Map<String, Object> queryMenuList(Long rootId) {
        return sysMenuDataServie.queryMenuList(rootId);
    }
    @SystemLog
	@Override
    public List<SysMenu> getMenuList(Long roleId){
        return sysMenuDataServie.getMenuList(roleId);
    }
    @SystemLog
    @Override
    public List<SysMenu> findByUserIdAndTopMenu(Long userId) {
        return sysMenuDataServie.findByUserIdAndTopMenu(userId);
    }

}
