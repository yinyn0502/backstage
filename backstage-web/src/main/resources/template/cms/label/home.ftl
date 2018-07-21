<html>
<head>
    <meta name="decorator" content="default"/>
<#--    <#include "../../ahead.ftl">
    <#include "../../treeview.ftl" >
    <#include "../../treetable.ftl" >-->

    <script src="/static/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <link href="/static/bootstrap/3.3.4/css_default/bootstrap.min.css" type="text/css" rel="stylesheet"/>

    <script src="/static/bootstrap/3.3.4/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="/static/bootstrap/bootstrap-paginator.js" type="text/javascript"></script>
    <link href="/static/awesome/4.4/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="/static/common/css/style.css?v=3.2.0" type="text/css" rel="stylesheet"/>

    <script type="text/javascript" src="/static/artDialog/jquery.artDialog.js?skin=green"></script>
    <script type="text/javascript" src="/static/artDialog/plugins/iframeTools.source.js"></script>
</head>
<h1 align="center">标签配置</h1>

<style>
    table.gridtable {
        font-family: verdana, arial, sans-serif;
        font-size: 11px;
        color: #333333;
        border-width: 1px;
        border-color: #666666;
        border-collapse: collapse;
        width: 80%;
        text-align: center;
        border-radius: 5px;
    }

    table.gridtable th {
        border-width: 1px;
        padding: 8px;
        border-style: solid;
        border-color: #666666;
        background-color: #dedede;
        text-align: center;
    }

    table.gridtable td {
        border-width: 1px;
        padding: 8px;
        border-style: solid;
        border-color: #666666;
        background-color: #ffffff;
    }

    .add {
        background-color: #1ab394; /* Green */
        border: none;
        color: white;
        text-align: center;
        text-decoration: none;
        font-size: 16px;
    }
</style>

<script>
    function updateLabel(index) {

        var id = $("#id_" + index).html();
        var url = "/cms/label/edit/view?&id=" + id;

        $.artDialog.open(url, {
            title: "标签编辑",
            width: 500,
            height: 600,
            lock: true,
            cancelVal: "取消",
            close: function () {
                var options = $("#storeIds option:selected");
                var storeId = options.val();
                query(storeId);
            }
        });

    }

    function deleteLabel(index) {
        $("#priority_modal").html($("#priority_" + index).html());
        $("#labelName_modal").html($("#labelName_" + index).html());
        $("#targetValue_modal").html($("#targetValue_" + index).html());
        $("#targetType_modal").html($("#targetType_" + index).html());
        $("#appType_modal").html($("#appType_" + index).html());
        $("#appVersion_modal").html($("#appVersion_" + index).html());
        $("#storeId_modal").html($("#storeId_" + index).html());
        $("#id_modal").html($("#id_" + index).html());
        $("#index_modal").html($("#index_" + index).html());
        $("#myModal").modal();
    }

    function deleteLabelConfirm() {
        $("#myModal").modal('hide');

        $.get("/cms/label/delete?id=" + $("#id_modal").text(), function (data) {
            if (data) {
                alert("成功");
                $("#delete_" + $("#index_modal").text()).attr("style", "display:none;");
                $("#edit_" + $("#index_modal").text()).attr("style", "display:none;");
                $("#deleted_" + $("#index_modal").text()).attr("style", "display:inline-block;");
                /*art.dialog.open.origin.location.href="/cms/label";*/
            } else {
                alert("error");
            }
            var options = $("#storeIds option:selected");
            var storeId = options.val();
            query(storeId);
        });
    }

    /**
     * 店铺的change事件
     */
    function selectStore() {
        var options = $("#storeIds option:selected");
        var storeId = options.val();
        if (storeId) {
            $('[name = addBut]').css('display', 'inline-block')
        } else {
            $('[name = addBut]').css('display', 'none')
        }
        query(storeId)
    }

    function addLabel() {
        var options = $("#storeIds option:selected");
        var storeId = options.val();
        var storeName = options.text();
        if (storeId) {
            $.artDialog.open("/cms/label/edit/view?storeId=" + storeId + "&storeName=" + storeName, {
                title: "标签添加",
                width: 500,
                height: 600,
                lock: true,
                cancelVal: "取消",
                close: function () {
                    query(storeId);
                }
            });
        } else {
            alert("请选择门店");
            $('[name = addBut]').css('display', 'none');
        }
    }

    /**
     * 获取数据
     */
    function query(storeId, pageCount, pageSize) {
        if (!storeId) {
            var options = $("#storeIds option:selected");
            storeId = options.val();
        }
        pageCount = pageCount ? pageCount : 1;
        pageSize = pageSize ? pageSize : 10;

        //获取数据
        $.get("/cms/label/getLabelList", {
            "storeId": storeId,
            "pageCount": pageCount,
            "pageSize": pageSize
        }, function (data) {
            var list = data.list;

            var content = "";
            if (list) {
                for (var i = 0; i < list.length; i++) {
                    var item = list[i];
                    var appType = "", targetType, deleted, updateBtn;
                    if (item.appType == 0) {
                        appType = "IOS"
                    } else if (item.appType == 1) {
                        appType = "Android";
                    } else {
                        appType = "微信商城";
                    }

                    if (item.targetType == 1) {
                        targetType = "当前页打开H5";
                    } else if (item.targetType == 2) {
                        targetType = "当前页打开本地页";
                    } else if (item.targetType == 3) {
                        targetType = "新页打开H5";
                    } else {
                        targetType = "新页打开本地页";
                    }

                    if (item.deleted == 0) {
                        deleted = "使标签失效";
                        updateBtn = "修改";
                    } else {
                        deleted = "已失效";
                    }

                    content += "<tr class=\"count\">\n" +
                            "            <td>\n" +
                            "                <label class=\"priority\" id=\"priority_" + i + "\">" + item.priority + "</label>\n" +
                            "                <label style=\"display: none\" class=\"id\" id=\"id_" + i + "\">" + item.id + "</label>\n" +
                            "                <label style=\"display: none\" id=\"index_" + i + "\">" + i + "</label>\n" +
                            "            </td>" +
                            "<td>\n" +
                            "                <label class=\"labelName\" id=\"labelName_" + i + "\">" + item.labelName + "</label>\n" +
                            "            </td>" +
                            "<td>\n" +
                            "                <label class=\"targetValue\" id=\"targetValue_" + i + "\">" + item.targetValue + "</label>\n" +
                            "            </td>" +
                            "<td>\n" +
                            "                <label class=\"targetType\" style=\"display: none\" id=\"targetType_" + i + "\">" + item.targetType + "</label>\n" +
                            "                <label>" + targetType + "</label>\n" +
                            "            </td>" +
                            "<td>\n" +
                            "                <label class=\"appType\" style=\"display: none\" id=\"appType_" + i + "\">" + item.appType + "</label>\n" +
                            "                <label>" + appType + "</label>\n" +
                            "            </td>" +
                            "<td>\n" +
                            "                <label class=\"appVersion\" id=\"appVersion_" + i + "\">" + item.appVersion + "</label>\n" +
                            "            </td>" +
                            "<td>\n" +
                            "                <label class=\"storeId\" id=\"storeId_" + i + "\">" + item.storeId + "</label>\n" +
                            "            </td>" +
                            "<td>" +
                            "<button  id=\"delete_" + i + " data-index=" + i + " data-target=\"#myModal\" onclick=\"deleteLabel(" + i + ")\">" + deleted + "</button>\n" +
                            "                <button  id=\"edit_" + i + "\" onclick=\"updateLabel(" + i + ")\">" + updateBtn + "</button>\n" +

                            "</td>" +
                            "</tr>";
                }


            }
            $('#content').html(content);
            if (content != '') {
                $('#bp-3-element-test').css('display', '');
                $('#noData').css('display', 'none');
                var element = $('#bp-3-element-test');
                var options = {
                    bootstrapMajorVersion: 3,             //bootstrap的版本要求
                    currentPage: data.pageNum,           //设置当前页
                    numberOfPages: 5,                     //设置可以点击到的页数范围
                    totalPages: data.pages,
                    shouldShowPage: true,                 //是否显示该按钮
                    itemTexts: function (type, page, current) {

                        switch (type) {

                            case "first":

                                return "首页";

                            case "prev":

                                return "上一页";

                            case "next":

                                return "下一页";

                            case "last":

                                return "末页";

                            case "page":

                                return page;

                        }
                    },
                    onPageClicked: function (event, originalEvent, type, page) {
                        query("", page, "");
                    }
                }
                // element.bootstrapPaginator(options);

            } else {
                $('#noData').css('display', '');
                $('#bp-3-element-test').css('display', 'none');
            }
        });
    }

</script>

<table class="gridtable" align="center" border="1px">
    <thead style="border: 0px">
    <tr>
        <td colspan="8" style="text-align: left">
            <select id="storeIds" style="width: 200px;height: 40px;" onchange="selectStore()">
                <option selected="selected" value="">请选择门店</option>
                     <#if storeList??>
                         <#list storeList as store>
                                <option value="<#if store.id??>${store.id}</#if>"><#if store.id??>${store.id}</#if>
                                    -<#if store.name??>${store.name}</#if></option>
                         </#list>
                     </#if>
            </select>
            <button class="add" name="addBut"
                    style="width: 150px; height: 44px; border-radius: 5px; margin-left: 36px; display: none"
                    onclick="addLabel()">新增标签
            </button>
        </td>
    </tr>
    </thead>
    <tr>
        <th>标签位置</th>
        <th>标签名称</th>
        <th>跳转链接</th>
        <th>跳转类型</th>
        <th>客户端类型</th>
        <th>生效版本</th>
        <th>生效门店ID</th>
        <th>操作</th>
    </tr>
    <tbody id="content">


    <#if list??>
    <#list list.list as item>
        <tr class="count">
            <td>
                <label class="priority"
                       id="priority_${item_index}"><#if item.priority??>${item.priority?c}</#if></label>
                <label style="display: none" class="id" id="id_${item_index}"><#if item.id??>${item.id?c}</#if></label>
                <label style="display: none" id="index_${item_index}">${item_index}</label>
            </td>
            <td>
                <label class="labelName"
                       id="labelName_${item_index}"><#if item.labelName??>${item.labelName}</#if></label>
            </td>
            <td>
                <label class="targetValue"
                       id="targetValue_${item_index}"><#if item.targetValue??>${item.targetValue}</#if></label>
            </td>
            <td>
                <label class="targetType" style="display: none"
                       id="targetType_${item_index}"><#if item.targetType??>${item.targetType}</#if></label>
                <label>
                    <#if item.targetType??>
                        <#if item.targetType==1>当前页打开H5</#if>
                        <#if item.targetType==2>当前页打开本地页</#if>
                        <#if item.targetType==3>新页打开H5</#if>
                        <#if item.targetType==4>新页打开本地页</#if>
                    </#if>
                </label>
            </td>
            <td>
                <label class="appType" style="display: none"
                       id="appType_${item_index}"><#if item.appType??>${item.appType}</#if></label>
                <label>
                    <#if item.appType??>
                        <#if item.appType==0>iOS</#if>
                        <#if item.appType==1>Android</#if>
                        <#if item.appType==2>微信商城</#if>
                    </#if>
                </label>
            </td>
            <td>
                <label class="appVersion"
                       id="appVersion_${item_index}"><#if item.appVersion??>${item.appVersion}</#if></label>
            </td>
            <td>
                <label class="storeId" id="storeId_${item_index}"><#if item.storeId??>${item.storeId}</#if></label>
            </td>
            <td>
            <#--<button onclick="deleteLabel(${item_index})">使标签失效</button>-->
                <!-- 按钮触发模态框 -->

                <button <#if item.deleted==1>hidden</#if> id="delete_${item_index}" data-index="${item_index}"
                        data-target="#myModal" onclick="deleteLabel(${item_index})">使标签失效
                </button>
                <button <#if item.deleted==1>hidden</#if> id="edit_${item_index}" onclick="updateLabel(${item_index})">
                    修改
                </button>
                <button <#if item.deleted==0>style="display: none"</#if> id="deleted_${item_index}" disabled>已失效
                </button>
            </td>
        </tr>
    </#list>
    </#if>
    </tbody>
</table>
<div style="text-align: center;">
    <div id="noData" style="display: none">暂无数据</div>
    <ul id='bp-3-element-test'></ul>
</div>
</html>


<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">请确认</h4>
            </div>
            <div class="modal-body">是否确定要使它失效
                <table class="gridtable" align="center" border="1px">
                    <tr>
                        <th>标签位置</th>
                        <th>标签名称</th>
                        <th>跳转链接</th>
                        <th>跳转类型</th>
                        <th>客户端类型</th>
                        <th>生效版本</th>
                        <th>生效门店ID</th>
                    </tr>
                    <tr>
                    <tr>
                        <td>
                            <label id="priority_modal"></label>
                            <input hidden id="id_modal"></input>
                            <input hidden id="index_modal"></input>
                        </td>
                        <td>
                            <label id="labelName_modal"></label>
                        </td>
                        <td>
                            <label style="max-width: 250px; word-break: break-all" singleLine="false"
                                   id="targetValue_modal"></label>
                        </td>
                        <td>
                            <label id="targetType_modal"></label>
                        </td>
                        <td>
                            <label id="appType_modal"></label>
                        </td>
                        <td>
                            <label id="appVersion_modal"></label>
                        </td>
                        <td>
                            <label id="storeId_modal"></label>
                        </td>
                    </tr>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" onclick="deleteLabelConfirm()">确认</button>
            </div>
        </div>
    </div>
</div>



