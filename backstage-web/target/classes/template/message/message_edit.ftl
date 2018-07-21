
<html>
<head>
    <title>消息管理</title>

    <meta name="decorator" content="default"/>
<#include "../ahead.ftl">
<#include "../treeview.ftl" >
<#include "../treetable.ftl" >
</head>
<body class="hideScroll">
<form id="inputForm" modelAttribute="batchMessageTO" action="/message/jpush" method="post" class="form-horizontal">
    <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
        <tbody>
        <tr>
            <td class="width-20 active">	<label class="pull-right">推送标题:</label></td>
            <td class="width-45"  colspan="2"><input name="title" htmlEscape="false" maxlength="150" class="form-control"  value=""/></td>
        </tr>

        <tr>
        	<td  class="width-20 active">	<label class="pull-right"><font color="red">*</font>推送内容:</label></td>
            <td  class="width-45" colspan="2"><input name="content" htmlEscape="false" maxlength="150" class="form-control required" value=""/></td>
        </tr>

        <tr>
            <td class="width-20 active">	<label class="pull-right">文案链接:</label></td>
            <td class="width-20" ><input name="targetValue" htmlEscape="false" class="form-control" value=""/></td>
        	<td class="width-25" colspan="2"><input id="targetType1" name="targetType" class="required i-checks " type="radio" value="0" checked="checked"/><label for="targetType1">原生页</label></span><span><input id="targetType2" name="targetType" class="required i-checks " type="radio" value="1" /><label for="targetType2">H5</label></td>
        </tr>

        <tr>
         	<td class="width-20 active">	<label class="pull-right"><font color="red">*</font>文案类型:</label></td>
         	<td class="width-45" ><input id="businessType1" name="businessType" class="required i-checks " type="radio" value="2" checked="checked"/><label for="businessType1">营销类</label></span><span><input id="businessType2" name="businessType" class="required i-checks " type="radio" value="1" /><label for="businessType2">业务类</label></td>
        </tr>

        <tr>
            <td class="width-20 active">	<label class="pull-right"><font color="red">*</font>目标人群:</label></td>
        	<td class="width-20" >
        	<input id="personType2" name="personType" class="required i-checks " type="radio" value="1" checked /><label for="personType2">目标用户手机</label></span></p>
            <input id="personType1" name="personType" class="required i-checks " type="radio" value="0" /><label for="personType1">某个门店的所有用户</label></span>
            </td>
        	<td class="width-25" >
                <p>
        	<textarea name="targets" htmlEscape="false" rows="2" maxleng、th="20000" class="form-control " value="" ></textarea>
                <div id="lengthNotify" >最多输入1000个手机号码，以英文逗号分隔</div>
                </p>
                <select id="storeIds" name="storeId" >
                    <option selected = "selected" value="">请选择门店</option>
                     <#if storeList??>
                         <#list storeList as store>
                                <option  value="<#if store.id??>${store.id}</#if>"><#if store.id??>${store.id}</#if>-<#if store.name??>${store.name}</#if></option>
                         </#list>
                     </#if>
                </select>
        	</td>
        </tr>

        <tr>
           <td class="width-20 active">	<label class="pull-right"><font color="red">*</font>目标设备:</label></td>
           <td class="width-45" colspan="2"><input id="appType1" name="appType" class="required i-checks " type="radio" value="1" /><label for="appType1">安卓</label></span><span><input id="appType2" name="appType" class="required i-checks " type="radio" value="0" /><label for="appType2">IOS</label></span><span><input id="appType3" name="appType" class="required i-checks " type="radio" value="2"  /><label for="appType3">全部</label></td>
        </tr>

        <tr>
            <td class="width-20 active">	<label class="pull-right"><font color="red">*</font>发送时间:</label></td>
        	<td class="width-20" >
        	<input id="bookType1" name="bookType" class="required i-checks " type="radio" value="0" checked/><label for="bookType1">立即发送</label></span></p>
        	<input id="bookType2" name="bookType" class="required i-checks " type="radio" value="1" /><label for="bookType2">预约发送</label></span>
        	</td>
        	<td class="width-25" >
        	<div><label class="pull-right"></label></div></span></p>
            <input type="text" class="input-sm form-control " data-date-format="yyyy-mm-dd hh:ii:ss" id="bookTime" name="bookTime" readonly disabled/>
        	</td>
        </tr>

        </tbody>
    </table>
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
        $('#storeIds').css('background-color', '#EEEEEE').attr('disabled', 'disabled');
    	
    	$('#bookTime').datetimepicker({
    		format: 'yyyy-mm-dd hh:ii:ss',
            weekStart: 1,
            autoclose: true,
            minView: 0,
            forceParse: false,
            language: 'zh-CN'
       });
    	
    	$("input:radio[name=bookType]").on('ifChecked', function(event) {
    		var discount = $(this).val();
            if(discount=="0"){
            	$("[name=bookTime]").attr("disabled",true);
            	$("[name=bookTime]").attr("value","");
            }else{
            	$("[name=bookTime]").removeAttr("disabled");
            }
        });
    	
    	
    	$("input:radio[name=personType]").on('ifChecked', function(event) {
    		var discount = $(this).val();
            $('#storeIds').css('background-color', '').removeAttr('disabled');
            if(discount=="0"){
            	$("[name=targets]").attr("readOnly",true).val('');
                $('#lengthNotify').hide();
            }else{
            	$("[name=targets]").removeAttr("readOnly");
                $('#lengthNotify').show();
                $('#storeIds').css('background-color', '#EEEEEE').attr('disabled', 'disabled');
                $("#storeIds option:first").prop("selected", 'selected');
            }
        });

        $.validator.addMethod('checkTargets',function(){
            if($("input[name='personType']:checked").val()==1){
                var target = $("[name=targets]").val();
                return target.length > 0;
            }else return true;
        },'目标用戶不能为空');

        jQuery.validator.addMethod("checkStoreId", function() {
            var personType = $('[name = personType]:checked').val();
            if (personType == '0') {
                var storeId = $("#storeIds option:selected").val();
                if (storeId){return  true}  else false
            }
        },'请选择门店');


        validateForm= $("#inputForm").validate({
            rules: {
                title : {
                    maxlength:20
                },
                content : {
                    required : true,
                    maxlength:80
                },
                businessType : {
                    required : true
                },
                personType : {
                    required : true
                },
                appType : {
                    required : true
                },
                bookType : {
                    required : true
                },
                bookTime : {
                    required : true
                },
                targets : {
                    checkTargets : true
                },
                storeId : {
                    checkStoreId : true
                }
            },
            messages: {
                content: {remote: "请填写推送内容"},
                businessType: {remote: "请选择文案类型"},
                personType: {remote: "请选择目标人群"},
                appType: {remote: "请选择目标设备"},
                bookType: {remote: "请选择发送时间"},
                bookTime: {remote: "请选择发送时间"}
            },
            submitHandler: function(form){
                form.submit();
            },
            errorContainer: "#messageBox",
            errorPlacement: function(error, element) {
                $("#messageBox").text("输入有误，请先更正。");
                if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
                    error.appendTo(element.parent().parent());
                } else {
                    error.insertAfter(element);
                }
            }
        });

    });


</script>
</body>
</html>