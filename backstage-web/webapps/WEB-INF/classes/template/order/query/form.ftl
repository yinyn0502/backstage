
<html>
<head>
    <title>订单详情</title>

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
<form id="inputForm" modelAttribute="orderDetailTO" action="/order/query/audit" method="post" class="form-horizontal">

<#include "../../message.ftl">
    <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
        <tbody>
        <tr>
            <td  class="width-15 active" colspan="6">订单基本信息</td>
        </tr>
        <tr>
            <td class="width-15 active">	<label class="pull-left">订单号:</label></td>
            <td class="width-20" > <#if orderDetailTO.baseInfo.orderId??>${orderDetailTO.baseInfo.orderId?c}<#else> </#if></td>
            <td class="width-15 active">	<label class="pull-left">下单用户:</label></td>
            <td class="width-20" > <#if orderDetailTO.baseInfo.memberName??>${orderDetailTO.baseInfo.memberName}<#else> </#if></td>
            <td class="width-15 active">	<label class="pull-left">门店:</label></td>
            <td class="width-20" > <#if orderDetailTO.baseInfo.storeName??>${orderDetailTO.baseInfo.storeName}<#else> </#if></td>
        </tr>

        <tr>
            <td class="width-15 active">	<label class="pull-left">渠道:</label></td>
            <td class="width-20" > <#if orderDetailTO.baseInfo.channel??>${orderDetailTO.baseInfo.channel}<#else> </#if></td>
            <td class="width-15 active">	<label class="pull-left">订单状态:</label></td>
            <td class="width-20" > <#if orderDetailTO.baseInfo.status??><font color="red">${orderDetailTO.baseInfo.status}</font><#else> </#if></td>
            <td class="width-15 active">	<label class="pull-left"></label></td>
            <td class="width-20" ></td>
        </tr>

        <tr>
            <td class="width-15 active">	<label class="pull-left">下单时间:</label></td>
            <td class="width-20" > <#if orderDetailTO.baseInfo.orderCreateTime??><font size="2">${orderDetailTO.baseInfo.orderCreateTime}</font><#else> </#if></td>
            <td class="width-15 active">	<label class="pull-left">付款时间:</label></td>
            <td class="width-20" > <#if orderDetailTO.baseInfo.payedTime??><font size="2">${orderDetailTO.baseInfo.payedTime}</font><#else> </#if></td>
            <td class="width-15 active">	<label class="pull-left">送达时间:</label></td>
            <td class="width-20" > <#if orderDetailTO.baseInfo.deliveryTime??><font size="2">${orderDetailTO.baseInfo.deliveryTime}</font><#else> </#if></td>
        </tr>

        <tr>
            <td  class="width-15 active" colspan="6">订单金额明细</td>
        </tr>
        <tr>
            <td  class="width-15 active">	<label class="pull-left">商品成交金额:</label></td>
            <td class="width-20" > <#if orderDetailTO.orderAmount.totalAmount??>${orderDetailTO.orderAmount.totalAmount}<#else> </#if></td>


            <td  class="width-15 active">
                <label class="pull-left">系统集合促销:</label>
            </td>
            <td class="width-20" >
                -<#if orderDetailTO.orderAmount.promoDiscount??>${orderDetailTO.orderAmount.promoDiscount}<#else> </#if>
            </td>
            <td  class="width-15 active">	<label class="pull-left">本地手工单品折扣</label></td>
            <td class="width-20" >
                 -<#if orderDetailTO.orderAmount.singleManualDiscount??>${orderDetailTO.orderAmount.singleManualDiscount}<#else> </#if>
            </td>
        </tr>

        <tr colspan="4">
            <td  class="width-15 active">
                <label class="pull-left">本地手工整单折扣:</label>
            </td>
            <td class="width-20" >
                -<#if orderDetailTO.orderAmount.wholeManualDiscount??>${orderDetailTO.orderAmount.wholeManualDiscount}<#else> </#if>
            </td>
            <td  class="width-15 active">
                <label class="pull-left">商品优惠券:</label>
            </td>
            <td class="width-20" >
                -<#if orderDetailTO.orderAmount.couponDiscount??>${orderDetailTO.orderAmount.couponDiscount}<#else> </#if>
            </td>
            <td  class="width-15 active">
                <label class="pull-left">现金劵:</label></td>
            <td class="width-20" >
                <#if orderDetailTO.orderAmount.expressChargeDeduct??>${orderDetailTO.orderAmount.expressChargeDeduct}<#else> </#if>
            </td>
        </tr>



        <tr colspan="4">
            <td  class="width-15 active">	<label class="pull-left">运费金额:</label></td>
            <td class="width-20" > <#if orderDetailTO.orderAmount.expressCharge??>${orderDetailTO.orderAmount.expressCharge}<#else> </#if></td>
            <td  class="width-15 active">	<label class="pull-left">运费优惠:</label></td>
            <td class="width-20" > <#if orderDetailTO.orderAmount.expressChargeDeduct??>${orderDetailTO.orderAmount.expressChargeDeduct}<#else> </#if></td>
            <td  class="width-15 active">	<label class="pull-left"></label></td>
            <td class="width-20" ></td>
        </tr>

        <tr>
            <td  class="width-15 active">	<label class="pull-left">订单成交总金额:</label></td>
            <td class="width-20" > <#if orderDetailTO.orderAmount.bargainAmount??>${orderDetailTO.orderAmount.bargainAmount}<#else> </#if></td>
            <td  class="width-15 active">	<label class="pull-left"></label></td>
            <td class="width-20" ></td>
            <td  class="width-15 active">	<label class="pull-left"></label></td>
            <td class="width-20" ></td>

        </tr>

        <tr colspan="6">
            <td class="width-15 active">	<label class="pull-left">积分支付:</label></td>
            <td class="width-20" > <#if orderDetailTO.orderAmount.memberPointAmount??>${orderDetailTO.orderAmount.memberPointAmount}<#else> </#if></td>
            <td class="width-15 active">	<label class="pull-left">现金券支付:</label></td>
            <td class="width-20" > <#if orderDetailTO.orderAmount.cashCouponAmount??>${orderDetailTO.orderAmount.cashCouponAmount}<#else> </#if></td>
            <td class="width-15 active">	<label class="pull-left">其他支付:</label></td>
            <td class="width-20" > <#if orderDetailTO.orderAmount.otherPayAmount??>${orderDetailTO.orderAmount.otherPayAmount}<#else> </#if></td>
        </tr>
        <tr>
            <td  class="width-15 active" colspan="6">商品明细</td>
        </tr>

        <tr>
            <td colspan="6">
                <table  class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
                    <thead>
                    <tr>

                        <th  class="sort-column value">序号</th>
                        <th>商品编码</th>
                        <th  class="sort-column type">商品名称</th>
                        <th  class="sort-column description">商品单价</th>
                        <th  class="sort-column sort">购买数量</th>
                        <th  class="sort-column sort">实配数量</th>
                        <th  class="sort-column sort">成交单价</th>
                        <th>商品享受集合总优惠</th>
                        <th>实际成交总价</th>


                    </tr>
                    </thead>
                    <tbody>
                            <#if orderDetailTO.orderItemList??>
                            <#list orderDetailTO.orderItemList as b>

                            <tr>

                                <td class="width-15 active">${b_index+1}</td>
                                <td class="width-20"><#if b.productId??>${b.productId?c}</#if></td>
                                <td>
                                    <#if b.productName??>${b.productName}</#if>
                                </td>
                                <td>
                                    <#if b.price??>
                                        ${b.price}
                                    </#if>
                                </td>
                                <td>
                                    <#if b.orderCount??>
                                        ${b.orderCount}
                                    </#if>
                                </td>
                                <td>
                                    <#if b.allotCount??>
                                        ${b.allotCount}
                                    </#if>

                                </td>
                                <td>
                                    <#if b.bargainPrice??>
                                        ${b.bargainPrice}
                                    </#if>

                                </td>
                                <td>
                                      <#if b.benefitAmount??>
                                          ${b.benefitAmount}
                                      </#if>

                                </td>

                                <td>
                                    <#if b.bargainAmount??>
                                        ${b.bargainAmount}
                                    </#if>
                                </td>



                            </tr>
                            </#list>
                            </#if>
                    </tbody>
                </table>
            </td>
        </tr>


        <tr>
            <td  class="width-15 active" colspan="6">订单状态变化</td>
        </tr>
        <td colspan="6" class="col-md-6">
            <table  class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
                <thead>
                <tr>

                    <th  class="sort-column value">时间</th>
                    <th>订单状态</th>
                    <th  class="sort-column type">其他说明</th>
                </tr>
                </thead>
                <tbody>
                                               <#if orderDetailTO.orderFlowList??>
                                               <#list orderDetailTO.orderFlowList as b>

                                               <tr>

                                                   <td class="width-20 active"><#if b.time??>${b.time}</#if></td>
                                                   <td class="width-20"><#if b.status??>${b.status}</#if></td>
                                                   <td>
                                                       <#if b.note??>
                                                           ${b.note}
                                                       </#if>
                                                   </td>

                                               </tr>
                                               </#list>
                                               </#if>
                </tbody>
            </table>

        </td>
        </tr>




        <tr>
            <td colspan="6">
                <!-- Button trigger modal -->
        <#if orderDetailTO??>
            <#if orderDetailTO.operationList??>
                <#list orderDetailTO.operationList as oper>
                    <#if oper.operationType==4>
                <shiro:hasPermission name="order:query:audit">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal"  href="/order/return/questions?orderId=<#if orderDetailTO.baseInfo.orderId??>${orderDetailTO.baseInfo.orderId?c}</#if><#if orderDetailTO.baseInfo.memberId??>&&memberId=${orderDetailTO.baseInfo.memberId?c}</#if>">
                        退换货
                    </button>
                </shiro:hasPermission>
                    </#if>

                    <#if oper.operationType==2>
                    <shiro:hasPermission name="order:query:payview">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal"  href="/order/query/payviews?orderId=<#if orderDetailTO.baseInfo.orderId??>${orderDetailTO.baseInfo.orderId?c}</#if>&amount=<#if orderDetailTO.shouldPayAmount??>${orderDetailTO.shouldPayAmount?c}</#if>&orderType=<#if orderDetailTO.baseInfo.orderType??>${orderDetailTO.baseInfo.orderType}</#if>">
                            确认收款
                        </button>
                    </shiro:hasPermission>
                    </#if>


                <!-- Modal -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">申请退换货</h4>
                            </div>
                            <div class="modal-body">
                                <#if oper.operationType==4>
                                    <#include "../return/questions.ftl">
                                </#if>

                            <#if oper.operationType==2>
                                <#include "../query/payview.ftl">
                            </#if>
                            </div>
                        <#--<div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" id="btn_confirm">Save changes</button>
                        </div>-->
                        </div>
                    </div>
                </div>




                </#list>
            </#if>
        </#if>






            </td>


        </tr>









        </tbody>
    </table>
</form>
</body>
</html>