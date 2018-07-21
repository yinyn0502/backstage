
<html>
<head>
    <title>手动发券</title>
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

        $(function () {
            $("#sendActivityCreate").click(function () {
                $.artDialog.open("/sendcoupon/edit/view", {
                    title : "建券",
                    width : 800,
                    height : 600,
                    lock : true,
                    cancelVal: "取消",
                    close: function () {
                        art.dialog.open.origin.location.href="/sendcoupon/list";
                    }
                });
//                window.location.href = "/sendcoupon/edit/view";
            });

            $(".pageButton").click(function () {
                alert($(this).data("page"));
                $("#currentPage").val($(this).data("page"));
                query();
            });
            
            $("#currentPage").change(function () {
                if ($(this).val() > <#if pages??>${pages}<#else>1</#if>) {
                    alert("跳转页面错误! 第" + $(this).val() + "页不存在");
                } else {
                    query();
                }
            });

            $("#pageCount").change(function () {
                alert($(this).val());
                $("#currentPage").val(1);
                query();
            });
        });


        function query() {
            $.get("/sendcoupon/list/ajax", {
                sendActivityName: $("#sendActivityName").val(),
                targetType: $("#targetType").val() != 0 ? $("#targetType").val() : "",
                createdBy: $("#createdBy").val(),
                createStartTimeStr: $("#createStartTime").val(),
                createEndTimeStr: $("#createEndTime").val(),
                executedBy: $("#executedBy").val(),
                executeStartTimeStr: $("#executeStartTime").val(),
                executeEndTimeStr: $("#executeEndTime").val(),
                couponActivityId : $("#couponActivityId").val(),
                currentPage : $("#currentPage").val(),
                pageCount : $("#pageCount").val()
            }, function (data) {
                var list = data.list;
                var content = "";
                if (list) {
                    for (var i = 0; i < list.length; i++) {
                        var row = list[i];
                        var buttons = "";
                        if (row.isShowView) {
                            buttons += "<button onclick=\"coupoonView('查看', '/sendcoupon/detail?activityId=" + row.sendActivityId + "')\">查看</button> ";
                        }
                        if (row.isShowEdit) {
                            buttons += "<button id=\"edit_" + i + "\" onclick=\"coupoonView('编辑','/sendcoupon/edit/view?activityId=" + row.sendActivityId + "')\">编辑</button> ";
                        }
                        if (row.isShowExecute) {
                            buttons += "<span id=\"execute_"+i+"\"><button onclick=\"execute(" + row.sendActivityId + ", "+i+")\">执行</button></span> ";
                        }
                        if (row.isShowIng) {
                            buttons += "<label>执行中</label> ";
                        }
                        if (row.isShowResult) {
                            buttons += "<label>已执行</label> ";
                        }

                        content += "<tr><td><label>" + (i+ 1) +"</label></td><td><label id=\"sendActivityId_"+(i)+"\">" + row.sendActivityId +
                            "</label></td><td><label id=\"sendActivityName_" + i + "\">" + row.sendActivityName + "</label>" +
                            "</td>" +
                                "<td><label id=\"targetType_" + i + "\">" + row.targetTypeDesc +
                                "</label></td>" +
                                "<td><label id=\"createdBy_" + i + "\">" + row.createdBy + "</label></td>" +
                            "<td><label id=\"createTime_" + i + "\">" + row.createTime + "</label></td><td><label id=\"executedBy_" + i + "\">" + isExist(row.executedBy) + "</label></td>" +
                            "<td><label id=\"executeTime_" + i + "\">" + isExist(row.executeTime) + "</label></td><td>" + buttons + "</td></tr>"
                    }
                }

                function isExist(param) {
                    if (param) {
                        return param;
                    }
                    return "--";
                }

                $("#contentBody").html(content);
                var pageInfo = data.basePagination;
                if (pageInfo) {
                    $("#currentPageLabel").text(pageInfo.currentPage);
                    $("#pageCount").val(pageInfo.pageCount);
                    $("#totalCount").text(pageInfo.totalCount);
                    $("#pages").text(pageInfo.lastPage);

                    $("#firstPage").data("page", data.firstPage);
                    $("#prePage").data("page", data.prePage);
                    $("#nextPage").data("page", data.nextPage);
                    $("#lastPage").data("page", data.lastPage);

                    $("#firstPage").attr("disabled", !data.hasPreviousPage);
                    $("#prePage").attr("disabled", !data.hasPreviousPage);

                    $("#nextPage").attr("disabled", !data.hasNextPage);

                    $("#lastPage").attr("disabled", !data.hasNextPage);
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
            });


        }

        function resetQuery() {
            $("#sendActivityName").val("");
            $("#targetType").val("");
            $("#createdBy").val("");
            $("#createStartTime").val("");
            $("#createEndTime").val("");
            $("#executedBy").val("");
            $("#executeStartTime").val("");
            $("#executeEndTime").val("");
            $("#couponActivityId").val("");
        }

        $(function () {
            $("#createStartTime").datetimepicker({
                format: 'yyyy-mm-dd hh:ii:ss',
                autoclose: true,
                minView: 0,
                minuteStep:1

            }).on('changeDate',function (e) {
                var startTime = e.date;
                $('#createEndTime').datetimepicker('setStartDate',startTime);
            });
            $( "#createEndTime" ).datetimepicker({
                format: 'yyyy-mm-dd hh:ii:ss',
                autoclose: true,
                minView: 0,
                minuteStep:1
            }).on('changeDate',function (e) {
                var endTime = e.date;
                $('#createStartTime').datetimepicker('setEndDate',endTime);
            });

            $("#executeStartTime").datetimepicker({
                format: 'yyyy-mm-dd hh:ii:ss',
                autoclose: true,
                minView: 0,
                minuteStep:1

            }).on('changeDate',function (e) {
                var startTime = e.date;
                $('#executeEndTime').datetimepicker('setStartDate',startTime);
            });
            $("#executeEndTime").datetimepicker({
                format: 'yyyy-mm-dd hh:ii:ss',
                autoclose: true,
                minView: 0,
                minuteStep:1

            }).on('changeDate',function (e) {
                var endTime = e.date;
                $('#executeStartTime').datetimepicker('setEndDate',endTime);
            });
        });

        function coupoonView(title, url) {
            $.artDialog.open(url, {
                title : title,
                width : 800,
                height : 600,
                lock : true,
                cancelVal: "取消",
                close: function () {
                    art.dialog.open.origin.location.href="/sendcoupon/list";
                }
            });
        }

        function execute(activityId, index) {
            $.get("/sendcoupon/execute", {
                "activityId" : activityId
            }, function (data) {
                if (data) {
                    $("#execute_" + index).html("执行中");
                    $("#edit_" + index).hide();
                }
            });
        }
    </script>

    <style>
        table {
            font-family: verdana, arial, sans-serif;
            font-size: 11px;
            color: #333333;
            border-width: 1px;
            border-color: #666666;
            border-collapse: collapse;
            width: 80%;
            text-align: center;
            border-radius: 5px;
            border-top: 30px;
        }

        input, select {
            border: 1px solid #ccc;
            padding: 7px 0px;
            border-radius: 3px;
            padding-left: 5px;
        }

        .add {
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            padding: 12px 26px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 7px;
        }
    </style>


</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="ibox">

        <div class="ibox-content">

            <table style="border-collapse:separate; border-spacing:0px 10px;">
                <tr align="left">
                    <td colspan="2">
                        <button class="add" id="sendActivityCreate">创建发券活动</button>
                    </td>
                </tr>
                <tr align="left">
                    <td><label>活动名称</label></td>
                    <td>
                        <input id="sendActivityName"/>
                    </td>
                    <td><label>目标类型</label></td>
                    <td>
                        <select id="targetType">
                            <option value="0">请选择</option>
                            <#if targetTypes??>
                                <#list targetTypes as targetItem>
                                    <option value="${targetItem.type}">${targetItem.desc}</option>
                                </#list>
                            </#if>
                        </select>
                    </td>
                    <td><label>创建人</label></td>
                    <td>
                        <input id="createdBy"></input>
                    </td>
                </tr>
                <tr align="left">
                    <td><label>执行人</label></td>
                    <td>
                        <input id="executedBy"></input>
                    </td>
                    <td><label>优惠券ID</label></td>
                    <td>
                        <input id="couponActivityId" type="number"/>
                    </td>
                </tr>
                <tr align="left">
                    <td><label>创建日期</label></td>
                    <td>
                        <input style="max-width: 230px" type="text" class="input-sm form-control " data-date-format="yyyy-mm-dd hh:ii:ss"
                        id="createStartTime" readonly value="<#if createStartTime??>${createStartTime}</#if>"/>
                    </td>
                    <td align="center">
                        至
                    </td>
                    <td>
                        <input style="max-width: 230px" type="text" class="input-sm form-control " data-date-format="yyyy-mm-dd hh:ii:ss"
                               id="createEndTime" readonly value="<#if createEndTime??>${createEndTime}</#if>"/>
                    </td>
                </tr>

                <tr align="left">
                    <td>
                        <label>执行日期</label>
                    </td>
                    <td>
                        <input style="max-width: 230px" type="text" class="input-sm form-control " data-date-format="yyyy-mm-dd hh:ii:ss" id="executeStartTime" readonly value="<#if executeStartTime??>${executeStartTime}</#if>"/>
                    </td>
                    <td align="center">
                        至
                    </td>
                    <td>
                        <input style="max-width: 230px" type="text" class="input-sm form-control " data-date-format="yyyy-mm-dd hh:ii:ss"
                               id="executeEndTime" readonly value="<#if executeEndTime??>${executeEndTime}</#if>"/>
                    </td>
                </tr>
            </table>

            <!-- 工具栏 -->
            <div class="row" style="margin-bottom: 10px; margin-top: 10px">
                <div class="col-sm-12">
                    <div class="pull-left">
                        <button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="query()"><i class="fa fa-search"></i> 查询</button>
                        <span style="display: inline-block; width: 10px"></span>
                        <button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="resetQuery()" ><i class="fa fa-refresh"></i> 重置查询条件</button>
                    </div>
                </div>
            </div>

            <table id="contentTable" class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footer">
                <thead>
                <tr>
                    <th><label>序号</label></th>
                    <th><label>活动ID</label></th>
                    <th><label>活动名称</label></th>
                    <th><label>目标类型</label></th>
                    <th><label>创建人</label></th>
                    <th><label>创建日期</label></th>
                    <th><label>执行人</label></th>
                    <th><label>执行日期</label></th>
                    <th><label>操作</label></th>
                </tr>
                </thead>
                <tbody id="contentBody">
                <#if list??>
                <#list list as item>
                    <tr>
                        <td><label>${item_index+1}</label></td>
                        <td>
                            <#if item.sendActivityId??>
                            <label id="sendActivityId_${item_index}"><#if item.sendActivityId??>${item.sendActivityId}</#if></label>
                            </#if>
                        </td>
                        <td>
                            <#if item.sendActivityName??>
                            <label id="sendActivityName_${item_index}"><#if item.sendActivityName??>${item.sendActivityName}</#if></label>
                            </#if>
                        </td>
                        <td>
                            <#if item.targetType??>
                            <label id="targetType_${item_index}">
                                <#if item.targetType??>
                                    <#if targetTypes??>
                                        <#list targetTypes as targetItem>
                                            <#if targetItem.type==item.targetType>
                                                ${targetItem.desc}
                                            </#if>
                                        </#list>
                                    </#if>
                                </#if>
                            </label>
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
                            <#if item.executedBy??>
                            <label id="executedBy_${item_index}"><#if item.executedBy??>${item.executedBy}</#if></label>
                            </#if>
                        </td>
                        <td>
                            <#if item.executeTime??>
                            <label id="executeTime_${item_index}"><#if item.executeTime??>${item.executeTime}</#if></label>
                            </#if>
                        </td>
                        <td>
                            <#if item.isShowView>
                                <button onclick="coupoonView('查看', '/sendcoupon/detail?activityId=<#if item.sendActivityId??>${item.sendActivityId}</#if>')">查看</button>
                            </#if>
                            <#if item.isShowEdit>
                                <button id="edit_${item_index}" onclick="coupoonView('编辑','/sendcoupon/edit?activityId=<#if item.sendActivityId??>${item.sendActivityId}</#if>')">编辑</button>
                            </#if>
                            <#if item.isShowExecute>
                                <span id="execute_${item_index}"><button onclick="execute(<#if item.sendActivityId??>${item.sendActivityId}</#if>, ${item_index})">执行</button></span>
                            </#if>
                            <#if item.isShowIng>
                                <label>执行中</label>
                            </#if>
                            <#if item.isShowResult>
                                <label>已执行</label>
                            </#if>

                        </td>
                    </tr>
                </#list>
                </#if>
                </tbody>
                <tfoot>
                <#if pageInfo??>
                    <tr>
                        <td colspan="3">
                            共有<label id="pages"><#if pages??>${pages}</#if></label>页
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
                            <input id="currentPage" type="number" value="<#if pageInfo.currentPage??>${pageInfo.currentPage}</#if>" min="1" max="<#if pages??>${pages}</#if>"/>
                            <label>页面容量:</label>
                            <select id="pageCount">
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
