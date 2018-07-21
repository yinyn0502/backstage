package com.ueater.backstage.common.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class SysMenu {
    private Long id;

    private Long parentId;

    private String parentIds;

    private String name;

    private Long sort;

    private String href;

    private String target;

    private String icon;

    private String isShow;

    private String permission;

    private Long createBy;

    private Date createDate;

    private Long updateBy;

    private Date updateDate;

    private String remarks;

    private String delFlag;

    private boolean hasSubSysMenu;

    private List<SysMenu> subSysMenu;

    private SysMenu parent;



    @JsonIgnore
    public static void sortList(List<SysMenu> list, List<SysMenu> sourcelist, Long parentId, boolean cascade){
        for (int i=0; i<sourcelist.size(); i++){
            SysMenu e = sourcelist.get(i);
            if (e.getParentId()!=null && e.getParentId().equals(parentId)){
                list.add(e);
                if (cascade){
                    // 判断是否还有子节点, 有则继续获取子节点
                    for (int j=0; j<sourcelist.size(); j++){
                        SysMenu child = sourcelist.get(j);
                        if (child.getParentId()!=null && child.getParentId().equals(e.getId())){
                            sortList(list, sourcelist, e.getId(), true);
                            break;
                        }
                    }
                }
            }
        }
    }

   }