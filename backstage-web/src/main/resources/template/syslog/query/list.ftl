
<html>
<head>
    <title>日志管理</title>
<#include "../../ahead.ftl">
<#include "../../treeview.ftl" >
<#include "../../treetable.ftl" >
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        function page(n,s){
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="ibox">
        <div class="ibox-title">
            <h5>字典列表 </h5>
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
                    <form id="searchForm" modelAttribute="dict" action="/syslog/query/list" method="post" class="form-inline">
                    <#--<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
                    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
                    <table:sortColumn id="orderBy" name="orderBy" value="${page.orderBy}" callback="sortOrRefresh();"/>
                   -->
                        <div class="form-group">
                            <span>业务类型：</span>
                            <input name="bizType" htmlEscape="false" maxlength="50" class="form-control" <#if bizType??>value="${bizType}"</#if>/>

                        </div>
                    </form>
                    <br/>
                </div>
            </div>

            <!-- 工具栏 -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="pull-left">
                        <shiro:hasPermission name="sys:dict:add">
                            <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" onclick="add()" title="添加"><i class="fa fa-plus"></i> 添加</button>

                            <script type="text/javascript">
                                function add(){
                                    openDialog("新增"+'字典',"/sys/dict/form","800px", "500px","");
                                }
                            </script><!-- 增加按钮 -->
                        </shiro:hasPermission>
                        <shiro:hasPermission name="sys:dict:edit">
                            <table:editRow url="/sys/dict/form" id="contentTable"  title="字典"></table:editRow><!-- 编辑按钮 -->
                        </shiro:hasPermission>
                        <shiro:hasPermission name="sys:dict:del">
                            <table:delRow url="/sys/dict/deleteAll" id="contentTable"></table:delRow><!-- 删除按钮 -->
                        </shiro:hasPermission>
                        <button class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" onclick="sortOrRefresh()" title="刷新"><i class="glyphicon glyphicon-repeat"></i> 刷新</button>

                    </div>
                    <div class="pull-right">
                        <button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="search()" ><i class="fa fa-search"></i> 查询</button>
                        <button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="reset()" ><i class="fa fa-refresh"></i> 重置</button>
                    </div>
                </div>
            </div>

            <table id="contentTable" class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footer">
                <thead>
                <tr>
                    <th> <input type="checkbox" class="i-checks"></th>
                    <th  class="sort-column value">业务类型</th>
                    <th >IP地址</th>
                    <th  class="sort-column type">访问URL</th>
                    <th  class="sort-column description">方法</th>
                    <th  class="sort-column sort">参数</th>
                    <th  class="sort-column sort">创建人</th>
                    <th  class="sort-column sort">创建日期</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <#list pageInfo.list as dict>

                <tr>
                    <td> <input type="checkbox" id="${dict.id}" class="i-checks"></td>
                    <td>${dict.bizType}</td>
                    <td><a  href="#" onclick="openDialogView('查看字典', '/sys/dict/form?id=${dict.id}','800px', '500px')">${dict.remoteAddr}</a></td>
                    <td><a href="javascript:" onclick="$('#type').val('${dict.type}');$('#searchForm').submit();return false;">${dict.requestUri}</a></td>
                    <td>${dict.method}</td>
                    <td>${dict.params}</td>
                    <td>${dict.createBy}</td>
                    <td>${dict.createDate?string("yyyy-MM-dd HH:mm:ss")}</td>
                    <td>
                        <#--<shiro:hasPermission name="sys:dict:view">
                            <a href="#" onclick="openDialogView('查看字典', '/sys/dict/form?id=${dict.id}','800px', '500px')" class="btn btn-info btn-xs" ><i class="fa fa-search-plus"></i> 查看</a>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="sys:dict:edit">
                            <a href="#" onclick="openDialog('修改字典', '/sys/dict/form?id=${dict.id}','800px', '500px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> 修改</a>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="sys:dict:del">
                            <a href="/sys/dict/delete?id=${dict.id}&type=${dict.type}" onclick="return confirmx('确认要删除该字典吗？', this.href)"   class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> 删除</a>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="sys:dict:add">
                            <a href="#" onclick="openDialog('添加键值', '/sys/dict/form','800px', '500px')" class="btn btn-primary btn-xs" ><i class="fa fa-plus"></i> 添加键值</a>
                        </shiro:hasPermission>-->
                    </td>
                </tr>
                </#list>
                </tbody>
            </table>

        <#include "../../page.ftl" >
            <br/>
            <br/>
        </div>
    </div>
</div>
</body>
</html>