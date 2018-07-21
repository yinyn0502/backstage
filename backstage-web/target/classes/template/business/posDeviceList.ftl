<html>
<head>
    <title>pos设备</title>
<#include "../ahead.ftl">
<#include "../treeview.ftl">
<#include "../treetable.ftl" >
    <meta name="decorator" content="default"/>
</head>
<style>
    .add {
        background-color: #1ab394; /* Green */
        border: none;
        color: white;
        text-align: center;
        text-decoration: none;
        font-size: 16px;
        padding: 11px;
        border-radius: 5px;
    }
    .popupWarp{
        width: 250px;
        height: 160px;
        border: 1px solid #000;
        position: fixed;
        top: 30%;
        left: 39%;
        background: #ffffff;
        text-align: center;
        display:none ;
    }
    .buttonWarp{
        width: 100%;
        margin-top: 20px;
    }
    .buttonWar pbutton{ width: 50%; height: 45px; line-height: 45px;}
</style>
<body class="gray-bg">
<#setting datetime_format="yyyy-MM-dd HH:mm:ss">
<div class="wrapper wrapper-content">
    <div class="ibox">
        <div class="ibox-title">
            <h5>pos设备列表</h5>
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
                    <form id="searchForm" class="form-inline">
                        <input id="pageNo" name="pageNo" type="hidden" value="page.pageNo"/>
                        <input id="pageSize" name="pageSize" type="hidden" value="page.pageSize"/>
                        <table:sortColumn id="orderBy" name="orderBy" value="page.orderBy" callback="sortOrRefresh();"/><!-- 支持排序 &ndash;&gt;-->
                        <div class="form-group">
                            <span>门店:</span>
                            <#if storeId??>
                                <input type="hidden" id="echoStore" echoStoreId="${storeId}">
                            </#if>
                            <select id="storeIds" style="width: 150px;height: 30px; margin-right: 30px;">
                                <option selected="selected" value="">请选择门店</option>
                            <#if storeList??>
                                <#list storeList as store>
                                    <option <#if store.id??>id="storeId_${store.id}"</#if> value="<#if store.id??>${store.id}</#if>">
                                        <#if store.name??>${store.name}</#if>
                                    </option>
                                </#list>
                            </#if>
                            </select>
                        </div>
                        <div class="form-group">
                            <span>设备序号:</span>
                            <input id="deviceId" htmlEscape="false" style="margin-right: 30px;" maxlength="64" class=" form-control input-sm"
                            <#if id??>
                                   value="${id}"
                            </#if>
                            />
                        </div>
                        <div class="form-group">
                            <span>pos机号:</span>
                            <input id="posNo" style="margin-right: 30px;" htmlEscape="false" maxlength="64" class=" form-control input-sm"
                            <#if posNo??>
                                   value="${posNo}"
                            </#if>
                            />
                        </div>
                    </form>
                    <br/>
                </div>
            </div>

            <!-- 工具栏 -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="pull-center" align="center">
                        <button class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="query();"><i class="fa fa-search"></i> 查询</button>
                        <button class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="cleanBtn()"><i class="fa fa-search"></i>重置查询条件</button>
                    </div>
                </div>
            </div>

            <!-- pos设备列表 -->
            <table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
                <thead>
                <tr>
                    <th align="center">设备序号</th>
                    <th align="center">物理设备号</di></th>
                    <th align="center">门店</th>
                    <th align="center">pos机号</th>
                    <th align="center">程序版本号</th>
                    <th align="center">注册时间</th>
                    <th align="center">更新时间</th>
                    <th align="center">操作</th>
                </tr>
                </thead>
                <tbody id="content">
                <#if pageInfo?? && pageInfo.list?? && pageInfo.list?size gt 0>
                    <#list pageInfo.list as item>
                    <tr>
                        <td><#if item.id??>${item.id}<#else >--</#if></td>
                        <td><#if item.deviceId??>${item.deviceId}<#else >--</#if></td>
                        <td><#if item.storeId??>${item.storeId}<#else >--</#if></td>
                        <td><#if item.posNo??>${item.posNo}<#else >--</#if></td>
                        <td><#if item.appVersion??>${item.appVersion}<#else >--</#if></td>
                        <td><#if item.registTime??>${item.registTime?c?number?number_to_datetime}<#else >--</#if></td>
                        <td><#if item.updateTime??>${item.updateTime?c?number?number_to_datetime}<#else >--</#if></td>
                        <td>
                            <#if item.id?? && storeList??>
                                <#if item.storeId??>
                                    <a onclick="show(${item.id})">更换门店</a>
                                <#else >
                                    <a onclick="show(${item.id})">绑定门店</a>
                                </#if>
                            <#else >
                                <#if item.storeId??>
                                    更换门店
                                <#else >
                                    绑定门店
                                </#if>
                            </#if>
                        </td>
                    </tr>
                    </#list>
                </#if>
                </tbody>
            </table>
        <#include "../page.ftl">
            <div id='nodata' style="text-align: center; display: none">
                <div id="noData">暂无数据</div>
                <ul id='bp-3-element-test'></ul>
            </div>

        </div>
    </div>
</div>
<#-----------------下拉列表弹窗--------------------------------------->
<div class="popupWarp">
    <p style="margin: 20px;">请选择绑定门店</p>
    <select id="storeIdsPop" style="width: 180px;height: 30px;">
        <option selected="selected" value="">请选择门店</option>
    <#if storeList??>
        <#list storeList as store>
            <option value="<#if store.id??>${store.id}</#if>">
                <#if store.name??>${store.name}</#if>
            </option>
        </#list>
    </#if>
    </select>
    <div class="buttonWarp">
        <button onclick="hiddenPop()">取消</button>
        <button onclick="bindingPosStore()">确定</button>
    </div>
</div>

<script type="text/javascript" src="/business/PosDevice.js"></script>
</body>
</html>