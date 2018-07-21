<html>
<head>
    <title>商户管理</title>
    <#include "../ahead.ftl">
    <#include "../treeview.ftl" >
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
        padding:11px;
        border-radius: 5px;
    }
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
            <h5>商户列表 </h5>
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
                    <form id="searchForm"  class="form-inline">
                        <input id="pageNo" name="pageNo" type="hidden" value="page.pageNo"/>
                        <input id="pageSize" name="pageSize" type="hidden" value="page.pageSize"/>
                        <table:sortColumn id="orderBy" name="orderBy" value="  page.orderBy" callback="sortOrRefresh();"/><!-- 支持排序 &ndash;&gt;-->
                        <div class="form-group">
                            <span>门店:</span>
                            <select id="storeIds" style="width: 200px;height: 35px; margin-right: 30px;" >
                                        <option selected = "selected" value="">请选择门店</option>
                             <#if storeList??>
                                 <#list storeList as store>
                                        <option value="<#if store.id??>${store.id}</#if>"><#if store.name??>${store.name}</#if></option>
                                 </#list>
                             </#if>
                                    </select>
                        </div>
                        <div class="form-group">
                            <span>商户名称:</span>
                            <input id="businessName" name="businessName" htmlEscape="false" style="margin-right: 30px;" maxlength="64"  class=" form-control input-sm"
                                <#if businessName??>
                                    value="${businessName}"
                                </#if>
                            />
                        </div>
                        <div class="form-group">
                            <span>商户id:</span>
                            <input id="businessId"  name="businessId" style="margin-right: 30px;" htmlEscape="false" maxlength="64" digits="true" class=" form-control input-sm"
                                <#if businessId??>
                                    value="${businessId}"
                                </#if>
                            />
                        </div>
                        <div class="form-group">
                            <span>商户状态:</span>

                            <select id="businessStatus" class="form-control" name="businessStatus" style="width: 80px;height: 35px;">
                                <option selected = "selected" value="">请选择</option>
                                <option  value="0">关闭</option>
                                <option  value="1">正常</option>
                            </select>
                        </div>
                    </form>
                    <br/>
                </div>
            </div>

            <!-- 工具栏 -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="pull-center" align="center">
                        <button class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="query();" ><i class="fa fa-search"></i> 查询</button>
                        <button class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="cleanBtn()" ><i class="fa fa-search"></i>重置查询条件</button>
                    </div>
                    <div class="pull-right">
                         <shiro:hasPermission name="sys:member:add">
                            <button class="add" data-toggle="tab" data-placement="left" onclick="javascript:add();" title="开通新商户"><i class="fa fa-plus"></i> 开通新商户</button>

                         </shiro:hasPermission>
                    </div>
                </div>
            </div>

            <!-- 商户列表 -->
            <table id="contentTable" class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footer" style="text-align: center">
                <thead>
                <tr>
                    <th align="center">序号</th>
                    <th align="center">门店</di></th>
                    <th align="center">商户id</th>
                    <th align="center">商户名称</th>
                    <th align="center">商户状态</th>
                    <th align="center">商户创建时间</th>
                    <th align="center">创建人</th>
                    <th align="center">最后更新人</th>
                    <th align="center">最后更新时间</th>
                </tr>
                </thead>
                <tbody id="content"></tbody>
            </table>
            <div id = 'nodata' style="text-align: center; display: none">
                <div id="noData" >暂无数据</div>
                <ul id='bp-3-element-test'></ul>
            </div>

        </div>
    </div>
</div>
<script type="text/javascript" src="/business/list.js"></script>
</body>
</html>