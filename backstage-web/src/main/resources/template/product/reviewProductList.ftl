
<html>
<head>
    <title>商品审核管理</title>
     <#include "../ahead.ftl">
    <#include "../treeview.ftl" >
    <#include "../treetable.ftl" >
    <script type="text/javascript" src="/static/artDialog/jquery.artDialog.js?skin=green"></script>
    <script type="text/javascript" src="/static/artDialog/plugins/iframeTools.source.js"></script>
    <script type="text/javascript" src="/static/artDialog/plugins/iframeTools.source.js"></script>
    <script type="text/javascript" src="/static/jquery-validation/1.14.0/jquery.validate.js"></script>
    <script type="text/javascript" src="/static/artDialog/jquery.artDialog.js?skin=green"></script>
    <script type="text/javascript" src="/static/artDialog/plugins/iframeTools.source.js"></script>
    <script src="/static/bootstrap/bootstrap-paginator.js" type="text/javascript"></script>
    <script type="text/javascript">
    /**
     *查询
     */
    function query(pageCount) {
        var storeId = $("#storeIds option:selected").val();
        var storeName = $("#storeIds option:selected").text();
        var reviewStatus = $("#reviewStatus option:selected").val();
        var merchantIds = $('#merchantIds').val()
        var merchantName = $('#merchantName').val();
        var productIds = $.trim($('#productIds').val());
        var r = /^\+?[1-9][0-9]*$/;　　//判断是否为正整数
        var url = "/product/reviewProductList?";

        if(!storeId) {
            layer.tips('请选择对应门店', $('#storeIds'), {tips: [2,'#ba081d']});
            return;
        }else {
            url +="storeId="+storeId;
        }

        if (storeName) {
            url += "&storeName="+storeName;
        }
        if (reviewStatus){
            url += "&reviewStatus="+reviewStatus;
        }
        if (merchantIds){
            if (r.test(merchantIds)) {
                url += "&merchantIds="+merchantIds;
            } else {
                layer.tips('请输入有效数字', $('#merchantIds'), {tips: [2,'#ba081d']});
                return;
            }
        }
        if (merchantName){
            url +="&merchantName="+merchantName
        }
        if (productIds ){
            var flg = false;
            var split = productIds.split(',');
            if (split.length > 0 ) {
                for (var i = 0 ;i < split.length; i++ ) {
                    if (!r.test(split[i])){
                        flg = true;
                    }
                }
            }
            if (flg){
                layer.tips('请输入有效数字', $('#productIds'), {tips: [2,'#ba081d']});
                return;
            } else {
                url += "&productIds="+productIds;
            }
        }
        if (pageCount) {
            url += "&pageCount="+pageCount+"&pageSize=10";
        }

        window.location.href = url;

    }

    /**
     * 重置
     */
    function resetQuery() {
        $("#merchantIds").val("");
        $("#storeIds").val("");
        $("#merchantName").val(""),
        $("#productIds").val("");
        $("#reviewStatus").val(0);
    }

    /**
     * 查看详情
     */
    function checkDetails(queueId, reviewStatus,storeName) {

        var title = "";
        if (reviewStatus == 0 ) {
            title = '商品审核信息';
        }else {
            title = '商品详情';
        }
        $.artDialog.open("/product/reviewProductInfo?queueId=" + queueId+"&storeName="+storeName+"&reviewStatus="+reviewStatus, {
            title : title,
            width : 900,
            height : 800,
            lock : true,
            cancelVal: "取消",
            close: function () {
                query();
            }
        });
    }


   $(function () {
       //分页
       var element = $('#element');
       var options = {
           bootstrapMajorVersion: 3,             //bootstrap的版本要求
           currentPage: ${pageInfo.pageNum},     //设置当前页
           numberOfPages: ${pageInfo.pages},     //设置可以点击到的页数范围
           totalPages: ${pageInfo.pages},
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
               query(page);
           }
       }
       element.bootstrapPaginator(options);
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
    </style>


</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="ibox">

        <div class="ibox-content">



                <table  style="border-collapse:separate; border-spacing:0px 10px; width: 99%" align="center" >

                <tr style="margin-right: 10px">
                    <td>
                        <label>门店</label>
                        <select id="storeIds" style="width: 200px;height: 32px;">
                            <option value="">请选择</option>
                             <#if storeList??>
                                 <#list storeList as store>
                                    <option <#if storeId??><#if storeId==store.id>selected="selected"</#if></#if>value="<#if store.id??>${store.id}</#if>"><#if store.name??>${store.name}</#if></option>
                                 </#list>
                             </#if>


                        </select>
                    </td>
                    <td>
                    <td>
                        <label>商户id</label>
                        <input id="merchantIds" name="merchantIds" <#if merchantIds??>value="<#list merchantIds as merchantId>${merchantId?c}</#list>"</#if>/>
                    </td>
                    </td>
                    <td>
                        <label>商户名称</label>
                        <input id="merchantName" name="merchantName" <#if merchantName??>value="${merchantName}"</#if>/>
                    </td>
                    <td>
                        <label>商品Id</label>
                        <textarea id="productIds"  name="productIds" placeholder="用英文逗号分隔" style="height: 32px;margin-bottom: -10px;">
                            <#if productIds??>${productIds}</#if>

                        </textarea>
                    </td>

                    <td>
                        <label>审核状态</label>
                        <select id="reviewStatus" style="width: 200px;height: 32px;">
                            <option <#if reviewStatus??> <#if reviewStatus==0>selected="selected"</#if></#if> value="0">待审核</option>
                            <option <#if reviewStatus??> <#if reviewStatus==1>selected="selected"</#if></#if>value="1">审核通过</option>
                            <option <#if reviewStatus??> <#if reviewStatus==2>selected="selected"</#if></#if>value="2">审核不通过</option>
                        </select>
                    </td>
                    <td>
                        <button class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="query();" ><i class="fa fa-search"></i> 查询</button>
                        <button class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="resetQuery()" ><i class="fa fa-search"></i>重置</button>
                    </td>
                </tr>
            </table>

            <table id="contentTable" class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footer" style="text-align: center">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>门店</th>
                    <th>商户id</th>
                    <th>商户名称</th>
                    <th>商品id</th>
                    <th>商品名称</th>
                    <th>审核状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="contentBody">
                    <#if list??>
                        <#list list as obj>
                            <tr>
                                <td>${pageInfo.startRow+obj_index}</td>
                                <td><#if storeName??>${storeName}</#if></td>
                                <td><#if obj.merchantId??>${obj.merchantId?c}</#if></td>
                                <td><#if obj.merchantName??>${obj.merchantName}</#if></td>
                                <td><#if obj.productId??>${obj.productId?c}</#if></td>
                                <td><#if obj.title??>${obj.title}</#if></td>
                                <td>
                                 <#if obj.reviewStatus?? >
                                    <#if obj.reviewStatus==0>待审核</#if>
                                    <#if obj.reviewStatus==1>审核通过</#if>
                                    <#if obj.reviewStatus==2>审核不通过</#if>
                                 </#if>

                                </td>
                                <td>
                                    <button class="btn btn-primary btn-rounded btn-outline" onclick="checkDetails(${obj.queueId},${obj.reviewStatus},'${storeName}')">
                                        <#if obj.reviewStatus??>
                                            <#if obj.reviewStatus==0>审核信息
                                                <#else >
                                                    查看详情
                                            </#if>
                                        </#if>
                                    </button>
                                </td>
                            </tr>
                        </#list>
                    </#if>
                </tbody>
            </table>
            <br/>
            <div style="text-align: center;">
                <div id="noData" style="display: none">暂无数据</div>
                <ul id='element'></ul>
            </div>

        </div>
    </div>
</div>
</body>
</html>
