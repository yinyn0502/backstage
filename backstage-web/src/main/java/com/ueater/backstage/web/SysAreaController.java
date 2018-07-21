package com.ueater.backstage.web;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.ueater.backstage.common.model.SysArea;
import com.ueater.backstage.common.model.SysDict;
import com.ueater.backstage.common.model.SysUser;
import com.ueater.backstage.common.util.JsonUtil;
import com.ueater.backstage.common.util.Tools;
import com.ueater.backstage.service.ISysAreaService;
import com.ueater.backstage.service.ISysDictService;
import com.ueater.tool.annotation.ControllerLog;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by caoli on 2017/8/21.
 */
@Controller
@RequestMapping(value = "/sys/area/")
public class SysAreaController {
    @Resource
    private ISysAreaService sysAreaService;
    @Resource
    private ISysDictService sysDictService;

   @ControllerLog
    @RequiresPermissions("sys:area:list")
    @RequestMapping(value = {"list", ""})
    public ModelAndView list(SysArea area) {
        List<SysArea> list= sysAreaService.findAll();
        ModelAndView model=new ModelAndView("/sys/area/areaList");
        String jsonString=  JsonUtil.list2json(list);
        List<SysDict> dictList=sysDictService.getDictList("sys_area_type");
        String jsonDictListString=JsonUtil.list2json(dictList);
        String labelString= sysDictService.getDictLabel(jsonDictListString,"row","type");
        model.getModel().put("dictString",jsonString);
        //model.getModel().put("labelString",labelString);
        return model;
    }

    @ControllerLog
    @RequiresPermissions(value={"sys:area:view","sys:area:add","sys:area:edit"},logical= Logical.OR)
    @RequestMapping(value = "/form/{id}",method = RequestMethod.GET)
    public ModelAndView form(@PathVariable("id") Long id) {
        ModelAndView model=new ModelAndView("/sys/area/areaForm");
        SysArea area=sysAreaService.findById(id);

        SysArea parent=sysAreaService.findById(area.getParentId());
        List<SysArea> list= sysAreaService.findAll();
        String jsonString=  JsonUtil.list2json(list);


        List<SysDict> dictList=sysDictService.getDictList("sys_area_type");
        String jsonDictListString=JsonUtil.list2json(dictList);

        /*if (area.getParent()==null||area.getParentId()==null){
            area.setParent(UserUtils.getUser().getOffice().getArea());
        }else{
            area.setParent(areaService.get(area.getParent().getId()));
        }*/

//		// 自动获取排序号
//		if (StringUtils.isBlank(area.getId())){
//			int size = 0;
//			List<Area> list = areaService.findAll();
//			for (int i=0; i<list.size(); i++){
//				Area e = list.get(i);
//				if (e.getParent()!=null && e.getParent().getId()!=null
//						&& e.getParent().getId().equals(area.getParent().getId())){
//					size++;
//				}
//			}
//			area.setCode(area.getParent().getCode() + StringUtils.leftPad(String.valueOf(size > 0 ? size : 1), 4, "0"));
//		}
        model.getModel().put("dictString",jsonString);
        model.getModel().put("jsonDictListString",jsonDictListString);
        model.getModel().put("dictList",dictList);
        model.getModel().put("list",list);
        model.getModel().put("area", area);

        model.getModel().put("parent", parent);
        return model;
    }/**/


    @ControllerLog
    @RequiresPermissions(value={"sys:area:view","sys:area:add","sys:area:edit"},logical= Logical.OR)
    @RequestMapping(value = "/subform/{id}",method = RequestMethod.GET)
    public ModelAndView subform(@PathVariable("id") Long id) {
        ModelAndView model=new ModelAndView("/sys/area/areaSubForm");
        SysArea area=sysAreaService.findById(id);
        SysArea parent=sysAreaService.findById(area.getParentId());
        List<SysArea> list= sysAreaService.findAll();
        String jsonString=  JsonUtil.list2json(list);
        List<SysDict> dictList=sysDictService.getDictList("sys_area_type");
        String jsonDictListString=JsonUtil.list2json(dictList);
//		// 自动获取排序号
//		if (StringUtils.isBlank(area.getId())){
//			int size = 0;
//			List<Area> list = areaService.findAll();
//			for (int i=0; i<list.size(); i++){
//				Area e = list.get(i);
//				if (e.getParent()!=null && e.getParent().getId()!=null
//						&& e.getParent().getId().equals(area.getParent().getId())){
//					size++;
//				}
//			}
//			area.setCode(area.getParent().getCode() + StringUtils.leftPad(String.valueOf(size > 0 ? size : 1), 4, "0"));
//		}
        model.getModel().put("dictString",jsonString);
        model.getModel().put("jsonDictListString",jsonDictListString);
        model.getModel().put("dictList",dictList);
        model.getModel().put("list",list);
        model.getModel().put("area", area);
        model.getModel().put("parent", parent);
        return model;
    }


    @RequiresPermissions(value={"sys:area:add","sys:area:edit"},logical=Logical.OR)
    @RequestMapping(value = "save",method = RequestMethod.POST)
    public String save(SysArea area, RedirectAttributes redirectAttributes, HttpServletRequest request) {
        SysUser currentUser=  (SysUser) request.getSession().getAttribute("currentUser");
        area.setCreateBy(currentUser.getId());
        area.setUpdateBy(currentUser.getId());
        area.setCreateDate(new Date());
        area.setUpdateDate(new Date());
       int result= sysAreaService.update(area);
       if(result==1) {
           Tools.addMessage(redirectAttributes, "保存区域'" + area.getName() + "'成功");
       }else{
           Tools.addMessage(redirectAttributes, "保存区域'" + area.getName() + "'失败");
       }
        return "redirect:/sys/area/list";
    }


    @ControllerLog
    @RequiresPermissions(value={"sys:area:add","sys:area:edit"},logical=Logical.OR)
    @RequestMapping(value = "subsave",method = RequestMethod.POST)
    public String subsave(SysArea area, RedirectAttributes redirectAttributes) {
        SysArea newArea=new SysArea();
        newArea.setCreateBy(Long.parseLong("1"));
        newArea.setUpdateBy(Long.parseLong("1"));
        newArea.setCreateDate(new Date());
        newArea.setUpdateDate(new Date());
        newArea.setParentId(area.getId());
        newArea.setCode(area.getCode());
        newArea.setDelFlag(area.getDelFlag());
        newArea.setName(area.getName());
        newArea.setParentIds(area.getParentIds());
        newArea.setRemarks(area.getRemarks());
        newArea.setSort(area.getSort());
        newArea.setType(area.getType());
        int result= sysAreaService.save(newArea);
        if (result == 1) {
            Tools.addMessage(redirectAttributes, "保存区域'" + area.getName() + "'成功");
        }else{
            Tools.addMessage(redirectAttributes, "保存区域'" + area.getName() + "'失败");
        }
        return "redirect:/sys/area/list";
    }

    @RequiresPermissions("user")
    @RequestMapping(value = "treeData",method = RequestMethod.GET)
    @ResponseBody
    public List<Map<String, Object>> treeData(@RequestParam(required=false) String extId, HttpServletResponse response) {
        List<Map<String, Object>> mapList = Lists.newArrayList();
        List<SysArea> list = sysAreaService.findAll();
        for (int i=0; i<list.size(); i++){
            SysArea e = list.get(i);
            if (StringUtils.isBlank(extId) || (extId!=null && !extId.equals(e.getId()) && e.getParentIds().indexOf(","+extId+",")==-1)){
                Map<String, Object> map = Maps.newHashMap();
                map.put("id", e.getId());
                map.put("pId", e.getParentId());
                map.put("name", e.getName());
                mapList.add(map);
            }
        }
        return mapList;
    }


    @ControllerLog
    @RequiresPermissions("sys:area:del")
    @RequestMapping(value = "/delete/{id}",method = RequestMethod.GET)
    public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        SysArea area=sysAreaService.findById(id);
        if(area!=null) {
            area.setCreateBy(Long.parseLong("1"));
            area.setUpdateBy(Long.parseLong("1"));
            area.setCreateDate(new Date());
            area.setUpdateDate(new Date());
            area.setDelFlag("1");
            int result = sysAreaService.update(area);
            if (result == 1) {
                Tools.addMessage(redirectAttributes, "删除区域成功");
            } else {
                Tools.addMessage(redirectAttributes, "删除区域失败");
            }
        }else{
            Tools.addMessage(redirectAttributes, "删除区域失败");
        }
        return "redirect:/sys/area/list";
    }







}
