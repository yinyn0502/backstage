
<html>
<head>
    <title>优惠劵管理</title>
<#include "../../ahead.ftl">
<#include "../../treeview.ftl" >
<#include "../../treetable.ftl" >
<#include "../../mydate.ftl"/>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        var validateForm;
        function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
            if(validateForm.form()){
                $("#searchForm").submit();
                return true;
            }
            return false;
        }

        function page(n,s){
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }

        function selectOnchang(obj){
            return obj.selectedIndex;
        }

        function checkTime(){
            var starttime = $("#startDate").val();
            var endtime = $("#endDate").val();
            var start = new Date(starttime.replace("-", "/").replace("-", "/"));
            var end = new Date(endtime.replace("-", "/").replace("-", "/"));
            //endTime>当前时间
            alert(start+":"+end);
            if(end>start){
                return false;
            }else{
                return true;
            }
        }

        function checkEndTime(){
            var starttime = new Date().form('yyyy-mm-dd hh:ii:ss');
            var endtime = $("#endDate").val();
            var start = new Date(starttime.replace("-", "/").replace("-", "/"));
            var end = new Date(endtime.replace("-", "/").replace("-", "/"));
            if(end>start){
                return false;
            }else{
                return true;
            }
        }



        </script>


</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="ibox">
        <div class="ibox-title">
            <h5>优惠劵列表 </h5>
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
            <form id="searchForm"  action="/couponmanage/query/list" method="post" class="form-inline">
            <div class="row">
                <div class="col-sm-12">

                        <#--<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
                        <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
                        <table:sortColumn id="orderBy" name="orderBy" value="${page.orderBy}" callback="sortOrRefresh();"/>
                       -->
                        <div class="form-group">
                            <span>类型 ：</span>
                            <select class="form-control" name="couponType" id="couponType" onchange="selectOnchang(this)">
                                <option value="9999">全部</option>
                            <#if couponTypeList??>
                                <#list couponTypeList as d>
                                    <#if d??>
                                    <option <#if d.type??>value="${d.type}"  <#if type??&&d.type==type>selected</#if></#if> ><#if d.names??>${d.names}</#if>
                                    </#if>
                                    </option>
                                </#list>
                            </#if>
                            </select>
                            <span>优惠劵ID ：</span>
                            <input name="activityId" htmlEscape="false" maxlength="50" class="form-control" <#if activityId??>value="${activityId}"<#else>value=""</#if>/>
                            <span>优惠劵名称 ：</span>
                            <input name="couponName" htmlEscape="false" maxlength="50" class="form-control" <#if couponName??>value="${couponName}"<#else>value=""</#if>/>
                            <div class="form-group">
                                <span>有效期 ：</span>
                                <input type="text" class="form-control" data-date-format="yyyy-mm-dd hh:ii:ss" id="strStartTime" name="strStartTime" readonly />
                                <span>至 ：</span>
                                <input type="text" class="form-control" data-date-format="yyyy-mm-dd hh:ii:ss" id="strEndTime" name="strEndTime" readonly />
                            </div>


                        </div>
<p></p>

                            <div class="form-group">
                                <span>创建人 ：</span>
                                <input name="createdBy" htmlEscape="false" maxlength="50" class="form-control" <#if createdBy??>value="${createdBy}"</#if>/>
                                <#--<select class="form-control" name="createBy" id="createBy" onchange="selectOnchang(this)">
                                    <option value="">全部</option>-->
                               <#-- <#if storeList??>
                                    <#list storeList as d>
                                        <#if d??>
                                        <option <#if d.id??>value="${d.id}" <#if storeId??&&d.id==storeId>selected</#if></#if> ><#if d.name??>${d.name}</#if>
                                                    </#if>
                                    </option>
                                    </#list>
                                </#if>-->
                               <#-- </select>-->



                                <div class="form-group">
                                    <span>创建日期 ：</span>
                                    <input type="text" class="form-control" data-date-format="yyyy-mm-dd hh:ii:ss" id="startTime" name="startTime" readonly />
                                    <span>至 ：</span>
                                    <input type="text" class="form-control" data-date-format="yyyy-mm-dd hh:ii:ss" id="endTime" name="endTime" readonly />
                                </div>



                                <span>审核人 ：</span>
                                <select class="form-control" name="reviewBy" id="reviewBy" onchange="selectOnchang(this)">
                                    <option value="">全部</option>
                                <#--<#if storeList??>
                                    <#list storeList as d>
                                        <#if d??>
                                        <option <#if d.id??>value="${d.id}" <#if storeId??&&d.id==storeId>selected</#if></#if> ><#if d.name??>${d.name}</#if>
                                                </#if>
                                    </option>
                                    </#list>
                                </#if>-->
                                </select>



                                <div class="form-group">
                                    <span>审核日期 ：</span>
                                    <input type="text" class="form-control" data-date-format="yyyy-mm-dd hh:ii:ss" id="auditStartTime" name="auditStartTime" readonly />
                                    <span>至 ：</span>
                                    <input type="text" class="form-control" data-date-format="yyyy-mm-dd hh:ii:ss" id="auditEndTime" name="auditEndTime" readonly />
                                </div>
                            </div>

                            <p></p>
                                <div class="form-group">
                                    <span>门店 ：</span>
                                    <select class="form-control" name="storeId" id="storeId" >
                                        <option value="9999">全部</option>
                                    <#if storeList??>
                                        <#list storeList as d>
                                            <#if d??>
                                            <option <#if d.id??>value="${d.id}" <#if storeId??&&d.id==storeId>selected</#if></#if> ><#if d.name??>${d.name}</#if>
                                                    </#if>
                                        </option>
                                        </#list>
                                    </#if>
                                    </select>

                                    <span>商品类别ID ：</span>
                                    <input name="categoryId" htmlEscape="false" maxlength="50" class="form-control" <#if categoryId??>value="${categoryId}"<#else>value=""</#if>/>
                                    <span>商品ID ：</span>
                                    <input name="productIds" htmlEscape="false" maxlength="50" class="form-control" <#if productIds??>value="${productIds}"<#else>value=""</#if>/>

                                    <span>是否预算内 ：</span>
                                    <select class="form-control" name="isBudget" id="isBudget">
                                       <option value="">全部</option>
                                    <#if budgetList??>
                                        <#list budgetList as d>
                                            <#if d??>
                                            <option <#if d.status??>value="${d.status}"  <#if status??&&d.status==status>selected</#if></#if> ><#if d.names??>${d.names}</#if>
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
                                    openDialogByButtonNames("新增"+'优惠劵',"/couponmanage/query/form","800px", "500px","","保存并提交审核");
                                }
                            </script><!-- 增加按钮 -->
                        </shiro:hasPermission>



                    </div>
                    <div class="pull-right">
                        <button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="search()" ><i class="fa fa-search"></i> 查询</button>
                        <button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="reset()" ><i class="fa fa-refresh"></i> 重置</button>
                    </div>

                    <div id="resultflag">

                    </div>
                </div>
            </div>

            <table id="contentTable" class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footer">
                <thead>
                <tr>
                    <th> <input type="checkbox" class="i-checks"></th>
                    <th  class="sort-column value">优惠劵ID</th>
                    <th >优惠劵类型</th>
                    <th  class="sort-column type">门店名称</th>
                    <th  class="sort-column description">优惠劵名称</th>
                    <th  class="sort-column sort">有效期</th>
                    <th  class="sort-column sort">状态</th>
                    <th  class="sort-column sort">渠道</th>
                    <th  class="sort-column sort">创建人</th>
                    <th  class="sort-column sort">创建日期</th>
                    <th  class="sort-column sort">审核人</th>
                    <th  class="sort-column sort">审核日期</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <#list pageInfo.list as dict>
                <#if dict.status??&&dict.status=='已禁用'>
                    <tr class="info">
                        <td> <input type="checkbox" id="${dict.couponId?c}" class="i-checks"></td>
                        <td>${dict.couponId?c}</td>
                        <td><a  href="#" onclick="openDialogView('查看字典', '/coupon/query/detail?activityId=${dict.couponId}','800px', '500px')">

                        ${dict.couponType}
                        </a></td>
                        <td>
                            <#if dict.storeNameList??>
                                <#list dict.storeNameList as store>
                                    ${store}
                                </#list>
                            </#if>
                        </td>
                        <td><a href="javascript:" onclick="$('#type').val('${dict.couponName}');$('#searchForm').submit();return false;">${dict.couponName}</a></td>
                        <td>${dict.validityString}</td>
                        <td><#if dict.status??>${dict.status}</#if></td>
                        <td>${dict.useChannel}</td>
                        <td>${dict.createdBy}</td>
                        <td>${dict.createTime?number_to_datetime}</td>
                        <td><#if dict.reviewedBy??>${dict.reviewedBy}</#if></td>
                        <td></td>

                        <td>
                            <shiro:hasPermission name="sys:dict:view">
                                <a href="#" onclick="openDialogView('查看', '/coupon/query/detail?activityId=${dict.couponId?c}','800px', '500px')" class="btn btn-info btn-xs" ><i class="fa fa-search-plus"></i> 查看</a>
                            </shiro:hasPermission>


                    <#--<#if dict.status??>
                        ${dict.status}
                    </#if>-->

                           <#-- <a href="#" onclick="openDialogView('审核', '/couponmanage/query/audit?activityId=${dict.couponId?c}','800px', '500px')" class="btn btn-danger btn-xs" ><i class="fa fa-trash"></i> 审核</a>-->
                            <#if dict.status=='待审核'||dict.status=='审核不通过'>
                                <a href="#" onclick="openDialogViewAndClose('审核', '/couponmanage/query/audit?activityId=${dict.couponId?c}','800px', '500px')" class="btn btn-danger btn-xs" ><i class="fa fa-trash"></i> 审核</a>
                            <#elseif dict.status=='启用中'>
                                <a href="#" onclick="auditClose(${dict.couponId?c})" class="btn btn-warning btn-xs" ><i class="fa fa-trash"></i> 停用</a>
                            <#elseif dict.status=='已禁用'>
                                <a href="#" onclick="auditOpen(${dict.couponId?c})" class="btn btn-info btn-xs" ><i class="fa fa-trash"></i> 启用</a>

                            </#if>

                           <#-- <shiro:hasPermission name="sys:dict:del">
                                <a href="/sys/dict/delete?id=${dict.couponId}&type=${dict.status}" onclick="return confirmx('确认要删除该字典吗？', this.href)"   class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> 删除</a>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="sys:dict:add">
                                <a href="#" onclick="openDialog('添加键值', '/sys/dict/form','800px', '500px')" class="btn btn-primary btn-xs" ><i class="fa fa-plus"></i> 添加键值</a>
                            </shiro:hasPermission>-->
                        </td>
                    </tr>
                <#elseif dict.status??&&dict.status=='已过期'>
                <tr class="danger">
                    <td> <input type="checkbox" id="${dict.couponId?c}" class="i-checks"></td>
                    <td>${dict.couponId?c}</td>
                    <td><a  href="#" onclick="openDialogView('查看字典', '/coupon/query/detail?activityId=${dict.couponId}','800px', '500px')">

                    ${dict.couponType}
                    </a></td>
                    <td>
                        <#if dict.storeNameList??>
                                <#list dict.storeNameList as store>
                        ${store}
                        </#list>
                            </#if>
                    </td>
                    <td><a href="javascript:" onclick="$('#type').val('${dict.couponName}');$('#searchForm').submit();return false;">${dict.couponName}</a></td>
                    <td>${dict.validityString}</td>
                    <td><#if dict.status??>${dict.status}</#if></td>
                    <td>${dict.useChannel}</td>
                    <td>${dict.createdBy}</td>
                    <td>${dict.createTime?number_to_datetime}</td>
                    <td><#if dict.reviewedBy??>${dict.reviewedBy}</#if></td>
                    <td></td>

                    <td>
                        <shiro:hasPermission name="sys:dict:view">
                            <a href="#" onclick="openDialogView('查看', '/coupon/query/detail?activityId=${dict.couponId?c}','800px', '500px')" class="btn btn-info btn-xs" ><i class="fa fa-search-plus"></i> 查看</a>
                        </shiro:hasPermission>


                    <#--<#if dict.status??>
                        ${dict.status}
                    </#if>-->

                    <#-- <a href="#" onclick="openDialogView('审核', '/couponmanage/query/audit?activityId=${dict.couponId?c}','800px', '500px')" class="btn btn-danger btn-xs" ><i class="fa fa-trash"></i> 审核</a>-->
                        <#if dict.status=='待审核'||dict.status=='审核不通过'>
                            <a href="#" onclick="openDialogViewAndClose('审核', '/couponmanage/query/audit?activityId=${dict.couponId?c}','800px', '500px')" class="btn btn-danger btn-xs" ><i class="fa fa-trash"></i> 审核</a>
                        <#elseif dict.status=='启用中'>
                            <a href="#" onclick="auditClose(${dict.couponId?c})" class="btn btn-warning btn-xs" ><i class="fa fa-trash"></i> 停用</a>
                        <#elseif dict.status=='已禁用'>
                            <a href="#" onclick="auditOpen(${dict.couponId?c})" class="btn btn-info btn-xs" ><i class="fa fa-trash"></i> 启用</a>

                        </#if>

                    <#-- <shiro:hasPermission name="sys:dict:del">
                         <a href="/sys/dict/delete?id=${dict.couponId}&type=${dict.status}" onclick="return confirmx('确认要删除该字典吗？', this.href)"   class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> 删除</a>
                     </shiro:hasPermission>
                     <shiro:hasPermission name="sys:dict:add">
                         <a href="#" onclick="openDialog('添加键值', '/sys/dict/form','800px', '500px')" class="btn btn-primary btn-xs" ><i class="fa fa-plus"></i> 添加键值</a>
                     </shiro:hasPermission>-->
                    </td>
                </tr>
                <#else>
                <tr>
                    <td> <input type="checkbox" id="${dict.couponId?c}" class="i-checks"></td>
                    <td><#if dict.couponId??>${dict.couponId?c}</#if></td>
                    <td>
                    <#if dict.couponType??>
                    ${dict.couponType}
                    </#if>
                    </td>
                    <td>
                        <#if dict.storeNameList??>
                                <#list dict.storeNameList as store>
                        ${store}
                        </#list>
                            </#if>
                    </td>
                    <td><#if dict.couponName??>${dict.couponName}</#if></td>
                    <td><#if dict.validityString??>${dict.validityString}</#if></td>
                    <td>
                        <#if dict.status??>${dict.status}
                            <#if dict.status=="审核不通过">
                        <#if dict.reviewRefuseReason??>
                            <button style="border-radius: 15px" class="btn btn-default" data-container="body" data-toggle="popover" data-placement="top" title="优惠券审核未通过" data-content="原因: <#if dict.reviewRefuseReason??>${dict.reviewRefuseReason}</#if>">?</button>
                        </#if>
                            </#if>
                        </#if>
                    </td>
                    <td><#if dict.useChannel??>${dict.useChannel}</#if></td>
                    <td><#if dict.createdBy??>${dict.createdBy}</#if></td>
                    <td><#if dict.createTime??>${dict.createTime?number_to_datetime}</#if></td>
                    <td><#if dict.reviewedBy??>${dict.reviewedBy}</#if></td>
                    <td></td>

                    <td>
                        <shiro:hasPermission name="sys:dict:view">
                            <a href="#" onclick="openDialogView('查看', '/coupon/query/detail?activityId=${dict.couponId?c}','800px', '500px')" class="btn btn-info btn-xs" ><i class="fa fa-search-plus"></i> 查看</a>
                        </shiro:hasPermission>

                        <#if dict.status??>
                    <#if dict.status!='启用中'&&dict.status!='已过期'>
                            <a href="#" onclick="openDialog('修改', '/couponmanage/query/form?activityId=${dict.couponId?c}','800px', '500px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> 修改</a>
                    </#if>
                        </#if>

                    <#--<#if dict.status??>
                        ${dict.status}
                    </#if>-->

                    <#-- <a href="#" onclick="openDialogView('审核', '/couponmanage/query/audit?activityId=${dict.couponId?c}','800px', '500px')" class="btn btn-danger btn-xs" ><i class="fa fa-trash"></i> 审核</a>-->
                        <#if dict.status??>
                        <#if dict.status=='待审核'||dict.status=='审核不通过'>
                            <a href="#" onclick="openDialogViewAndClose('审核', '/couponmanage/query/audit?activityId=${dict.couponId?c}','800px', '500px')" class="btn btn-danger btn-xs" ><i class="fa fa-trash"></i> 审核</a>
                        <#elseif dict.status=='启用中'>
                            <a href="#" onclick="auditClose(${dict.couponId?c})" class="btn btn-warning btn-xs" ><i class="fa fa-trash"></i> 停用</a>
                        <#elseif dict.status=='已禁用'>
                            <a href="#" onclick="auditOpen(${dict.couponId?c})" class="btn btn-info btn-xs" ><i class="fa fa-trash"></i> 启用</a>

                        </#if>
                        </#if>
                    <#-- <shiro:hasPermission name="sys:dict:del">
                         <a href="/sys/dict/delete?id=${dict.couponId}&type=${dict.status}" onclick="return confirmx('确认要删除该字典吗？', this.href)"   class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> 删除</a>
                     </shiro:hasPermission>
                     <shiro:hasPermission name="sys:dict:add">
                         <a href="#" onclick="openDialog('添加键值', '/sys/dict/form','800px', '500px')" class="btn btn-primary btn-xs" ><i class="fa fa-plus"></i> 添加键值</a>
                     </shiro:hasPermission>-->
                    </td>
                </tr>
                </#if>
                </#list>

                </tbody>
            </table>

            <#include "../../page.ftl" >
    <script type="text/javascript" src="/member/mregister.js"></script>
    <script type="text/javascript">
        function auditClose(activity){
            $.ajax({
                type: "post",
                url: "/json/auditClose",
                data: "activityId="+activity,
                dataType: 'html',
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                success: function(result) {

                    var stResult="";
                    var jsondata = $.parseJSON(result);
                    var datas=jsondata.code;
                    if(datas==0){
                        stResult="停用成功"
                    }


                    /*sortOrRefresh();*/
                    window.location.reload();
                    $("#resultflag").html(stResult);
                    //$('#myModal').modal('hide');
                }
            });
        }



        function auditOpen(activity){
            $.ajax({
                type: "post",
                url: "/json/auditOpen",
                data: "activityId="+activity,
                dataType: 'html',
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                success: function(result) {

                    var stResult="";
                    var jsondata = $.parseJSON(result);
                    var datas=jsondata.code;
                    if(datas==0){
                        stResult="启用成功"
                    }
                    sortOrRefresh();
                    $("#resultflag").html(stResult);

                }
            });
        }
    </script>
            <br/>
            <br/>
        </div>
    </div>
</div>
</body>
</html>