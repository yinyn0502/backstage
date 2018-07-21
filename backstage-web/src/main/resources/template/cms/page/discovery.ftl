
<html>
<head>
    <title>新品发现</title>

    <meta name="decorator" content="default"/>

    <script src="/static/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <link href="/static/bootstrap/3.3.4/css_default/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="/static/bootstrap/3.3.4/js/bootstrap.min.js"  type="text/javascript"></script>
    <link href="/static/awesome/4.4/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/static/common/css/style.css?v=3.2.0" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="/static/artDialog/jquery.artDialog.js?skin=green"></script>
    <script type="text/javascript" src="/static/artDialog/plugins/iframeTools.source.js"></script>
    <style>
        .add {
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

<#if moduleTypeId??>
<input hidden value="${moduleTypeId}" name="moduleTypeId" id="moduleTypeId"/>
</#if>
<#if moduleIds??>
<input hidden value="${moduleIds}" name="moduleIds" id="moduleIds"/>
</#if>
<#if templateId??>
<input hidden value="${templateId?c}" name="templateId" id="templateId"/>
</#if>
<#if storeId??>
<input hidden value="${storeId?c}" name="storeId" id="storeId"/>
</#if>
<table align="center">
    <thead>
    <tr>
        <td>
            <label>数量限制: <#if min??>${min}</#if>~<#if max??>${max}</#if>个</label>
            <div style="display: inline-block; width: 100px"></div>
            <button id="add" class="add">添加</button>
        </td>
    </tr>
    </thead>
    <#if resourceInfoList??>
    <#list resourceInfoList as item>
    <tr class="count" style="border-bottom: solid 1px ">
        <td>
            <table>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <label>位置:</label>
                                </td>
                                <td>
                                    <label id="sort_${item_index}"><#if item.sort??>${item.sort?c}</#if></label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>图片:</label>
                                </td>
                                <td>
                                    <img id="image_${item_index}" src="<#if item.productImage??>${item.productImage}</#if>" width="100px">
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <label>商品ID:</label>
                                </td>
                                <td>
                                    <label id="productId_${item_index}"><#if item.productId??>${item.productId?c}<#else>--</#if></label>
                                    <#if item.id??><input id="id_${item_index}" hidden value="${item.id?c}"/></#if>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>商品名称:</label>
                                </td>
                                <td>
                                    <label id="productTitle_${item_index}"><#if item.productTitle??>${item.productTitle}<#else>--</#if></label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>副标题:</label>
                                </td>
                                <td>
                                    <label id="productSubtitle_${item_index}"><#if item.productSubtitle??>${item.productSubtitle}</#if></label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>商品价格:</label>
                                </td>
                                <td>
                                    <label id="price_${item_index}"><#if item.price??>${item.price?c}<#else>0</#if></label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>可售库存:</label>
                                </td>
                                <td>
                                    <label id="stock_${item_index}"><#if item.stock??>${item.stock?c}<#else>0</#if></label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>可售状态:</label>
                                </td>
                                <td>
                                    <label id="status_${item_index}"><#if item.status??>${item.status}<#else>--</#if></label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td align="right">
                        <button class="delete" id="delete_${item_index}" data-index="${item_index}">删除</button>
                        <button class="update" id="update_${item_index}" data-index="${item_index}">修改</button>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style="height: 45px"></div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    </#list>
    </#if>
</table>

<script>
        $("#add").click(function () {
            var templateId = $("#templateId").val();
            var moduleIds = $("#moduleIds").val();
            var storeId = $("#storeId").val();
            var count = $(".count").size();
            if (count>=10){
                alert("最多10个嗷");
                return;
            }
            var productIds = "";

            for(var i=0;i<count;i++){
                var productId = $("#productId_"+i).html();

                productIds=productIds+productId+",";

            }


            $.artDialog.open("/cms/page/discovery/edit/view?cmd=save" + "&templateId=" + templateId
                    + "&moduleId=" + moduleIds
                    + "&storeId=" + storeId
                    +"&productIds="+productIds
                    ,{
                id: "discovery",
                width:500,
                height:400,
                title:"新品发现添加",
                close : function () {
                    art.dialog.open.origin.location.href="/cms/page/discovery?moduleIds="+$("#moduleIds").val()+"&templateId="+$("#templateId").val()+"&storeId="+$("#storeId").val();
                }
            });
        });

        $(".update").click(function () {
            var index = $(this).data("index");
            var productIds = "";
            var count = $(".count").size();
            for(var i=0;i<count;i++){
                if(i!=index){
                    var productId = $("#productId_"+i).html();
                    productIds=productIds+productId+",";
                }
            }

            var sort = $("#sort_" + index).text();
            var productId = $("#productId_" + index).text();
            var id = $("#id_" + index).val();
            var image = $("#image_" + index).attr("src");
            var productTitle = $("#productTitle_" + index).text();
            var productSubtitle = $("#productSubtitle_"+index).text();
            var price = $("#price_" + index).text();
            var stock = $("#stock_" + index).text();
            var status = $("#status_" + index).text();
            var templateId = $("#templateId").val();
            var moduleIds = $("#moduleIds").val();
            $.artDialog.open("/cms/page/discovery/edit/view?cmd=update&id="+id
            +"&sort=" + sort
            +"&image=" + image
            +"&productTitle=" + productTitle
            +"&productSubtitle=" + productSubtitle
            +"&price=" + price
            +"&stock=" + stock
            +"&status=" + status
            + "&productId=" + productId
            + "&templateId=" + templateId
            + "&moduleId=" + moduleIds
            +"&productIds="+productIds
            <#if storeId??>+"&storeId=${storeId}"</#if>
                    ,{
                id: "discovery",
                width:500,
                height:400,
                title:"新品发现编辑",
                close : function () {
                    art.dialog.open.origin.location.href="/cms/page/discovery?moduleIds="+$("#moduleIds").val()+"&templateId="+$("#templateId").val()+"&storeId="+$("#storeId").val();
                }
            });
        });
        $(".delete").click(function () {
            var count = $(".count").size();
            if (count<=4){
                alert("最少4个嗷");
                return;
            }

            var index = $(this).data("index");
            var id = $("#id_" + index).val();
            $.get("/cms/moduleResource/delete?id="+id, function (data) {
                if (!data) {
                    alert("失败, id:"+id);
                } else {
                    alert("成功, id:"+id);
                }
                art.dialog.open.origin.location.href="/cms/page/discovery?moduleIds="+$("#moduleIds").val()+"&templateId="+$("#templateId").val()+"&storeId="+$("#storeId").val();
            });
        });

</script>

</html>