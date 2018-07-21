<html>
<head>
    <title></title>
    <meta name="decorator" content="default"/>
<#include "../ahead.ftl">
<#include "../treeview.ftl" >
<#include "../treetable.ftl" >

</head>
<body class="hideScroll">
<form id="inputForm" modelAttribute="couponAttributeDTO" action="/coupon/create" method="post" class="form-horizontal">
    <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
        <tbody>
        <tr>
            <td  class="width-15" class="active"><label class="pull-right">礼券活动ID:</label></td>
            <td class="width-35">
                <input name="activityId" htmlEscape="false" maxlength="50" class="form-control"/>
            </td>
            <td class="width-15" class="active"><label class="pull-right">礼券类型:</label></td>
            <td class="width-35">
                <select name="couponType" class="form-control ">
                    <option value="1">商品券</option>
                    <option value="2">现金券</option>
                    <option value="3">运费券</option>
                </select>
            </td>
        </tr>
        <tr>
            <td class="width-15" class="active"><label class="pull-right">优惠条件：</label></td>
            <td class="width-35">
                <select name="qualificationType" class="form-control ">
                    <option value="0">无类型</option>
                    <option value="1">满额</option>
                    <option value="2">满件</option>
                </select>
            </td>
            <td class="width-15" class="active"><label class="pull-right">优惠条件值：</label></td>
            <td class="width-35">
                <input name="qualificationValue" htmlEscape="false" maxlength="50" class="form-control"/>
            </td>
        </tr>

        <tr>
            <td class="width-15" class="active"><label class="pull-right">优惠类型：</label></td>
            <td class="width-35">
                <select name="benefitType" class="form-control ">
                    <option value="0">减</option>
                    <option value="1">折</option>
                </select>
            </td>
            <td class="width-15" class="active"><label class="pull-right">优惠值：</label></td>
            <td class="width-35">
                <input name="benefitValue" htmlEscape="false" maxlength="50" class="form-control"/>
            </td>
        </tr>

        <tr>
            <td class="width-15" class="active"><label class="pull-right">用户领取限制数量:</label></td>
            <td class="width-35">
                <input name="count" htmlEscape="false" maxlength="50" class="form-control"/>
            </td>
            <td class="width-15" class="active"><label class="pull-right">发放礼券总数量:</label></td>
            <td class="width-35">
                <input name="totalCount" htmlEscape="false" maxlength="50" class="form-control"/>
            </td>
        </tr>


        <tr>
            <td class="width-15" class="active"><label class="pull-right">条件作用域:</label></td>
            <td class="width-35">
                <select name="couponQualificationScope" class="form-control ">
                    <option value="1">SKU(单品)</option>
                    <option value="2">ALL(集合)</option>
                </select>
            </td>
            <td class="width-15" class="active"><label class="pull-right">礼券介绍:</label></td>
            <td class="width-35">
                <input name="couponIntroduce" htmlEscape="false" maxlength="50" class="form-control"/>
            </td>
        </tr>


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