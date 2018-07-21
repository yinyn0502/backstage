
<html>
<head>
    <title>字典管理</title>

    <meta name="decorator" content="default"/>
<#include "../../ahead.ftl">
<#include "../../treeview.ftl" >
<#include "../../treetable.ftl" >
    <script type="text/javascript">
        var validateForm;
        function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
            if(validateForm.form()){
                $("#inputForm").submit();
                closeTip();
                return true;
            }

            return false;
        }
        $(document).ready(function() {
            $("#value").focus();
            validateForm = $("#inputForm").validate({
                submitHandler: function(form){
                    loading('正在提交，请稍等...');
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
</head>
<body class="hideScroll">
<form id="inputForm" modelAttribute="dict" action="/sys/dict/save" method="post" class="form-horizontal">
    <input type="hidden" name="id" <#if dict.id??>value="${dict.id}"</#if>/>
    <input type="hidden" name="createBy" <#if dict.createBy??>value="${dict.createBy}"</#if>/>
    <input type="hidden" name="delFlag" <#if dict.delFlag??>value="${dict.delFlag}"</#if>/>
    <#include "../../message.ftl">
    <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
        <tbody>
        <tr>
            <td  class="width-15 active">	<label class="pull-right">键值:</label></td>
            <td class="width-35" ><input name="value" htmlEscape="false" maxlength="50" class="form-control required" <#if dict.value??>value="${dict.value}"<#else> value=""</#if>/></td>
            <td  class="width-15 active">	<label class="pull-right">标签:</label></td>
            <td  class="width-35" ><input name="label" htmlEscape="false" maxlength="50" class="form-control required" <#if dict.label??>value="${dict.label}"</#if>/></td>
        </tr>
        <tr>
            <td  class="width-15 active">	<label class="pull-right">类型:</label></td>
            <td class="width-35" ><input name="type" htmlEscape="false" maxlength="50" class="form-control required abc" <#if dict.type??>value="${dict.type}"</#if>/></td>
            <td  class="width-15 active">	<label class="pull-right">描述:</label></td>
            <td  class="width-35" ><input name="description" htmlEscape="false" maxlength="50" class="form-control required" <#if dict.description??>value="${dict.description}"</#if>/></td>
        </tr>
        <tr>
            <td  class="width-15 active">	<label class="pull-right">排序:</label></td>
            <td class="width-35" ><input name="sort" htmlEscape="false" maxlength="11" class="form-control required digits"<#if dict.sort??>value="${dict.sort}"</#if>/></td>
            <td  class="width-15 active">	<label class="pull-right">备注:</label></td>
            <td  class="width-35" ><textarea name="remarks" htmlEscape="false" rows="3" maxlength="200" class="form-control "><#if dict.remarks??>${dict.remarks}</#if></textarea></td>
        </tr>
        </tbody>
    </table>
</form>
</body>
</html>