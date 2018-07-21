<html>
<head>
    <title>菜单管理</title>
    <meta name="decorator" content="default"/>

    <!-- 引入jquery插件 -->
    <script src="/static/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="/static/jquery/jquery-migrate-1.1.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/static/TableDnD/jquery.tablednd.js"></script>


    <!-- 引入依赖的第三方插件 -->
    <script src="/static/slimscroll/jquery.slimscroll.min.js"></script>



    <script src="/static/jquery-validation/1.14.0/jquery.validate.min.js" type="text/javascript"></script>
    <script src="/static/jquery-validation/1.14.0/localization/messages_zh.min.js" type="text/javascript"></script>
    <link href="/static/jquery-jbox/2.3/Skins/Bootstrap/jbox.min.css" rel="stylesheet" />
    <script src="/static/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="/static/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="/static/pace/pace.min.js"></script>
    <script src="/static/metisMenu/jquery.metisMenu.js"></script>
    <link href="/static/iCheck/custom.css" rel="stylesheet" />
    <script src="/static/iCheck/icheck.min.js"></script>
    <script src="/static/iCheck/icheck-init.js"></script>
    <link href="/static/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
    <script src="/static/dataTables/jquery.dataTables.js"></script>
    <script src="/static/dataTables/dataTables.bootstrap.js"></script>




    <!-- jeeplus -->
    <link href="/static/common/jeeplus.css" type="text/css" rel="stylesheet" />
    <script src="/static/common/jeeplus.js" type="text/javascript"></script>

    <!-- jquery ui -->
    <script src="/static/jquery-ui/jquery-ui.min.js"></script>

    <!-- 引入bootstrap插件 -->
    <!-- bootswatch主题效果不怎么好，停止切换，使用官网的默认版本，如果你想切换主题请访问http://bootswatch.com/下载最新版版主题，by刘高峰 -->
    <!--  <link href="/jeeplus/static/bootstrap/3.3.4/css_default/bootstrap.min.css" type="text/css" rel="stylesheet" />-->
    <link href="/static/bootstrap/3.3.4/css_default/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="/static/bootstrap/3.3.4/js/bootstrap.min.js"  type="text/javascript"></script>
    <link href="/static/awesome/4.4/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/static/common/css/style.css?v=3.2.0" type="text/css" rel="stylesheet" />

    <!-- 引入layer插件 -->
    <script src="/static/layer-v2.3/layer/layer.js"></script>
    <script src="/static/layer-v2.3/layer/laydate/laydate.js"></script>

    <!--引入webuploader-->
    <link rel="stylesheet" type="text/css" href="/static/webuploader-0.1.5/webuploader.css">
    <script type="text/javascript" src="/static/webuploader-0.1.5/webuploader.js"></script>


    <!-- 引入自定义文件 -->
    <script src="/static/common/mustache.min.js" type="text/javascript"></script>
    <script src="/static/common/content.js" type="text/javascript"></script>
    <link href="/static/common/css/login.css" type="text/css" rel="stylesheet" />





    <link href="/static/treeTable/themes/vsStyle/treeTable.min.css" rel="stylesheet" type="text/css" />
    <script src="/static/treeTable/jquery.treeTable.min.js" type="text/javascript"></script>






    <script type="text/javascript">
        $(document).ready(function() {
            $("#treeTable").treeTable({expandLevel : 1,column:1}).show();
        });
        function updateSort() {
            loading('正在提交，请稍等...');
            $("#listForm").attr("action", "/sys/menu/updateSort");
            $("#listForm").submit();
        }
        function refresh(){//刷新

            window.location="/sys/menu/";
        }
    </script>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="ibox">
        <div class="ibox-title">
            <h5>菜单列表 </h5>
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


               <!-- 工具栏 -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="pull-left">
                        <shiro:hasPermission name="sys:menu:add">
                            <table:addRow url="/sys/menu/form" title="菜单"></table:addRow><!-- 增加按钮 -->
                        </shiro:hasPermission>
                        <shiro:hasPermission name="sys:menu:edit">
                            <table:editRow url="/sys/menu/form" id="treeTable"  title="菜单"></table:editRow><!-- 编辑按钮 -->
                        </shiro:hasPermission>
                        <shiro:hasPermission name="sys:menu:del">
                            <table:delRow url="/sys/menu/deleteAll" id="treeTable"></table:delRow><!-- 删除按钮 -->
                        </shiro:hasPermission>
                        <shiro:hasPermission name="sys:menu:updateSort">
                            <button id="btnSubmit" class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" onclick="updateSort()" title="保存排序"><i class="fa fa-save"></i> 保存排序</button>
                        </shiro:hasPermission>
                        <button class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" onclick="refresh()" title="刷新"><i class="glyphicon glyphicon-repeat"></i> 刷新</button>

                    </div>
                </div>
            </div>
            <form id="listForm" method="post">
                <table id="treeTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
                    <thead><tr><th><input type="checkbox" class="i-checks"></th><th>名称</th><th>链接</th><th style="text-align:center;">排序</th><th>可见</th><th>权限标识</th><shiro:hasPermission name="sys:menu:edit"><th>操作</th></shiro:hasPermission></tr></thead>
                    <tbody>
                    <#list menuList as menu>
                    <tr id="${menu.id}" <#if menu.parentId??>pId="${menu.parentId}"<#else> pId="0" </#if>>
                        <td> <input type="checkbox" id="${menu.id}" class="i-checks"></td>
                        <td nowrap><#if menu.icon??><i class="icon-${menu.icon}"><#else><i class="icon-hidden"></#if></i><a  href="#" onclick="openDialogView('查看菜单', '/menu/form/${menu.id}','800px', '500px')">${menu.name}</a></td>
                            <td <#if menu.href??>title="${menu.href}"</#if>>fns:abbr(menu.href,30)</td>
                            <td style="text-align:center;">
                                <shiro:hasPermission name="sys:menu:updateSort">
                                    <input type="hidden" name="ids" value="${menu.id}"/>
                                    <input name="sorts" type="text" value="${menu.sort}" class="form-control" style="width:100px;margin:0;padding:0;text-align:center;">
                                </shiro:hasPermission><shiro:lacksPermission name="sys:menu:updateSort">
                            ${menu.sort}
                            </shiro:lacksPermission>
                            </td>
                            <td><#if menu.isShow??&& menu.isShow=='1'>显示<#else>隐藏</#if></td>
                            <td title="${menu.permission}">fns:abbr(menu.permission,30)</td>
                            <td nowrap>
                                <shiro:hasPermission name="sys:menu:view">
                                    <a href="#" onclick="openDialogView('查看菜单', '/sys/menu/form?id=${menu.id}','800px', '500px')" class="btn btn-info btn-xs" ><i class="fa fa-search-plus"></i> 查看</a>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="sys:menu:edit">
                                    <a href="#" onclick="openDialog('修改菜单', '/sys/menu/form?id=${menu.id}','800px', '500px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> 修改</a>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="sys:menu:del">
                                    <a href="/sys/menu/delete?id=${menu.id}" onclick="return confirmx('要删除该菜单及所有子菜单项吗？', this.href)" class="btn btn-danger btn-xs" ><i class="fa fa-trash"></i> 删除</a>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="sys:menu:add">
                                    <a href="#" onclick="openDialog('添加下级菜单', '/sys/menu/form?parent.id=${menu.id}','800px', '500px')" class="btn btn-primary btn-xs" ><i class="fa fa-plus"></i> 添加下级菜单</a>
                                </shiro:hasPermission>
                            </td>
                        </tr>
                    </#list>

                    </tbody>
                </table>
            </form>
        </div>
    </div>
</div>
</body>
</html>