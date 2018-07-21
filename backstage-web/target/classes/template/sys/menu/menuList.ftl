
<html>
<head>
    <title>菜单管理</title>
    <meta name="decorator" content="default"/>
<#include "../../ahead.ftl">
<#include "../../treetable.ftl">
<#assign hasAnyPermissions = "com.ueater.backstage.web.auth.HasAnyPermissions"?new()>
    <script type="text/javascript">
        $(document).ready(function() {
            var tpl = $("#treeTableTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
        var data = <#if dictString??>${dictString},<#else>"[]"</#if> rootId = "0";
            addRow("#treeTableList", tpl, data, rootId, true);
            $("#treeTable").treeTable({expandLevel : 5});

        });
        function addRow(list, tpl, data, pid, root){
            for (var i=0; i<data.length; i++){
                var row = data[i];

                if (row.parentId == pid){
                    $(list).append(Mustache.render(tpl, {
                        dict: {
                            type: getDictLabel(${dictString}, row.type)
                        }, pid: (root?0:pid), row: row
                    }));
                    addRow(list, tpl, data, row.id);
                }
            }
        }

        function refresh(){//刷新

            window.location="/sys/menu/list";
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
        <#if message??>

            <div id="messageBox" class="alert alert-success">

                <button data-dismiss="alert" class="close">×</button>  ${message} </div>


            <script type="text/javascript">if(!top.$.jBox.tip.mess){top.$.jBox.tip.mess=1;top.$.jBox.tip("${message}","success",{persistent:true,opacity:0});$("#messageBox").show();}</script>

        </#if>





            <!-- 工具栏 -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="pull-left">
                        <shiro:hasPermission name="sys:menu:add">
                            <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" onclick="add()" title="添加"><i class="fa fa-plus"></i> 添加</button>

                            <script type="text/javascript">
                                function add(){
                                    openDialog("新增"+'菜单',"/sys/menu/form/0","800px", "500px");
                                }
                            </script><!-- 增加按钮 -->
                        </shiro:hasPermission>
                        <button class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" onclick="refresh()" title="刷新"><i class="glyphicon glyphicon-repeat"></i> 刷新</button>

                    </div>
                </div>
            </div>

            <table id="treeTable"  class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
                <thead><th>名称</th><th>链接</th><th style="text-align:center;">排序</th><th>可见</th><th>权限标识</th><shiro:hasPermission name="sys:office:edit"><th>操作</th></thead>
                <tbody id="treeTableList"></tbody>
            </table>
            <br/>
        </div>
    </div>
</div>

<script type="text/template" id="treeTableTpl">

    <tr id="{{row.id}}" pId="{{pid}}">
        <td><a  href="#" onclick="openDialogView('查看菜单', '/sys/menu/form/{{row.id}}','800px', '500px')">{{row.name}}</a></td>
        <td>{{row.href}}</td>
        <td>{{row.sort}}</td>
        <td>{{row.isShow}}</td>
        <td>{{row.permission}}</td>
        <td>


    <#if hasAnyPermissions('sys:menu:view')?c=='true'>
                <a href="#" onclick="openDialogView('查看菜单', '/sys/menu/form/{{row.id}}','800px', '500px')" class="btn btn-info btn-xs" ><i class="fa fa-search-plus"></i>  查看</a>
    </#if>
    <#if hasAnyPermissions('sys:menu:edit')?c=='true'>
        <a href="#" onclick="openDialog('修改菜单', '/sys/menu/form/{{row.id}}','800px', '500px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> 修改</a>
    </#if>
    <#if hasAnyPermissions('sys:menu:del')?c=='true'>
                <a href="/sys/menu/delete/{{row.id}}" onclick="return confirmx('要删除该菜单及所有子菜单项吗？', this.href)" class="btn btn-danger btn-xs" ><i class="fa fa-trash"></i> 删除</a>
    </#if>
    <#if hasAnyPermissions('sys:menu:add')?c=='true'>
                <a href="#" onclick="openDialog('添加下级菜单', '/sys/menu/subform/{{row.id}}','800px', '500px')" class="btn btn-primary btn-xs" ><i class="fa fa-plus"></i> 添加下级菜单</a>
    </#if>
        </td>
    </tr>

</script>

</body>
</html>