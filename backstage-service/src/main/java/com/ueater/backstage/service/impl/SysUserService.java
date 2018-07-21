package com.ueater.backstage.service.impl;

import com.ueater.backstage.common.model.SysOffice;
import com.ueater.backstage.common.model.SysUser;
import com.ueater.backstage.common.util.Tools;
import com.ueater.backstage.dataservice.ISysOfficeDataService;
import com.ueater.backstage.dataservice.ISysUserDataService;
import com.ueater.backstage.service.ISysUserService;
import com.ueater.tool.annotation.SystemLog;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by caoli on 2017/8/26.
 */
@Slf4j
@Service
public class SysUserService implements ISysUserService {
    @Resource
    private ISysUserDataService sysUserDataService;
    @Resource
    private ISysOfficeDataService sysOfficeDataService;
//    @SystemLog
	@Override
    public SysUser getByLoginName(String loginName) {
        return sysUserDataService.getByLoginName(loginName);
    }

    @SystemLog
	@Override
    public List<SysUser> findUserByOfficeId(Long officeId) {
        return sysUserDataService.findUserByOfficeId(officeId);
    }

    @SystemLog
	@Override
    public long findAllCount() {
        return sysUserDataService.findAllCount();
    }

    @SystemLog
	@Override
    public int update(SysUser user) {
        return sysUserDataService.update(user);
    }

    @SystemLog
	@Override
    public int deleteUserRole(SysUser user) {
        return sysUserDataService.deleteUserRole(user);
    }

    @SystemLog
	@Override
    public int insertUserRole(Long userId, Long roleId) {
        return sysUserDataService.insertUserRole(userId,roleId);
    }

    @SystemLog
	@Override
    public List<SysUser> searchUsers(SysUser user) {
        return sysUserDataService.searchUsers(user);
    }

    @SystemLog
	@Override
    public List<SysUser> findListByOffice(SysUser user) {
        return sysUserDataService.findListByOffice(user);
    }

    @SystemLog
	@Override
    public SysUser findById(Long id) {
        return sysUserDataService.findById(id);
    }

    @SystemLog
	@Override
    public List<SysUser> findListByRoleId(Long roleId) {
        return sysUserDataService.findListByRoleId(roleId);
    }

    @SystemLog
	@Override
    public List<SysUser> findAll() {
        return sysUserDataService.findAll();
    }
    @SystemLog
	@Override
    public SysUser findByLoginNameAndAdFlag(String loginName, String adFlag){
        return sysUserDataService.findByLoginNameAndAdFlag(loginName,adFlag);
    }

    @SystemLog
	@Override
    public int save(SysUser user) {
        return sysUserDataService.save(user);
    }

    @SystemLog
	@Override
    public List<SysUser> findLikeLoginName(String loginName,String name,Long officeId,Long companyId) {
        return sysUserDataService.findLikeLoginName(loginName,name,officeId,companyId);
    }

//    @SystemLog
	@Override
    public List<SysUser> initOffice(List<SysUser> list) {
        for(SysUser u:list){
            if(u.getOfficeId()!=null){
                SysOffice office=sysOfficeDataService.findById(u.getOfficeId());
                u.setOffice(office);
                if(office.getParentIds()!=null) {
                    u.setCompany(sysOfficeDataService.findById(Long.parseLong(Tools.getCompayId(office.getParentIds()))));
                }else{
                    u.setCompany(sysOfficeDataService.findById(Long.parseLong("1")));
                }
            }
        }
        return list;
    }


}
