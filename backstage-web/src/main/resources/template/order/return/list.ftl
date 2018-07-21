
<html>
<head>
    <title>退换货管理</title>
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
        };


        /**
         * 激活tab选项卡并使用ajax异步加载内容
         * @param {Object} tabsId
         * @param {Object} url
         */
        function showTabs(tabsId,url) {
            $("a[href='#"+tabsId+"']").tab('show');
            var $tabContent = $('#'+tabsId);
            if($tabContent.length < 100) {
                $tabContent.load(url);
                //console.info(tabsId + ' load done!');
            }
        }

        var tabsData = [{
            "id" : "test-paper",
            "url" : "pages/test-paper.jsp"
        },{
            "id" : "favorite",
            "url" : "pages/favorite.jsp"
        },{
            "id" : "about",
            "url" : "pages/about.jsp"
        },{
            "id" : "user-info-page",
            "url" : "pages/user-info.jsp"
        }];

        $(tabsData).each(function(){
            console.info(this.id + "--->" + this.url);
            $("a[href='#"+this.id+"']").bind('click',{
                id : this.id,
                url : this.url
            },tabsHandler);
        });
        function tabsHandler(event) {
            var data = event.data;
            showTabs(data.id,data.url);
            return false; //阻止默认a标签响应
        }

    </script>
<body class="gray-bg">
<div class="wrapper wrapper-content">


    <ul id="myTab" class="nav nav-tabs">
        <li class="active">
            <a href="#home" data-toggle="tab">待审核(<#if totalCount1??>${totalCount1}<#else>0</#if>)</a></li>
        <li><a href="#pendingAudit" data-toggle="tab">待确认退货(<#if totalCount2??>${totalCount2}<#else>0</#if>)</a></li>
        <li><a href="#returnConfirm" data-toggle="tab">待确认退款(<#if totalCount3??>${totalCount3}<#else>0</#if>)</a></li>
        <li><a href="#refundConfirm" data-toggle="tab">全部(<#if totalCount0??>${totalCount0}<#else>0</#if>)</a></li>

    </ul>
    <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade in active" id="home">
            <div class="ibox">
                <div class="ibox-title">
                    <h5>待审核列表 </h5>
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
                            <form id="searchForm" modelAttribute="dict" action="/order/return/list" method="post" class="form-inline">
                            <#--<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
                            <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
                            <table:sortColumn id="orderBy" name="orderBy" value="${page.orderBy}" callback="sortOrRefresh();"/>
                           -->
                                <div class="form-group">
                                    <span>门店：</span>
                                    <select class="form-control">
                                        <option value="">全部</option>
                                    <#if storeList??>
                                        <#list storeList as d>
                                            <#if d??>
                                            <option <#if d.id??>value="${d.id}"</#if> ><#if d.name??>${d.name}</#if>
                                            </#if>
                                        </option>
                                        </#list>
                                    </#if>
                                    </select>
                                    <span>会员ID ：</span>
                                    <input name="memberId" htmlEscape="false" maxlength="30" class="form-control"/>
                                    <span>会员手机号 ：</span>
                                <#--  <input name="memberPhone" htmlEscape="false" maxlength="30" class="input-medium"/>-->
                                    <span>会员卡ID ：</span>
                                    <input name="description" htmlEscape="false" maxlength="30" class="form-control"/>
                                    <span>原订单ID ：</span>


                                    <span>申请单ID ：</span>
                                    <textarea name="reverseIdList" class="form-control"></textarea>
                                    <span>申请单状态 ：</span>
                                    <select class="form-control" name="status">
                                        <option value="">全部</option>
                                    <#if dictLists??>
                                        <#list dictLists as dict>
                                            <#if dict??>
                                            <option <#if dict.value??>value="${dict.value}"</#if> ><#if dict.label??>${dict.label}</#if>
                                            </#if>
                                        </option>
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
                            <th  class="sort-column value">门店名称</th>
                            <th>申请单ID</th>
                            <th  class="sort-column type">申请单类型</th>
                            <th  class="sort-column description">申请单详情</th>
                            <th  class="sort-column sort">用户名称</th>
                            <th>预计退款金额</th>
                            <th>申请单状态</th>
                            <th>申请单提交时间</th>
                            <th>最后修改时间</th>
                            <th>最后操作人</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#if pageInfo1??&&pageInfo1.list??>
                            <#list pageInfo1.list as b>
                            <tr>
                                <td> <input type="checkbox" id="${b.reverseId?string}" class="i-checks"></td>
                                <td><#if b.storeName??>${b.storeName}</#if></td>
                                <td>${b.reverseId?c}</td>
                                <td>
                                    <#if dictList??>
                                    <#list dictList as dict>
                                        <#if b.type??&&b.type?string==dict.value>
                                            <#if dict.label??>${dict.label}</#if>

                                        </#if>
                                    </#list>
                                </#if>
                                </td>
                                <td>
                                    <#if b.reverseProductInfo??&&b.reverseProductInfo.productIdList??>
                                    <#list b.reverseProductInfo.productIdList as p>
                                    ${p}
                                    </#list>
                                </#if>
                                </td>
                                <td>
                                    <#if b.username??>${b.username}</#if>
                                </td>
                                <td>

                                    <#if b.totalRefundPrice??&&b.totalRefundPrice??>
                                    ${b.totalRefundPrice}
                                    <#else>
                                        0
                                    </#if>
                                </td>

                                <td>
                                   <#if b.reverseStatusDesc??>${b.reverseStatusDesc}</#if>
                                </td>
                                <td>
                                    <#if b.screateTime??>
                                    ${b.screateTime}
                                    <#else>
                                        创建时间
                                    </#if>
                                </td>
                                <td>

                                    <#if b.reverseOrderOperationTO??&&b.reverseOrderOperationTO.supdateTime??>
                                ${ b.reverseOrderOperationTO.supdateTime}
                                <#else>

                                    </#if>
                                </td>

                                <td>
                                    <#if b.reverseOrderOperationTO??>
                                ${ b.reverseOrderOperationTO.updateBy}
                                <#else>

                                    </#if>
                                </td>
                                <td>
                                    <shiro:hasPermission name="order:return:view">
                                        <a href="#" onclick="openDialogView('查看退换货明細', '/order/return/form?reverseId=${b.reverseId?c}','800px', '500px')" class="btn btn-info btn-xs" ><i class="fa fa-search-plus"></i>查看</a>
                                    </shiro:hasPermission>

                                    <#if b.operationName??&&b.operationName=='审核'>
                                        <shiro:hasPermission name="order:return:audit">
                                            <#if b.operationName??> <a href="#" onclick="openDialog('审核退换货', '/order/return/form?reverseId=${b.reverseId?c}&flag=91','800px', '500px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> ${b.operationName}通过</a></#if>
                                        </shiro:hasPermission>

                                        <shiro:hasPermission name="order:return:auditnot">
                                            <#if b.operationName??> <a href="#" onclick="openDialog('审核退换货', '/order/return/form?reverseId=${b.reverseId?c}&flag=92','800px', '500px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> ${b.operationName}不通过</a></#if>
                                        </shiro:hasPermission>
                                    </#if>
                                    <#if b.operationName??&&b.operationName=='收货'>
                                        <shiro:hasPermission name="order:return:audit">
                                            <#if b.operationName??>  <a href="#" onclick="openDialog('审核退换货', '/order/return/form?reverseId=${b.reverseId?c}&flag=93','800px', '500px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i>${b.operationName}通过</a></#if>
                                        </shiro:hasPermission>

                                        <shiro:hasPermission name="order:return:auditnot">
                                            <#if b.operationName??> <a href="#" onclick="openDialog('审核退换货', '/order/return/form?reverseId=${b.reverseId?c}&flag=94','800px', '500px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i>  ${b.operationName}不通过</a></#if>
                                        </shiro:hasPermission>
                                    </#if>
                                </td>
                            </tr>
                            </#list>
                        </#if>
                        </tbody>
                    </table>

                <#include "../../page1.ftl" >
                    <br/>
                    <br/>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="pendingAudit">
            <input type="hidden" name="queryType" value="2"/>
            <div class="ibox">
                <div class="ibox-title">
                    <h5>待确认退货列表</h5>
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
                            <form id="searchForm" modelAttribute="dict" action="/order/return/list" method="post" class="form-inline">
                            <#--<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
                            <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
                            <table:sortColumn id="orderBy" name="orderBy" value="${page.orderBy}" callback="sortOrRefresh();"/>
                           -->
                                <div class="form-group">
                                    <span>门店：</span>
                                    <select class="form-control">
                                        <option value="">全部</option>
                                    <#if storeList??>
                                        <#list storeList as d>
                                            <#if d??>
                                            <option <#if d.id??>value="${d.id}"</#if> ><#if d.name??>${d.name}</#if>
                                            </#if>
                                        </option>
                                        </#list>
                                    </#if>
                                    </select>
                                    <span>会员ID ：</span>
                                    <input name="memberId" htmlEscape="false" maxlength="30" class="form-control"/>
                                    <span>会员手机号 ：</span>
                                <#--  <input name="memberPhone" htmlEscape="false" maxlength="30" class="input-medium"/>-->
                                    <span>会员卡ID ：</span>
                                    <input name="description" htmlEscape="false" maxlength="30" class="form-control"/>
                                    <span>原订单ID ：</span>


                                    <span>申请单ID ：</span>
                                    <textarea name="reverseIdList" class="form-control"></textarea>
                                    <span>申请单状态 ：</span>
                                    <select class="form-control" name="status">
                                        <option value="">全部</option>
                                    <#if dictLists??>
                                        <#list dictLists as dict>
                                            <#if dict??>
                                            <option <#if dict.value??>value="${dict.value}"</#if> ><#if dict.label??>${dict.label}</#if>
                                            </#if>
                                        </option>
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
                            <th  class="sort-column value">门店名称</th>
                            <th>申请单ID</th>
                            <th  class="sort-column type">申请单类型</th>
                            <th  class="sort-column description">申请单详情</th>
                            <th  class="sort-column sort">用户名称</th>
                            <th>预计退款金额</th>
                            <th>申请单状态</th>
                            <th>申请单提交时间</th>
                            <th>最后修改时间</th>
                            <th>最后操作人</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#if pageInfo2??>
                            <#if pageInfo2.list??>

                                <#list pageInfo2.list as b>

                                <tr>
                                    <td> <input type="checkbox" id="${b.reverseId?string}" class="i-checks"></td>
                                    <td><#if b.storeName??>${b.storeName}</#if></td>
                                    <td>${b.reverseId?c}</td>
                                    <td>
                                        <#if dictList??>
                                    <#list dictList as dict>
                                            <#if b.type??&&b.type?string==dict.value>
                                                <#if dict.label??>${dict.label}</#if>

                                            </#if>
                                        </#list>
                                </#if>
                                    </td>
                                    <td>
                                        <#if b.reverseProductInfo??&&b.reverseProductInfo.productIdList??>
                                    <#list b.reverseProductInfo.productIdList as p>
                                        ${p}
                                        </#list>
                                </#if>
                                    </td>
                                    <td>
                                        <#if b.username??>${b.username}</#if>
                                    </td>
                                    <td>

                                        <#if b.reverseProductInfo??&&b.reverseProductInfo.totalPrice??>
                                        ${b.reverseProductInfo.totalPrice}
                                        <#else>
                                            0
                                        </#if>
                                    </td>

                                    <td>


                                        <#if b.reverseStatus==0>待审核</#if>
                                        <#if b.reverseStatus==100>审核通过</#if>
                                        <#if b.reverseStatus==200>拣货中</#if>
                                        <#if b.reverseStatus==300>拣货完成</#if>
                                        <#if b.reverseStatus==400>已退款</#if>
                                        <#if b.reverseStatus==500>取货中</#if>
                                        <#if b.reverseStatus==600>配送中</#if>
                                        <#if b.reverseStatus==700>已换货</#if>
                                        <#if b.reverseStatus==800>确认收货</#if>
                                        <#if b.reverseStatus==900>确认收货</#if>
                                        <#if b.reverseStatus==1000>退款审核通过</#if>
                                        <#if b.reverseStatus==1100>已退款</#if>
                                        <#if b.reverseStatus==1200>申请单完成</#if>
                                        <#if b.reverseStatus==-100>审核不通过</#if>
                                        <#if b.reverseStatus==-200>退款审核不通过</#if>
                                        <#if b.reverseStatus==-300>已取消</#if>
                                        <#if b.reverseStatus==-301>缺货取消</#if>
                                        <#if b.reverseStatus==-400>客服未收到货</#if>
                                        <#if b.reverseStatus==-500>拒收</#if>




                                    </td>
                                    <td>
                                        <#if b.screateTime??>
                                        ${b.screateTime}
                                        <#else>
                                            创建时间
                                        </#if>
                                    </td>
                                    <td>

                                        <#if b.reverseOrderOperationTO??&&b.reverseOrderOperationTO.supdateTime??>
                                ${ b.reverseOrderOperationTO.supdateTime}
                                <#else>

                                        </#if>
                                    </td>

                                    <td>
                                        <#if b.reverseOrderOperationTO??>
                                ${ b.reverseOrderOperationTO.updateBy}
                                <#else>

                                        </#if>
                                    </td>
                                    <td>
                                        <shiro:hasPermission name="order:return:view">
                                            <a href="#" onclick="openDialogView('查看退换货明細', '/order/return/form?reverseId=${b.reverseId?c}','800px', '500px')" class="btn btn-info btn-xs" ><i class="fa fa-search-plus"></i>查看</a>
                                        </shiro:hasPermission>

                                        <#if b.operationName??&&b.operationName=='审核'>
                                            <shiro:hasPermission name="order:return:audit">
                                                <#if b.operationName??> <a href="#" onclick="openDialog('审核退换货通过', '/order/return/form?reverseId=${b.reverseId?c}&flag=91','800px', '500px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> ${b.operationName}通过</a></#if>
                                            </shiro:hasPermission>

                                            <shiro:hasPermission name="order:return:auditnot">
                                                <#if b.operationName??> <a href="#" onclick="openDialog('审核退换货不通过', '/order/return/form?reverseId=${b.reverseId?c}&flag=92','800px', '500px')" class="btn btn-danger btn-xs" ><i class="fa fa-trash"></i> ${b.operationName}不通过</a></#if>
                                            </shiro:hasPermission>
                                        </#if>
                                        <#if b.operationName??&&b.operationName=='收货'>
                                            <shiro:hasPermission name="order:return:confirmgoods">
                                                <#if b.operationName??>  <a href="#" onclick="openDialog('审核收货通过', '/order/return/form?reverseId=${b.reverseId?c}&flag=93','800px', '500px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i>${b.operationName}通过</a></#if>
                                            </shiro:hasPermission>
                                            <shiro:hasPermission name="order:return:confirmgoodsnot">
                                                <#if b.operationName??> <a href="#" onclick="openDialog('审核收货不通过', '/order/return/form?reverseId=${b.reverseId?c}&flag=94','800px', '500px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i>  ${b.operationName}不通过</a></#if>
                                            </shiro:hasPermission>
                                        </#if>
                                    </td>
                                </tr>
                                </#list>

                            </#if>
                        </#if>
                        </tbody>
                    </table>

                <#include "../../page2.ftl" >
                    <br/>
                    <br/>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="returnConfirm">
            <input type="hidden" name="queryType" value="3"/>
            <div class="ibox">
                <div class="ibox-title">
                    <h5>待确认退款列表 </h5>
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
                            <form id="searchForm" modelAttribute="dict" action="/order/return/list" method="post" class="form-inline">
                            <#--<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
                            <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
                            <table:sortColumn id="orderBy" name="orderBy" value="${page.orderBy}" callback="sortOrRefresh();"/>
                           -->
                                <div class="form-group">
                                    <span>门店：</span>
                                    <select class="form-control">
                                        <option value="">全部</option>
                                    <#if storeList??>
                                        <#list storeList as d>
                                            <#if d??>
                                            <option <#if d.id??>value="${d.id}"</#if> ><#if d.name??>${d.name}</#if>
                                            </#if>
                                        </option>
                                        </#list>
                                    </#if>
                                    </select>
                                    <span>会员ID ：</span>
                                    <input name="memberId" htmlEscape="false" maxlength="30" class="form-control"/>
                                    <span>会员手机号 ：</span>
                                <#--  <input name="memberPhone" htmlEscape="false" maxlength="30" class="input-medium"/>-->
                                    <span>会员卡ID ：</span>
                                    <input name="description" htmlEscape="false" maxlength="30" class="form-control"/>
                                    <span>原订单ID ：</span>


                                    <span>申请单ID ：</span>
                                    <textarea name="reverseIdList" class="form-control"></textarea>
                                    <span>申请单状态 ：</span>
                                    <select class="form-control" name="status">
                                        <option value="">全部</option>
                                    <#if dictLists??>
                                        <#list dictLists as dict>
                                            <#if dict??>
                                            <option <#if dict.value??>value="${dict.value}"</#if> ><#if dict.label??>${dict.label}</#if>
                                            </#if>
                                        </option>
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
                            <th  class="sort-column value">门店名称</th>
                            <th>申请单ID</th>
                            <th  class="sort-column type">申请单类型</th>
                            <th  class="sort-column description">申请单详情</th>
                            <th  class="sort-column sort">用户名称</th>
                            <th>预计退款金额</th>
                            <th>申请单状态</th>
                            <th>申请单提交时间</th>
                            <th>最后修改时间</th>
                            <th>最后操作人</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#if pageInfo3??&&pageInfo3.list??>
                            <#list pageInfo3.list as b>

                            <tr>
                                <td> <input type="checkbox" id="${b.reverseId?string}" class="i-checks"></td>
                                <td><#if b.storeName??>${b.storeName}</#if></td>
                                <td>${b.reverseId?c}</td>
                                <td>
                                    <#if dictList??>
                                    <#list dictList as dict>
                                        <#if b.type??&&b.type?string==dict.value>
                                            <#if dict.label??>${dict.label}</#if>

                                        </#if>
                                    </#list>
                                </#if>
                                </td>
                                <td>
                                    <#if b.reverseProductInfo??&&b.reverseProductInfo.productIdList??>
                                    <#list b.reverseProductInfo.productIdList as p>
                                    ${p}
                                    </#list>
                                </#if>
                                </td>
                                <td>
                                    <#if b.username??>${b.username}</#if>
                                </td>
                                <td>

                                    <#if b.reverseProductInfo??&&b.reverseProductInfo.totalPrice??>
                                    ${b.reverseProductInfo.totalPrice}
                                    <#else>
                                        0
                                    </#if>
                                </td>

                                <td>


                                    <#if b.reverseStatus==0>待审核</#if>
                                    <#if b.reverseStatus==100>审核通过</#if>
                                    <#if b.reverseStatus==200>拣货中</#if>
                                    <#if b.reverseStatus==300>拣货完成</#if>
                                    <#if b.reverseStatus==400>已退款</#if>
                                    <#if b.reverseStatus==500>取货中</#if>
                                    <#if b.reverseStatus==600>配送中</#if>
                                    <#if b.reverseStatus==700>已换货</#if>
                                    <#if b.reverseStatus==800>确认收货</#if>
                                    <#if b.reverseStatus==900>确认收货</#if>
                                    <#if b.reverseStatus==1000>退款审核通过</#if>
                                    <#if b.reverseStatus==1100>已退款</#if>
                                    <#if b.reverseStatus==1200>申请单完成</#if>
                                    <#if b.reverseStatus==-100>审核不通过</#if>
                                    <#if b.reverseStatus==-200>退款审核不通过</#if>
                                    <#if b.reverseStatus==-300>已取消</#if>
                                    <#if b.reverseStatus==-301>缺货取消</#if>
                                    <#if b.reverseStatus==-400>客服未收到货</#if>
                                    <#if b.reverseStatus==-500>拒收</#if>




                                </td>
                                <td>
                                    <#if b.screateTime??>
                                    ${b.screateTime}
                                    <#else>
                                        创建时间
                                    </#if>
                                </td>
                                <td>

                                    <#if b.reverseOrderOperationTO??&&b.reverseOrderOperationTO.supdateTime??>
                                ${ b.reverseOrderOperationTO.supdateTime}
                                <#else>

                                    </#if>
                                </td>

                                <td>
                                    <#if b.reverseOrderOperationTO??>
                                ${ b.reverseOrderOperationTO.updateBy}
                                <#else>

                                    </#if>
                                </td>
                                <td>
                                    <shiro:hasPermission name="order:return:view">
                                        <a href="#" onclick="openDialogView('查看退换货明細', '/order/return/form?reverseId=${b.reverseId?c}','800px', '500px')" class="btn btn-info btn-xs" ><i class="fa fa-search-plus"></i> 查看</a>
                                    </shiro:hasPermission>

                                    <#if b.operationName??&&b.operationName=='审核'>
                                        <shiro:hasPermission name="order:return:audit">
                                            <#if b.operationName??> <a href="#" onclick="openDialog('审核退换货', '/order/return/form?reverseId=${b.reverseId?c}&flag=91','800px', '500px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> ${b.operationName}通过</a></#if>
                                        </shiro:hasPermission>

                                        <shiro:hasPermission name="order:return:auditnot">
                                            <#if b.operationName??> <a href="#" onclick="openDialog('审核退换货', '/order/return/form?reverseId=${b.reverseId?c}&flag=92','800px', '500px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> ${b.operationName}不通过</a></#if>
                                        </shiro:hasPermission>
                                    </#if>
                                    <#if b.operationName??&&b.operationName=='收货'>
                                        <shiro:hasPermission name="order:return:confirmgoods">
                                            <#if b.operationName??>  <a href="#" onclick="openDialog('审核收货', '/order/return/form?reverseId=${b.reverseId?c}&flag=93','800px', '500px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i>${b.operationName}通过</a></#if>
                                        </shiro:hasPermission>

                                        <shiro:hasPermission name="order:return:confirmgoodsnot">
                                            <#if b.operationName??> <a href="#" onclick="openDialog('审核收货', '/order/return/form?reverseId=${b.reverseId?c}&flag=94','800px', '500px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i>  ${b.operationName}不通过</a></#if>
                                        </shiro:hasPermission>
                                    </#if>
                                </td>
                            </tr>
                            </#list>
                        </#if>
                        </tbody>
                    </table>

                <#include "../../page3.ftl" >
                    <br/>
                    <br/>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="refundConfirm">

            <div class="ibox">
                <div class="ibox-title">
                    <h5>全部列表 </h5>
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
                            <form id="searchForm" modelAttribute="dict" action="/order/return/list" method="post" class="form-inline">
                            <#--<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
                            <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
                            <table:sortColumn id="orderBy" name="orderBy" value="${page.orderBy}" callback="sortOrRefresh();"/>
                           -->
                                <div class="form-group">
                                    <span>门店：</span>
                                    <select class="form-control">
                                        <option value="">全部</option>
                                    <#if storeList??>
                                        <#list storeList as d>
                                            <#if d??>
                                            <option <#if d.id??>value="${d.id}"</#if> ><#if d.name??>${d.name}</#if>
                                            </#if>
                                        </option>
                                        </#list>
                                    </#if>
                                    </select>
                                    <span>会员ID ：</span>
                                    <input name="memberId" htmlEscape="false" maxlength="30" class="form-control"/>
                                    <span>会员手机号 ：</span>
                                <#--  <input name="memberPhone" htmlEscape="false" maxlength="30" class="input-medium"/>-->
                                    <span>会员卡ID ：</span>
                                    <input name="description" htmlEscape="false" maxlength="30" class="form-control"/>
                                    <span>原订单ID ：</span>


                                    <span>申请单ID ：</span>
                                    <textarea name="reverseIdList" class="form-control"></textarea>
                                    <span>申请单状态 ：</span>
                                    <select class="form-control" name="status">
                                        <option value="">全部</option>
                                    <#if dictLists??>
                                        <#list dictLists as dict>
                                            <#if dict??>
                                            <option <#if dict.value??>value="${dict.value}"</#if> ><#if dict.label??>${dict.label}</#if>
                                            </#if>
                                        </option>
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
                            <th  class="sort-column value">门店名称</th>
                            <th>申请单ID</th>
                            <th  class="sort-column type">申请单类型</th>
                            <th  class="sort-column description">申请单详情</th>
                            <th  class="sort-column sort">用户名称</th>
                            <th>预计退款金额</th>
                            <th>申请单状态</th>
                            <th>申请单提交时间</th>
                            <th>最后修改时间</th>
                            <th>最后操作人</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#if pageInfo0.list??>
                        <#list pageInfo0.list as b>

                        <tr>
                            <td> <input type="checkbox" id="${b.reverseId?string}" class="i-checks"></td>
                            <td><#if b.storeName??>${b.storeName}</#if></td>
                            <td>${b.reverseId?c}</td>
                            <td>
                                <#if dictList??>
                                    <#list dictList as dict>
                                    <#if b.type??&&b.type?string==dict.value>
                                        <#if dict.label??>${dict.label}</#if>

                                    </#if>
                                </#list>
                                </#if>
                            </td>
                            <td>
                                <#if b.reverseProductInfo??&&b.reverseProductInfo.productIdList??>
                                    <#list b.reverseProductInfo.productIdList as p>
                                ${p}
                                </#list>
                                </#if>
                            </td>
                            <td>
                                <#if b.username??>${b.username}</#if>
                            </td>
                            <td>

                                <#if b.reverseProductInfo??&&b.reverseProductInfo.totalPrice??>
                                ${b.reverseProductInfo.totalPrice}
                                <#else>
                                    0
                                </#if>
                            </td>

                            <td>


                                <#if b.reverseStatus==0>待审核</#if>
                                <#if b.reverseStatus==100>审核通过</#if>
                                <#if b.reverseStatus==200>拣货中</#if>
                                <#if b.reverseStatus==300>拣货完成</#if>
                                <#if b.reverseStatus==400>已退款</#if>
                                <#if b.reverseStatus==500>取货中</#if>
                                <#if b.reverseStatus==600>配送中</#if>
                                <#if b.reverseStatus==700>已换货</#if>
                                <#if b.reverseStatus==800>确认收货</#if>
                                <#if b.reverseStatus==900>确认收货</#if>
                                <#if b.reverseStatus==1000>退款审核通过</#if>
                                <#if b.reverseStatus==1100>已退款</#if>
                                <#if b.reverseStatus==1200>申请单完成</#if>
                                <#if b.reverseStatus==-100>审核不通过</#if>
                                <#if b.reverseStatus==-200>退款审核不通过</#if>
                                <#if b.reverseStatus==-300>已取消</#if>
                                <#if b.reverseStatus==-301>缺货取消</#if>
                                <#if b.reverseStatus==-400>客服未收到货</#if>
                                <#if b.reverseStatus==-500>拒收</#if>




                            </td>
                            <td>
                                <#if b.screateTime??>
                                ${b.screateTime}
                                <#else>
                                    创建时间
                                </#if>
                            </td>
                            <td>

                                <#if b.reverseOrderOperationTO??&&b.reverseOrderOperationTO.supdateTime??>
                                ${ b.reverseOrderOperationTO.supdateTime}
                                <#else>

                                </#if>
                            </td>

                            <td>
                                <#if b.reverseOrderOperationTO??>
                                ${ b.reverseOrderOperationTO.updateBy}
                                <#else>

                                </#if>
                            </td>
                            <td>
                                <shiro:hasPermission name="order:return:view">
                                    <a href="#" onclick="openDialogView('查看退换货明細', '/order/return/form?reverseId=${b.reverseId?c}','800px', '500px')" class="btn btn-info btn-xs" ><i class="fa fa-search-plus"></i>查看</a>
                                </shiro:hasPermission>
                            <#if b.operationName??>${b.operationName}</#if>
                                <#if b.operationName??&&b.operationName=='审核'>
                                    <shiro:hasPermission name="order:return:audit">
                                        <#if b.operationName??> <a href="#" onclick="openDialog('审核退换货', '/order/return/form?reverseId=${b.reverseId?c}&flag=91','800px', '500px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> ${b.operationName}通过</a></#if>
                                    </shiro:hasPermission>

                                    <shiro:hasPermission name="order:return:auditnot">
                                        <#if b.operationName??> <a href="#" onclick="openDialog('审核退换货', '/order/return/form?reverseId=${b.reverseId?c}&flag=92','800px', '500px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> ${b.operationName}不通过</a></#if>
                                    </shiro:hasPermission>
                                </#if>
                                <#if b.operationName??&&b.operationName=='收货'>
                                    <shiro:hasPermission name="order:return:confirmgoods">
                                        <#if b.operationName??>  <a href="#" onclick="openDialog('审核收货', '/order/return/form?reverseId=${b.reverseId?c}&flag=93','800px', '500px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i>${b.operationName}通过</a></#if>
                                    </shiro:hasPermission>

                                    <shiro:hasPermission name="order:return:confirmgoodsnot">
                                        <#if b.operationName??> <a href="#" onclick="openDialog('审核收货', '/order/return/form?reverseId=${b.reverseId?c}&flag=94','800px', '500px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i>  ${b.operationName}不通过</a></#if>
                                    </shiro:hasPermission>
                                </#if>

                            </td>
                        </tr>
                        </#list>
                        </#if>
                        </tbody>
                    </table>

                <#include "../../page0.ftl" >
                    <br/>
                    <br/>
                </div>
            </div>
        </div>
    </div>



</div>
</body>
</html>










