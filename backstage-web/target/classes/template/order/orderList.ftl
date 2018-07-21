<html>
<head>
    <title>订单列表管理</title>
    <#include "../ahead.ftl">
    <#include "../treeview.ftl" >
    <#include "../treetable.ftl" >
    <meta name="decorator" content="default"/>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="ibox">
        <#--<div class="ibox-title">-->
            <#--<h5>角色列表 </h5>-->
            <#--<div class="ibox-tools">-->
                <#--<a class="collapse-link">-->
                    <#--<i class="fa fa-chevron-up"></i>-->
                <#--</a>-->
                <#--<a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">-->
                    <#--<i class="fa fa-wrench"></i>-->
                <#--</a>-->
                <#--<ul class="dropdown-menu dropdown-user">-->
                    <#--<li><a href="#">选项1</a>-->
                    <#--</li>-->
                    <#--<li><a href="#">选项2</a>-->
                    <#--</li>-->
                <#--</ul>-->
                <#--<a class="close-link">-->
                    <#--<i class="fa fa-times"></i>-->
                <#--</a>-->
            <#--</div>-->
        <#--</div>-->
        <div class="ibox-content">
            <#if message??>${message}</#if>

            <!-- 查询条件 -->
            <div class="row">
                <div class="col-sm-12">
                    <form id="searchForm" modelAttribute="role" action="/sys/role/list" method="post" class="form-inline">
                        <input id="pageNo" name="pageNo" type="hidden" value="page.pageNo"/>
                        <input id="pageSize" name="pageSize" type="hidden" value="page.pageSize"/>
                        <table:sortColumn id="orderBy" name="orderBy" value="page.orderBy" callback="sortOrRefresh();"/><!-- 支持排序 &ndash;&gt;-->
                        <div class="form-group" style="display:block">
                            <span>门店：</span>
                            <input name="name"  htmlEscape="false" maxlength="64"  class=" form-control input-sm"/>

                            <span>会员手机号：</span>
                            <input name="name"  htmlEscape="false" maxlength="64"  class=" form-control input-sm"/>

                            <span>会员卡id：</span>
                            <input name="name"  htmlEscape="false" maxlength="64"  class=" form-control input-sm"/>

                        </div>
                        <div class="form-group" style="display:block">
                            <span>订单id：</span>
                            <input name="name"  htmlEscape="false" maxlength="64"  class=" form-control input-sm"/>

                            <span>订单状态：</span>
                            <input name="name"  htmlEscape="false" maxlength="64"  class=" form-control input-sm"/>

                            <span>订单类型：</span>
                            <input name="name"  htmlEscape="false" maxlength="64"  class=" form-control input-sm"/>
                        </div>
                        <div class="form-group" style="display:block">
                            <span>开始时间：</span>
                            <input name="name"  htmlEscape="false" maxlength="64"  class=" form-control input-sm"/>

                            <span> - - 结束时间：</span>
                            <input name="name"  htmlEscape="false" maxlength="64"  class=" form-control input-sm"/>
                        </div>
                    </form>
                    <br/>
                </div>
            </div>

            <!-- 工具栏 -->
            <div class="row">
                <div class="col-sm-12">
                    <#--<div class="pull-left">-->
                        <#--<shiro:hasPermission name="sys:role:add">-->
                            <#--<!--<table:addRow url="/sys/role/form" title="角色"></table:addRow> 增加按钮 &ndash;&gt;-->

                            <#--<button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" onclick="add()" title="添加"><i class="fa fa-plus"></i> 添加</button>-->

                            <#--<script type="text/javascript">-->
                                <#--function add(){-->
                                    <#--openDialog("新增"+'角色',"/sys/role/form/0","800px", "500px","");-->
                                <#--}-->
                            <#--</script><!-- 增加按钮 &ndash;&gt;-->
                        <#--</shiro:hasPermission>-->
                        <#--<shiro:hasPermission name="sys:role:edit">-->
                            <#--<table:editRow url="/sys/role/form" id="contentTable"  title="角色"></table:editRow><!-- 编辑按钮 &ndash;&gt;-->
                        <#--</shiro:hasPermission>-->
                        <#--<shiro:hasPermission name="sys:role:del">-->
                            <#--<table:delRow url="/sys/role/deleteAll" id="contentTable"></table:delRow><!-- 删除按钮 &ndash;&gt;-->
                        <#--</shiro:hasPermission>-->
                        <#--<button class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" onclick="sortOrRefresh()" title="刷新"><i class="glyphicon glyphicon-repeat"></i> 刷新</button>-->

                    <#--</div>-->
                    <div class="pull-right">
                        <button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="search()" ><i class="fa fa-search"></i> 查询</button>
                        <button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="reset()" ><i class="fa fa-refresh"></i> 重置</button>
                    </div>
                </div>
            </div>

            <table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
                <thead>
                <tr>
                    <th><input type="checkbox" class="i-checks"></th>
                    <th>序号</th>
                    <th>门店名称</th>
                    <th>订单渠道</th>
                    <th>订单id</th>
                    <th>会员名称</th>
                    <th>订单详情</th>
                    <th>订单成交金额(已减优惠)</th>
                    <th>积分支付</th>
                    <th>礼品卡支付</th>
                    <th>其他方式支付</th>
                    <th>支付方式</th>
                    <th>订单状态</th>
                    <th>订单提交时间</th>
                    <th>操作</th>
                    <shiro:hasPermission name="sys:role:edit"><th>操作</th></shiro:hasPermission>
                </tr>
                </thead>
                <tbody>
                <#--<#list list as role>-->
                    <#--<tr>-->
                        <#--<td> <input type="checkbox" <#if role.id??>id="${role.id}" <#else>id=""</#if> class="i-checks"></td>-->
                        <#--<td><a  href="#" onclick="openDialogView('查看角色', '/sys/role/${role.id}','800px', '500px')">${role.name}</a></td>-->
                        <#--<td><a  href="#" onclick="openDialogView('查看角色', '/sys/role/${role.id}','800px', '500px')">${role.enname}</a></td>-->
                        <#--<td><#if role.office.name??>${role.office.name}</#if></td>-->
                        <#--<td>-->
                            <#--<#if dictList??>-->
                                <#--<#list dictList as dict>-->
                                    <#--<#if dict??&&role.dataScope??>-->
                                     <#--<#if dict.value??&&dict.value==role.dataScope>-->
                                         <#--${dict.label}-->
                                     <#--</#if>-->
                                <#--</#if>-->
                                <#--</#list>-->
                            <#--</#if>-->
                        <#--</td>-->
                        <#--<td>-->
                            <#--<shiro:hasPermission name="sys:role:view">-->
                                <#--<a href="#" onclick="openDialogView('查看角色', '/sys/role/form/${role.id}','800px', '500px')" class="btn btn-info btn-xs" ><i class="fa fa-search-plus"></i> 查看</a>-->
                            <#--</shiro:hasPermission>-->
                            <#--<shiro:hasPermission name="sys:role:edit">-->

                                    <#--<a href="#" onclick="openDialog('修改角色', '/sys/role/form/${role.id}','800px', '500px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> 修改</a>-->

                            <#--</shiro:hasPermission>-->
                            <#--<shiro:hasPermission name="sys:role:del">-->
                                <#--<a href="/sys/role/delete/${role.id}" onclick="return confirmx('确认要删除该角色吗？', this.href)" class="btn  btn-danger btn-xs"><i class="fa fa-trash"></i> 删除</a>-->
                            <#--</shiro:hasPermission>-->
                            <#--<shiro:hasPermission name="sys:role:assign">-->
                                <#--<a href="#" onclick="openDialog('权限设置', '/sys/role/auth?id=${role.id}','350px', '700px')" class="btn btn-primary btn-xs" ><i class="fa fa-edit"></i> 权限设置</a>-->
                            <#--</shiro:hasPermission>-->
                            <#--<shiro:hasPermission name="sys:role:assign">-->
                                <#--<a href="#" onclick="openDialogView('分配用户', '/sys/role/assign/${role.id}','800px', '600px')"  class="btn  btn-warning btn-xs" ><i class="glyphicon glyphicon-plus"></i> 分配用户</a>-->
                            <#--</shiro:hasPermission>-->
                        <#--</td>-->
                    <#--</tr>-->
                <#--</#list>-->
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>