<html>
<head>
    <title>自定义活动</title>

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
        table{
            padding: 30px`;
        }
    </style>

</head>

<h1 align="center">自定义活动</h1>


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
                <label>只能设置1个</label>
            </td>
            <td></td>
            <td>
                <button <#if isCanAdd??&&!isCanAdd>disabled</#if> id="add" class="add">添加</button>
            </td>
        </tr>
    </thead>
    <#if cmsCustomVO??>
    <tbody>
        <tr>
            <td>
                <label>图片:</label>
            </td>
            <td>
                <img id="image" src="<#if cmsCustomVO.imageUrl??>${cmsCustomVO.imageUrl}</#if>" width="400px">
            </td>
        </tr>
        <tr>
            <td>
                <label>页面文件:</label>
            </td>
            <td>
                <label id="filePath"><#if cmsCustomVO.failPath??>${cmsCustomVO.failPath}</#if></label>
            </td>
        </tr>
        <tr>
            <td>
                <label>页面名称:</label>
            </td>
            <td>
                <label id="title"><#if cmsCustomVO.title??>${cmsCustomVO.title}</#if></label>
            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td>
                <input hidden id="id" value="<#if cmsCustomVO.id??>${cmsCustomVO.id?c}</#if>"/>
                <button id="delete">删除</button>
                <button id="update">修改</button>
            </td>
        </tr>
    </tbody>
    </#if>
</table>

<script>
    $(function () {
        $("#add").click(function () {
            var templateId = $("#templateId").val();
            var moduleId = $("#moduleIds").val();
            $.artDialog.open("/cms/page/custom/edit/view?cmd=save&templateId=" + templateId + "&moduleId=" + moduleId, {
                width: 700,
                height:400,
                title: "添加自定义活动",
                close: function(){
                    art.dialog.open.origin.location.href="/cms/page/custom?moduleIds="+$("#moduleIds").val()+"&templateId="+$("#templateId").val()+"&storeId="+$("#storeId").val();
                }
            });
        });
        $("#delete").click(function () {
            var id = $("#id").val();
            $.get("/cms/moduleResource/delete?id="+id, function (data) {
                if (!data) {
                    alert("失败, id:"+id);
                } else {
                    alert("成功, id:"+id);
                }
                art.dialog.open.origin.location.href="/cms/page/custom?moduleIds="+$("#moduleIds").val()+"&templateId="+$("#templateId").val()+"&storeId="+$("#storeId").val();
            });
        });

        $("#update").click(function () {
            var id = $("#id").val();
            var templateId = $("#templateId").val();
            var moduleId = $("#moduleIds").val();
            var filePath = $("#filePath").text();
            var title = $("#title").text();
            var image = $("#image").attr("src");

            $.artDialog.open("/cms/page/custom/edit/view?cmd=update&id="+id+"&storeId=<#if storeId??>${storeId?c}</#if>"
                    + "&templateId=" + templateId
                    + "&filePath=" + filePath
                    + "&moduleId=" + moduleId
                    + "&image=" + image
                    + "&title=" + title,{
                width:1000,
                height:400,
                title:"编辑自定义",
                close: function(){
                    art.dialog.open.origin.location.href="/cms/page/custom?moduleIds="+$("#moduleIds").val()+"&templateId="+$("#templateId").val()+"&storeId="+$("#storeId").val();
                }
            });
        });
    });
</script>
</html>