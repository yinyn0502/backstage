package com.ueater.backstage.dataservice.impl;

import com.ueater.backstage.common.model.SysUser;
import com.ueater.backstage.common.model.SysUserExample;
import com.ueater.backstage.common.util.Constant;
import com.ueater.backstage.dao.ISysUserDao;
import com.ueater.backstage.dataservice.ISysUserDataService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by caoli on 2017/8/25.
 */
@Slf4j
@Service
public class SysUserDataService implements ISysUserDataService {
    @Resource
    private ISysUserDao sysUserDao;
    @Override
    public SysUser getByLoginName(String loginName) {
        SysUserExample example = new SysUserExample();
        SysUserExample.Criteria criteria = example.createCriteria();
        criteria.andLoginNameEqualTo(loginName);
        List<SysUser> list = sysUserDao.selectByExample(example);
        if(list!=null&&list.size()>0){
            return list.get(0);
        }
        return null;
    }

    @Override
    public List<SysUser> findUserByOfficeId(Long officeId) {
        SysUserExample example = new SysUserExample();
        SysUserExample.Criteria criteria = example.createCriteria();
        criteria.andOfficeIdEqualTo(officeId);
        List<SysUser> list = sysUserDao.selectByExample(example);
        return list;
    }

    @Override
    public long findAllCount() {
        SysUserExample example = new SysUserExample();
        List<SysUser> list=sysUserDao.selectByExample(example);
        if(list!=null&&list.size()>0){
            return list.size();
        }
        return 0;
    }

    @Override
    public int update(SysUser user) {
        return sysUserDao.updateByPrimaryKey(user);
    }

    @Override
    public int save(SysUser user) {
        return sysUserDao.insert(user);
    }


    @Override
    public int deleteUserRole(SysUser user) {
        return sysUserDao.deleteUserRole(user.getId());
    }

    @Override
    public int insertUserRole(Long userId,Long roleId) {
        return sysUserDao.insertUserRole(userId,roleId);
    }



    @Override
    public List<SysUser> searchUsers(SysUser user) {
        return null;
    }

    @Override
    public List<SysUser> findListByOffice(SysUser user) {
        return null;
    }

    @Override
    public SysUser findById(Long id) {
        return sysUserDao.selectByPrimaryKey(id);
    }

    @Override
    public List<SysUser> findListByRoleId(Long roleId) {
        return sysUserDao.findListByRoleId(roleId);
    }

    @Override
    public List<SysUser> findAll() {
        SysUserExample example = new SysUserExample();
        SysUserExample.Criteria criteria = example.createCriteria();
        criteria.andDelFlagEqualTo("0");
        List<SysUser> list = sysUserDao.selectByExample(example);
        return list;
    }

    @Override
    public SysUser findByLoginNameAndAdFlag(String loginName, String adFlag) {
        SysUserExample example = new SysUserExample();
        SysUserExample.Criteria criteria = example.createCriteria();
        criteria.andLoginNameEqualTo(loginName);
        criteria.andAdFlagEqualTo(adFlag);
        criteria.andDelFlagEqualTo(Constant.DEL_FLAG_NOT);
        List<SysUser> list = sysUserDao.selectByExample(example);
        if(list!=null&&list.size()>0){
            return list.get(0);
        }
        return null;
    }

    @Override
    public List<SysUser> findLikeLoginName(String loginName,String name,Long officeId,Long companyId) {
        return sysUserDao.findLikeLoginName(loginName,name,officeId,companyId);
    }


}
