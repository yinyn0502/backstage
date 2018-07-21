<html>
<head>
    <title>自定义活动</title>

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

<h1 align="center">请填写要操作的门店Id</h1>

<form action="/cms/page/pre">
    <table align="center">
        <tr>
            <td>
                <label style="color: forestgreen">门店Id:</label>
            </td>
            <td>
                <input id="storeId" name="storeId" type="number"/>
            </td>
        </tr>
        <tr>
            <td>
                <label style="color: forestgreen">终端类型:</label>
            </td>
            <td>
                <select id="appType" name="appType">
                <#if appTypeList??>
                    <#list appTypeList as item>
                        <option value="<#if item.type??>${item.type}</#if>"><#if item.desc??>${item.desc}</#if></option>
                    </#list>
                </#if>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                <label style="color: forestgreen">APP版本:</label>
            </td>
            <td>
                <select id="appVersion" name="appVersion">
                    <#if iOSVersionOptions??>${iOSVersionOptions}</#if>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                <label style="color: forestgreen">页面类型:</label>
            </td>
            <td>
                <select id="pageType" name="pageType">
                    <option value="index">首页</option>
                </select>
            </td>
        </tr>
        <tr>
            <td rowspan="2" style="text-align: center">
                <button class="button">提交</button>
            </td>
        </tr>
    </table>
</form>

<script>
    $(function () {
        var iOSVersionOptions = "<#if iOSVersionOptions??>${iOSVersionOptions}</#if>";
        var androidVersionOptions = "<#if androidVersionOptions??>${androidVersionOptions}</#if>";
        $("#appType").change(function () {
            var appType= $("#appType").val();
            if (appType == 0) {         // iOS
                $("#appVersion").html(iOSVersionOptions);
            } else if (appType == 1) {  // Android
                $("#appVersion").html(androidVersionOptions);
            }
        });
    });
</script>

</html>