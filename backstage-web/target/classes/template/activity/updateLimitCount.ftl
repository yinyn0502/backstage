<html>
<head>
    <title></title>
    <meta name="decorator" content="default"/>
<#include "../ahead.ftl">
<#include "../treeview.ftl" >
<#include "../treetable.ftl" >
    <link rel="stylesheet" href="/static/jquery-select2/3.4/select2.min.css"
          type="text/css">
</head>
<body class="hideScroll">
<form id="inputForm" modelAttribute="activityLimitCountVO" action="/activity/goToUpdateActivityLimit" method="post" class="form-horizontal">
    <div style="width:50%">
    <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
        <tbody>

        <tr>
            <td class="width-15" class="active"><label class="pull-right">请输入促销单号：</label></td>
            <td class="width-35">
                <input id="sheetId" name="sheetId" htmlEscape="false" maxlength="50" class="form-control required"/>
            </td>

        </tr>

        <tr>
            <td class="width-15" class="active"><label class="pull-right">请输入每个用户活动期间最大购买数量:</label></td>
            <td class="width-35">
                <input id="maxBuyN" name="maxBuyN" class="form-control required"/>
            </td>
        </tr>

        <tr>
            <td class="width-15"></td>
            <td class="width-35">
                <button class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="updateCount();" ><i class="fa fa-search"></i> 查询</button>
            </td>
        </tr>
        </tbody>
    </table>
    </div>
</form>
<script src="/static/jquery-select2/3.4/select2.min.js"></script>
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
                form.submit();
                closeTip();
            }
        });
    });

    function updateCount(){
        var sheetId = $("#sheetId").val();
        var maxBuyN = $("#maxBuyN").val();
        $.ajax({
            url: "/activity/updateCountSyn",
            type: "POST",
            dataType:"json",
            async: false,
            data:{
                "sheetId":sheetId,
                "limitCount":maxBuyN
            },
            success: function (data) {
                if( data != null ){
                    if(data == 0){
                        alert("修改成功");
                        doSubmit();
                    }
                    if( data == 34004 ){
                        alert("促销单不存在或已过期，请核实");
                    }else if(data == 34005){
                        alert("活动非单品促销，无法设置限购数量");
                    }
                }else{
                    alert("系统异常!");
                }
            },
            error: function () {
            }
        });
    }


</script>
</body>
</html>