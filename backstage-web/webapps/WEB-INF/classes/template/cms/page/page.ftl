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
    <script type="text/javascript" src="/static/artDialog/plugins/iframeTools.source.js"></script>    <style>
        .button {
            background-color: #4A90E2; /* Green */
            border: none;
            color: white;
            padding: 10px 21px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            border-radius: 5px;
        }
    </style>
</head>

<ul class="nav nav-pills nav-justified">
    <li><a href="#" onclick="$('#iframe').attr('src', '/cms/page/banner?storeId=<#if storeId??>${storeId?c}</#if>&templateId=<#if templateId??>${templateId?c}</#if>&moduleIds=<#if moduleIdList1??>${moduleIdList1}</#if>')">banner</a></li>
    <li><a href="#" onclick="$('#iframe').attr('src', '/cms/page/discovery?storeId=<#if storeId??>${storeId?c}</#if>&templateId=<#if templateId??>${templateId?c}</#if>&moduleIds=<#if moduleIdList2??>${moduleIdList2}</#if>')">新品发现</a></li>
    <li><a href="#" onclick="$('#iframe').attr('src', '/cms/page/prerelease?storeId=<#if storeId??>${storeId?c}</#if>&templateId=<#if templateId??>${templateId?c}</#if>&moduleIds=<#if moduleIdList3??>${moduleIdList3}</#if>')">每日抢鲜</a></li>
    <li><a href="#" onclick="$('#iframe').attr('src', '/cms/page/taste?storeId=<#if storeId??>${storeId?c}</#if>&templateId=<#if templateId??>${templateId?c}</#if>&moduleIds=<#if moduleIdList5??>${moduleIdList5}</#if>')">纯粹味道</a></li>
    <li><a href="#" onclick="$('#iframe').attr('src', '/cms/page/recommendation?storeId=<#if storeId??>${storeId?c}</#if>&templateId=<#if templateId??>${templateId?c}</#if>&moduleIds=<#if moduleIdList6??>${moduleIdList6}</#if>')">买手推荐</a></li>
    <li><a href="#" onclick="$('#iframe').attr('src', '/cms/page/say?storeId=<#if storeId??>${storeId?c}</#if>&templateId=<#if templateId??>${templateId?c}</#if>&moduleIds=<#if moduleIdList7??>${moduleIdList7}</#if>')">eat说</a></li>
    <li><a href="#" onclick="$('#iframe').attr('src', '/cms/page/custom?storeId=<#if storeId??>${storeId?c}</#if>&templateId=<#if templateId??>${templateId?c}</#if>&moduleIds=<#if moduleIdList4??>${moduleIdList4}</#if>')">自定义活动</a></li>
</ul>
<iframe src="/cms/page/banner?params=<#if params??>${params}</#if>&storeId=<#if storeId??>${storeId?c}</#if>&templateId=<#if templateId??>${templateId?c}</#if>&moduleIds=<#if moduleIdList1??>${moduleIdList1}</#if>" width="99%" height="88%" frameborder="0" id="iframe"></iframe>

<div style="text-align: right; padding-right: 50px">
    <button class="button" id="preShow">
        <a id="preShowLink" href="/cms/preview?templateId=<#if templateId??>${templateId?c}</#if>&storeId=<#if storeId??>${storeId?c}</#if>">
            <font color=white>预览</font>
        </a>
    </button>
    <button class="button" id="online">上线</button>
    <#--<button class="button" id="cancel">取消</button>-->
</div>

<script>
    $(function () {
        $("#preShowLink").attr("target", "_blank");
    });

    $("#online").click(function () {
        $.artDialog.open("/cms/online/pre?templateId=<#if templateId??>${templateId?c}</#if>&storeId=<#if storeId??>${storeId?c}</#if>", {
            title: "确认上线吗?",
            width: 400,
            height: 240
        });
    });

    $("#cancel").click(function () {
        var str = "取消成功喽";
        $.get("/cms/cancel?templateId=<#if templateId??>${templateId?c}</#if>", function (data) {
            if (!data) {
                str = "取消失败啦";
            }
            alert(str);
        });
    });
</script>

</html>