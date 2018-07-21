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
            border-radius: 5px;
        }
        .buttonDefault {
            background-color: #939393; /* Green */
            border: none;
            color: white;
            padding: 10px 21px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            border-radius: 5px;
        }

        .storeSelect {
            margin-right: 24px;
            height: 36px;
            width: 200px;
        }
    </style>
</head>

<div style="text-align: right; padding-right: 50px; padding-top: 30px">
    <td>
        <select id="storeIds" class="storeSelect" onchange="changeStore()">
            <option selected = "selected" value="">请选择门店</option>
             <#if storeList??>
                 <#list storeList as store>
                        <option value="<#if store.id??>${store.id}</#if>"><#if store.name??>${store.name}</#if></option>
                 </#list>
             </#if>
        </select>
    </td>
    <button class="buttonDefault"><font >编辑门店首页</font></button>
    <div style="display: inline-block; width: 45px"></div>
<#--<button class="button"><a href="/cms/page?flag=2&storeId=<#if storeId??>${storeId?c}</#if>"><font color=white>创建新首页</font></a></button>-->
</div>
<script>

    /**
     * 编辑门店首页按钮
     */
    function changeStore () {
        var options = $("#storeIds option:selected");
        var storeId = options.val();
        if (storeId) {
            $('button font').attr('color', 'blue');
            $('button').attr('class', 'button').off("click").on('click', function () {
                window.location.href = "/cms/page?flag=1&storeId="+storeId;
            })
        }else {
            $('button').attr('class', 'buttonDefault').unbind();
            $('button font').attr('color', '')
        }
    }

</script>

</html>