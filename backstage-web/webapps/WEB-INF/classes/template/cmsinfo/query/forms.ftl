<!DOCTYPE html>
<html>
<head>
<#include "../../ahead.ftl">
<#include "../../treeview.ftl" >
<#include "../../treetable.ftl" >

    <!--引入js  -->
<#--<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>-->
    <!--引入bootstrap -->

    <script src="/static/fileinput/js/fileinput.js" type="text/javascript"></script>
    <script src="/static/fileinput/js/locales/zh.js" type="text/javascript"></script>

    <link href="/static/fileinput/css/fileinput.css" rel="stylesheet">
    <link href="/META-INF/resources/static/bootstrap/3.3.4/css_default/bootstrap-theme.css" rel="stylesheet">

    <meta charset="utf-8"/>
</head>
<body>
<div>
    <form id="add_commodity_form" method="post" enctype="multipart/form-data">
        ...//其他form参数
        <div class="form-group" style="width:99%">
            <input id="add_bachPic" name="commoPicArr" type="file" multiple  class="file-loading">
        </div>
    </form>
</div>
</body>
</html>