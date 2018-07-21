<html>
<head>
    <title>供应商管理</title>
    <#include "../ahead.ftl">
    <#include "../treeview.ftl" >
    <#include "../treetable.ftl" >
    <meta name="decorator" content="default"/>
</head>
<style>
    table {
        font-family: verdana, arial, sans-serif;
        font-size: 11px;
        color: #333333;
        border-width: 1px;
        border-color: #666666;
        border-collapse: collapse;
        text-align: center;
        border-radius: 5px;
        border-top: 30px;
    }
    th {
        text-align: center;
    }
    input, select {
        border: 1px solid #ccc;
        padding: 7px 0px;
        border-radius: 3px;
        padding-left: 5px;
        width: 200px;
    }
</style>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="ibox">
        <div class="ibox-title">
            <h5>供应商列表</h5>
            <div class="ibox-tools">
                <a class="collapse-link">
                    <i class="fa fa-chevron-up"></i>
                </a>
                <a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
                    <i class="fa fa-wrench"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#">选项1</a>
                    </li>
                    <li><a href="#">选项2</a>
                    </li>
                </ul>
                <a class="close-link">
                    <i class="fa fa-times"></i>
                </a>
            </div>
        </div>


        <div class="ibox-content">

            <!-- 查询条件 -->
            <div class="row">
                <div class="col-sm-12">
                    <form class="form-inline" id="searchForm">
                        <div class="form-group">
                            <span>供应商名称:</span>
                            <input id="vendorName" <#if vendorName??>value="${vendorName}"</#if> name="vendorName" htmlEscape="false" style="margin-right: 30px;" maxlength="64"  class=" form-control input-sm"/>
                        </div>
                        <div class="form-group">
                            <span>供应商id:</span>
                            <input id="vendorId"  <#if vendorId??>value="${vendorId?c}" </#if> name="vendorId" style="margin-right: 30px;" htmlEscape="false" maxlength="64"  class=" form-control input-sm"/>
                        </div>
                    </form>
                    <div class="pull-center" align="center">
                        <button class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="query();" ><i class="fa fa-search"></i> 查询</button>
                        <button class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="cleanBtn()" ><i class="fa fa-search"></i>重置查询条件</button>
                    </div>
                </div>
            </div>

            <!-- 商户列表 -->
            <table id="addBusiness" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable tab-pane fade in active">
                <thead>
                <tr>
                    <th align="center">序号</th>
                    <th align="center">供应商id</th>
                    <th align="center">商户名称</th>
                    <th align="center">商户大码</th>
                    <th align="center">对应分类</th>
                    <th align="center">所属门店</th>
                    <th align="center">创建人</th>
                    <th align="center">创建时间</th>
                    <th align="center">操作</th>
                </tr>
                </thead>
                <tbody id="content">
                <#if response??>
                    <#list response as vendor>
                       <tr>
                           <td>${vendor_index+1}</td>
                           <td><#if vendor.venderId??>${vendor.venderId?c}</#if></td>
                           <td><#if vendor.merchantName??>${vendor.merchantName}</#if></td>
                           <td align="center">
                            <#if vendor.merchantMainProductIds??>
                                <#if vendor.merchantMainProductIds?size=0>
                                    --
                                    <#elseif vendor.merchantMainProductIds?size=1>
                                        ${vendor.merchantMainProductIds[0]?c}
                                    <#else >
                                        ${vendor.merchantMainProductIds[0]?c},
                                    ${vendor.merchantMainProductIds[1]?c}...
                                </#if>
                                <#else >
                                --
                            </#if>
                           </td>
                           <td align="center">
                               <#if vendor.merchantMainProductIds?? && (vendor.merchantMainProductIds?size=1)>
                                <#if vendor.categoryPath??>${vendor.categoryPath}</#if>
                               <#else >
                               --
                           </#if>
                           </td>
                           <td><#if vendor.storeName??>${vendor.storeName}</#if></td>
                           <td><#if vendor.createdBy??>${vendor.createdBy}</#if></td>
                           <td><#if vendor.createTime??>${vendor.createTime}</#if></td>
                           <td>
                               <#if vendor.venderStatus??>
                                   <#if vendor.activationFlag == 1>
                                        <button class="btn btn-rounded btn-outline">已开通</button>
                                        <#if vendor.errorDesc??>
                                            <button onclick="layer.alert('${vendor.errorDesc}');" style='margin-left: 7px;border-radius:14px;width:25px;height: 24px;background:black;color:white'>?</button>
                                        </#if>

                                   <#elseif vendor.activationFlag == 2>
                                        <button class="btn btn-rounded btn-outline">已关闭</button>
                                        <#if vendor.errorDesc??>
                                           <button onclick="layer.alert('${vendor.errorDesc}');" style='margin-left: 7px;border-radius:14px;width:25px;height: 24px;background:black;color:white'>?</button>
                                        </#if>

                                   <#elseif vendor.activationFlag == 3>
                                        <button class="btn btn-primary btn-rounded btn-outline" onclick = "activate(<#if vendor.storeId??>${vendor.storeId},</#if><#if vendor.venderId??>${vendor.venderId?c}</#if>)">商户开通</button>
                                        <#if vendor.errorDesc??>
                                            <button onclick="layer.alert('${vendor.errorDesc}');" style='margin-left: 7px;border-radius:14px;width:25px;height: 24px;background:black;color:white'>?</button>
                                        </#if>
                                   <#else>
                                       <button class="btn btn-rounded" style="border-color: #e7eaec;background-color: #ddd;transition:all .5s;">商户开通</button>
                                        <#if vendor.errorDesc??>
                                            <button onclick="layer.alert('${vendor.errorDesc}');" style='margin-left: 7px;border-radius:14px;width:25px;height: 24px;background:black;color:white'>?</button>
                                        </#if>

                                   </#if>
                               </#if>

                           </td>
                       </tr>
                    </#list>
                </#if>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript" src="/business/vendorList.js"></script>
</body>
</html>