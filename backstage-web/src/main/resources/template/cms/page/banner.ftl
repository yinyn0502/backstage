<html>
<head>
    <title>banner</title>

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

<h1 align="center">banner</h1>

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
                <label>banner数量不得少于1,不得多于8个</label>
                <div style="display: inline-block; width: 100px"></div>
                <button id="addBanner" class="add">添加</button>
            </td>
        </tr>
    </thead>
    <#if cmsBannnerVOList??>
    <#list cmsBannnerVOList as item>
    <tr style="border-bottom: solid 1px" class="count">
        <td>
            <table>
                <tr>
                    <th>
                        <label>位置:</label>
                    </th>
                    <th>
                        <label id="sort_${item_index}"><#if item.sort??>${item.sort}</#if></label>
                    </th>
                </tr>
                <tr>
                    <td>
                        <label>图片:</label>
                    </td>
                    <td>
                        <img id="imageUrl_${item_index}" src="<#if item.imageUrl??>${item.imageUrl}</#if>" href="test" width="200px">
                    </td>
                </tr>

               <#if item.targetType??&&item.targetType==1>
                   <tr>
                       <td>
                           <label>页面文件:</label>
                       </td>
                       <td>
                           <label id="filePath_${item_index}" style="color: red"><#if item.filePath??>${item.filePath}</#if></label>
                       </td>
                   </tr>
                   <tr>
                       <td>
                           <label>页面标题:</label>
                       </td>
                       <td>
                           <label id="title_${item_index}" style="color: forestgreen"><#if item.title??>${item.title}</#if></label>
                       </td>
                   </tr>
               <#elseif item.targetType??&&item.targetType==2>
                   <tr>
                       <td>
                           <label>链接地址:</label>
                       </td>
                       <td>
                           <label id="filePath_${item_index}" style="color: red"><#if item.filePath??>${item.filePath}</#if></label>
                       </td>
                   </tr>
                   <tr>
                       <td>
                           <label>页面标题:</label>
                       </td>
                       <td>
                           <label id="title_${item_index}" style="color: forestgreen"><#if item.title??>${item.title}</#if></label>
                       </td>
                   </tr>

               <#elseif item.targetType??&&item.targetType==3>

                   <tr>
                       <td>
                           <label>App商品详情页:</label>
                       </td>
                       <td>
                           <label id="filePath_${item_index}" style="color: red"><#if item.filePath??>${item.filePath}</#if></label>
                       </td>
                   </tr>


               <#elseif item.targetType??&&item.targetType==4>

                   <tr>
                       <td>
                           <label>App分类详情页:</label>
                       </td>
                       <td>
                           <label id="filePath_${item_index}" style="color: red"><#if item.filePath??>${item.filePath}</#if></label>
                       </td>
                   </tr>

               <#elseif item.targetType??&&item.targetType==5>
                   <tr>
                       <td>
                           <label>页面地址:</label>
                       </td>
                       <td>
                           <label id="filePath_${item_index}" style="color: red"><#if item.filePath??>${item.filePath}</#if></label>
                       </td>
                   </tr>
               </#if>



                <tr>
                    <td></td>
                    <td></td>
                    <td>
                        <input hidden value="<#if item.id??>${item.id?c}</#if>" id="id_${item_index}"/>
                        <input hidden value="<#if item.targetType??>${item.targetType}</#if>" id="targetType_${item_index}"/>
                        <button class="delete" data-index="${item_index}">删除</button>
                        <button class="update" data-index="${item_index}">修改</button>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    </#list>
    </#if>
</table>

<script>
    $(".add").click(function () {
        var count = $(".count").size();
        if (count>=8){
            alert("最多可以有8个");
            return;
        }

        var moduleId = $("#moduleIds").val();
        var templateId = $("#templateId").val();
        var storeId = $("#storeId").val();
        $.artDialog.open("/cms/page/banner/edit/view?cmd=save"+ "&templateId=" + templateId
                + "&moduleId=" + moduleId+ "&storeId=" + storeId,{
            width:1000,
            height:400,
            title:"添加banner",
            close: function () {
                art.dialog.open.origin.location.href="/cms/page/banner?moduleIds="+$("#moduleIds").val()+"&templateId="+$("#templateId").val()+"&storeId="+$("#storeId").val();
            }
        });
    });

    $(".delete").click(function () {
        var count = $(".count").size()-1;
        if (count<1){
            alert("至少要有1个");
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
            art.dialog.open.origin.location.href="/cms/page/banner?moduleIds="+$("#moduleIds").val()+"&templateId="+$("#templateId").val()+"&storeId="+$("#storeId").val();
        });
    });

    $(".update").click(function () {
        var index = $(this).data("index");
        var id = $("#id_" + index).val();
        var sort = $("#sort_" + index).text();
        var filePath = $("#filePath_" + index).text();
        var imageUrl = $("#imageUrl_" + index).attr("src");
        var targetType =  $("#targetType_" + index).val();
        var title = $("#title_" + index).text();
        var templateId = $("#templateId").val();
        var moduleId = $("#moduleIds").val();
        $.artDialog.open("/cms/page/banner/edit/view?cmd=update&id="+id+"&storeId=<#if storeId??>${storeId?c}</#if>"
                + "&sort=" + sort
                + "&filePath=" + filePath
                + "&title=" + title
                + "&templateId=" + templateId
                + "&moduleId=" + moduleId
                + "&imageUrl=" + imageUrl
                + "&targetType=" +targetType,{
            width:1000,
            height:400,
            title:"编辑banner",
            close: function () {
                art.dialog.open.origin.location.href="/cms/page/banner?moduleIds="+$("#moduleIds").val()+"&templateId="+$("#templateId").val()+"&storeId="+$("#storeId").val();
            }
        });
    });
</script>

</html>