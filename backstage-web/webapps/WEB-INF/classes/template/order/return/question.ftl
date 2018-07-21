<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>退换货管理</title>

    <meta name="decorator" content="default"/>
<#include "../../ahead.ftl">
<#include "../../treeview.ftl" >
<#include "../../treetable.ftl" >
    <style>
        .colRowForm{
            border: 1px solid red;
            height: 500px;
        }
        .colRowFormBlue{
            border: 2px solid blue;
            height: 200px;
            max-width:100% ;
        }
        .slectFrom{
            width: 60px;
        }
    </style>
<#if isCanReverse??&&isCanReverse>
    <script type="text/javascript">
        var validateForm;
        function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
            if(validateForm.form()){
                var count = $("input[type='checkbox']:checked").length;
                var countArr = $(".reverseCount");
                var appCount = 0;
                for (var i = 0; i < countArr.length; i++) {
                    appCount = appCount + $(countArr[i]).val();
                }
                if (count > 0 && appCount > 0) {
                    $("#inputForm").submit();
                    closeTip();
                    return true;
                } else {
                    alert("请选择商品");
                }
            }

            return false;
        }
        $(document).ready(function() {
            $("#value").focus();
            validateForm = $("#inputForm").validate({
                submitHandler: function(form){
                    loading('正在提交，请稍等...');
                    form.submit();
                    closeTip();
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

        $(function() {
            json=${jsonString};


            $.each(json, function(index, row) {
                $("#province").append("<option value=" + row.code + ">" + row.name + "</option>");

            });
            $("#province").change(function() {
                var province = $(this).val();
                if(province == "请选择") {
                    return;
                } else {
                    if(province == 1) {
                        $(".refundView").hide();
                    } else {
                        $(".refundView").show();
                    }
                    provinceCity(province);
                }
            });
            $("#provinceCity").change(function(){
                var cityName=$(this).val();
                cityStreet(cityName);
            });

        });

        function provinceCity(nameProvince) {
            $("#provinceCity").empty();
            $("#Citystreet").empty();
            $.each(json, function(index, row) {
                if(row.code == nameProvince) {
                    $.each(row.city, function(indec, rowc) {
                        $("#provinceCity").append("<option value=" + rowc.codec + ">" + rowc.namec + "</option>");

                    });
                }
            });
        };

        function cityStreet(nameCity) {
            $("#Citystreet").empty();
            $.each(json,function(index,row){
                $.each(row.city,function(indec,rowc){
                    if(rowc.codec == nameCity)
                    {
                        $.each(rowc.streetc,function(indeCc,rowCc) {
                            $("#Citystreet").append("<option value=" + rowCc.codeCc + ">" + rowCc.nameCc + "</option>");
                        });
                    }
                });
            });

        };

       /* //1. 先进行事件绑定
        $('#province').on('change',
                function () {
            alert("OK");
                    if( $("#province").find("option[text='0']").attr("selected",true);){
                        $("#refund").attr("style","display:block;");//显示div
                    }
                });


        //再运行 selectpicker
        $('#province').selectpicker();*/

        function selectOnchange(obj){
            if(obj.selectedIndex != 0){
                $("input[type='checkbox']").attr("disabled", false)
            } else {
                $("input[type='number']").attr("disabled", true)
                $("input[type='number']").val(0);
                $("input[type='checkbox']").attr("checked", false)
                $("input[type='checkbox']").attr("disabled", true)
            }
            praise();
        }

        $(function () {
            $(".refundView").hide();
        });

        function checkBoxChanged(param) {
            var ids = "mycount_" + param;
            $("#"+ids).val(0);
            $("#"+ids).attr("disabled", $("#checkbox_" + param).attr("checked")!="checked");
            praise();
        }

    </script>
</#if>
</head>
<body class="hideScroll">
<#if isCanReverse??&&isCanReverse>
<form id="inputForm" modelAttribute="reverseOrderSaveTO" action="/order/return/apply" method="post" class="form-horizontal">
<#--<input type="hidden" name="reverseId" <#if reverseOrderDetail.reverseId??>value="${reverseOrderDetail.reverseId?c}"</#if>/>-->
<input type="hidden" value="1" name="type"/>
<#include "../../message.ftl">
    <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
        <tbody>
        <tr>
            <td  class="width-15 active" colspan="2">退换货服务类型</td>
            <label style="color: red"><#if bean.specialCircumstancesExplanation??>--${bean.specialCircumstancesExplanation}</#if></label>
        </tr>
        <tr>
            <td class="width-15 active">

                <label class="pull-right">服务类型：</label></td>

            <td class="width-35"  >
                <select id="province"  class="form-control" onchange="selectOnchange(this)" name="reverseOrderTO.reverseType">
                    <option value="-1">请选择</option>

                </select>
            </td>
        </tr>

        <tr>
            <td class="width-15 active">
                <label class="pull-right">退货模式：</label>
            </td>

            <td class="width-35"  >
                <select id="refundMode"  class="form-control" name="reverseOrderTO.refundMode">
                    <#--<option value="0">上门取货</option>-->
                    <option value="1">送往门店</option>
                </select>
            </td>
        </tr>


        <tr>
            <td class="width-15 active"><label class="pull-right">申请原因：</label></td>
            <td class="width-35"  >
                <select id="provinceCity"  class="form-control" onchange="praise();" name="reverseOrderTO.refundReason">
                    <!--<option>请选择</option>-->
                </select>
            </td>
        </tr>

        <tr>
            <td  class="width-15 active">	<label class="pull-right">问题描述:</label></td>
            <td class="width-35" >
                <textarea name="reverseOrderTO.reasonDesc" class="form-control"></textarea>
            </td>
        </tr>




        <tr>
            <td  class="width-15 active" colspan="2">申请商品选择</td>
        </tr>

        <tr>
            <td colspan="2">
                <table  class="table">
                    <thead>
                    <tr>
                        <th  class="sort-column value">选择</th>
                        <th  class="sort-column value">商品ID</th>
                        <th>商品名称</th>
                        <th  class="sort-column type">商品单价</th>
                        <th  class="sort-column description">购买数量</th>
                        <th  class="sort-column sort">享受优惠</th>
                        <th>实际成交总价</th>
                        <th>实配数量</th>
                        <th>申请数量</th>
                        <th class="refundView">预计退款金额</th>

                    </tr>
                    </thead>
                    <tbody>
                    <#if bean.reverseOrderApportionTO?? && bean.reverseOrderApportionTO.reverseOrderItemApportionTOList??>
                        <input name="reverseOrderTO.reverseId" id="reverseId" type="text" style="display: none" <#if bean.reverseId??>value="${bean.reverseId?c}"</#if>/>
                        <input name="reverseOrderTO.storeId" id="storeId" type="text" style="display: none" <#if bean.storeId??>value="${bean.storeId?c}"</#if>/>
                        <input name="reverseOrderTO.orderId" id="orderId" type="text" style="display: none" <#if bean.orderId??>value="${bean.orderId?c}"</#if>/>
                        <input name="reverseOrderTO.memberId" id="memberId" type="text" style="display: none"  <#if memberId??>value="${memberId}"</#if>/>
                        <#list bean.reverseOrderApportionTO.reverseOrderItemApportionTOList as b>

                        <tr>
                            <td>
                                <#if !b.specialInfo??>
                                    <input type="checkbox" width="30px" disabled onchange="checkBoxChanged(${b_index+1});" id="checkbox_${b_index+1}">
                                </#if>
                                <#if b.specialInfo??>
                                    <label>
                                        <#if b.specialInfo??>
                                            <#list b.specialInfo as info>
                                                ${info.desc}
                                            </#list>
                                        </#if>
                                    </label>
                                </#if>

                                <input name="reverseOrderItemTOList[${b_index}].itemId" type="text" style="display: none" id="itemId_${b_index+1}" <#if b.itemId??>value="${b.itemId?c}"</#if>/>

                            </td>
                            <td><input name="reverseOrderItemTOList[${b_index}].productId" type="hidden" id="${b.productId?c}" value="${b.productId?c}" class="i-checks">${b.productId?c}
                            </td>
                            <td><#if b.productName??><input name="reverseOrderItemTOList[${b_index}].productName" type="hidden" value="${b.productName}">${b.productName}</#if></td>
                            <td>
                                <#if b.salePrice??>
                        ${b.salePrice}
                    </#if>
                            </td>
                            <td>
                                <#if b.buyCount??>
                        ${b.buyCount}
                    </#if>
                            </td>
                            <td>
                                <#if b.discountAmount??>
                                ${b.discountAmount}
                               </#if>
                            </td>


                            <td>
<#if b.dealAmount??>
${b.dealAmount}
</#if>
                            </td>
                            <td>
                                <#if b.alloctCount??>
                                    ${b.alloctCount?c}
                                </#if>
                            </td>
                            <td>
                                <#if !b.specialInfo??>
                                    <input type="number" disabled class="reverseCount" max="${b.alloctCount}" min="0" name="reverseOrderItemTOList[${b_index}].count" onchange="praise()" id="mycount_${b_index+1}"/>
                                </#if>
                                <#if b.specialInfo??>
                                    <label>
                                       --
                                    </label>
                                </#if>

                                <#--<a href="javascript:void(0);" onclick=""
                                   class="btn btn-default btn-xs"> 赞-->

                                </a>
                                <script type="text/javascript">
                                    function praise() {
                                        var reverseType = $("#province").val();
                                        if (reverseType == 1) {
                                            return;
                                        }
                                        var orderId=$("#orderId").val();
                                        var memberId=$("#memberId").val();
                                        var itemId=$("#itemId_${b_index+1}").val();
                                        var d=$("#mycount_${b_index+1}").val();
                                        var refundMode=$("#refundMode").val();
                                        var reason=$("#provinceCity").val();
                                        var reverseId=$("#reverseId").val();
                                        var requestParams = $("#inputForm").serialize();
                                        $.ajax({
                                            url: '/json/reverse/backstage/amount',
                                            type: 'POST',
                                            data: requestParams,
                                            dataType: "json",
                                            success: function(d) {
                                                /*if (d.success) {
                                                    var strategyPraiseNo = parseInt(praiseCount) + 1;
                                                    $('#praiseNo' + recordNo).html(strategyPraiseNo)
                                                }*/
                                               // alert(d.data);
                                                // 填充金额数据
                                                var data = d.data;
                                                if (!data) {
                                                    $(".itemRefundAmount").html("")
                                                    $(".itemRefundPrice").val("")
                                                    $(".amount").html("");
                                                    $("#refundType").html("");
                                                    return;
                                                }
                                                $("#takeGoodsHomeExpressFee").html(data.takeGoodsHomeExpressFee);
                                                $("#refundExpressRee").html(data.refundExpressRee);
                                                $("#totalFinalRefundAmount").html(data.totalFinalRefundAmount);
                                                $("#totalProductRefundAmount").html(data.totalProductRefundAmount);
                                                /*alert(data.productList);*/
                                                if (data.productList) {
                                                    for (var i = 0; i < data.productList.length; i++) {
                                                        var item = data.productList[i];
                                                        /*alert(item);*/
                                                        $("#itemRefundAmount"+item.itemId).html(item.refundAmount)
                                                        $("#itemRefundPrice"+item.itemId).val(item.refundAmount)
                                                    }
                                                }
                                                var content = "";
                                                if (data.refundCalcResult && data.refundCalcResult.refundTOList) {
                                                    $("#deductCreditAmount").html(data.refundCalcResult.deductCreditAmount);
                                                    for(var i = 0; i < data.refundCalcResult.refundTOList.length; i++) {
                                                       content += "<td>"+data.refundCalcResult.refundTOList[i].payTypeDesc+": </td><td>" + data.refundCalcResult.refundTOList[i].refundAmount + "</td>";
                                                    }
                                                }
                                                $("#refundType").html(content);
                                            },
                                            error: function(XMLHttpRequest, textStatus, errorThrown) {
                                                bootbox.alert("无法连接服务器:" + textStatus);
                                            }
                                        });
                                    }
                                </script>

                            </td>
                            <td class="refundView">
                                <input name="reverseOrderItemTOList[${b_index}].price" type="hidden" class="itemRefundPrice" id="itemRefundPrice${b.itemId?c}" value="">
                                <label class="pull-right itemRefundAmount" id="itemRefundAmount${b.itemId?c}">0</label></td>
                            </td>


                        </tr>
                        </#list>
                    </#if>
                    </tbody>
                </table>
            </td>
        </tr>

        </tbody>
    </table>
    <div id="reverseAmount" class="refundView">
        <table>
        <tr>

            <td  class="width-15 active" colspan="2">退回金额确认</td>

        </tr>

        <tr>
            <td  class="width-15 active">	<label class="pull-right">退回商品总金额:</label></td>
            <td class="width-35 amount" id="totalProductRefundAmount"></td>
        </tr>
        <tr>
            <td  class="width-15 active">	<label class="pull-right" style="color: red">吃货币奖励扣回金额:</label></td>
            <td class="width-35 amount" id="deductCreditAmount"></td>
        </tr>
        <tr>
            <td  class="width-15 active">	<label class="pull-right">退回运费:</label></td>
            <td class="width-35 amount" id="refundExpressRee"></td>
        </tr>

       <#-- <tr>
            <td  class="width-15 active">	<label class="pull-right">收取运费:</label></td>
            <td class="width-35" id="takeGoodsHomeExpressFee"></td>
        </tr>-->
        <tr>
            <td  class="width-15 active">	<label class="pull-right">合计:</label></td>
            <td class="width-35 amount" id="totalFinalRefundAmount"></td>
        </tr>
            <tr>预计退款</tr>
            <tr id="refundType">

            </tr>
        </table>
    </div>
</form>

</#if>
<#if isCanReverse??&&!isCanReverse>
<h1>
该订单不能申请退换货!!!
</h1>
<h3><#if canNotReverseReason??>${canNotReverseReason}</#if></h3>
</#if>


</body>
</html>