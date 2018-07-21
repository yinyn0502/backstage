<html>
<head>
    <title>用户管理</title>
    <meta name="decorator" content="default"/>
<#include "../../ahead.ftl">
<#include "../../treeview.ftl" >
<#include "../../treetable.ftl" >
</head>
<body>
<div class="wrapper wrapper-content">
   <#if message??> ${message} </#if>
    <!-- 查询条件 -->
    <div class="row">
        <div class="col-sm-12">
            <form id="searchForm" modelAttribute="user" action="/sys/user/list" method="post" class="form-inline">
                <#--<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
                <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
                <table:sortColumn id="orderBy" name="orderBy" value="${page.orderBy}" callback="sortOrRefresh();"/>-->
                    <!-- 支持排序 &ndash;&gt;-->
                <div class="form-group">
                    <span>归属公司：</span>
                    <input id="companyId" name="companyId" class=" form-control input-sm" type="hidden" value=""/>
                    <div class="input-group">
                        <input id="companyName" name="company.name" readonly="readonly"  type="text" value="" data-msg-required=""
                               class=" form-control input-sm" style=""/>
                        <span class="input-group-btn">
	       		 <button type="button"  id="companyButton" class="btn  btn-sm   btn-primary  "><i class="fa fa-search"></i>
	             </button>
       		 </span>

                    </div>
                    <label id="companyName-error" class="error" for="companyName" style="display:none"></label>
                    <script type="text/javascript">
                        $("#companyButton, #companyName").click(function(){
                            // 是否限制选择，如果限制，设置为disabled
                            if ($("#companyButton").hasClass("disabled")){
                                return true;
                            }
                            // 正常打开
                            top.layer.open({
                                type: 2,
                                area: ['300px', '420px'],
                                title:"选择公司",
                                ajaxData:{selectIds: $("#companyId").val()},
                                content: "/tag/treeselect?url="+encodeURIComponent("/sys/office/treeData?type=1")+"&module=&checked=&extId=&isAll=" ,
                                btn: ['确定', '关闭']
                                ,yes: function(index, layero){ //或者使用btn1
                                    var tree = layero.find("iframe")[0].contentWindow.tree;//h.find("iframe").contents();
                                    var ids = [], names = [], nodes = [];
                                    if ("" == "true"){
                                        nodes = tree.getCheckedNodes(true);
                                    }else{
                                        nodes = tree.getSelectedNodes();
                                    }
                                    for(var i=0; i<nodes.length; i++) {//
                                        ids.push(nodes[i].id);
                                        names.push(nodes[i].name);//
                                        break; // 如果为非复选框选择，则返回第一个选择
                                    }
                                    $("#companyId").val(ids.join(",").replace(/u_/ig,""));
                                    $("#companyName").val(names.join(","));
                                    $("#companyName").focus();
                                    top.layer.close(index);
                                },
                                cancel: function(index){ //或者使用btn2
                                    //按钮【按钮二】的回调
                                }
                            });

                        });
                    </script>


                    <#--<sys:treeselect id="company" name="company.id" value="${user.company.id}" labelName="company.name" labelValue="${user.company.name}"
                                    title="公司" url="/sys/office/treeData?type=1" cssClass=" form-control input-sm" allowClear="true"/>-->
                    <span>登录名：</span>
                    <input name="loginName" htmlEscape="false" maxlength="50" class=" form-control input-sm"/>
                    <span>归属部门：</span>

                    <input id="officeId" name="officeId" class=" form-control input-sm" type="hidden" />
                    <div class="input-group">
                        <input id="officeName" name="office.name" readonly="readonly"  type="text" value="" data-msg-required=""
                               class=" form-control input-sm" style="" />
                        <span class="input-group-btn">
	       		 <button type="button"  id="officeButton" class="btn  btn-sm   btn-primary  "><i class="fa fa-search"></i>
	             </button>
       		 </span>

                    </div>
                    <label id="officeName-error" class="error" for="officeName" style="display:none"></label>
                    <script type="text/javascript">
                        $("#officeButton, #officeName").click(function(){
                            // 是否限制选择，如果限制，设置为disabled
                            if ($("#officeButton").hasClass("disabled")){
                                return true;
                            }
                            // 正常打开
                            top.layer.open({
                                type: 2,
                                area: ['300px', '420px'],
                                title:"选择部门",
                                ajaxData:{selectIds: $("#officeId").val()},
                                content: "/tag/treeselect?url="+encodeURIComponent("/sys/office/treeData?type=2")+"&module=&checked=&extId=&isAll=" ,
                                btn: ['确定', '关闭']
                                ,yes: function(index, layero){ //或者使用btn1
                                    var tree = layero.find("iframe")[0].contentWindow.tree;//h.find("iframe").contents();
                                    var ids = [], names = [], nodes = [];
                                    if ("" == "true"){
                                        nodes = tree.getCheckedNodes(true);
                                    }else{
                                        nodes = tree.getSelectedNodes();
                                    }
                                    for(var i=0; i<nodes.length; i++) {//
                                        if (nodes[i].isParent){
                                            //top.$.jBox.tip("不能选择父节点（"+nodes[i].name+"）请重新选择。");
                                            //layer.msg('有表情地提示');
                                            top.layer.msg("不能选择父节点（"+nodes[i].name+"）请重新选择。", {icon: 0});
                                            return false;
                                        }//
                                        ids.push(nodes[i].id);
                                        names.push(nodes[i].name);//
                                        break; // 如果为非复选框选择，则返回第一个选择
                                    }
                                    $("#officeId").val(ids.join(",").replace(/u_/ig,""));
                                    $("#officeName").val(names.join(","));
                                    $("#officeName").focus();
                                    top.layer.close(index);
                                },
                                cancel: function(index){ //或者使用btn2
                                    //按钮【按钮二】的回调
                                }
                            });

                        });
                    </script>
                    <span>姓&nbsp;&nbsp;&nbsp;名：</span>
                    <input name="name" htmlEscape="false" maxlength="50" class=" form-control input-sm"/>

                </div>
            </form>
            <br/>
        </div>
    </div>

    <!-- 工具栏 -->
    <div class="row">
        <div class="col-sm-12">
            <div class="pull-left">
                <shiro:hasPermission name="sys:user:add">
                    <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" onclick="add()" title="添加"><i class="fa fa-plus"></i> 添加</button>

                    <script type="text/javascript">
                        function add(){
                            openDialog("新增"+'用户',"/sys/user/form/0","800px", "625px","officeContent");
                            //openMessageView("标题","显示内容","400px", "325px");
                        }
                    </script><!-- 增加按钮 -->

                </shiro:hasPermission>
                <shiro:hasPermission name="sys:user:edit">
                    <table:editRow url="/sys/user/form" id="contentTable"  title="用户" width="800px" height="680px" target="officeContent"></table:editRow><!-- 编辑按钮 -->
                </shiro:hasPermission>
                <shiro:hasPermission name="sys:user:del">
                    <table:delRow url="/sys/user/deleteAll" id="contentTable"></table:delRow><!-- 删除按钮 -->
                </shiro:hasPermission>
                <shiro:hasPermission name="sys:user:import">
                    <table:importExcel url="/sys/user/import"></table:importExcel><!-- 导入按钮 -->
                </shiro:hasPermission>
                <shiro:hasPermission name="sys:user:export">
                    <table:exportExcel url="/sys/user/export"></table:exportExcel><!-- 导出按钮 -->
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
            <th class="sort-column login_name">登录名</th>
            <th class="sort-column name">姓名</th>
            <th class="sort-column phone">电话</th>
            <th class="sort-column mobile">手机</th>
            <th class="sort-column c.name">归属公司</th>
            <th class="sort-column o.name">归属部门</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <#list pageInfo.list as user>
            <tr>
                <td> <input type="checkbox" id="${user.id}" class="i-checks"></td>
                <td><a  href="#" onclick="openDialogView('查看用户', '/sys/user/form?id=${user.id}','800px', '680px')">${user.loginName}</a></td>
                <td><#if user.name??>${user.name}</#if></td>
                <td><#if user.phone??>${user.phone}</#if></td>
                <td><#if user.mobile??>${user.mobile}</#if></td>
                <td><#if user.company.name??>${user.company.name}</#if></td>
                <td><#if user.office.name??>${user.office.name}</#if></td>
                <td>
                    <shiro:hasPermission name="sys:user:view">
                        <a href="#" onclick="openDialogView('查看用户', '/sys/user/form/${user.id}','800px', '680px')" class="btn btn-info btn-xs" ><i class="fa fa-search-plus"></i> 查看</a>
                    </shiro:hasPermission>
                    <shiro:hasPermission name="sys:user:edit">
                        <a href="#" onclick="openDialog('修改用户', '/sys/user/form/${user.id}','800px', '700px', 'officeContent')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> 修改</a>
                    </shiro:hasPermission>
                    <shiro:hasPermission name="sys:user:del">
                        <a href="/sys/user/delete/${user.id}" onclick="return confirmx('确认要删除该用户吗？', this.href)" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> 删除</a>
                    </shiro:hasPermission>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>
    <#--<table:page page="${page}"></table:page>-->

      <#-- <div class="fixed-table-pagination" style="display: block;">
           <div class="pull-left pagination-detail"><span class="pagination-info">总共<#if pageInfo.size??>${pageInfo.size}</#if>条记录</span><span class="page-list">每页显示 <span class="btn-group dropup"><button type="button" class="btn btn-default  btn-outline dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="page-size">10</span> <span class="caret"></span></button><ul class="dropdown-menu" role="menu"><li class="active"><a href="javascript:page(1,10,'');">10</a></li><li class=""><a href="javascript:page(1,25,'');">25</a></li><li class=""><a href="javascript:page(1,50,'');">50</a></li><li class=""><a href="javascript:page(1,100,'');">100</a></li></ul></span> 条记录</span></div><div class="pull-right pagination-roll"><ul class="pagination pagination-outline"><li class="paginate_button previous disabled"><a href="javascript:"><i class="fa fa-angle-double-left"></i></a></li>
           <li class="paginate_button previous disabled"><a href="/sys/user/list?pageNum=${pageInfo.}"><i class="fa fa-angle-left"></i></a></li>
           <li class="paginate_button active"><a href="javascript:">1</a></li>
           <li class="paginate_button next disabled"><a href="javascript:"><i class="fa fa-angle-right"></i></a></li>
           <li class="paginate_button next disabled"><a href="javascript:"><i class="fa fa-angle-double-right"></i></a></li>
       </ul></div></div>-->

   <#include "../../page.ftl">


</div>
</body>
</html>