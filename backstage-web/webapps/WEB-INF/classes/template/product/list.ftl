
<html>
<head>
    <title>商品管理后台</title>
    <#--<#include "../ahead.ftl">-->

    <script src="/static/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="/static/layer-v2.3/layer/layer.js"></script>
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


        function editProduct(index) {
            var productId = $("#productId_" + index).text();
            var storeId = $("#storeId_" + index).val();
            var productName = $("#productName_" + index).text();
            var storeName = $("#storeName_" + index).text();
            var subTitle = $("#subTitle_" + index).text();
            var salesInventory = $("#salesInventory_" + index).text();
            var haveImage = $("#haveImage_" + index).text();
            var originPrice = $("#originPrice_" + index).text();
            var saleStatus = $("#saleStatus_" + index).text();
            var saleStatusType = $("#saleStatusType_" + index).val();
            $.artDialog.open("/product/edit/view?productId=" + productId
                    + "&productName=" + encodeURIComponent(productName)
                    + "&storeName=" + storeName
                    + "&subTitle=" + subTitle
                    + "&salesInventory=" + salesInventory
                    + "&haveImage=" + (haveImage == "有")
                    + "&originPrice=" + originPrice
                    + "&saleStatus=" + saleStatus
                    + "&saleStatusType=" + saleStatusType
                    + "&storeId=" + storeId
                    , {
                title : "单个编辑",
                width : 400,
                height : 360,
                lock : true,
                cancelVal: "取消",
                close: function () {
                    query();
                }
            });
        }

        function editProductBatch() {
            var products = document.getElementsByName("product");
            var productIds = "";
            for (var i = 0; i < products.length; i++) {
                if ($(products[i]).prop("checked")) {
                    productIds += $("#productId_" + ($(products[i]).data("index"))).text() +":"
                            + $("#saleStatusType_" + ($(products[i]).data("index"))).val() +":"
                            + $("#haveImage_" + ($(products[i]).data("index"))).text() +":"
                            + ",";
                }
            }
            if (!productIds) {
                alert("没有选中的选项!!!");
                return;
            }
            $.artDialog.open("/product/edit/batch/view?productIds=" + productIds + "&storeId=" + $("#storeId").val(), {
                title : "批量编辑",
                width : 400,
                height : 300,
                lock : true,
                cancelVal: "取消",
                close: function () {
                    query();
                }
            });
        }


        $(function () {
            $(".pageButton").click(function () {
                // alert($(this).data("page"));
                $("#currentPage").val($(this).data("page"));
                query();
            });

            $("#currentPage").change(function () {
                if (parseInt($(this).val()) > parseInt($("#pages").text())) {
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

        function query(flag) {

            var productIds = $("#productIds").val();
            //正则校验
            var r = /^[0-9,]+$/;
            if (productIds && !r.test(productIds)) {
                layer.tips('请输入有效数字', $('#productIds'), {tips: [2,'#ba081d']});
                return;
            }
            var currentPage = 1;
            if(flag===1){
                currentPage = 1;
            }else {
                currentPage = $("#currentPage").val()
            }
            $.get("/product/list/data", {
                "storeId" : $("#storeId").val(),
                "categoryId" : $("#categoryId").val(),
                "productIdStr" : productIds,
                "productName" : $("#productName").val(),
                "saleStatus" : $("#saleStatus").val(),
                "createEndTimeStr" : $("#createEndTime").val(),
                "currentPage" : currentPage,
                "pageCount" : $("#pageCount").val()
            }, function (data) {
                var list = data.productListTOList;
                var content = "";
                if (list) {
                    for (var i = 0; i < list.length; i++) {
                        var row = list[i];

                        content += "<tr><td>" + (row.saleStatusType != 0 || row.productId.toString().length >=9 ? "<input type='checkbox' name='product' class='product' data-index='"+ (i + 1) +"' style='width: 33px'/>" : "") + "<label id=\"productId_" + (i + 1) + "\">" + row.productId + "</label></td>" +
                                "<td><label id=\"storeName_" + (i + 1) + "\">" +
                                row.storeName + "</label><input type='hidden' id='storeId_"+ (i + 1) +"' value='"+row.storeId+"'/></td>" +
                        "<td><label id=\"productName_" + (i + 1) + "\">"+ row.productName + "</label></td><td><label id=\"subTitle_" + (i + 1) + "\">"+ (row.subTitle ? row.subTitle : "") + "</label></td>" +
                        "<td><label id=\"salesInventory_" + (i + 1) + "\">"+ (row.salesInventory ? row.salesInventory : 0) + "</label></td><td><label id=\"haveImage_" + (i + 1) + "\">"+ (row.haveImage ? "有" : "无") + "</label></td>" +
                        "<td><label id=\"originPrice_" + (i + 1) + "\">"+ (row.originPrice ? row.originPrice : "") + "</label></td>" +
                        "<td><label id=\"saleStatus_" + (i + 1) + "\">"+ row.saleStatus + "</label><input type='hidden' id='saleStatusType_"+(i + 1)+"' value='" + row.saleStatusType + "'/>" + "</td>" + "<td>" + "<button onclick='editProduct(" + (i+1) + ")'>修改商品信息</button>" + "</td></tr>";

                    }
                    content += "<tr><td><input type='checkbox' class='allProduct' onchange='quanxuan(this)' style='width: 33px'/>全选</td><td colspan='7'></td><td><button onclick='editProductBatch()'>批量修改商品信息</button></td></tr>";
                }

                $("#contentBody").html(content);
                var pageInfo = data.basePagination;
                if (pageInfo) {
                    $("#currentPageLabel").text(pageInfo.currentPage);
                    $("#currentPage").val(pageInfo.currentPage);
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

        function quanxuan(a) {
            /*$(".storeProductCheckbox").prop("checked", $(".allStoreProductCheckbox").prop("checked"));*/
            var ck =document.getElementsByName("product");
            //遍历所有复选框，设置选中状态。
            for(var i=0;i<ck.length;i++) {
                //判断全选按钮的状态是不是选中的
                if(a.checked){
                    ck[i].checked=true;//如果是选中的，就让所有的状态为选中。
                } else {
                    ck[i].checked=false;//如果不是选中的，就移除所有的状态是checked的选项。
                }
            }
        }

        $(function() {
            $("#choseCategory").click(function() {
                $.artDialog.open("/product/category/chose", {
                    title : "选择分类",
                    width : 400,
                    height : 600,
                    lock : true,
                    cancelVal: "取消",
                    close: function () {
                        /*art.dialog.open.origin.location.href="/seckill/list";*/
                        //query();
                        var selectedId = $.artDialog.data("selectedId");
                        var selectedName = $.artDialog.data("selectedName");
                        $("#categoryName").text(selectedName)
                        $("#categoryId").val(selectedId)
                    }
                });
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

        .query {
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

            <table  style="border-collapse:separate; border-spacing:0px 10px; width: 99%" align="center" >

                <tr style="margin-right: 10px">
                    <td>
                        <label>所在门店</label>
                        <select id="storeId">
                            <#if storeList??>
                            <#list storeList as store>
                                <option value="<#if store.id??>${store.id}</#if>"><#if store.name??>${store.name}</#if></option>
                            </#list>
                            </#if>
                        </select>
                    </td>
                    <td>
                        <label>商品分类</label>
                        <div style="display: inline-block;">
                            <input id="categoryId" type="hidden"/>
                            <label id="categoryName" style="color: forestgreen"></label><br/>
                            <button id="choseCategory">选择分类</button>
                        </div>
                    </td>
                    <td>
                        <label>商品ID</label>
                        <textarea id="productIds" placeholder="用英文逗号分隔"></textarea>
                    </td>
                    <td>
                        <label>商品名称</label>
                        <input id="productName"/>
                    </td>
                    <td>
                        <label>销售状态</label>
                        <select id="saleStatus">
                            <option value="">全部</option>
                            <option value="3">仅线下可售</option>
                            <option value="2">仅线上可售</option>
                            <option value="1">线上线下可售</option>
                            <option value="0">不可售</option>
                        </select>
                    </td>
                    <td>
                        <button class="query" id="productQueryButton" onclick="query(1)">查询</button>
                    </td>
                </tr>
            </table>

            <!-- 工具栏 -->
           <#-- <div class="row" style="margin: 10px">
                <div class="col-sm-12">
                    <div class="pull-left" style="margin:5px 0 15px 0;">
                        <button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="query()"><i class="fa fa-search"></i> 查询</button>
                        <button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="resetQuery()" ><i class="fa fa-refresh"></i> 重置查询条件</button>
                    </div>
                </div>
            </div>-->

            <table id="contentTable" class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footer" style="text-align: center">
                <thead>
                <tr>
                    <th>商品ID</th>
                    <th>所在门店</th>
                    <th>商品名称</th>
                    <th>副标题</th>
                    <th>可售库存</th>
                    <th>商品图</th>
                    <th>正常售价</th>
                    <th>销售状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="contentBody">

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
                                <option value="50" <#if pageInfo.pageCount??&&pageInfo.pageCount==50>selected</#if>>50</option>
                                <option value="100" <#if pageInfo.pageCount??&&pageInfo.pageCount==100>selected</#if>>100</option>
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
            <input id="modalActivityId" type="hidden"/></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button id="stop" type="button" class="btn btn-primary">终止</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>