
<html>
<head>
    <title>商品管理后台</title>
    <script src="/static/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <link href="/static/bootstrap/3.3.4/css_default/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="/static/bootstrap/3.3.4/js/bootstrap.min.js"  type="text/javascript"></script>
    <link href="/static/awesome/4.4/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/static/common/css/style.css?v=3.2.0" type="text/css" rel="stylesheet" />

    <link href="/static/jquery-ztree/3.5.12/css/zTreeStyle/metro.css" rel="stylesheet" type="text/css"/>
    <script src="/static/jquery-ztree/3.5.12/js/jquery.ztree.all-3.5.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/static/artDialog/jquery.artDialog.js?skin=green"></script>
    <script type="text/javascript" src="/static/artDialog/plugins/iframeTools.source.js"></script>

    <script src="/static/bootstrap-datetimepicker/bootstrap-datetimepicker.js"  charset="UTF-8"></script>
    <script src="/static/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
    <link href="/static/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <meta name="decorator" content="default"/>


<script type="text/javascript">
    $(function () {
        var setting = {
            check:{
                enable:true,
                nocheckInherit:true,
                chkboxType: { "Y": "p", "N": "s" },
                chkStyle: "radio",
                radioType: "all"
            },
            view:{
                selectedMulti:false
            },
            data:{
                simpleData:{
                    enable:true
                }
            },
            callback:{
                beforeClick:function(id, node){
                    /* tree.checkNode(node, !node.checked, true, true);
                     return false;*/
                }}};

        // 用户-菜单
        var zNodes=[
        <#list category as menu>
            {
                id:"${menu.id?c}",
                pId:"<#if menu.parentId??>${menu.parentId?c}<#else>0</#if>",
                name:"<#if menu.name??>${menu.name}<#else>'菜单'</#if>"
            },
        </#list>
        ];
        // 初始化树结构
        tree = $.fn.zTree.init($("#first_tree"), setting, zNodes);
    });

    $(function () {
        $("#sure").click(function () {
            var treeObj = $.fn.zTree.getZTreeObj("first_tree");
            var nodes = treeObj.getCheckedNodes(true);
            if (!nodes.length) {
                alert("请选择");
                return;
            }
            $.artDialog.data("selectedId", nodes[nodes.length - 1].id);
            $.artDialog.data("selectedName", nodes[nodes.length - 1].name);
            $.artDialog.close();
        });
        $("#cancel").click(function () {
            $.artDialog.close();
        });

        var id = artDialog.open.origin.document.getElementById('categoryId');
//        alert($(id).val());
        var treeObj = $.fn.zTree.getZTreeObj("first_tree");
        var node = treeObj.getNodeByParam("id", $(id).val());
        treeObj.selectNode(node);
        node.checked = true;
        treeObj.updateNode(node);
    });

</script>
</head>
    <div>
        <ul class="ztree" id="first_tree"></div>
    </div>

    <div align="right">
        <button id="cancel">取消</button>
        <button id="sure">确定</button>
    </div>
</html>