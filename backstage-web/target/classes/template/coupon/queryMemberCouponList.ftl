<html>
<head>
    <title>用户礼券管理</title>

<#include "../ahead.ftl">
<#include "../treeview.ftl" >
<#include "../treetable.ftl" >
</head>
<body>
<div class="wrapper wrapper-content">

    <!-- 工具栏 -->
    <div class="row">
        <div class="col-sm-12">
            <div class="pull-left">
                <shiro:hasPermission name="sys:user:add">
                    <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" onclick="add()" title="添加用户礼券信息"><i class="fa fa-plus"></i> 添加用户礼券信息</button>

                    <script type="text/javascript">
                        function add(){
                            openDialog("新增"+'用户礼券信息',"/coupondistribution/goToAddMemberCouponPage","850px", "600px","officeContent");
                        }
                    </script><!-- 增加按钮 -->

                </shiro:hasPermission>

            </div>

        </div>
    </div>


</div>
</body>

</html>