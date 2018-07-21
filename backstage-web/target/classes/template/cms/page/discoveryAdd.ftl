<html>
<head>
    <title>新品发现</title>

    <meta name="decorator" content="default"/>

    <script src="/static/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <link href="/static/bootstrap/3.3.4/css_default/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <script src="/static/bootstrap/3.3.4/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="/static/awesome/4.4/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="/static/common/css/style.css?v=3.2.0" type="text/css" rel="stylesheet"/>

    <script type="text/javascript" src="/static/artDialog/jquery.artDialog.js?skin=green"></script>
    <script type="text/javascript" src="/static/artDialog/plugins/iframeTools.source.js"></script>
    <style>
        .button {
            background-color: #4A90E2; /* Green */
            border: none;
            color: white;
            padding: 10px 21px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
        }
    </style>

</head>

<h1 align="center">新品发现</h1>


<#if productIds??>
<input hidden value="${productIds}" name="productIds" id="productIds"/>
</#if>
<#if moduleTypeId??>
<input hidden value="${moduleTypeId?c}" name="moduleTypeId" id="moduleTypeId"/>
</#if>
<#if moduleId??>
<input hidden value="${moduleId?c}" name="moduleId" id="moduleId"/>
</#if>
<#if templateId??>
<input hidden value="${templateId?c}" name="templateId" id="templateId"/>
</#if>
<#if storeId??>
<input hidden value="${storeId?c}" name="storeId" id="storeId"/>
</#if>

<#if cmd??><input id="cmd" hidden value="${cmd}"/></#if>
<input id="id" hidden value="<#if id??>${id?c}</#if>"/>
<table align="center">
    <thead>
    <tr>
        <td>
            <label>位置:</label>
            <input <#if cmd=="update">disabled</#if> id="sort" name="sort" value="<#if sort??>${sort?c}</#if>"/><label id="sortTip" style="color: red"></label>
            <script>
                $("#sort").change(function () {
                    $.get("/cms/page/verifyLocation?templateId=<#if templateId??>${templateId?c}</#if>&moduleId=<#if moduleId??>${moduleId?c}</#if>&sort=" + $("#sort").val(), function (data) {
                        if (data) {
                            $("#sortTip").text("该位置已有资源!");
                        } else {
                            $("#sortTip").text("");
                        }
                    });
                });
            </script>
        </td>
    </tr>
    </thead>
    <tr style="border-bottom: solid 1px ">
        <td>
            <table>
                <tr>
                    <td></td>
                    <td>
                        <label class="tips" id="tips" style="color: red"></label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>商品ID:</label>
                    </td>
                    <td>
                        <input id="productId" name="productId" value="<#if productId??>${productId?c}</#if>"></input>
                        <input hidden id="hasProduct" value="<#if productId??>${productId?c}</#if>"/>
                        <button id="query">查询</button>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>商品名称:</label>
                    </td>
                    <td>
                        <label id="productTitle"><#if productTitle??>${productTitle}<#else>--</#if></label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>副标题:</label>
                    </td>
                    <td>
                        <label id="productSubtitle"><#if productSubtitle??>${productSubtitle}</#if></label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>商品展示价格:</label>
                    </td>
                    <td>
                        <label id="productPrice">
                            <#if price??>${price?c}<#else>--</#if>
                        </label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>图片:</label>
                    </td>
                    <td>
                        <img id="productImg" src="<#if image??>${image}</#if>" width="100px">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>可售库存:</label>
                    </td>
                    <td>
                        <label id="productStock">
                            <#if stock??>${stock?c}<#else>--</#if>
                        </label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>可售状态:</label>
                    </td>
                    <td>
                        <label id="status">
                            <#if status??>${status}<#else>--</#if>
                        </label>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td align="right">
                        <input type="button" class="button" id="save" value="保存"></input>
                    </td>
                </tr>
            </table>
        </td>
    </tr>

</table>

<script>
    //判断该商品是否存在的标识
    var isProductExist = false;

    $("#save").click(function () {

        var sort = $("#sort").val();
        if (!sort) {
            alert("请填写[位置]");
            return;
        }

    <#if cmd=="save">
        var tip = $("#sortTip").text();
        if (tip) {
            alert("该位置已有资源");
            return;
        }
    </#if>
        var productId = $("#productId").val();
        if (!productId) {
            alert("商品ID不能为空");
            return;
        }
        var hasProduct = $("#hasProduct").val();
        if (!hasProduct&&!productId) {
            alert("该商品不存在");
            return;
        }
        if (isProductExist){
            alert("该商品不存在");
            return;
        }
        var status =  $("#status").html();
        if(status=="不在该门店销售"||status=="仅线下可售"||status=="不可售"){
            alert("有该门店不可售的商品");
            return;
        }
        var cmd = $("#cmd").val();

        var id = $("#id").val();
        var moduleId = $("#moduleId").val();
        var templateId = $("#templateId").val();
        var str = "保存成功";
        $.get("/cms/page/discovery/edit?cmd="+cmd
                +"&sort="+sort
                +"&productId="+productId
                +"&moduleId="+moduleId
                +"&templateId="+templateId
                + "&id=" + id, function (data) {
            if (!data) {
                str = "保存失败";
            }
            alert(str);
            $.artDialog.close();
        });
    });



    function query() {
        var productId = $("[name='productId']").val();
        var storeId = $("#storeId").val();
        var productIds = $("#productIds").val();
        var attr =  productIds.split(",");
        var cmd = $("#cmd").val();

        for(var i =0;i<attr.length;i++){
            if(productId==attr[i]&&productId!=""&&productId!=null){
                alert("此模块以包含此商品");
                $("[name='productId']").val("");
                $("#productImg").attr("src", "");
                $("#productPrice").html("");
                $("#productStock").html("");
                $("#productTitle").html("");
                $("#status").html("");
                $("#productSubtitle").html("");
                return;
            }
        }

        $.get("/product/productInfo?storeId=" + storeId + "&productId=" + productId, {}, function (result) {
            if (result) {
                $("#productImg").attr("src", result.productImage);
                $("#productPrice").html(result.price);
                $("#productSubtitle").html(result.productSubtitle);
                $("#productStock").html(result.stock);
                $("#productTitle").html(result.productTitle);
                $("#status").html(result.status);
                $("#hasProduct").html(productId);
                if (result.status == "不在该门店销售") {
                    $("#tips").text("该门店无此商品");
                } else {
                    $("#tips").text("");
                }
                isProductExist = false;
            } else {
                alert("该商品不存在");
                isProductExist = true;
                $("#productImg").attr("src", "");
                $("#productPrice").html("");
                $("#productStock").html("");
                $("#productTitle").html("");
                $("#status").html("");
                $("#hasProduct").html("");
                $("#productSubtitle").html("");
            }
        });
    }

    $("#query").click(function () {
        query();
    });
    $("#productId").change(function () {
        query();
    });
</script>

</html>