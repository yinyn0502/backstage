<html>
<head>
    <title>会员管理</title>
    <#include "../ahead.ftl">
    <#include "../treeview.ftl" >
    <#include "../treetable.ftl" >
    <meta name="decorator" content="default"/>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="ibox">
        <div class="ibox-title">
            <h5>会员列表 </h5>
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
                    <form id="searchForm" modelAttribute="member" action="/member/get" method="get" class="form-inline">
                        <input id="pageNo" name="pageNo" type="hidden" value="page.pageNo"/>
                        <input id="pageSize" name="pageSize" type="hidden" value="page.pageSize"/>
                        <table:sortColumn id="orderBy" name="orderBy" value="page.orderBy" callback="sortOrRefresh();"/><!-- 支持排序 &ndash;&gt;-->
                        <div class="form-group">
                            <span>手机号码:</span>
                            <input id="mobile"  htmlEscape="false" maxlength="64"  class=" form-control input-sm"
                                <#if mobile??>
                                    value="${mobile}"
                                </#if>
                            />
                        </div>
                        <div class="form-group">
                            <span>会员卡号:</span>
                            <input id="cardNo"  htmlEscape="false" maxlength="64"  class=" form-control input-sm"
                                <#if cardNo??>
                                    value="${cardNo}"
                                </#if>
                            />
                        </div>
                        <div class="form-group">
                            <span>开卡门店:</span>
                            <select id="storeId" class="form-control" name="storeId">
                            <#if storeInfo??>
                                <option  value="<#if storeId??>${storeId?c}</#if>"><#if storeString??>${storeString}<#else >请选择</#if></option>
                                <#list storeInfo as item>
                                    <option storeType="<#if item.type??>${item.type?c}</#if>" value="<#if item.id??>${item.id}</#if>"><#if item.id??>${item.id}-</#if><#if item.name??>${item.name}</#if></option>
                                </#list>
                            </#if>
                            </select>
                        </div>
                    </form>
                    <br/>
                </div>
            </div>

            <!-- 工具栏 -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="pull-center">
                        <button class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="javascript:query();" ><i class="fa fa-search"></i> 查询</button>
                    </div>
                    <div class="pull-right">
                         <shiro:hasPermission name="sys:member:add">

                            <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" onclick="javascript:add();" title="新增付费会员"><i class="fa fa-plus"></i> 新增付费会员</button>

                        </shiro:hasPermission>
                    </div>
                </div>
            </div>

            <!-- 会员列表 -->
            <table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
                <thead>
                <tr>
                    <th><input type="checkbox" class="i-checks"></th>
                    <th>用户名</th>
                    <th>手机号</th>
                    <th>注册时间</th>
                    <th>积分</th>
                    <th>礼券数量</th>
                    <th>会员等级</th>
                    <th>卡状态</th>
                    <th>备注</th>
                    <shiro:hasPermission name="sys:member:edit"><th>操作</th></shiro:hasPermission>
                </tr>
                </thead>
                <tbody>
                    <#if pageInfo.list??>
                        <#list pageInfo.list as member>
                            <tr>
                                <td> <input type="checkbox" <#if member.memberId??>id="${member.memberId?c}" <#else>id=""</#if> class="i-checks"></td>
                                <td><#if member.name??>${member.name}</#if></td>
                                <td><#if member.mobile??>${member.mobile}</#if></td>
                                <td><#if member.registDate??>${member.registDate}</#if></td>
                                <td><#if member.points??>${member.points?c}</#if></td>
                                <td><#if member.couponCount??>${member.couponCount}</#if></td>
                                <td><#if member.levelName??>${member.levelName}</#if></td>
                                <td><#if member.cardStatus??>${member.cardStatus}</#if></td>
                                <td><#if member.remarks??>${member.remarks}</#if></td>
                                <td>
                                <shiro:hasPermission name="member:query:view">
                                    <a href="#" onclick="javascript:detail(${member.memberId?c});" class="btn btn-info btn-xs" ><i class="fa fa-search-plus"></i> 详情</a>
                                    <#if member.unbinding>
                                        <a href="#" onclick="javascript:unbinding(${member.memberId?c});" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> 解绑</a>
                                    </#if>
                                    <#if member.backCard>
                                        <a href="#" onclick="javascript:retreatCard(${member.memberId?c});" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> 退卡</a>
                                    </#if>
                                </shiro:hasPermission>
                                </td>
                            </tr>
                        </#list>
                    <#else>
                        <thead>
                            <tr>
                                <td  class="width-15 active" colspan="11">
                                    <label class="pull-left">暂无记录!</label>
                                </td>
                            </tr>
                        </thead>
                    </#if>
                </tbody>
            </table>
            <#include "../page.ftl">
        </div>
    </div>
</div>
<script type="text/javascript" src="/member/list.js"></script>
</body>
</html>