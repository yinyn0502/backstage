package com.ueater.backstage.service;

import com.ueater.backstage.common.model.SysMenu;

import java.util.List;
import java.util.Map;

/**
 * Created by  caoli on 2017/8/14
 */
public interface ISysMenuService {

     public SysMenu get(Long id);

     public List<SysMenu> findAll();

     public List<SysMenu> findByUserId(Long userId);

     public int save(SysMenu menu);

     public int update(SysMenu menu) ;

     public int delete(SysMenu menu) ;

     public List<SysMenu> findByParentIdsLike(String parentIds);

     public List<SysMenu> getChildren(Long parentId);

     List<SysMenu> getAllList();

     List<SysMenu> getAll(Long id);

     List<SysMenu> getAllByParentId(Long id);

     public List<SysMenu> getChild(Long id, List<SysMenu> rootMenu);

     public Map<String,Object> queryMenuList(Long rootId);

     public List<SysMenu> getMenuList(Long roleId);

     public List<SysMenu> findByUserIdAndTopMenu(Long userId);
}
