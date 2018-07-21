<#include "../../ahead.ftl">
<#include "../../treeview.ftl" >
<#include "../../treetable.ftl" >
<div>
    <form id="inputForms" action="/order/query/payment" method="post" class="form-horizontal">
        <table align="center">
            <tr>
                <td class="width-20 active">付款方式: </td>
                <td class="width-20">
                    <select name="payType" class="form-control">
                        <option value="5">现金</option>
                        <option value="0">线下银联刷卡</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="width-20 active">付款金额: </td>
                <td class="width-20">
                <#if amount??><input name="amount" style="display: none;" value="${amount?c}">${amount?c}</#if>
                <#if orderType??><input name="orderType" style="display: none;" value="${orderType?c}"></#if>
                    <input name="orderId" style="display: none" value="<#if orderId??>${orderId?c}</#if>" class="form-control"/>
                    <input type="hidden" name="type" value="2"/>
                </td>
            </tr>
        </table>
    </form>


    <div class="modal-footer">

        <button type="submit" class="btn btn-primary" id="btn_confirm" onclick="gensubmit()">确认收款</button>
        <script type="text/javascript">
            function gensubmit(){
                doSubmit();
            }
        </script>
    </div>



</div>

<script type="text/javascript">
    var validateForm;
    function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
        if(validateForm.form()){
            $("#inputForms").submit();
            closeTip();
            return true;
        }

        return false;
    }
    $(document).ready(function() {
        $("#value").focus();
        validateForm = $("#inputForms").validate({
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