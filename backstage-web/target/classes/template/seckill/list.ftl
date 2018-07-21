
<html>
<head>
    <title>场次管理</title>
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

        function seckillDetail(activityId) {
            $.artDialog.open("/seckill/detail?activityId=" + activityId, {
                title : "秒杀场次",
                width : 800,
                height : 600,
                lock : true,
                cancelVal: "取消",
                close: function () {
                    // art.dialog.open.origin.location.href="/seckill/list";
                }
            });
        }

        function seckillEdit(activity) {
            $.artDialog.open("/seckill/edit/view?activityId=" + activity, {
                title : "编辑秒杀场次",
                width : 800,
                height : 600,
                lock : true,
                cancelVal: "取消",
                close: function () {
                    art.dialog.open.origin.location.href="/seckill/list";
                }
            });
        }

        function seckillAudit(activity, createdBy) {
            $.artDialog.open("/seckill/detail?isAudit=true&activityId=" + activity + "&createdBy=" + createdBy, {
                title : "审核秒杀场次",
                width : 800,
                height : 600,
                lock : true,
                cancelVal: "取消",
                close: function () {
                    art.dialog.open.origin.location.href="/seckill/list";
                }
            });
        }

        function seckillDisableModal(activity) {
            $("#modalActivityId").val(activity);
            $("#myModal2").modal();
        }

        $(function () {
            $(function () {
                $('[data-toggle="popover"]').popover()
            })

            $("#seckillCreate").click(function () {
                $.artDialog.open("/seckill/edit/view", {
                    title : "新增秒杀场次",
                    width : 800,
                    height : 600,
                    lock : true,
                    cancelVal: "取消",
                    close: function () {
                        art.dialog.open.origin.location.href="/seckill/list";
                    }
                });
//                window.location.href = "/seckill/edit/view";
            });

            $("#stop").click(function () {
                $.get("/seckill/stop", {
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
        });


        function query() {
            $.get("/seckill/list/data", {
                "storeId" : $("#storeId").val(),
                "activityName" : $("#activityName").val(),
                "activityStartTimeStr" : $("#activityStartTime").val(),
                "activityEndTimeStr" : $("#activityEndTime").val(),
                "createStartTimeStr" : $("#createStartTime").val(),
                "createEndTimeStr" : $("#createEndTime").val(),
                "productId" : $("#productId").val(),
                "createdBy" : $("#createdBy").val(),
                "currentPage" : $("#currentPage").val(),
                "pageCount" : $("#pageCount").val()
            }, function (data) {
                var list = data.seckillQueryResultList;
                var content = "";
                if (list) {
                    for (var i = 0; i < list.length; i++) {
                        var row = list[i];
                        var buttons = "";
                        var auditRefuseView = "";
                        if (row.isShowView) {
                            buttons += "<button onclick=\"seckillDetail(" + row.activityId + ")\" data-activity=\"" + row.activityId + "\">查看</button> ";
                        }
                        if (row.isShowEdit) {
                            buttons += "<button onclick=\"seckillEdit(" + row.activityId + ")\" data-activity=\"" + row.activityId + "\">编辑</button> ";
                        }
                        if (row.isShowDisable) {
                            buttons += "<button onclick=\"seckillDisableModal(" + row.activityId + ")\" data-activity=\"" + row.activityId + "\">禁用</button> ";
                        }
                        if (row.isShowAudit) {
                            buttons += "<button onclick=\"seckillAudit(" + row.activityId + ",'" + row.createdBy + "')\">审核</button> ";
                        }
                        if (row.isShowRefused) {
                            auditRefuseView = "<button style=\"border-radius: 15px\" class=\"btn btn-default example\" data-container=\"body\" data-toggle=\"popover\" data-placement=\"top\" title=\"审核未通过\" data-content=\"原因: " + (row.reviewRefuseReason ? row.reviewRefuseReason : "--") +"\">?</button>";
                        }

                        content += "<tr><td><label>" + (i + 1) + "</label></td><td><label hidden id=\"storeId_"+ (i + 1) +"\">" + row.storeId + "</label>" +
                                "<label >"+row.storeName+"</label>" +
                                "</td>" +
                                "<td><label id=\"activityName_" + (i + 1) + "\">" +
                                row.activityName + "</label></td>" +
                        "<td><label id=\"activityStartTime_" + (i + 1) + "\">"+ row.activityStartTime + "</label>~<label id=\"activityEndTime_" + (i + 1) + "\">"+ row.activityEndTime + "</label></td>" +
                        "<td><label id=\"saleCount_" + (i + 1) + "\">"+ (row.saleCount ? row.saleCount : 0) + "</label></td><td><label id=\"createdBy_" + (i + 1) + "\">"+ row.createdBy + "</label></td>" +
                        "<td><label id=\"createTime_" + (i + 1) + "\">"+ row.createTime + "</label></td>" +
                        "<td><label id=\"activityStatus_" + (i + 1) + "\">"+ row.activityStatus + "</label>" + auditRefuseView + "</td>" + "<td>" + buttons + "</td></tr>";

                    }
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
<div class="wrapper wrapper-content">
    <div class="ibox">

        <div class="ibox-content">

            <table  style="border-collapse:separate; border-spacing:0px 10px;" align="left">
                <tr>
                    <td colspan="2" align="left">
                        <button class="add" id="seckillCreate">新增秒杀场次</button>
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
                    <td style="width: 12%" ><label>场次名称</label></td>
                    <td>
                        <input id="activityName"/>
                    </td>
                </tr>
                <tr>
                    <td style="width: 12%; text-align: left;" ><label>创建人</label></td>
                    <td>
                        <input id="createdBy"></input>
                    </td>
                    <td style="width: 12%" ><label>商品ID</label></td>
                    <td>
                        <input id="productId" type="number"/>
                    </td>
                </tr>
                <tr>
                    <td style="width: 12%; text-align: left;" ><label>有效期</label></td>
                    <td>
                        <input id="activityStartTime" type="text" class="input-sm form-control " style="max-width: 200px" data-date-format="yyyy-mm-dd hh:ii:ss"
                        readonly value="<#if activityStartTime??>${activityStartTime}</#if>"/>
                    </td>
                    <td style="width: 12%" >
                        至
                    </td>
                    <td>
                        <input id="activityEndTime" type="text" class="input-sm form-control " style="max-width: 200px" data-date-format="yyyy-mm-dd hh:ii:ss"
                                readonly value="<#if activityEndTime??>${activityEndTime}</#if>"/>
                    </td>
                </tr>
                <tr>
                    <td style="width: 12%; text-align: left;" >
                        <label>创建日期</label>
                    </td>
                    <td>
                        <input id="createStartTime" type="text" class="input-sm form-control " style="max-width: 200px"  data-date-format="yyyy-mm-dd hh:ii:ss" readonly value="<#if createStartTime??>${createStartTime}</#if>"/>
                    </td>
                    <td style="width: 12%" >
                        至
                    </td>
                    <td>
                        <input id="createEndTime" type="text" class="input-sm form-control "style="max-width: 200px" data-date-format="yyyy-mm-dd hh:ii:ss"
                                readonly value="<#if createEndTime??>${createEndTime}</#if>"/>
                    </td>
                </tr>
            </table>

            <!-- 工具栏 -->
            <div class="row" style="margin: 10px">
                <div class="col-sm-12">
                    <div class="pull-left" style="margin:5px 0 15px 0;">
                        <button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="query()"><i class="fa fa-search"></i> 查询</button>
                        <button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="resetQuery()" ><i class="fa fa-refresh"></i> 重置查询条件</button>
                    </div>
                </div>
            </div>

            <table id="contentTable" class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footer" style="text-align: center">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>门店</th>
                    <th>场次名称</th>
                    <th>场次有效时间</th>
                    <th>当前活动商品数</th>
                    <th>创建人</th>
                    <th>创建时间</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="contentBody">
                <#if list??>
                <#list list as item>
                    <tr>
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
                            <#if item.activityName??>
                            <label id="activityName_${item_index}"><#if item.activityName??>${item.activityName}</#if></label>
                            </#if>
                        </td>
                        <td>
                            <#if item.activityStartTime??>
                            <label id="activityStartTime_${item_index}">${item.activityStartTime}</label>
                            </#if>
                       ~
                            <#if item.activityEndTime??>
                            <label id="activityEndTime_${item_index}"><#if item.activityEndTime??>${item.activityEndTime}</#if></label>
                            </#if>
                        </td>
                        <td>
                            <#if item.saleCount??>
                            <label id="saleCount_${item_index}"><#if item.saleCount??>${item.saleCount}</#if></label>
                            </#if>
                        </td>
                        <td>
                            <#if item.createdBy??>
                            <label id="createdBy_${item_index}"><#if item.createdBy??>${item.createdBy}</#if></label>
                            </#if>
                        </td>
                        <td>
                            <#if item.createTime??>
                            <label id="createTime_${item_index}"><#if item.createTime??>${item.createTime}</#if></label>
                            </#if>
                        </td>
                        <td>
                            <#if item.activityStatus??>
                                <label id="activityStatus_${item_index}"><#if item.activityStatus??>${item.activityStatus}</#if></label>
                                <#if item.isShowRefused>
                                    <button style="border-radius: 15px" class="btn btn-default" data-container="body" data-toggle="popover" data-placement="top" title="审核未通过" data-content="原因: <#if item.reviewRefuseReason??>${item.reviewRefuseReason}</#if>">
                                        ?
                                    </button>
                                </#if>
                            </#if>
                        </td>
                        <td>
                            <#if item.isShowView>
                                <button onclick="seckillDetail(<#if item.activityId??>${item.activityId?c}</#if>)" data-activity="<#if item.activityId??>${item.activityId?c}</#if>">查看</button>
                            </#if>
                            <#if item.isShowEdit>
                                <button onclick="seckillEdit(<#if item.activityId??>${item.activityId?c}</#if>)" data-activity="<#if item.activityId??>${item.activityId?c}</#if>">编辑</button>
                            </#if>
                            <#if item.isShowDisable>
                                <button onclick="seckillDisableModal(<#if item.activityId??>${item.activityId?c}</#if>)" data-activity="<#if item.activityId??>${item.activityId?c}</#if>">禁用</button>
                            </#if>
                            <#if item.isShowAudit>
                                <button onclick="seckillAudit(<#if item.activityId??>${item.activityId?c}</#if><#if item.createdBy??>, '${item.createdBy}'</#if>)" data-activity="<#if item.activityId??>${item.activityId?c}</#if>">审核</button>
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
            <br/>

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