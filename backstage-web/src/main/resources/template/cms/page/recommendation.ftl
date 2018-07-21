<html>
<head>
    <title>banner</title>

    <meta name="decorator" content="default"/>
<#--    <#include "../../ahead.ftl">
    <#include "../../treeview.ftl" >
    <#include "../../treetable.ftl" >-->

    <script src="/static/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <link href="/static/bootstrap/3.3.4/css_default/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="/static/bootstrap/3.3.4/js/bootstrap.min.js"  type="text/javascript"></script>
    <link href="/static/awesome/4.4/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/static/common/css/style.css?v=3.2.0" type="text/css" rel="stylesheet" />

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

<h1 align="center">买手推荐</h1>

<#if moduleTypeId??>
<input hidden value="${moduleTypeId?c}" name="moduleTypeId" id="moduleTypeId"/>
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
                <label>数量限制:3~6个</label>
            </td>
            <td align="right">
                <button class="button" id="add">添加</button>
            </td>
        </tr>
    </thead>
    <tbody>
    <#if cmsRecommendationVOList??>
    <#list cmsRecommendationVOList as item>
        <tr class="count">
            <td>
                <tr>
                    <td>
                        <hr style=" height:2px;border:none;border-top:2px dotted #185598;" />
                        <label>位置:</label>
                        <label id="sort_${item_index}"><#if item.sort??>${item.sort?c}</#if></label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="350px">
                            <tr>
                                <td>
                                    <label>买手名称:</label>
                                </td>
                                <td>
                                    <label id="buyer_${item_index}"><#if item.buyer??>${item.buyer}</#if></label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>商品图</label>
                                </td>
                                <td>
                                    <img id="headImage_${item_index}" src="<#if item.headImage??>${item.headImage}</#if>" href="头像图" width="150px">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>文案:</label>
                                </td>
                                <td>
                                    <label id="document_${item_index}"><#if item.document??>${item.document}</#if></label>
                                </td>
                            </tr>
                            <#if item.isMore??&&item.isMore>
                            <tr>
                                <td>
                                    <label style="color: palevioletred">更多推荐</label>
                                    <input hidden id="isMore_#{item_index}" disabled type="checkbox" checked="<#if item.isMore??>${item.isMore?c}</#if>"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>页面文件:</label>
                                    <label style="color: green" id="filePath_${item_index}"><#if item.filePath??>${item.filePath}</#if></label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>页面标题:</label>
                                    <label id="title_${item_index}"><#if item.title??>${item.title}</#if></label>
                                </td>
                            </tr>
                            </#if>
                        </table>
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <label>商品ID:</label>
                                </td>
                                <td>
                                    <label id="productId_${item_index}"><#if item.productId??>${item.productId?c}</#if></label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>商品图:</label>
                                </td>
                                <td>
                                    <img id="productImage_${item_index}" src="<#if item.productImage??>${item.productImage}</#if>" href="头像图" width="150px">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>商品价格:</label>
                                </td>
                                <td>
                                    <label id="price_${item_index}"><#if item.price??>${item.price?c}</#if></label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>商品名称:</label>
                                </td>
                                <td>
                                    <label id="productTitle_${item_index}"><#if item.productTitle??>${item.productTitle}</#if></label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>副标题:</label>
                                </td>
                                <td>
                                    <label id="productSubTitle_${item_index}"><#if item.productSubTitle??>${item.productSubTitle}</#if></label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>可售库存:</label>
                                </td>
                                <td>
                                    <label id="stock_${item_index}"><#if item.stock??>${item.stock?c}</#if></label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>销售状态:</label>
                                </td>
                                <td>
                                    <label id="status_${item_index}"><#if item.status??>${item.status}</#if></label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr align="right">
                    <td>
                        <div style="text-align: right; padding-right: 30px">
                            <input hidden id="id_${item_index}" value="<#if item.id??>${item.id?c}</#if>"/>
                            <button class="button delete" data-index="${item_index}">删除</button>
                            <button class="button update" id="update_" data-index="${item_index}">修改</button>
                        </div>
                    </td>
                </tr>
            </td>
        </tr>
    </#list>
    </#if>
    </tbody>
</table>


<script>
    $(function () {
        $("#add").click(function () {
            var count = $(".count").size();
            if (count>=6){
                alert("最多添加6个");
                return;
            }
            var productIds = "";
            for(var i=0;i<count;i++){
                var productId=$("#productId_"+i).text();
                productIds=productIds+productId+",";
            }


            var moduleId = $("#moduleIds").val();
            var templateId = $("#templateId").val();
            $.artDialog.open("/cms/page/recommendation/edit/view?cmd=save"
                    +"&storeId=<#if storeId??>${storeId?c}</#if>"
                    + "&moduleId=" + moduleId
                    + "&templateId=" + templateId
                    + "&productIds=" + productIds
                    , {
                width:1200,
                height:600,
                close: function () {
                    art.dialog.open.origin.location.href="/cms/page/recommendation?moduleIds="+$("#moduleIds").val()+"&templateId="+$("#templateId").val()+"&storeId="+$("#storeId").val();
                }
            });
        });

        $(".delete").click(function () {
            var count = $(".count").size();
            if (count<=3){
                alert("不能再删啦，最少得有3条");
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
                art.dialog.open.origin.location.href="/cms/page/recommendation?moduleIds="+$("#moduleIds").val()+"&templateId="+$("#templateId").val()+"&storeId="+$("#storeId").val();
            });
        });
        $(".update").click(function () {
            var count = $(".count").size();
            var index = $(this).data("index");

            var productIds = "";
            for(var i=0;i<count;i++){
                if(i!=index){
                    productIds=productIds+$("#productId_"+i).text()+",";
                }
            }
            var productId = $("#productId_" + index).text();
            var id = $("#id_" + index).val();
            var moduleId = $("#moduleIds").val();
            var templateId = $("#templateId").val();
            var sort = $("#sort_" + index).text();
            var buyer = $("#buyer_" + index).text();
            var headImage = $("#headImage_" + index).attr("src");
            var document = $("#document_" + index).text();
            var productImage = $("#productImage_" + index).attr("src");
            var price = $("#price_" + index).text();
            var productTitle = $("#productTitle_" + index).text();
            var productSubTitle = $("#productSubTitle_" + index).text();
            var stock = $("#stock_" + index).text();
            var status = $("#status_" + index).text();
            var filePath = $("#filePath_" + index).text();
            var isMore = $("#isMore_" + index).prop("checked");
            if (!isMore) {
                isMore = false;
            }
            var title = $("#title_" + index).text();
            $.artDialog.open("/cms/page/recommendation/edit/view?cmd=update&id="+id
                    +"&storeId=<#if storeId??>${storeId?c}</#if>"
                    + "&sort=" + sort
                    + "&buyer=" + buyer
                    + "&headImage=" + headImage
                    + "&document=" + document
                    + "&productId=" + productId
                    + "&productImage=" + productImage
                    + "&price=" + price
                    + "&productTitle=" + productTitle
                    + "&moduleId=" + moduleId
                    + "&productSubTitle=" + productSubTitle
                    + "&templateId=" + templateId
                    + "&filePath=" + filePath
                    + "&isMore=" + isMore
                    + "&title=" + title
                    + "&status=" + status
                    + "&productIds=" + productIds
                    + "&stock=" + stock,{
                width:1000,
                height:400,
                title:"编辑买手推荐",
                close: function () {
                    art.dialog.open.origin.location.href="/cms/page/recommendation?moduleIds="+$("#moduleIds").val()+"&templateId="+$("#templateId").val()+"&storeId="+$("#storeId").val();
                }
            });
        });
    });
</script>
</html>