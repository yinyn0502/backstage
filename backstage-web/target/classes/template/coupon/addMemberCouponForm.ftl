<html>
<head>
    <title></title>
    <meta name="decorator" content="default"/>
<#include "../ahead.ftl">
<#include "../treeview.ftl" >
<#include "../treetable.ftl" >

</head>
<body class="hideScroll">
<form id="inputForm" modelAttribute="couponDistributeCheckBatchDTO" action="/coupondistribution/create" method="post" class="form-horizontal">
    <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
        <tbody>
        <tr>
            <td  class="width-15" class="active"><label class="pull-right">领券活动ID:</label></td>
            <td class="width-35">
                <input name="activityId" htmlEscape="false" maxlength="50" class="form-control"/>
            </td>
            <td  class="width-15" class="active"><label class="pull-right">礼券活动ID:</label></td>
            <td class="width-35">
                <input name="couponActivityId" htmlEscape="false" maxlength="50" class="form-control"/>
            </td>
        </tr>
        <tr>
            <td class="width-15" class="active"><label class="pull-right">用户ID：</label></td>
            <td class="width-35">
                <textarea name="memberIdList" htmlEscape="false"  class="form-control "></textarea>
            </td>
            <td class="width-15" class="active"><label class="pull-right">门店ID：</label></td>
            <td class="width-35">
                <input name="storeId" htmlEscape="false" maxlength="50" class="form-control"/>
            </td>
        </tr>

        <tr>
            <td class="width-15" class="active"><label class="pull-right">终端类型：</label></td>
            <td class="width-35">
                <select name="appType" class="form-control ">
                    <option value="0">IOS</option>
                    <option value="1">ANDROID</option>
                    <option value="2">H5</option>
                </select>
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