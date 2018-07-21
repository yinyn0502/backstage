<html>
<head>
    <title>eat说</title>

    <meta name="decorator" content="default"/>

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

<h1 align="center">eat说</h1>

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
    <tr>
        <td>
            <label>一共8个位置</label>
        </td>
    </tr>
    <#if cmsSayVOS??>
        <#list cmsSayVOS as item>
        <tr>
            <td>
                <label><#if item.sort??>${item.sort+1}</#if></label>
            </td>
        </tr>

        <tr>
            <td>
                <label>图片:</label>
            </td>
            <td>
                <img id="imageUrl_${item_index}" src="<#if item.imagePath??>${item.imagePath}</#if>" href="test" width="200px">
            </td>

        </tr>

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
                <label ><#if item.title??>${item.title}</#if></label>
            </td>
        </tr
        </#list>
    </#if>
    <tr>
        <td>
            <button id="update" class="button">修改</button>
        </td>
    </tr>
</table>

<script>
    $(function () {

        $("#update").click(function () {

            $.artDialog.open("/cms/page/say/edit/view?cmd=update"+"&moduleId="+$("#moduleIds").val()+"&templateId="+$("#templateId").val()+"&storeId="+$("#storeId").val(),{
                width:720,
                height:800,
                title:"编辑eat说",
                close: function () {
                    art.dialog.open.origin.location.href="/cms/page/say?moduleIds="+$("#moduleIds").val()+"&templateId="+$("#templateId").val()+"&storeId="+$("#storeId").val();
                }
            });
        });
    });
</script>

</html>