<html>
<head>
    <title>每日抢鲜</title>

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

    <!-- bootstrap-datetimepicker 时间控件 和语言包-->
    <script src="/static/bootstrap-datetimepicker/bootstrap-datetimepicker.js"  charset="UTF-8"></script>
    <script src="/static/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
    <link href="/static/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>

<h1 align="center">每日抢鲜</h1>

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
<table style="padding: 20px" align="center">

    <thead style="border-bottom: 1px">
        <td>
            <label>可设置3组秒杀品</label>
            <div style="display: inline-block; width: 300px"></div>
            <button id="add">添加</button>
        </td>
    </thead>

    <tbody>
    <#if cmsPrereleaseVOList??>
    <#list cmsPrereleaseVOList as item>
    <tr class="count">
        <td>
            <table>
                <thead>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <label style="color: red">第<label id="sort_${item_index}"><#if item.sort??>${item.sort?c}</#if></label>组</label>
                                    <input class="sortInput" hidden value="<#if item.sort??>${item.sort?c}</#if>"/>
                                </td>
                                <td>
                                    <input id="moduleId_${item_index}" hidden value="<#if item.moduleId??>${item.moduleId?c}</#if>"/>
                                    <button class="update" data-index="${item_index}" id="update_${item_index}">编辑</button>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>开始时间:</label>
                                </td>
                                <td>
                                    <label id="startTime_${item_index}"><#if item.startTime??>${item.startTime}</#if></label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>结束时间:</label>
                                </td>
                                <td>
                                    <label id="endTime_${item_index}"><#if item.endTime??>${item.endTime}</#if></label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                </thead>
                <tr>
                <#if item.productInfoList??>
                <#list item.productInfoList as productInfo>
                    <td style="border-left: 1px">
                        <table style="border-top: solid 1px">
                            <tr>
                                <td>
                                    <label style="width: 100px">商品<#if productInfo.sort??>${productInfo.sort?c}</#if>:</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>商品ID:</label>
                                </td>
                                <td>
                                    <label><#if productInfo.productId??>${productInfo.productId?c}</#if></label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>商品图:</label>
                                </td>
                                <td>
                                    <img id="uploadhead" src="<#if productInfo.productImage??>${productInfo.productImage}</#if>" href="test" width="200px">
                                    <#--<input id="imgUpload" type="file"/>-->
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>商品价格:</label>
                                </td>
                                <td>
                                    <label><#if productInfo.price??>${productInfo.price?c}<#else>--</#if></label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>商品名称:</label>
                                </td>
                                <td>
                                    <label><#if productInfo.productTitle??>${productInfo.productTitle}</#if></label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>副标题:</label>
                                </td>
                                <td>
                                    <label ><#if productInfo.productSubtitle??>${productInfo.productSubtitle}</#if></label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>可售库存:</label>
                                </td>
                                <td>
                                    <label><#if productInfo.stock??>${productInfo.stock?c}</#if></label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>销售状态:</label>
                                </td>
                                <td>
                                    <label><#if productInfo.status??>${productInfo.status}</#if></label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </#list>
                </#if>
                </tr>
            </table>
        </td>
    </tr>
    </#list>
    </#if>
    </tbody>

</table>

<script>
    $(function () {

        $(".update").click(function () {
            var index = $(this).data("index");
            var moduleId = $("#moduleId_" + index).val();
            var moduleIds = $("#moduleIds").val();
            var startTime = $("#startTime_" + index).val();
            var endTime = $("#endTime_" + index).val();
            var sort = $("#sort_" + index).text();
            var templateId = $("#templateId").val();
            $.artDialog.open("/cms/page/prerelease/edit/view?cmd=update&storeId=<#if storeId??>${storeId?c}</#if>"
                    + "&sort=" + sort
                    + "&index=" + index
                    + "&templateId=" + templateId
                    + "&startTime=" + startTime
                    + "&endTime=" + endTime
                    + "&index=" + index
                    + "&moduleIds=" + moduleIds
                    + "&moduleId=" + moduleId,{
                width:550,
                height:600,
                title:"编辑-每日抢鲜",
                close: function () {
                    art.dialog.open.origin.location.href="/cms/page/prerelease?moduleIds="+$("#moduleIds").val()+"&templateId="+$("#templateId").val()+"&storeId="+$("#storeId").val();
                }
            });
        });

        /*$(".delete").click(function () {
            alert($(this).data("index"));
            var index = $(this).data("index");
            var moduleId = $("#moduleId_" + index).val();
            $.get("/cms/moduleResource/delete?id="+moduleId, function (data) {
                if (!data) {
                    alert("失败, id:"+id);
                } else {
                    alert("成功, id:"+id);
                }
                art.dialog.open.origin.location.href="/cms/page/banner?moduleIds="+$("#moduleIds").val()+"&templateId="+$("#templateId").val()+"&storeId="+$("#storeId").val();
            });
        });*/

        $("#add").click(function () {
            var count = $(".count").size();
            if(count>=3){
                alert("最多三组,如有需求请修改其他");
                return;
            }

            var templateId = $("#templateId").val();

            var sorts = $(".sortInput");
            var sortStr = "";
            for (var i = 0; i < sorts.size(); i++) {
                sortStr = sortStr + "," + $(sorts[i]).val();
            }

            $.artDialog.open("/cms/page/prerelease/edit/view?cmd=save&storeId=<#if storeId??>${storeId?c}</#if>"
                    + "&index=" + "<#if count??>${count?c}</#if>" + "&sorts=" + sortStr
                    + "&templateId=" + templateId,{
                width:550,
                height:600,
                title:"添加-每日抢鲜",
                close: function () {
                    art.dialog.open.origin.location.href="/cms/page/prerelease?moduleIds="+$("#moduleIds").val()+"&templateId="+$("#templateId").val()+"&storeId="+$("#storeId").val();
                }
            });
        });
    });
</script>

</html>