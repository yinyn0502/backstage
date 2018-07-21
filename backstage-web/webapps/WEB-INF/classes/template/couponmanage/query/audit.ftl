
<html>
<head>
    <title>优惠券详情</title>

    <meta name="decorator" content="default"/>
<#include "../../ahead.ftl">
<#include "../../treeview.ftl" >
<#include "../../treetable.ftl" >

</head>
<body class="hideScroll">

    <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
        <tbody>
        <tr>
            <td  class="width-15 active" colspan="2"><label class="pull-left">优惠券明细</label>
                <input type="hidden" id="activityIds" <#if couponDetailTO.activityId??>value="${couponDetailTO.activityId?c}"<#else></#if>/>

            </td>

        </tr>
        <tr>
            <td class="width-15 active">	<label class="pull-left">最后操作:</label></td>
            <td class="width-20" > <#if couponDetailTO.lastHandler??>${couponDetailTO.lastHandler}<#else>-- </#if></td>

        </tr>
        <tr>
            <td class="width-15 active">	<label class="pull-left">操作时间:</label></td>
            <td class="width-20" > <#if couponDetailTO.handleTimeStr??>${couponDetailTO.handleTimeStr}<#else> </#if></td>
        </tr>
        <tr>
            <td  class="width-15 active" colspan="2">基本信息</td>
        </tr>
        <tr>
            <td class="width-15 active">	<label class="pull-left">优惠券名称:</label></td>
            <td class="width-20" > <#if couponDetailTO.couponName??>${couponDetailTO.couponName}<#else> </#if></td>
        </tr>

        <tr>
            <td class="width-15 active">	<label class="pull-left">优惠券副标题:</label></td>
            <td class="width-20" > <#if couponDetailTO.couponSubName??>${couponDetailTO.couponSubName}<#else> </#if></td>
        </tr>
        <tr>
            <td class="width-15 active">	<label class="pull-left">描述:</label></td>
            <td class="width-20" > <#if couponDetailTO.description??>${couponDetailTO.description}<#else> </#if></td>
        </tr>
        <tr>
            <td class="width-15 active">	<label class="pull-left">规则说明:</label></td>
            <td class="width-20" > <#if couponDetailTO.couponIntroduce??>${couponDetailTO.couponIntroduce}<#else> </#if></td>
        </tr>
        <tr>
            <td class="width-15 active">	<label class="pull-left">有效期:</label></td>
            <td class="width-20" >
            <#if couponDetailTO.startTime??>${couponDetailTO.startTimeStr}<#else>
            </#if>
            <#if couponDetailTO.endTime??>至${couponDetailTO.endTimeStr}<#else>
            </#if>
            </td>
        </tr>
        <#if couponDetailTO.continueDate??>
        <td class="width-15 active"></td>
        <td class="width-20" >
            绑定至用户账户当天算起${couponDetailTO.continueDate}天有效
        </td>
        </#if>


        <tr>
            <td  class="width-15 active" colspan="2">作用范围</td>
        </tr>
        <tr>
            <td  class="width-15 active">	<label class="pull-left">优惠券类型:</label></td>
            <td class="width-20" >
            <#if couponDetailTO.couponType==1>商品券</#if>
            <#if couponDetailTO.couponType==2>现金券</#if>
            <#if couponDetailTO.couponType==3>运费券</#if>
            </td>
        </tr>

        <tr>
            <td  class="width-15 active">	<label class="pull-left">门店:</label></td>
            <td class="width-20" > <#if couponDetailTO.storeName??>${couponDetailTO.storeName}<#else> </#if></td>
        </tr>

        <#if couponDetailTO.couponType==1>
            <tr>
                <td class="width-15 active">	<label class="pull-left">增加 分类/商品:</label></td>
                <td class="width-20" >

                </td>
            </tr>

            <#if couponDetailTO.categoryName??>
                <#list couponDetailTO.categoryName as path>
                <tr>
                    <td class="width-15 "></td>
                    <td class="width-20" >
                        <#if couponDetailTO.categoryName??>${path}<#else> </#if>
                    </td>
                </tr>
                </#list>
            </#if>

            <#if couponDetailTO.productStoreName??>
                <#list couponDetailTO.productStoreName as productName>
                <tr>
                    <td class="width-15 "></td>
                    <td class="width-20" >
                        ${productName}
                    </td>
                </tr>
                </#list>
            </#if>


            <tr>
                <td  class="width-15 active">	<label class="pull-left">排除 分类/商品:</label></td>
                <td class="width-20" >

                </td>
            </tr>
            <#if couponDetailTO.expCategoryName??>
                <#list couponDetailTO.expCategoryName as expPath>
                <tr>
                    <td class="width-15 "></td>
                    <td class="width-20" >
                        <#if couponDetailTO.expCategoryName??>${expPath}<#else> </#if>
                    </td>
                </tr>
                </#list>
            </#if>

            <#if couponDetailTO.expStoreProductName??>
                <#list couponDetailTO.expStoreProductName as expProductName>
                <tr>
                    <td class="width-15 "></td>
                    <td class="width-20" >
                        <#if couponDetailTO.expStoreProductName??>${expProductName}<#else> </#if>
                    </td>
                </tr>
                </#list>
            </#if>
        </#if>

        <#if couponDetailTO.couponType==2>
            <#if couponDetailTO.expProductIdsCategoryPaths??>
                <#list couponDetailTO.expProductIdsCategoryPaths as expPath>
                <tr>
                    <td class="width-15 "></td>
                    <td class="width-20" >
                        <#if couponDetailTO.expProductIdsCategoryPaths??>${expPath}<#else> </#if>
                    </td>
                </tr>
                </#list>
            </#if>

            <#if couponDetailTO.expStoreProductName??>
                <#list couponDetailTO.expStoreProductName as expProductName>
                <tr>
                    <td class="width-15 "></td>
                    <td class="width-20" >
                        <#if couponDetailTO.expProductName??>${expProductName}<#else> </#if>
                    </td>
                </tr>
                </#list>
            </#if>
        </#if>

        <tr>
            <td  class="width-15 active" colspan="2">限制条件</td>
        </tr>
        <tr>
            <td  class="width-15 active">	<label class="pull-left">会员类型:</label></td>
            <td class="width-20" >
            ${couponDetailTO.memberLevelValue}

            </td>
        </tr>
        <tr>
            <td  class="width-15 active">	<label class="pull-left">使用渠道:</label></td>
            <td class="width-20" > ${couponDetailTO.useChannelValue}</td>

        </tr>

        <tr>
            <td  class="width-15 active">	<label class="pull-left">领取限制:</label></td>
            <td class="width-20" > <#if couponDetailTO.memberCount??>${couponDetailTO.memberCount?c}<#else> </#if></td>

        </tr>
        <tr>
            <td  class="width-15 active">	<label class="pull-left">限领总数：</label></td>
            <td class="width-20" ><#if couponDetailTO.totalCount??>${couponDetailTO.totalCount?c}<#else> </#if></td>
        </tr>
        <tr>
            <td  class="width-15 active" colspan="4">优惠规则</td>
        </tr>



        <tr>
            <#if couponDetailTO.qualificationType??>
                <#if  couponDetailTO.qualificationType==0>
                    <td  class="width-15 active"> <label class="pull-left">无门槛:</label></td>
                    <td class="width-20" >
                    <#if  couponDetailTO.benefitType==0>减${couponDetailTO.benefitValue?c}
                    </#if>
                    <#if  couponDetailTO.benefitType==1>打${couponDetailTO.benefitValue?c}折
                    </#if>
                    </td>
                </#if>
                <#if  couponDetailTO.qualificationType==1>
                    <td  class="width-15 active">	<label class="pull-left">满额</label></td>
                    <td class="width-20" >满${couponDetailTO.qualificationValue?c}
                        <#if  couponDetailTO.benefitType==0>减${couponDetailTO.benefitValue?c}
                        </#if>
                        <#if  couponDetailTO.benefitType==1>打${couponDetailTO.benefitValue?c}折
                        </#if>
                    </td>
                </#if>
            </#if>
        </tr>
        <tr>
            <td  class="width-15 active" colspan="4">其他属性</td>
        </tr>
        <tr>
            <td  class="width-15">
            <#if couponDetailTO.budget?? && couponDetailTO.budget==1>预算内
            </#if>
            <#if couponDetailTO.budget?? && couponDetailTO.budget==2>预算外
            <#else>默认
            </#if>
            </td>
        </tr>



        <tr>
            <td colspan="2" align="center">
                <!-- 按钮触发模态框 -->
                <div id="resultflag">

                </div>

                <button class="btn btn-info btn-xs" onclick="pass(${couponDetailTO.activityId?c})"><i class="fa fa-edit"></i>审核通过</button>
                <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#myModal" onclick="values(${couponDetailTO.activityId?c})"><i class="fa fa-edit"></i>审核驳回</button>


                <!-- 模态框（Modal） -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <div class="modal-content">
                                    <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel">选择名店</h4>
                            </div>
                            <div class="modal-body">
                                <table id="contentTable" class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footer">
                                    <thead>
                                    <input type="hidden" id="activityId" name="activityId" value="<#if couponDetailTO.activityId??>${couponDetailTO.activityId?c}</#if>"/>

                                    <div class="form-group">
                                        <label for="name">拒绝原因</label>
                                        <textarea class="form-control" id="reason" name="reason" rows="3"></textarea>
                                    </div>
                                    </thead>

                                </table>
                            </div>
                            <div class="modal-footer">

                                <button type="button" class="btn btn-primary" onclick="refuse()">提交驳回</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>
            </td>

        </tr>

        </tbody>
    </table>
<script>
    function values(ids) {
        $("#activityId").val(ids);
    }

    function refuse(){
        //获取模态框数据
        /* var stuno = $('#stuno').val();
         var pass = $('#pass').val();
         var name = $('#stuname').val();*/
        var activity=$('#activityId').val();
        var reason = $('#reason').val();


        //  alert(storeVal);
        $.ajax({
            type: "post",
            url: "/json/auditUnPass",
            data: "activityId="+activity+"&reason="+reason,
            dataType: 'html',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            success: function(result) {

                var stResult="";
                //alert(result);
                var jsondata = $.parseJSON(result);
                var datas=jsondata.code;
                if(datas==0){
                    stResult="审核驳回成功"
                }

                $("#resultflag").html(stResult);
                $('#myModal').modal('hide');
                top.closeTip();
            }
        });
    }

    function pass(activity){
        //获取模态框数据
        /* var stuno = $('#stuno').val();
         var pass = $('#pass').val();
         var name = $('#stuname').val();*/
        //  alert(storeVal);
        $.ajax({
            type: "post",
            url: "/json/auditPass",
            data: "activityId="+activity,
            dataType: 'html',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            success: function(result) {

                var stResult="";
                //alert(result);
                var jsondata = $.parseJSON(result);
                var datas=jsondata.code;
                if(datas==0){
                    stResult="审核通过成功"
                }

                $("#resultflag").html(stResult);

                //$('#myModal').modal('hide');
            }
        });
    }

    function myclose(index){
        top.layer.close(index);

        window.top.refresh();
    }
</script>
</body>
</html>