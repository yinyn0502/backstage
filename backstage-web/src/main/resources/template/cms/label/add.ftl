<html>
<head>
    <title>添加标签</title>

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

</head>
<h1 align="center">标签添加</h1>

<style>
    table {
        font-family: verdana, arial, sans-serif;
        font-size: 11px;
        color: #333333;
        border-width: 1px;
        border-color: #666666;
        border-collapse: collapse;
        width: 80%;
        text-align: center;
        border-radius: 5px;
        border-top: 30px;
    }

    input, select {
        border: 1px solid #ccc;
        padding: 7px 0px;
        border-radius: 3px;
        padding-left: 5px;
    }
</style>

<script type="text/javascript">

</script>

<form id="inputForm" action="/cms/label/edit" class="form-horizontal" method="post">
    <table align="center">
        <tr>
            <td><label>门店</label></td>
            <td style="text-align: left">
            <#if storeId??>
                <input name="storeId" value="${storeId}" type="hidden">
            </#if>
            <#if storeName??>
                <label>${storeName}</label>
            </#if>

            </td>
        </tr>
        <tr>
            <td><label>标签位置:</label></td>
            <td style="text-align: left">
                <input name="cmd" style="display: none" value="<#if cmd??>${cmd}</#if>"/>
                <input name="id" style="display: none" value="<#if updateHomePageLabel??&&updateHomePageLabel.id??>${updateHomePageLabel.id?c}</#if>"/>
                <input name="priority" type="number"
                       <#if updateHomePageLabel??&&updateHomePageLabel.priority??>value="${updateHomePageLabel.priority}"</#if>/>
                <label style="color: red">(例如:0,1,2,3...数字越大,位置越靠后)</label>
            </td>
        </tr>
        <tr>
            <td><label>标签名称:</label></td>
            <td style="text-align: left">
                <input name="labelName" type="text" placeholder="1~4个中文字符"
                       <#if updateHomePageLabel??&&updateHomePageLabel.labelName??>value="${updateHomePageLabel.labelName}"</#if>/>
            </td>
        </tr>
        <tr>
            <td><label>跳转链接:</label></td>
            <td style="text-align: left">
                <input name="targetValue" type="text"
                       <#if updateHomePageLabel??&&updateHomePageLabel.targetValue??>value="${updateHomePageLabel.targetValue}"</#if>/>
            </td>
        </tr>
        <tr>
            <td></td>
            <td style="text-align: left">
                <label style="color: red">(链接规范：<br/>
                    H5页面链接: http://+URL<br/>
                    分类页面链接: ueater://categorypage?categoryID=xxx)</label>
            </td>
        </tr>
        <tr>
            <td><label>跳转类型:</label></td>
            <td style="text-align: left">
                <select name="targetType">
                <#if homePageTargetTypeList??>
                    <#list homePageTargetTypeList as item>
                        <option <#if updateHomePageLabel??&&updateHomePageLabel.targetType??><#if updateHomePageLabel.targetType==item.type>selected</#if></#if>
                                value="<#if item.type??>${item.type}</#if>"><#if item.desc??>${item.desc}</#if></option>
                    </#list>
                </#if>
                </select>
            </td>
        </tr>
        <tr>
            <td><label>客户端类型:</label></td>
            <td style="text-align: left">
                <select id="appType" name="appType" onchange="getVersions()">
                <#if appTypeList??>
                    <#list appTypeList as item>
                        <option <#if updateHomePageLabel??&&updateHomePageLabel.appType??><#if updateHomePageLabel.appType==item.type>selected</#if></#if>
                                value="<#if item.type??>${item.type}</#if>"><#if item.desc??>${item.desc}</#if></option>
                    </#list>
                </#if>
                </select>
            </td style="text-align: left">
        </tr>
        <#--<tr id="appVersionsTr" align="left">

            <script>
                function getVersions(version) {
                    $.get("/cms/versions?appType=" + $("#appType").val(), function (data) {
                        console.log(data);
                        var content = "";
                        if (data) {
                            content += "<td><label>生效版本:</label></td><td>";
                            for (var i = 0; i < data.length; i++) {
                                content += "<input class='versionBox' type='checkbox' id='checkbox"+i+"' ";
                                if (data[i] == version) {
                                    content += "checked"
                                }
                                content += "><label class='version' id='version"+i+"'>"+data[i]+"</label>";
                            }
                            content += "</td>"
                            $("#versionTip").show();
                        } else {
                            $("#versionTip").hide();
                        }
                        $("#appVersionsTr").html(content);
                    });
                }
                $(function () {
                    getVersions(<#if appVersion??>"${appVersion}"</#if>);
                })
            </script>
        </tr>
        <tr id="versionTip">
            <td></td>
            <td style='text-align: left'><label style='color: red'>请选择需要生效的版本号,可以复选</label></td>
        </tr>-->

        <tr>
            <td colspan="2" style="text-align: right">
                <input type="button" onclick="sure()" value="确定"></input>
            </td>
        </tr>
    </table>
</form>
<script>
    function sure() {
        var appVersion = "";
        var box = $(".versionBox");
        for (var i = 0; i < box.length; i++) {
            if ($(box[i]).prop("checked")) {
                appVersion += $("#version" + i).text() + ",";
            }
        }

        if (!$("[name='priority']").val()) {
            alert("标签位置 不能为空!");
            return;
        }
        if (!$("[name='labelName']").val()) {
            alert("标签名称 不能为空!");
            return;
        }
        if (!$("[name='targetValue']").val()) {
            alert("跳转链接 不能为空!");
            return;
        }
        if (!$("[name='targetType']").val()) {
            alert("跳转类型 不能为空!");
            return;
        }
        if (!$("[name='appType']").val()) {
            alert("客户端类型 不能为空!");
            return;
        }
        /*if (!appVersion && $("[name='appType']").val() != 2) {
            alert("生效版本 不能为空!");
            return;
        }*/
        if (!$("[name='storeId']").val()) {
            alert("生效门店ID 不能为空!");
            return;
        }

        $.post("/cms/label/edit", {
            cmd: $("[name='cmd']").val(),
            id: $("[name='id']").val(),
            priority: $("[name='priority']").val(),
            labelName: $("[name='labelName']").val(),
            targetValue: $("[name='targetValue']").val(),
            targetType: $("[name='targetType']").val(),
            appType: $("[name='appType']").val(),
            appVersion: appVersion,
            storeId: $("[name='storeId']").val()
        }, function (data) {
            if (!data) {
                alert("失败!!!");
            }
            $.artDialog.close();
        });
    }
</script>
</html>

