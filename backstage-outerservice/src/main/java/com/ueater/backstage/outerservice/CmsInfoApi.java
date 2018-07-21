package com.ueater.backstage.outerservice;

import com.ueater.backstage.common.model.cmsinfo.QueryModuleResourceDO;
import com.ueater.backstage.common.model.cmsinfo.QueryModuleResourceDTO;
import com.ueater.backstage.common.model.cmsinfo.QueryTemplateResourceDTO;
import com.ueater.tool.response.Response;
import feign.Param;
import feign.RequestLine;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

public interface CmsInfoApi {
    @RequestLine("GET /cms/queryResourceInfo?templateId={templateId}&moduleId={moduleId} HTTP/1.1")
    Response<QueryModuleResourceDTO> queryModule(@Param("moduleId") Long moduleId, @Param("templateId") Long templateId);

    @RequestLine("GET /cms/queryPageResourceInfo?appType={appType}&appVersion={appVersion}&pageType={pageType}&storeId={storeId} HTTP/1.1")
    Response<QueryTemplateResourceDTO> queryPageResourceInfo(@Param("appType") Integer appType, @Param("appVersion") String appVersion, @Param("pageType") String pageType, @Param("storeId") Long storeId);

    @RequestLine("POST /cms/queryModuleResource HTTP/1.1")
    Response<List<QueryModuleResourceDTO>>  queryPageResource(@RequestBody QueryModuleResourceDO queryModuleResourceDO);
}
