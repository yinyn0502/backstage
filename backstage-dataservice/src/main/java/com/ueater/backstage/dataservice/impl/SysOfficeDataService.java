package com.ueater.backstage.dataservice.impl;

import com.ueater.backstage.common.model.SysOffice;
import com.ueater.backstage.common.model.SysOfficeExample;
import com.ueater.backstage.dao.ISysOfficeDao;
import com.ueater.backstage.dataservice.ISysOfficeDataService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by caoli on 2017/8/24.
 */
@Slf4j
@Service
public class SysOfficeDataService implements ISysOfficeDataService {
    @Resource
    private ISysOfficeDao sysOfficeDao;
    @Override
    public List<SysOffice> findAll() {
        List<SysOffice> list=sysOfficeDao.findAllList();
        if(list!=null&&list.size()>0){
          for(SysOffice o:list){
              if(o.getParentId()!=null){
                  o.setParent(sysOfficeDao.selectByPrimaryKey(o.getParentId()));
              }
          }
        }
        return list;
    }

    @Override
    public List<SysOffice> findList(Boolean isAll) {
        return null;
    }

    @Override
    public List<SysOffice> findList(SysOffice office) {
        return null;
    }

    @Override
    public SysOffice getByCode(String code) {
        return null;
    }

    @Override
    public int save(SysOffice office) {
        return sysOfficeDao.insert(office);
    }

    @Override
    public int update(SysOffice office) {
        return sysOfficeDao.updateByPrimaryKey(office);
    }

    @Override
    public int delete(SysOffice office) {
        return sysOfficeDao.deleteByPrimaryKey(office.getId());
    }

    @Override
    public List<SysOffice> findAllList() {
        return sysOfficeDao.findAllList();
    }

    @Override
    public SysOffice findById(Long id) {
        return sysOfficeDao.selectByPrimaryKey(id);
    }

    @Override
    public List<SysOffice> findByParentId(Long parentId) {
        SysOfficeExample example = new SysOfficeExample();
        SysOfficeExample.Criteria criteria = example.createCriteria();
        criteria.andParentIdEqualTo(parentId);
        return  sysOfficeDao.selectByExample(example);
    }


}
