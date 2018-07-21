<html>
<head>
    <title></title>
    <meta name="decorator" content="default"/>
<#include "../ahead.ftl">
<#include "../treeview.ftl" >
<#include "../treetable.ftl" >

</head>
<body class="hideScroll">
<form id="inputForm" modelAttribute="addCouponDistributionTO" action="/coupondistribution/createCouponDistributionAttribute" method="post" class="form-horizontal">
    <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
        <tbody>
        <tr>
            <td  class="width-15" class="active"><label class="pull-right">领券活动ID:</label></td>
            <td class="width-35">
                <input name="activityId" htmlEscape="false" maxlength="50" class="form-control"/>
            </td>
            <td  class="width-15" class="active"><label class="pull-right">礼券活动ID:</label></td>
            <td class="width-35">
                <textarea name="couponActivityId" htmlEscape="false" rows="3" maxlength="200" class="form-control "></textarea>
            </td>
        </tr>
        <tr>
            <td class="width-15" class="active"><label class="pull-right">花费类型：</label></td>
            <td class="width-35">
                <select name="costType" class="form-control ">
                    <option value="0">无花费</option>
                    <option value="1">积分</option>
                    <option value="2">钱</option>
                </select>
            </td>
            <td class="width-15" class="active"><label class="pull-right">花费值：</label></td>
            <td class="width-35">
                <input name="cost" htmlEscape="false" maxlength="50" class="form-control"/>
            </td>
        </tr>

        <tr>
            <td class="width-15" class="active"><label class="pull-right">领取最大数量：</label></td>
            <td class="width-35">
                <input name="maxCountLimit" htmlEscape="false" maxlength="50" class="form-control"/>
            </td>
            <td class="width-15" class="active"><label class="pull-right">每日领取最大数量：</label></td>
            <td class="width-35">
                <input name="dailyMaxCountLimit" htmlEscape="false" maxlength="50" class="form-control"/>
            </td>
        </tr>
        <#--<tr>
            <td class="width-15" class="active"><label class="pull-right">用户可领取数量：</label></td>
            <td class="width-35">
                <input name="distributeMemberCount" htmlEscape="false" maxlength="50" class="form-control"/>
            </td>
            <td class="width-15" class="active"><label class="pull-right">用户领券限制：</label></td>
            <td class="width-35">
                <select name="distributeMemberRestrictionType" class="form-control ">
                    <option value="0">无限制</option>
                    <option value="1">相同券用完一张再领下一张</option>
                    <option value="2">相同券每天只能领1张</option>
                </select>
            </td>
        </tr>-->


</form>
<script type="text/javascript">
    var validateForm;
    function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
        if(validateForm.form()){
            $("#inputForm").submit();
            return true;
        }
        return false;
    }
    $(document).ready(function() {

        validateForm = $("#inputForm").validate({
            submitHandler: function(form){
                loading('正在提交，请稍等...');
                form.submit();
                closeTip();
            }
        });
    });


</script>
</body>
</html>