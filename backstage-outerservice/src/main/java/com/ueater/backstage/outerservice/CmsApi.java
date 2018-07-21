package com.ueater.backstage.outerservice;

import com.github.pagehelper.PageInfo;
import com.ueater.backstage.common.model.cms.*;
import com.ueater.tool.response.Response;
import feign.Param;
import feign.RequestLine;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.HashMap;
import java.util.List;

public interface CmsApi {

    // 查询appVersion,result: key是appType,value是appVersionList
    @RequestLine("GET /cms/queryAppVersion HTTP/1.1")
    Response<HashMap<Integer,List<String>>> queryAppVersion();

    //=====================================label===========================================
    @RequestLine("POST /cms/homePage/addLabel HTTP/1.1")
    Response<Integer> addLabel(HomePageLabelTO addHomePageLabelDTO);

    /**
     * 调用cms 根据门店id获取所属label
     * @param storeId 门店id
     * @return
     */
    @RequestLine("GET /cms/homePage/queryLabels?storeId={storeId}&pageCount={pageCount}&pageSize={pageSize} HTTP/1.1")
    Response<PageInfo> queryLabels(@Param("storeId") Long storeId,
                                   @Param("pageCount") Integer pageCount,
                                   @Param("pageSize") Integer pageSize);

    @RequestLine("GET /cms/homePage/getLabel?id={id} HTTP/1.1")
    Response<HomePageLabelTO> getLabel(@Param("id") Long id);

    @RequestLine("DELETE /cms/homePage/deleteLabel?id={id}&deleted={deleted}&updatedBy={updatedBy} HTTP/1.1")
    Response<Integer> deleteLabel(@Param("id") Long id, @Param("deleted") Integer deleted, @Param("updatedBy") String updatedBy);

    @RequestLine("POST /cms/homePage/updateLabel HTTP/1.1")
    Response<Integer> updateLabel(HomePageLabelTO updateHomePageLabel);

    //=====================================module===========================================
    @RequestLine("POST /cms/addModuleResource HTTP/1.1")
    Response<Integer> addModule(CmsModuleResourceTO addModuleResource);

    @RequestLine("DELETE /cms/deleteModuleResource?id={id}&deleted={deleted}&updatedBy={updatedBy} HTTP/1.1")
    Response<Integer> deleteModule(@Param("id") Long id, @Param("deleted") Integer deleted, @Param("updatedBy") String updatedBy);

    @RequestLine("POST /cms/updateModuleResource HTTP/1.1")
    Response<Integer> editModule(CmsModuleResourceTO cmsModuleTO);

    @RequestLine("POST /cms/queryModuleResource HTTP/1.1")
    Response<List<QueryModuleResourceTO>> queryModule(@RequestBody CmsQueryModuleResourceParamsTO cmsQueryModuleResourceParamsTO);


    /**
     * 上线模板
     * @return
     */
    @RequestLine("POST /cms/putTemplateOnline HTTP/1.1")
    Response putTemplateOnline(CmsPageInfoQueryTO cmsPageInfoQueryTO);

    /**
     * 修改/新增模板
     * @param flag  1修改2新增 storeId:门店ID
     * @return
     */
    @RequestLine("GET /cms/createNewTemplate?flag={flag}&storeId={storeId} HTTP/1.1")
    Response<CmsCreateNewTemplate> createNewTemplate(@Param("flag") Integer flag, @Param("storeId") Long storeId);

    /**
     * 修改模板状态
     * @return
     */
    @RequestLine("GET /cms/updateTemplateStatus HTTP/1.1")
    Response updateTemplateStatus(CmsUpdateTemplateStatusParamsTO updateTemplateStatusParamsTO);

    @RequestLine("GET /cms/getModuleIds?templateId={templateId}&moduleTypeId={moduleTypeId} HTTP/1.1")
    Response<List<QueryModuleResourceTO>>  getModuleIds(@Param("templateId") Long templateId, @Param("moduleTypeId") Long moduleTypeId);

    @RequestLine("GET /cms/verifyLocation?templateId={templateId}&moduleId={moduleId}&sort={sort} HTTP/1.1")
    Response<Integer> verifyLocation(@Param("templateId") Long templateId, @Param("moduleId") Long moduleId, @Param("sort") Integer sort);
}
