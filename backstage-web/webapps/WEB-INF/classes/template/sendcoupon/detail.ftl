
<html>
<head>
    <title>优惠券详情</title>

    <meta name="decorator" content="default"/>
<#include "../ahead.ftl">
<#include "../treeview.ftl" >
<#include "../treetable.ftl" >

    <script>
        /*$(function () {
            $("#download").click(function () {
                $.get("", {
                    mobileText : $(this).data("tel")
                }, function (data) {
                    console.log(data);
                }, true);
            });
        });*/
    </script>
</head>
<body class="hideScroll">
<form id="inputForm" modelAttribute="sendCouponDetailTO" action="/sendcoupon/detail" method="post" class="form-horizontal">

    <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
        <tbody>
        <tr>
            <td  class="width-15 active" colspan="6">发券活动明细</td>
        </tr>
        <tr>
            <td class="width-15 active">	<label class="pull-left">最后操作:</label>
            <#if sendCouponDetailTO.updatedBy??>${sendCouponDetailTO.updatedBy}<#else> </#if></td>
            <td class="width-15 active">	<label class="pull-left">操作时间:</label> <#if sendCouponDetailTO.updateTime??>${sendCouponDetailTO.updateTime}<#else> </#if></td>
        </tr>
        <tr>
            <td  class="width-15 active" colspan="2">基本信息</td>
        </tr>
        <tr>
            <td class="width-15 active">	<label class="pull-left">活动名称:</label></td>
            <td class="width-20" > <#if sendCouponDetailTO.sendActivityName??>${sendCouponDetailTO.sendActivityName}<#else> </#if></td>
        </tr>

        <tr>
            <td class="width-15 active">	<label class="pull-left">活动目标:</label></td>
            <td class="width-20" >
            <#if sendCouponDetailTO.targetType?? && sendCouponDetailTO.targetType==1>拉新</#if>
            <#if sendCouponDetailTO.targetType?? && sendCouponDetailTO.targetType==2>沉默激活</#if>
            <#if sendCouponDetailTO.targetType?? && sendCouponDetailTO.targetType==3>下单奖励</#if>
            <#if sendCouponDetailTO.targetType?? && sendCouponDetailTO.targetType==4>社群运营</#if>
            <#if sendCouponDetailTO.targetType?? && sendCouponDetailTO.targetType==5>用户补偿</#if>
            <#if sendCouponDetailTO.targetType?? && sendCouponDetailTO.targetType==6>品类推广</#if>
            <#if sendCouponDetailTO.targetType?? && sendCouponDetailTO.targetType==7>目标用户促活</#if>
            <#if sendCouponDetailTO.targetType?? && sendCouponDetailTO.targetType==8>第三方合作</#if>
            <#if sendCouponDetailTO.targetType?? && sendCouponDetailTO.targetType==9>其他</#if>

            </td>
        </tr>
        <tr>
            <td class="width-15 active">	<label class="pull-left">目标用户:</label></td>
            <td class="width-20" >
                <a href="/sendcoupon/downloadExcel?mobileText=<#if sendCouponDetailTO.mobileText??>${sendCouponDetailTO.mobileText}<#else></#if>">download</a>
            </td>
        </tr>
        <tr>
            <td class="width-15 active" colspan="2">	<label class="pull-left">绑定优惠券:</label></td>
            </td>
        </tr>
        <#if sendCouponDetailTO.activityNameList??>
        <#list sendCouponDetailTO.activityNameList as b>
        <tr>
            <td><#if b.activityId??>${b.activityId?c}</#if></td>
            <td><#if b.activityName??>${b.activityName}</#if></td>
        </tr>
        </#list>
        </#if>

        </tbody>
    </table>
</form>
</body>
</html>