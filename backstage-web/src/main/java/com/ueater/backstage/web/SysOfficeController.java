package com.ueater.backstage.web;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.ueater.backstage.common.model.SysDict;
import com.ueater.backstage.common.model.SysOffice;
import com.ueater.backstage.common.model.SysUser;
import com.ueater.backstage.common.util.JsonUtil;
import com.ueater.backstage.service.ISysAreaService;
import com.ueater.backstage.service.ISysDictService;
import com.ueater.backstage.service.ISysOfficeService;
import com.ueater.backstage.service.ISysUserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by caoli on 2017/8/24.
 */
@Slf4j
@Controller
@RequestMapping(value = "/sys/office/")
public class SysOfficeController{
    private static final Logger logger = LoggerFactory.getLogger(SysOfficeController.class);
    @Resource
    private ISysOfficeService sysOfficeService;
    @Resource
    private ISysDictService sysDictService;
    @Resource
    private ISysAreaService sysAreaService;
    @Resource
    private ISysUserService sysUserService;


    @RequiresPermissions("sys:office:index")
    @RequestMapping(value = {"index"})
    public ModelAndView index(SysOffice office) {
        ModelAndView model=new ModelAndView("/sys/office/officeIndex");
        return model;
    }



    @RequiresPermissions("sys:office:index")
    @RequestMapping(value = {"list", ""})
    public ModelAndView list(@RequestParam(required=false) String id , @RequestParam(required=false) String parentIds) {
        ModelAndView model = new ModelAndView("/sys/office/officeList");
        /*if (office == null || office.getParentIds() == null) {
            model.getModel().put("list", sysOfficeService.findList(false));
        } else {
            model.getModel().put("list", sysOfficeService.findList(office));
        }*/
        List<SysOffice> list= sysOfficeService.findAllList();
        model.getModel().put("list", list);
        String jsonString=  JsonUtil.list2json(list);
        List<SysDict> dictList=sysDictService.getDictList("sys_office_type");

        String jsonDictListString=JsonUtil.list2json(dictList);
        String labelString= sysDictService.getDictLabel(jsonDictListString,"row","type");
        model.getModel().put("dictString",jsonString);
        //model.getModel().put("labelString",labelString);
        return model;
    }

    @RequiresPermissions("user")
    @ResponseBody
    @RequestMapping(value = "getDictLabel")
    public String getDictLabel(@RequestParam(required=false) String json,@RequestParam(required=false) String type,@RequestParam(required=false)String defaultVlue){
        List<SysDict> dictList=sysDictService.getDictList("sys_office_type");
        String jsonDictListString=JsonUtil.list2json(dictList);
        String labelString= sysDictService.getDictLabel(jsonDictListString,type,defaultVlue);
        return labelString;
    }

    @RequiresPermissions(value={"sys:office:view","sys:office:add","sys:office:edit"},logical= Logical.OR)
    @RequestMapping(value = "/form/{id}",method = RequestMethod.GET)
    public ModelAndView form(@PathVariable("id") Long id, HttpServletRequest request) {
        String loginName = (String) request.getSession().getAttribute("loginName");
        //机构类型
        List<SysDict> dictList=sysDictService.getDictList("sys_office_type");
        //机构级别
        List<SysDict> gradeList=sysDictService.getDictList("sys_office_grade");
        //是否可用
        List<SysDict> yesList=sysDictService.getDictList("yes_no");
        ModelAndView m=new ModelAndView("/sys/office/officeForm");

        if(id==0){
            ModelAndView model=new ModelAndView("/sys/office/officeForm");
            SysUser user=sysUserService.getByLoginName(loginName);
            SysOffice userOffice=sysOfficeService.findById(user.getOfficeId());
            SysOffice office=new SysOffice();
            office.setParent(sysOfficeService.findById(userOffice.getParentId()));
            office.setParentId(userOffice.getParentId());
            if (office.getAreaId()==null){
                office.setArea(sysAreaService.findById(Long.parseLong(userOffice.getAreaId())));
                office.setAreaId(userOffice.getAreaId());
            }else{
                office.setArea(sysAreaService.findById(Long.parseLong(office.getAreaId())));
                office.setAreaId(office.getAreaId());
            }
            office.setId(null);
            model.getModel().put("office",office);
            model.getModel().put("yesList",yesList);
            model.getModel().put("gradeList",gradeList);
            model.getModel().put("dictList",dictList);
             return model;
        }
        SysOffice office=sysOfficeService.findById(id);

        SysUser user=sysUserService.getByLoginName(loginName);
        if (office.getParentId()==null){
            office.setParentId(user.getOfficeId());
        }
        office.setParent(sysOfficeService.findById(office.getParentId()));
        SysOffice userOffice=sysOfficeService.findById( user.getOfficeId());
        if (office.getAreaId()==null){
            office.setArea(sysAreaService.findById(Long.parseLong(userOffice.getAreaId())));
        }else{
            office.setArea(sysAreaService.findById(Long.parseLong(office.getAreaId())));
        }

       /* // 自动获取排序号
        if (office.getId()!=null&&office.getParent()!=null){
            int size = 0;
            List<SysOffice> list = sysOfficeService.findAllList();
            for (int i=0; i<list.size(); i++){
                SysOffice e = list.get(i);
                if (e.getParent()!=null && e.getParent().getId()!=null
                        && e.getParent().getId().equals(office.getParent().getId())){
                    size++;
                }
            }
            office.setCode(office.getParent().getCode() + StringUtils.leftPad(String.valueOf(size > 0 ? size+1 : 1), 3, "0"));
        }*/
        //List<SysOffice> officeList = sysOfficeService.findAllList();
        m.getModel().put("yesList",yesList);
        m.getModel().put("gradeList",gradeList);
        m.getModel().put("dictList",dictList);
        m.getModel().put("office",office);
       return m;
    }





    @RequiresPermissions(value={"sys:office:add","sys:office:edit"},logical=Logical.OR)
    @RequestMapping(value = "save",method = RequestMethod.POST)
    public String save(SysOffice office, RedirectAttributes redirectAttributes,HttpServletRequest request) {
        SysUser user=  (SysUser) request.getSession().getAttribute("currentUser");

        String areaId=office.getAreaId();
        if(areaId.contains(",")){
           int start= areaId.lastIndexOf(",")+1;
           int end=areaId.length();
           areaId=areaId.substring(start,end);
           office.setAreaId(areaId);
        }

        if(office.getCreateBy()==null){
            office.setCreateBy(user.getId());
        }
        if(office.getCreateDate()==null){
            office.setCreateDate(new Date());
        }
        office.setUpdateBy(user.getId());
        office.setUpdateDate(new Date());
        office.setSort(new Long(30));
        office.setDelFlag("0");
        office.getParentId();
        String parentIds=office.getParentIds();
        StringBuffer sb=new StringBuffer();
        if(StringUtils.isBlank(parentIds)){
            sb.append(office.getParentId());
        }else{
            sb.append(office.getParentIds());
            sb.append(office.getParentId());
        }

        if(office.getId()==null){
            int result=sysOfficeService.save(office);
            logger.info("result:"+result);
        }else{
            int result=sysOfficeService.update(office);
            logger.info("result:"+result);
        }

        int result=sysOfficeService.update(office);
        addMessage(redirectAttributes, "保存区域'" + office.getName() + "'成功");

        return "redirect:/sys/office/list";

        /*if(office.getChildDeptList()!=null){
            Office childOffice = null;
            for(String id : office.getChildDeptList()){
                childOffice = new Office();
                childOffice.setName(DictUtils.getDictLabel(id, "sys_office_common", "未知"));
                childOffice.setParent(office);
                childOffice.setArea(office.getArea());
                childOffice.setType("2");
                childOffice.setGrade(String.valueOf(Integer.valueOf(office.getGrade())+1));
                childOffice.setUseable(Global.YES);
                officeService.save(childOffice);
            }
        }

        addMessage(redirectAttributes, "保存机构'" + office.getName() + "'成功");
        String id = "0".equals(office.getParentId()) ? "" : office.getParentId();
        return "redirect:" + adminPath + "/sys/office/list?id="+id+"&parentIds="+office.getParentIds();
        */
    }



    /**
     * 获取机构JSON数据。
     * @param extId 排除的ID
     * @param type	类型（1：公司；2：部门/小组/其它：3：用户）
     * @param grade 显示级别
     * @param
     * @return
     */
    @RequiresPermissions("user")
    @RequestMapping(value = "treeData",method = RequestMethod.GET)
    @ResponseBody
    public List<Map<String, Object>> treeData(@RequestParam(required=false) String extId, @RequestParam(required=false) String type,
                                              @RequestParam(required=false) Long grade, @RequestParam(required=false) Boolean isAll) {
        List<Map<String, Object>> mapList = Lists.newArrayList();
        //List<SysOffice> list = sysOfficeService.findList(isAll);

        List<SysOffice> list = sysOfficeService.findAllList();
        if(list!=null&&list.size()>0) {
            for (int i = 0; i < list.size(); i++) {
                SysOffice e = list.get(i);
                if ((StringUtils.isBlank(extId) || (extId != null && !extId.equals(e.getId()) && e.getParentIds().indexOf("," + extId + ",") == -1)) && (type == null || (type != null && (type.equals("1") ? type.equals(e.getType()) : true))) && (grade == null || (grade != null && Integer.parseInt(e.getGrade()) <= grade.intValue())) && "1".equals(e.getUseable())) {
                    Map<String, Object> map = Maps.newHashMap();
                    map.put("id", e.getId());
                    map.put("pId", e.getParentId());
                    map.put("pIds", e.getParentIds());
                    map.put("name", e.getName());
                    if (type != null && "3".equals(type)) {
                        map.put("isParent", true);
                    }
                    mapList.add(map);
                }
            }
        }
        return mapList;
    }


    @RequiresPermissions("sys:office:del")
    @RequestMapping(value = "/delete/{id}",method = RequestMethod.GET)
    public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes,HttpServletRequest request) {
        SysUser user=  (SysUser) request.getSession().getAttribute("currentUser");
        SysOffice office=sysOfficeService.findById(id);
        List<SysOffice> subList=sysOfficeService.findByParentId(id);

        if(office!=null) {
            if(subList!=null&&subList.size()>0){
                for(SysOffice s:subList){
                    s.setUpdateBy(user.getId());
                    s.setUpdateDate(new Date());
                    s.setDelFlag("1");
                    sysOfficeService.update(s);
                }
            }
            office.setUpdateBy(user.getId());
            office.setUpdateDate(new Date());
            office.setDelFlag("1");
            int result = sysOfficeService.update(office);
            if (result == 1) {
                addMessage(redirectAttributes, "删除机构成功");
            } else {
                addMessage(redirectAttributes, "删除机构失败");
            }
        }else{
            addMessage(redirectAttributes, "删除机构失败");
        }
        return "redirect:/sys/office/list";
    }



    /**
     * 添加Flash消息
     */
    protected void addMessage(RedirectAttributes redirectAttributes, String... messages) {
        StringBuilder sb = new StringBuilder();
        for (String message : messages){
            sb.append(message).append(messages.length>1?"<br/>":"");
        }
        redirectAttributes.addFlashAttribute("message", sb.toString());
    }


    }
