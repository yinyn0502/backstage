<html>
<head>
    <title>页面管理</title>
<#include "../../ahead.ftl">
<#include "../../treeview.ftl" >
<#include "../../treetable.ftl" >
<#assign hasAnyPermissions = "com.ueater.backstage.web.auth.HasAnyPermissions"?new()>;
    <meta name="decorator" content="default"/>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="ibox">
        <div class="ibox-title">
            <h5>页面列表 </h5>
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
        <#if message??>${message}</#if>

            <!-- 查询条件 -->
            <div class="row">
                <div class="col-sm-12">
                    <form id="searchForm" modelAttribute="role" action="/sys/role/list" method="post" class="form-inline">
                        <input id="pageNo" name="pageNo" type="hidden" value="page.pageNo"/>
                        <input id="pageSize" name="pageSize" type="hidden" value="page.pageSize"/>
                        <table:sortColumn id="orderBy" name="orderBy" value="page.orderBy" callback="sortOrRefresh();"/><!-- 支持排序 &ndash;&gt;-->
                        <div class="form-group">
                            <span>角色名称：</span>
                            <input name="name"  htmlEscape="false" maxlength="64"  class=" form-control input-sm"/>

                        </div>
                    </form>
                    <br/>
                </div>
            </div>

            <!-- 工具栏 -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="pull-left">
                        <shiro:hasPermission name="sys:role:add">
                            <!--<table:addRow url="/sys/role/form" title="角色"></table:addRow> 增加按钮 -->

                            <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" onclick="add()" title="添加"><i class="fa fa-plus"></i> 添加</button>

                            <script type="text/javascript">
                                function add(){
                                    openDialog("新增"+'角色',"/sys/role/form/0","800px", "500px","");
                                }
                            </script><!-- 增加按钮 -->
                        </shiro:hasPermission>
                        <shiro:hasPermission name="sys:role:edit">
                            <table:editRow url="/sys/role/form" id="contentTable"  title="角色"></table:editRow><!-- 编辑按钮 -->
                        </shiro:hasPermission>
                        <shiro:hasPermission name="sys:role:del">
                            <table:delRow url="/sys/role/deleteAll" id="contentTable"></table:delRow><!-- 删除按钮 -->
                        </shiro:hasPermission>
                        <button class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" onclick="sortOrRefresh()" title="刷新"><i class="glyphicon glyphicon-repeat"></i> 刷新</button>

                    </div>
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
                    <th>图片名称</th>
                    <th>模型类型</th>
                    <th>图片</th>
                    <th>商品</th>
                    <shiro:hasPermission name="sys:role:edit"><th>操作</th></shiro:hasPermission>
                </tr>
                </thead>
                <tbody>
                <#if template??>
                <#list template.moduleList as role>
                <tr>

                    <td>${role.moduleId}</td>
                    <td><#if role.moduleImage??><img src="${role.moduleImage}" width="100px" height="100px"></#if></td>
                    <td><#if role.moduleTypeId==1>轮播图</#if>
                        <#if role.moduleTypeId==2>新品发现</#if>
                        <#if role.moduleTypeId==3>每日抢鲜</#if>
                        <#if role.moduleTypeId==4>自定义活动</#if>
                        <#if role.moduleTypeId==5>纯粹味道</#if>
                        <#if role.moduleTypeId==6>买手推荐</#if>
                        <#if role.moduleTypeId==7>eat说</#if>
                    </td>

                    <td>
                        <#if role.resourceList??>
                        <#list role.resourceList as r>
                            <#if r.imageValue??><img src="${r.imageValue}" width="100px" height="100px"></#if>
                        </#list>
                        </#if>
                    </td>
                    <td>
                        <#if role.resourceList??>
                        <#list role.resourceList as r>
                            <#if r.entityIdValue??>${r.entityIdValue}</#if>
                        </#list>
                        </#if>
                    </td>

                <#--<td><#if role.office.name??>${role.office.name}</#if></td>
                    <td>
                        <#if dictList??>
                                <#list dictList as dict>
                            <#if dict??&&role.dataScope??>
                                <#if dict.value??&&dict.value==role.dataScope>
                                ${dict.label}
                                </#if>
                            </#if>
                        </#list>
                            </#if>
                    </td>
                    -->
                    <td>

                    <#if hasAnyPermissions('cmsinfo:query:view')?c=='true'>
                            <#if template.templateId??&&role.moduleId??>
                                /cmsinfo/query/form/${template.templateId}/${role.moduleId}
                            <a href="#" onclick="openDialogView('查看', '/cmsinfo/query/form/${template.templateId}/${role.moduleId?c}','800px', '500px')" class="btn btn-info btn-xs" ><i class="fa fa-search-plus"></i> 查看</a>
                            </#if>
                    </#if>
                        <shiro:hasPermission name="sys:role:edit">

                            <a href="#" onclick="openDialog('修改角色', '/sys/role/form/${role.moduleId}','800px', '500px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> 修改</a>

                        </shiro:hasPermission>
                        <shiro:hasPermission name="sys:role:del">
                            <a href="/sys/role/delete/${role.moduleId}" onclick="return confirmx('确认要删除该角色吗？', this.href)" class="btn  btn-danger btn-xs"><i class="fa fa-trash"></i> 删除</a>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="sys:role:assign">
                            <a href="#" onclick="openDialog('权限设置', '/sys/role/auth?id=${role.moduleId}','350px', '700px')" class="btn btn-primary btn-xs" ><i class="fa fa-edit"></i> 权限设置</a>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="sys:role:assign">
                            <a href="#" onclick="openDialogView('分配用户', '/sys/role/assign/${role.moduleId}','800px', '600px')"  class="btn  btn-warning btn-xs" ><i class="glyphicon glyphicon-plus"></i> 分配用户</a>
                        </shiro:hasPermission>
                    </td>
                </tr>
                </#list>
                </#if>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>