<html>
<head>
    <title>用户管理</title>
    <meta name="decorator" content="default"/>
    <#include "../../ahead.ftl">
    <#include "../../treeview.ftl" >
    <#include "../../treetable.ftl" >
    <style type="text/css">
        .ztree {overflow:auto;margin:0;_margin-top:10px;padding:10px 0 0 10px;}
    </style>
    <script type="text/javascript">
        function refresh(){//刷新
            window.location="/sys/user/index";
        }
    </script>
</head>
<body class="gray-bg">

<div class="wrapper wrapper-content">
    <div class="ibox">
        <div class="ibox-content">
        <#if message??> ${message} </#if>
            <div id="content" class="row">
                <div id="left"  style="background-color:#e7eaec" class="leftBox col-sm-1">
                    <a onclick="refresh()" class="pull-right">
                        <i class="fa fa-refresh"></i>
                    </a>
                    <div id="ztree" class="ztree leftBox-content"></div>
                </div>
                <div id="right"  class="col-sm-11  animated fadeInRight">
                    <iframe id="officeContent" name="officeContent" src="/sys/user/list" width="100%" height="91%" frameborder="0"></iframe>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var setting = {data:{simpleData:{enable:true,idKey:"id",pIdKey:"pId",rootPId:'0'}},
            callback:{onClick:function(event, treeId, treeNode){
                var id = treeNode.id == '0' ? '' :treeNode.id;
                $('#officeContent').attr("src","/sys/user/list?officeId="+id+"&office.name="+treeNode.name);
            }
            }
        };

        function refreshTree(){
            $.getJSON("/sys/office/treeData",function(data){
                $.fn.zTree.init($("#ztree"), setting, data).expandAll(true);
            });
        }
        refreshTree();

        var leftWidth = 180; // 左侧窗口大小
        var htmlObj = $("html"), mainObj = $("#main");
        var frameObj = $("#left, #openClose, #right, #right iframe");
        function wSize(){
            var strs = getWindowSize().toString().split(",");
            htmlObj.css({"overflow-x":"hidden", "overflow-y":"hidden"});
            mainObj.css("width","auto");
            frameObj.height(strs[0] - 120);
            var leftWidth = ($("#left").width() < 0 ? 0 : $("#left").width());
            $("#right").width($("#content").width()- leftWidth - $("#openClose").width() -60);
            $(".ztree").width(leftWidth - 10).height(frameObj.height() - 46);
        }
    </script>
    <script src="/static/common/wsize.min.js" type="text/javascript"></script>
</body>
</html>