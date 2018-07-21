
<html>
<head>
    <title>邀请管理</title>
    <script src="/static/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <link href="/static/bootstrap/3.3.4/css_default/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="/static/bootstrap/3.3.4/js/bootstrap.min.js"  type="text/javascript"></script>
    <link href="/static/awesome/4.4/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/static/common/css/style.css?v=3.2.0" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="/static/artDialog/jquery.artDialog.js?skin=green"></script>
    <script type="text/javascript" src="/static/artDialog/plugins/iframeTools.source.js"></script>

    <script src="/static/bootstrap-datetimepicker/bootstrap-datetimepicker.js"  charset="UTF-8"></script>
    <script src="/static/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
    <link href="/static/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <meta name="decorator" content="default"/>


    <script type="text/javascript">
       /* $(document).ready(function () {
            pageFunction();
        });*/

        //页面加载初始化下一页是否可用
        function pageFunction() {
            var pageInfoString = $("#pageInfo").val();
            pageInfoString = JSON.parse(pageInfoString);
            if (pageInfoString) {
                //alert(pageInfoString.lastPage);
                $("#currentPageLabel").text(pageInfoString.currentPage);
                $("#currentPage").text(pageInfoString.currentPage);
                $("#currentPage").attr("max", pageInfoString.lastPage);
                $("#pageCount").val(pageInfoString.pageCount);
                $("#totalCount").text(pageInfoString.totalCount);
                $("#pages").text(pageInfoString.lastPage);

                $("#firstPage").data("page", pageInfoString.firstPage);
                $("#prePage").data("page", pageInfoString.prePage);
                $("#nextPage").data("page", pageInfoString.nextPage);
                $("#lastPage").data("page", pageInfoString.lastPage);

                $("#firstPage").attr("disabled", !pageInfoString.hasPreviousPage);
                $("#prePage").attr("disabled", !pageInfoString.hasPreviousPage);

                $("#nextPage").attr("disabled", !pageInfoString.hasNextPage);

                $("#lastPage").attr("disabled", !pageInfoString.hasNextPage);
            } else {
                $("#currentPage").val(1);
                $("#pageCount").val(1);
                $("#totalCount").val(0);

                $("#firstPage").data("page", 1);
                $("#prePage").data("page", 1);
                $("#nextPage").data("page", 1);
                $("#lastPage").data("page", 1);

                $("#firstPage").attr("disabled", true);
                $("#prePage").attr("disabled", true);

                $("#nextPage").attr("disabled", true);

                $("#lastPage").attr("disabled", true);
            }
        }
        //查看邀请活动详情
        function inviteDetail(activityId) {
            $.artDialog.open("/invite/detail?activityId=" + activityId, {
                title : "邀请活动详情",
                width : 800,
                height : 600,
                lock : true,
                cancelVal: "取消",
                close: function () {

                }
            });
        }
        //编辑邀请活动
        function inviteEdit(activity,index) {
           var status =  $("#status_"+index).html();

            $.artDialog.open("/invite/edit/view?activityId=" + activity + "&status=" + status, {
                title : "编辑邀请活动",
                width : 800,
                height : 600,
                lock : true,
                cancelVal: "取消",
                close: function () {
                    art.dialog.open.origin.location.href="/invite/list";
                }
            });
        }
        //审核邀请活动
        function inviteAudit(activity, createdBy) {
            $.artDialog.open("/invite/detail?isAudit=true&activityId=" + activity + "&createdBy=" + createdBy, {
                title : "审核邀请活动",
                width : 800,
                height : 600,
                lock : true,
                cancelVal: "取消",
                close: function () {
                    art.dialog.open.origin.location.href="/invite/list";
                }
            });
        }
        //终止活动
        function inviteDisableModal(activity) {
            $("#modalActivityId").val(activity);
            $("#myModal2").modal();
        }

        //
        $(function () {
            $(function () {
                $('[data-toggle="popover"]').popover();
            });

            //创建邀请活动
            $("#inviteCreate").click(function () {
                $.artDialog.open("/invite/edit/view", {
                    title : "新增邀请活动",
                    width : 800,
                    height : 600,
                    lock : true,
                    cancelVal: "取消",
                    close: function () {
                        art.dialog.open.origin.location.href="/invite/list";
                    }
                });
            });

            //活动终止
            $("#stop").click(function () {
                $.get("/invite/stop", {
                    "activityId" : $("#modalActivityId").val()
                }, function (data) {
                    if (data) {
                        if (data.code == 0) {
                            alert("禁用成功咯");
                            window.location.reload();
                        } else {
                            alert(data.message[0].message);
                        }
                    } else {
                        alert("请求失败");
                    }
                });
            });


            $(".pageButton").click(function () {
                // alert($(this).data("page"));
                $("#currentPage").val($(this).data("page"));
                query();
            });

            $("#currentPage").change(function () {
                if ($(this).val() > $("#pages").text()) {
                    alert("跳转页面错误! 第" + $(this).val() + "页不存在");
                } else {
                    query();
                }
            });

            $("#pageCount").change(function () {
                $("#currentPage").val(1);
                query();
            });

        })


        //条件查询或者查询所有
        function query() {
            if($("#activityStartTime").val()!=''&&$("#activityEndTime").val()!=''){
                var activityStartTime =new Date($("#activityStartTime").val()).getTime();
                var activityEndTime =new Date($("#activityEndTime").val()).getTime();
                if (activityStartTime > activityEndTime){
                    alert("开始时间不能大于结束时间嗷");
                    return;
                }
            }else if($("#activityStartTime").val()!=''&&$("#activityEndTime").val()==''){
                alert("开始时间,结束时间必须同时填写");
                return;
            }else if($("#activityStartTime").val()==''&&$("#activityEndTime").val()!=''){
                alert("开始时间,结束时间必须同时填写");
                return;
            }
            if($("#createStartTime").val()!=''&&$("#createEndTime").val()!=''){
                var createStartTime =new Date($("#createStartTime").val()).getTime();
                var createEndTime =new Date($("#createEndTime").val()).getTime();
                if (createStartTime > createEndTime){
                    alert("开始时间不能大于结束时间嗷");
                    return;
                }
            }else if($("#createStartTime").val()!=''&&$("#createEndTime").val()==''){
                alert("开始时间,结束时间必须同时填写");
                return;
            }else if($("#createStartTime").val()==''&&$("#createEndTime").val()!=''){
                alert("开始时间,结束时间必须同时填写");
                return;
            }
            /*alert(
                    "storeId" + $("#storeId").val()+
                    "activityStartTimeStr" + $("#activityStartTime").val()+
                    "activityEndTimeStr" + $("#activityEndTime").val()+
                    "createStartTimeStr" + $("#createStartTime").val()+
                    "createEndTimeStr" + $("#createEndTime").val()+
                    "createdBy" + $("#createdBy").val()+
                    "currentPage" + $("#currentPage").val()+
                    "pageCount" + $("#pageCount").val()
            );*/
            $.get("/invite/list/data", {
                "storeId" : $("#storeId").val(),
                "activityStartTimeStr" : $("#activityStartTime").val(),
                "activityEndTimeStr" : $("#activityEndTime").val(),
                "createStartTimeStr" : $("#createStartTime").val(),
                "createEndTimeStr" : $("#createEndTime").val(),
                "createdBy" : $("#createdBy").val(),
                "currentPage" : $("#currentPage").val(),
                "pageCount" : $("#pageCount").val()
            }, function (data) {
                var list = data.shareActivityInfoDTOList;
                var content = "";
                if (list) {
                    for (var i = 0; i < list.length; i++) {
                        var row = list[i];
                        var buttons = "";
                        var auditRefuseView = "";
                        if (row.isShowView) {
                            buttons += "<button onclick=\"inviteDetail(" + row.activityId + ")\" data-activity=\"" + row.activityId + "\">查看</button> ";
                        }
                        if (row.isShowEdit) {
                            buttons += "<button onclick=\"inviteEdit(" + row.activityId + ","+i+")\" data-activity=\"" + row.activityId + "\">编辑</button> ";
                        }
                        if (row.isShowDisable) {
                            buttons += "<button onclick=\"inviteDisableModal(" + row.activityId + ")\" data-activity=\"" + row.activityId + "\">禁用</button> ";
                        }
                        if (row.isShowAudit) {
                            buttons += "<button onclick=\"inviteAudit(" + row.activityId + ",'" + row.createdBy + "')\">审核</button> ";
                        }
                        if (row.isShowRefused) {
                            auditRefuseView = "<button style=\"border-radius: 15px\" class=\"btn btn-default example\" data-container=\"body\" data-toggle=\"popover\" data-placement=\"top\" title=\"审核未通过\" data-content=\"原因: " + (row.reviewRefuseReason ? row.reviewRefuseReason : "--") +"\">?</button>";
                        }

                        content+="<tr class='count'>";
                        content+="<td><label>"+(i+1)+"</label></td>";
                        content+="<td>";
                        content+="<label >"+row.storeName+"</label>";
                        content+="</td>";
                        content+="<td>";
                        content+="<label id='activityName_'>"+row.activityName+"</label>";
                        content+="</td>";
                        content+="<td>";
                        content+="<label id='activityStartTime_'>"+row.activityStartTimeStr+"</label>";
                        content+="~";
                        content+="<label id='activityEndTime_'>"+row.activityEndTimeStr+"</label>";
                        content+="</td>";
                        content+="<td>";
                        content+="<label id='createdBy_'>"+row.createdBy+"</label>";
                        content+="</td>";
                        content+="<td>";
                        content+="<label id='createTime_'>"+row.createTimeStr+"</label>";
                        content+="</td>";
                        content+="<td>";
                        if(row.status==null||row.status==undefined||row.status==''){
                            content+="<label id='status'></label>";
                        }else {
                            content+="<label id='status_"+i+"'>"+row.status+"</label>";
                        }
                        content+=auditRefuseView;
                        content+="</button>";
                        content+="</td>";
                        content+="<td>";
                        if(row.inviteCount==null||row.inviteCount==undefined){
                            content+="<label id='inviteCount_'>0</label>";
                        }else {
                            content+="<label id='inviteCount_'>"+row.inviteCount+"</label>";
                        }
                        content+="</td>";
                        content+="<td>";
                        if(row.inviteeCount==null||row.inviteeCount==undefined){
                            content+="<label id='inviteeCount'>0</label>";
                        }else {
                            content+="<label id='inviteeCount'>"+row.inviteeCount+"</label>";
                        }
                        content+="</td>";
                        content+="<td>";
                        if(row.orderedCount==null||row.orderedCount==undefined){
                            content+="<label id='orderedCount_'>0</label>";
                        }else {
                            content+="<label id='orderedCount_'>"+row.orderedCount+"</label>";
                        }
                        content+="</td>";
                        content+="<td>";
                        content+=buttons;
                        content+="</td>";
                        content+="</tr>";


                    }
                    //alert(content);
                }
                $("#contentBody").html(content);
                var pageInfo = data.basePagination;
                if (pageInfo) {
                    $("#currentPageLabel").text(pageInfo.currentPage);
                    $("#currentPage").text(pageInfo.currentPage);
                    $("#currentPage").attr("max", pageInfo.lastPage);
                    $("#pageCount").val(pageInfo.pageCount);
                    $("#totalCount").text(pageInfo.totalCount);
                    $("#pages").text(pageInfo.lastPage);

                    $("#firstPage").data("page", pageInfo.firstPage);
                    $("#prePage").data("page", pageInfo.prePage);
                    $("#nextPage").data("page", pageInfo.nextPage);
                    $("#lastPage").data("page", pageInfo.lastPage);

                    $("#firstPage").attr("disabled", !pageInfo.hasPreviousPage);
                    $("#prePage").attr("disabled", !pageInfo.hasPreviousPage);

                    $("#nextPage").attr("disabled", !pageInfo.hasNextPage);

                    $("#lastPage").attr("disabled", !pageInfo.hasNextPage);
                } else {
                    $("#currentPage").val(1);
                    $("#pageCount").val(1);
                    $("#totalCount").val(0);

                    $("#firstPage").data("page", 1);
                    $("#prePage").data("page", 1);
                    $("#nextPage").data("page", 1);
                    $("#lastPage").data("page", 1);

                    $("#firstPage").attr("disabled", true);
                    $("#prePage").attr("disabled", true);

                    $("#nextPage").attr("disabled", true);

                    $("#lastPage").attr("disabled", true);
                }
                $(".example").popover();

            });
        }


        //重置
        function resetQuery() {
            $("#storeId").val("");
            $("#activityName").val(""),
            $("#activityStartTime").val("");
            $("#activityEndTime").val("");
            $("#createStartTime").val("");
            $("#createEndTime").val("");
            $("#productId").val("");
            $("#createdBy").val("");
            $("#currentPage").val("");
            $("#pageCount").val("");
        }

        //时间jquery
        $(function () {
            $("#createStartTime").datetimepicker({
                format: 'yyyy-mm-dd hh:ii:ss',
                autoclose: true,
                minView: 0,
                minuteStep:1

            }).on('changeDate',function (e) {
                //var startTime = e.date;
                //$('#createEndTime').datetimepicker('setStartDate',startTime);
            });
            $( "#createEndTime" ).datetimepicker({
                format: 'yyyy-mm-dd hh:ii:ss',
                autoclose: true,
                minView: 0,
                minuteStep:1
            }).on('changeDate',function (e) {
                /*var endTime = e.date;
                $('#createStartTime').datetimepicker('setEndDate',endTime);*/
            });

            $("#activityStartTime").datetimepicker({
                format: 'yyyy-mm-dd hh:ii:ss',
                autoclose: true,
                minView: 0,
                minuteStep:1

            }).on('changeDate',function (e) {
                /*var startTime = e.date;
                $('#activityEndTime').datetimepicker('setStartDate',startTime);*/
            });
            $("#activityEndTime").datetimepicker({
                format: 'yyyy-mm-dd hh:ii:ss',
                autoclose: true,
                minView: 0,
                minuteStep:1

            }).on('changeDate',function (e) {
                /*var endTime = e.date;
                $('#activityStartTime').datetimepicker('setEndDate',endTime);*/
            });
       });

    </script>

    <style>
        table {
            font-family: verdana, arial, sans-serif;
            font-size: 11px;
            color: #333333;
            border-width: 1px;
            border-color: #666666;
            border-collapse: collapse;
            text-align: center;
            border-radius: 5px;
            border-top: 30px;
        }
        th {
            text-align: center;
        }
        input, select {
            border: 1px solid #ccc;
            padding: 7px 0px;
            border-radius: 3px;
            padding-left: 5px;
            width: 200px;
        }

        .add {
            background-color: #1ab394; /* Green */
            border: none;
            color: white;
            padding: 9px 24px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 15px;
            border-radius: 7px;
        }
    </style>

</head>



<body class="gray-bg">
<input type="hidden" id="pageInfo" value="<#if pageInfo??>${pageInfo}</#if>">

<div class="wrapper wrapper-content">
    <div class="ibox">

        <div class="ibox-content">

            <table  style="border-collapse:separate; border-spacing:0px 10px;" align="left">
                <tr>
                    <td colspan="2" align="left">
                        <button class="add" id="inviteCreate">新增邀请活动</button>
                    </td>
                </tr>
                <tr>
                    <td style="width: 12%; text-align: left;" ><label>门店</label></td>
                    <td>
                        <select id="storeId">
                            <option value="">全部</option>
                            <#if storeList??>
                            <#list storeList as store>
                                <option value="<#if store.id??>${store.id}</#if>"><#if store.name??>${store.name}</#if></option>
                            </#list>
                            </#if>
                        </select>
                    </td>

                </tr>
                <tr>
                    <td style="width: 12%; text-align: left;" ><label>创建人</label></td>
                    <td>
                        <input id="createdBy"/>
                    </td>
                </tr>
                <tr>
                    <td style="width: 12%; text-align: left;" ><label>有效期</label></td>
                    <td>
                        <input id="activityStartTime" type="text" class="input-sm form-control " style="max-width: 200px" data-date-format="yyyy-mm-dd hh:ii:ss"
                        readonly />
                    </td>
                    <td style="width: 12%" >
                        至
                    </td>
                    <td>
                        <input id="activityEndTime" type="text" class="input-sm form-control " style="max-width: 200px" data-date-format="yyyy-mm-dd hh:ii:ss"
                                readonly />
                    </td>
                </tr>
                <tr>
                    <td style="width: 12%; text-align: left;" >
                        <label>创建日期</label>
                    </td>
                    <td>
                        <input id="createStartTime" type="text" class="input-sm form-control " style="max-width: 200px"  data-date-format="yyyy-mm-dd hh:ii:ss" readonly />
                    </td>
                    <td style="width: 12%" >
                        至
                    </td>
                    <td>
                        <input id="createEndTime" type="text" class="input-sm form-control "style="max-width: 200px" data-date-format="yyyy-mm-dd hh:ii:ss"
                                readonly />
                    </td>
                </tr>
            </table>

            <!-- 工具栏 查询  重置-->
            <div class="row" style="margin: 10px">
                <div class="col-sm-12">
                    <div class="pull-left" style="margin:5px 0 15px 0;">
                        <button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="query()"><i class="fa fa-search"></i> 查询</button>
                        <button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="resetQuery()" ><i class="fa fa-refresh"></i> 重置查询条件</button>
                    </div>
                </div>
            </div>

            <table id="contentTable" class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footer" style="text-align: center">
                <thead id="contentThead">
                <tr>
                    <td>序号</td>
                    <td>门店</td>
                    <td>活动名称</td>
                    <td>有效时间</td>
                    <td>创建人</td>
                    <td>创建时间</td>
                    <td>状态</td>
                    <td>老用户参与数</td>
                    <td>新用户注册数</td>
                    <td>新用户完成首单数</td>
                    <td>操作</td>
                </tr>
                </thead>
                <tbody id="contentBody">
                <#if list??>
                    <#list list as item>
                    <tr class="count">
                        <td><label>${item_index+1}</label></td>
                        <td>
                            <#if item.storeId??>
                                <label hidden id="storeId_${item_index}"><#if item.storeId??>${item.storeId}</#if></label>
                            </#if>
                            <#if item.storeName??>
                                <label ><#if item.storeName??>${item.storeName}</#if></label>
                            </#if>
                        </td>
                        <td>
                            <#if item.activityId??>
                                <label hidden id="activityId_${item_index}"><#if item.activityId??>${item.activityId?c}</#if></label>
                            </#if>
                            <#if item.activityName??>
                                <label id="activityName_${item_index}"><#if item.activityName??>${item.activityName}</#if></label>
                            </#if>
                        </td>
                        <td>
                            <#if item.activityStartTimeStr??>
                                <label id="activityStartTime_${item_index}">${item.activityStartTimeStr}</label>
                            </#if>
                            ~
                            <#if item.activityEndTimeStr??>
                                <label id="activityEndTime_${item_index}"><#if item.activityEndTimeStr??>${item.activityEndTimeStr}</#if></label>
                            </#if>
                        </td>

                        <td>
                            <#if item.createdBy??>
                                <label id="createdBy_${item_index}"><#if item.createdBy??>${item.createdBy}</#if></label>
                            </#if>
                        </td>
                        <td>
                            <#if item.createTimeStr??>
                                <label id="createTime_${item_index}"><#if item.createTimeStr??>${item.createTimeStr}</#if></label>
                            </#if>
                        </td>
                        <td>
                            <#if item.status??>
                                <label id="status_${item_index}"><#if item.status??>${item.status}</#if></label>
                                <#if item.isShowRefused>
                                    <button style="border-radius: 15px" class="btn btn-default" data-container="body" data-toggle="popover" data-placement="top" title="审核未通过" data-content="原因: <#if item.reviewRefuseReason??>${item.reviewRefuseReason}</#if>">
                                        ?
                                    </button>
                                </#if>
                                <#else>
                                    <label></label>
                            </#if>

                        </td>
                        <td>
                            <#if item.inviteCount??>
                                <label id="inviteCount_${item_index}"><#if item.inviteCount??>${item.inviteCount?c}</#if></label>
                            <#else>
                                <label>0</label>
                            </#if>

                        </td>
                        <td>
                            <#if item.inviteeCount??>
                                <label id="inviteeCount_${item_index}"><#if item.inviteeCount??>${item.inviteeCount?c}</#if></label>
                            <#else>
                                <label>0</label>
                            </#if>
                        </td>
                        <td>
                            <#if item.orderedCount??>
                                <label id="orderedCount_${item_index}"><#if item.orderedCount??>${item.orderedCount?c}</#if></label>
                            <#else>
                                <label>0</label>
                            </#if>
                        </td>
                        <td>
                            <#if item.isShowView>
                                <button onclick="inviteDetail(<#if item.activityId??>${item.activityId?c}</#if>)" data-activity="<#if item.activityId??>${item.activityId?c}</#if>">查看</button>
                            </#if>
                            <#if item.isShowEdit>
                                <button onclick="inviteEdit(<#if item.activityId??>${item.activityId?c}</#if>,${item_index})" data-activity="<#if item.activityId??>${item.activityId?c}</#if>">编辑</button>
                            </#if>
                            <#if item.isShowDisable>
                                <button onclick="inviteDisableModal(<#if item.activityId??>${item.activityId?c}</#if>)" data-activity="<#if item.activityId??>${item.activityId?c}</#if>">禁用</button>
                            </#if>
                            <#if item.isShowAudit>
                                <button onclick="inviteAudit(<#if item.activityId??>${item.activityId?c}</#if><#if item.createdBy??>, '${item.createdBy}'</#if>)" data-activity="<#if item.activityId??>${item.activityId?c}</#if>">审核</button>
                            </#if>

                        </td>
                    </tr>
                    </#list>
                </#if>
                </tbody>
                <tfoot>
                <#if pageInfo??>
                <tr>
                    <td colspan="4">
                        共有<label id="pages"><#if pageInfo.lastPage??>${pageInfo.lastPage}</#if></label>页
                        当前<label id="currentPageLabel"><#if pageInfo.currentPage??>${pageInfo.currentPage}</#if></label>页
                        共有<label id="totalCount"><#if pageInfo.totalCount??>${pageInfo.totalCount}</#if></label>条数据
                    </td>
                    <td colspan="3"></td>
                    <td colspan="3">
                        <button class="pageButton" id="firstPage" data-page="1">首页</button>
                        <button class="pageButton" id="prePage" data-page="<#if pageInfo.prePage??>${pageInfo.prePage}</#if>">上一页</button>
                        <button class="pageButton" id="nextPage" data-page="<#if pageInfo.nextPage??>${pageInfo.nextPage}</#if>">下一页</button>
                        <button class="pageButton" id="lastPage" data-page="<#if pageInfo.lastPage??>${pageInfo.lastPage}</#if>">末页</button>
                        <label>当前页:</label>
                        <input id="currentPage" type="number" style="width: 40px" value="<#if pageInfo.currentPage??>${pageInfo.currentPage}</#if>" min="1" max="<#if pages??>${pages}</#if>"/>
                        <label>页面容量:</label>
                        <select id="pageCount" style="width: 45px">
                            <option value="5" <#if pageInfo.pageCount??&&pageInfo.pageCount==5>selected</#if>>5</option>
                            <option value="10" <#if pageInfo.pageCount??&&pageInfo.pageCount==10>selected</#if>>10</option>
                            <option value="15" <#if pageInfo.pageCount??&&pageInfo.pageCount==15>selected</#if>>15</option>
                            <option value="20" <#if pageInfo.pageCount??&&pageInfo.pageCount==20>selected</#if>>20</option>
                        </select>
                    </td>
                </tr>
                </#if>
                </tfoot>
            </table>

        </div>
    </div>
</div>
</body>
</html>
<!-- 终止 -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>

            </div>
            <div class="modal-body">活动正在进行，确定终止吗？
            <input id="modalActivityId" hidden/></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button id="stop" type="button" class="btn btn-primary">终止</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>