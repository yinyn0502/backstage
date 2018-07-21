<html>
<head>
    <title>push管理</title>
    <#include "../ahead.ftl">
    <#include "../treeview.ftl" >
    <#include "../treetable.ftl" >
    <meta name="decorator" content="default"/>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="ibox">
        <div class="ibox-title">
            <h5>push列表 </h5>
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

        <#if message??>
            <div id="messageBox" class="alert alert-success">
                <button data-dismiss="alert" class="close">×</button>  ${message} </div>
            <script type="text/javascript">if(!top.$.jBox.tip.mess){top.$.jBox.tip.mess=1;top.$.jBox.tip("${message}","success",{persistent:true,opacity:0});$("#messageBox").show();}</script>
        </#if>

            <!-- 查询条件 -->
            <div class="row">
                <div class="col-sm-12">
                    <form id="searchForm" modelAttribute="member" action="/message/list" method="get" class="form-inline">
                        <table:sortColumn id="orderBy" name="orderBy" value="page.orderBy" callback="sortOrRefresh();"/><!-- 支持排序 &ndash;&gt;-->
                        <div class="form-group">
                            <span>时间:</span>
                            <input type="text" class="input-sm form-control " data-date-format="yyyy-mm-dd hh:ii:ss" id="strStartDate" name="strStartDate" readonly
                                <#if strStartDate??>
                                    value="${strStartDate}"
                                </#if>
                            />—
                            <input type="text" class="input-sm form-control " data-date-format="yyyy-mm-dd hh:ii:ss" id="strEndDate" name="strEndDate" readonly
                                <#if strEndDate??>
                                    value="${strEndDate}"
                                </#if>
                            />
                        </div>
                        <div class="form-group">
                            <span>设备类型:</span>
                            <select id="appType" name="appType" class="form-control">
                                <#if appType??>
                                    <option value="2"
                                        <#if appType==2 >
                                            selected="selected"
                                        </#if>
                                    >全部</option>
                                    <option value="1"
                                        <#if appType==1 >
                                            selected="selected"
                                        </#if>
                                    >安卓</option>
                                    <option value="0"
                                        <#if appType==0 >
                                            selected="selected"
                                        </#if>
                                    >ios</option>
                                <#else>
                                    <option value="2" selected="selected" >全部</option>
                                    <option value="1" >安卓</option>
                                    <option value="0" >ios</option>
                                </#if>
                            </select>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="search()" >l<i class="fa fa-search"></i> 查询</button>
                            <button id="reset" class="btn btn-primary btn-rounded btn-outline btn-sm " ><i class="fa fa-refresh"></i> 重置</button>
                        </div>
                    </form>
                    <br/>
                </div>
            </div>

            <!-- 工具栏 -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="pull-right">
                         <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" onclick="javascript:add();" title="发送推送"><i class="fa fa-plus"></i> 发送推送</button>
                    </div>
                </div>
            </div>

            <!-- 会员列表 -->
            <table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
                <thead>
                <tr>
                    <th><input type="checkbox" class="i-checks"></th>
                    <th>发送时间</th>
                    <th>推送标题</th>
                    <th>文案类型</th>
                    <th>设备类型</th>
                    <th>推送设备数</th>
                    <th>推送状态</th>
                    <th>到达设备数</th>
                    <th>到达率</th>
                    <th>点击数</th>
                    <th>点击率</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                    <#if pageInfo.list??>
                        <#list pageInfo.list as message>
                            <tr>
                                <td> <input type="checkbox" class="i-checks"></td>
                                <td><#if message.bookTime??>${message.bookTime}</#if></td>
                                <td><#if message.title??>${message.title}</#if></td>
                                <td><#if message.businessType??>${message.businessType}</#if></td>
                                <td><#if message.appType??>${message.appType}</#if></td>
                                <td><#if message.sendTotal??>${message.sendTotal}</#if></td>
                                <td><#if message.status??>${message.status}</#if></td>
                                <td><#if message.arriveAppCount??>${message.arriveAppCount}</#if></td>
                                <td><#if message.arriveAppRate??>${message.arriveAppRate}</#if></td>
                                <td><#if message.clickCount??>${message.clickCount}</#if></td>
                                <td><#if message.clickRate??>${message.clickRate}</#if></td>
                                <td>
                                    <a href="#" onclick="javascript:detail(${message.id});" class="btn btn-info btn-xs" ><i class="fa fa-search-plus"></i> 详情</a>
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
<style type="text/css">/member/message/css/list.css</style>
<script type="text/javascript" src="/member/message/list.js"></script>
</body>
</html>