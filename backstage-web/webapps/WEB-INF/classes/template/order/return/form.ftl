
<html>
<head>
    <title>退换货管理</title>

    <meta name="decorator" content="default"/>
<#include "../../ahead.ftl">
<#include "../../treeview.ftl" >
<#include "../../treetable.ftl" >
    <script type="text/javascript">
        var validateForm;
        function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
           var isSubmit = $("#isSubmit").html();
            if (isSubmit == 0) {
                closeTip();
                return true;
            }
            if(validateForm.form()){
                <#if isModal??&&isModal>
                    <#if flag?? && flag==94>
                        $('#myModal').modal('show');

                    </#if>
                </#if>
                <#if isModal??&&!isModal>
                    $("#inputForm").submit();
                    closeTip();
                    return true;
                </#if>
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

        function submitException() {
            $("#isSubmit").html(0);

            var reverseId = $("#reverseId").val();
            var exceptionType = $("#exceptionType").val();
            var exceptionDesc = $("#exceptionDesc").val();
            $.get("/order/return/confirmgoodsnot?reverseId="+reverseId+"&reverseExceptionType="+exceptionType+"&reverseExceptionDesc="+exceptionDesc, function () {
                $('#myModal').modal('hide');
                doSubmit();
            });
        }
        $(function () {
            <#if reverseOrderDetail??&&reverseOrderDetail.reverseType==1||reverseOrderDetail.reverseType==3||reverseOrderDetail.reverseType==5>
                $(".refundView").hide();
            </#if>
        });
    </script>
</head>
<body class="hideScroll">
<label id="isSubmit" value="1" style="display: none;">1</label>
<form id="inputForm" modelAttribute="reverseOrderDetail" action="<#if postUrl??>${postUrl} </#if>" method="post" class="form-horizontal">
    <input type="hidden" name="reverseId" id="reverseId" <#if reverseOrderDetail.reverseId??>value="${reverseOrderDetail.reverseId?c}"</#if>/>

<#include "../../message.ftl">
    <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
        <tbody>
        <tr>
            <td  class="width-15 active" colspan="2">退换货服务类型</td>
        </tr>
        <tr>
            <td  class="width-15 active">	<label class="pull-right">申请类型:</label></td>
            <td class="width-35" > <#if reverseOrderDetail.reverseTypeDesc??>${reverseOrderDetail.reverseTypeDesc}<#else> </#if></td>
        </tr>

        <tr>
            <td  class="width-15 active">	<label class="pull-right">申请原因:</label></td>
            <td class="width-35" > <#if reverseOrderDetail.reverseReasonDesc??>${reverseOrderDetail.reverseReasonDesc}<#else> </#if></td>
        </tr>
        <#if reverseOrderDetail.isShowPickGoods>

        <tr>
            <td  class="width-15 active">	<label class="pull-right">是否取回:</label></td>
            <#if reverseOrderDetail.reverseStatus==0>
            <td class="width-35" >
                <select name="isPickup">
                    <option value="1" <#if reverseOrderDetail.isPickup??&&reverseOrderDetail.isPickup==1>selected</#if>>取 回</option>
                    <option value="0" <#if reverseOrderDetail.isPickup??&&reverseOrderDetail.isPickup==0>selected</#if>>不取回</option>
                </select>
            </td>
            </#if>
            <#if reverseOrderDetail.reverseStatus!=0>
                <td class="width-35" >
                        <#if reverseOrderDetail.isPickup??&&reverseOrderDetail.isPickup==1><label>取 回</label></#if>
                        <#if reverseOrderDetail.isPickup??&&reverseOrderDetail.isPickup==0><label>不取回</label></#if>
                </td>
            </#if>
        </tr>
        </#if>
        <tr>
            <td  class="width-15 active">	<label class="pull-right">问题描述:</label></td>
            <td class="width-35" > <#if reverseOrderDetail.reverseReasonDetail??>${reverseOrderDetail.reverseReasonDetail}<#else> </#if></td>
        </tr>

        <tr>
            <td  class="width-15 active">	<label class="pull-right">图片信息:</label></td>
            <td class="width-35" > <#if imgUrl??>
                <#list imgUrl as img>
                    <img src="${img}"} width="100px"/>
                </#list>
            <#else> </#if></td>
        </tr>

        <tr>
            <td  class="width-15 active">	<label class="pull-right">退货方式:</label></td>
            <td class="width-35" > <#if reverseOrderDetail.reverseModeDesc??>${reverseOrderDetail.reverseModeDesc}<#else> </#if></td>
        </tr>

        <tr>
            <td  class="width-15 active">	<label class="pull-right">退货地址:</label></td>
            <td class="width-35" > <#if reverseOrderDetail.addressInfo??>${reverseOrderDetail.addressInfo.address}<#else> </#if></td>
        </tr>

        <tr>
            <td  class="width-15 active">	<label class="pull-right">退货联系人:</label></td>
            <td class="width-35" > <#if reverseOrderDetail.addressInfo??>${reverseOrderDetail.addressInfo.consigneeName}<#else> </#if></td>
        </tr>

        <tr>
            <td  class="width-15 active">	<label class="pull-right">联系电话:</label></td>
            <td class="width-35" > <#if reverseOrderDetail.addressInfo??>${reverseOrderDetail.addressInfo.consigneeMobile}<#else> </#if></td>
        </tr>




        <tr>
            <td  class="width-15 active" colspan="2">申请商品</td>
        </tr>

        <tr>
<td colspan="2">
            <table  class="table">
                <thead>
                <tr>

                    <th  class="sort-column value">商品ID</th>
                    <th>商品名称</th>
                    <th  class="sort-column type">商品单价</th>
                    <th  class="sort-column description">购买数量</th>
                    <th  class="sort-column sort">享受优惠</th>
                    <th>实际成交总价</th>
                    <th>申请数量</th>
                    <th class="refundView">预计退款金额</th>

                </tr>
                </thead>
                <tbody>
                <#list reverseOrderDetail.productInfo as b>

                <tr>

                    <td>${b.productId?c}</td>
                    <td><#if b.productName??>${b.productName}</#if></td>
                    <td><#if b.productPrice??>${b.productPrice}</#if></td>
                    <td><#if b.buyCount??>${b.buyCount}</#if></td>
                    <td><#if b.discountAmount??>${b.discountAmount}</#if></td>
                    <td><#if b.dealAmount??>${b.dealAmount}</#if></td>
                    <td><#if b.count??>${b.count}</#if></td>
                    <td class="refundView"><#if b.price??>${b.price}</#if></td>

                </tr>
                </#list>
                </tbody>
            </table>
</td>
        </tr>
<#if reverseOrderAmount??>
<table class="refundView">
        <tr>

            <td  class="width-15 active" colspan="2">退回金额确认</td>

        </tr>

        <tr>
            <td  class="width-15 active">	<label class="pull-right">退回商品总金额:</label></td>
            <td class="width-35" > <#if reverseOrderAmount.productTotalPrice??>${reverseOrderAmount.productTotalPrice}<#else> </#if></td>
        </tr>

        <tr>
            <td  class="width-15 active">	<label class="pull-right">退回运费:</label></td>
            <td class="width-35" > <#if reverseOrderAmount.orderExpressCharge??>${reverseOrderAmount.orderExpressCharge}<#else> </#if></td>
        </tr>

        <tr>
            <td  class="width-15 active">	<label class="pull-right">收取运费:</label></td>
            <td class="width-35" > <#if reverseOrderAmount.expressCharge??>${reverseOrderAmount.expressCharge}<#else> </#if></td>
        </tr>
        <tr>
            <td  class="width-15 active">	<label class="pull-right">合计:</label></td>
            <td class="width-35" > <#if reverseOrderAmount.totalPrice??>${reverseOrderAmount.totalPrice}<#else> </#if></td>
        </tr>

            <#if reverseOrderAmount.refundResult??>
            <#if reverseOrderAmount.refundResult.deductCreditAmount??>
                <tr>
                    <td  class="width-15 active">	<label class="pull-right">吃货币奖励扣回金额:</label></td>
                    <td class="width-35" > <#if reverseOrderAmount.refundResult.deductCreditAmount??>${reverseOrderAmount.refundResult.deductCreditAmount}<#else> </#if></td>
                </tr>
            </#if>
                    <tr>
            <#--<td><label>现金／支付宝／微信退回:</label><#if moneyAmount??>${moneyAmount}<#else>0.00</#if></td>-->
                <#list reverseOrderAmount.refundResult.refundTOList as payment>
                        <td  class="width-15 active">
                            <#if payment??&&payment.payTypeDesc??><label class="pull-right">${payment.payTypeDesc}:</label></#if>
                        </td>
                        <td class="width-35" > <#if payment??&&payment.refundAmount??>${payment.refundAmount}<#else> </#if></td>
                </#list>
                    </tr>
            </#if>

</#if>

        </table>
        </tbody>
    </table>
</form>

<#--<#if isModal>-->

<#--<button class="btn btn-primary btn-lg" data-toggle="modal" id="modalOpenButton" data-target="#myModal"></button>-->
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">核验收货异常</h4>
            </div>
            <div class="modal-body">
                <table>
                    <tr>
                        <td>异常原因:</td>
                        <td>
                            <select id="exceptionType" name="reverseExceptionType">
                                <option value="1">收到商品有破损</option>
                                <option value="2">收到商品数量与实际申报不符</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>其他说明:</td>
                        <td><textarea id="exceptionDesc" name="reverseExceptionDesc"></textarea></td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="submitException();">确认</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<#--</#if>-->

</body>
</html>
