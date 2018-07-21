<html>
<head>
    <title>预览</title>

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

<h1 align="center">预览</h1>

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
    <tr style="border-bottom: solid 1px ">
        <td>
            <table>
                <tr>
                    <th>
                        <label>位置:</label>
                    </th>
                    <th>
                        <label>1</label>
                    </th>
                </tr>
                <tr>
                    <td>
                        <label>图片:</label>
                    </td>
                    <td>
                        <img src="#" href="test" width="200px">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>页面文件:</label>
                    </td>
                    <td>
                        <label style="color: red">页面文件的地址</label>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>
                        <button>删除</button>
                        <button>修改</button>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr style="border-bottom: solid 1px">
        <td>
            <table>
                <tr>
                    <th>
                        <label>位置:</label>
                    </th>
                    <th>
                        <label>2</label>
                    </th>
                </tr>
                <tr>
                    <td>
                        <label>图片:</label>
                    </td>
                    <td>
                        <img src="#" href="test" width="200px">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>页面文件:</label>
                    </td>
                    <td>
                        <label style="color: red">页面文件的地址</label>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>
                        <button>删除</button>
                        <button>修改</button>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<script>
    $(".add").click(function () {
        $.artDialog.open("/cms/page/banner/add",{
            width:1000,
            height:400,
            title:"添加banner"
        });
    });
</script>

</html>