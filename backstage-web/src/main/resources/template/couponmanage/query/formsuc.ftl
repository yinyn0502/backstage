
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

            $('#strStartTime').datetimepicker({
                format: 'yyyy-mm-dd hh:ii:ss',
                weekStart: 1,
                todayBtn: 1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 2,
                forceParse: 0,
                showMeridian: 1,
                language: 'zh-CN'
            });


            $('#strEndTime').datetimepicker({
                format: 'yyyy-mm-dd hh:ii:ss',
                weekStart: 1,
                todayBtn: 1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 2,
                forceParse: 0,
                showMeridian: 1,
                language: 'zh-CN'
            });
            //$("#value").focus();
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
<form id="inputForm" modelAttribute="couponActivityCreateDTO" action="/couponmanage/query/save" method="post" class="form-horizontal">
<#--<input type="hidden" name="id" <#if dict.id??>value="${dict.id}"</#if>/>
<input type="hidden" name="createBy" <#if dict.createBy??>value="${dict.createBy}"</#if>/>
<input type="hidden" name="delFlag" <#if dict.delFlag??>value="${dict.delFlag}"</#if>/>-->
<#include "../../message.ftl">
    <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
        <tbody>
        <tr>
            <div id="messageBox"></div>
            <td  class="width-15 active" colspan="3">
                <label class="pull-left">基本信息</label>
            </td>
        </tr>
        <tr>

            <td  class="width-15 active">	<label class="pull-right">优惠券名称:</label></td>
            <td class="width-30" ><input name="couponName" htmlEscape="false" maxlength="50" class="form-control required" /></td>
            <td  class="width-20 active">	（展示在券面，不超过15个字）</td>

        </tr>
        <tr>
            <td  class="width-15 active">	<label class="pull-right">优惠券副标题:</label></td>
            <td class="width-30" ><input name="couponSubName" htmlEscape="false" maxlength="50" class="form-control required abc" /></td>
            <td  class="width-20 active">	（展示在券面，不超过15个字）</td>
        </tr>
        <tr>
            <td  class="width-15 active">	<label class="pull-right">描述:</label></td>
            <td class="width-35" ><input name="description" htmlEscape="false" maxlength="11" class="form-control required abc"/></td>
            <td  class="width-15 active">	（内部描述字段）</td>
        </tr>

        <tr>
            <td  class="width-15 active">	<label class="pull-right">规则说明:</label></td>
            <td class="width-35" ><input name="couponIntroduce" htmlEscape="false" maxlength="11" class="form-control required abc"/></td>
            <td  class="width-15 active">	</td>
        </tr>


        <tr>
            <td  class="width-15 active">	<label class="pull-right">有效期:</label></td>
            <td class="width-30" >
                <input type="text" class="form-control" data-date-format="yyyy-mm-dd hh:ii:ss" id="strStartTime" name="strStartTime" readonly />
                <span>至 ：</span>
                <input type="text" class="form-control" data-date-format="yyyy-mm-dd hh:ii:ss" id="strEndTime" name="strEndTime" readonly />
            </td>
            <td  class="width-20 active"></td>
        </tr>


        <tr>
            <td class="width-15 active"><label class="pull-right">绑定至用户账户当天算起:</label></td>
            <td class="width-30" ><input name="continueDate" htmlEscape="false" maxlength="11" class="form-control required digits"/></td>
            <td class="width-20 active">天有效</td>
        </tr>
        <tr>
            <td  class="width-15 active" colspan="3">
                <label class="pull-left">作用范围</label>
            </td>

        </tr>

        <tr>
            <td class="width-15 active"><label class="pull-right">优惠劵类型:</label></td>
            <td class="width-30" >
                <select class="form-control" name="strCouponType" id="strCouponType" >
                <#--  <option value="9999">全部</option>-->
                <#if couponTypeList??>
                    <#list couponTypeList as d>
                        <#if d??>
                        <option <#if d.type??>value="${d.type}"  <#if type??&&d.type==type>selected</#if></#if> ><#if d.names??>${d.names}</#if>
                                                    </#if>
                    </option>
                    </#list>
                </#if>
                </select>

            </td>
            <td class="width-20 active"></td>
        </tr

        <tr>
            <td class="width-15 active"><label class="pull-right">门店:</label></td>
            <td class="width-30" >
                <input type="text" name="strStoreIds" value="" id="storeIds"/>
                <input type="text" name="strProductIds" value="" id="storeNames"/>

            </td>
            <td class="width-20 active"></td>
        </tr>


        <tr>
            <td  class="width-15 active" colspan="3">
                <label class="pull-left">限制条件</label>
            </td>
        </tr>


        <tr>
            <td class="width-15 active"><label class="pull-right">会员类型:</label></td>
            <td class="width-30" >

                <select class="form-control" name="strMemberLevel" id="strMemberLevel" >
                <#--  <option value="9999">全部</option>-->
                <#if memberCardTypeList??>
                    <#list memberCardTypeList as d>
                        <#if d??>
                        <option <#if d.type??>value="${d.type}"  <#if type??&&d.type==type>selected</#if></#if> ><#if d.levelName??>${d.levelName}</#if>
                                                    </#if>
                    </option>
                    </#list>
                </#if>
                </select>
            </td>
        </tr>

        <tr>
            <td class="width-15 active"><label class="pull-right">使用渠道:</label></td>
            <td class="width-30" >
            <#if dimensionAppTypeList??>
                <#list dimensionAppTypeList as d>
                    <input type="checkbox" id="${d.type}" class="i-checks" value="${d.type}" name="useChannel"/>
                ${d.names}
                </#list>
            </#if>
            </td>
        </tr>

        <tr>
            <td class="width-15 active"><label class="pull-right">领取限制:</label></td>
            <td class="width-30" >

                每个用户限领数 <input name="sMemberCount" htmlEscape="false" maxlength="50" class="form-control required" />(不填表示不限制)<br/>
                限领总数<input name="sTotalCount" htmlEscape="false" maxlength="50" class="form-control required" />(不填表示不限制)
            </td>
        </tr>

        <tr>
            <td  class="width-15 active" colspan="3">
                <label class="pull-left">优惠规则</label>
            </td>
        </tr>

        <tr>
            <td class="width-15 active"> <label class="pull-right"><span><input id="isShow2" name="qualificationType" class="i-checks " type="radio" value="0" checked/><label for="isShow2">无门槛:</label></td>
            <td class="width-30" >

                <select class="form-control" name="benefitType" id="benefitType" >

                <#if benefitTypeList??>
                    <#list benefitTypeList as d>
                        <#if d??>
                        <option <#if d.type??>value="${d.type}"  <#if type??&&d.type==type>selected</#if></#if> ><#if d.names??>${d.names}</#if>
                                                    </#if>
                    </option>
                    </#list>
                </#if>
                </select>

            </td>
            <td class="width-30" ><input name="sBenefitValue" htmlEscape="false" maxlength="50" class="form-control required" />（例：8折填0.8）</td>

        </tr>






        </tbody>
</form>
</body>

</html>