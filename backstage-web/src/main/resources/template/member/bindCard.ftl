<html>
<head>
    <title>会员管理</title>
    <#include "../ahead.ftl">
    <#include "../treeview.ftl" >
    <#include "../treetable.ftl" >
    <meta name="decorator" content="default"/>
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
            $("#name").focus();
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

    </script>

</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="ibox">
        <div class="ibox-title">
            <h3>绑定会员卡 </h3>
            <div class="ibox-tools">
                <a class="collapse-link">
                    <i class="fa fa-chevron-up"></i>
                </a>
                <a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
                    <i class="fa fa-wrench"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#">选项1</a>
                    </li>
                    <li><a href="#">选项2</a>
                    </li>
                </ul>
                <a class="close-link">
                    <i class="fa fa-times"></i>
                </a>
            </div>
        </div>
        <div class="ibox-content">
            <form id="inputForm" modelAttribute="memberBackstageSaveOrUpdateDTO" action="/member/card/binding" method="post" class="form-horizontal">
                <!-- <#include "../message.ftl"> -->
                <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
                    <tbody>
                        <#if memberBackstageDetailDTO?? >
                            <thead>
                                <tr>
                                    <td  class="width-15 active">
                                        <label class="pull-left">绑定会员卡（把已有信息带入）</label>
                                            <#if pageSize?? >
                                                <input name="pageSize" type="hidden" value="${pageSize}" >
                                            </#if>
                                            <#if pageNum?? >
                                                <input name="pageNum" type="hidden" value="${pageNum}" >
                                            </#if>
                                            <#if mobile?? >
                                                <input name="queryMobile" type="hidden" value="${mobile}" >
                                            </#if>
                                            <#if cardNo?? >
                                                <input name="queryCardNo" type="hidden" value="${cardNo}" >
                                            </#if>
                                            <#if memberBackstageDetailDTO.id?? >
                                                <input name="memberId" type="hidden" value="${memberBackstageDetailDTO.id}" >
                                            </#if>
                                    </td>
                                <tr>
                                <tr>
                                    <td  class="width-15 active">
                                        <label class="pull-left">手机号&nbsp;
                                            <#if memberBackstageDetailDTO.mobile??>
                                                ${memberBackstageDetailDTO.mobile}
                                            </#if>
                                        </label>
                                    </td>
                                    <td  class="width-15 active">
                                        <label class="pull-left">*会员等级</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td  class="width-15 active">
                                        <label class="pull-left">家庭日&nbsp;
                                            <#if memberBackstageDetailDTO.familyDay??>
                                                ${memberBackstageDetailDTO.familyDay}
                                            </#if>
                                        </label>
                                    </td>
                                    <td class="width-35" >
                                        <select name="level"  class="form-control">
                                            <option value="0" selected="selected" >eater(免费)</option>
                                            <option value="1" >prime eater family(500元/年)</option>
                                            <option value="2" >prime eater busness(1000元/年)</option>
                                        </select>
                                    </td>
                                </tr>
                                </thead>
                                <thead>
                                <tr>
                                    <td  class="width-15 active">
                                        <label class="pull-left">会员卡号（读卡器可自动读入）</label>
                                    </td>
                                    <td  class="width-15 active">
                                        <label class="pull-left">*付费会员有效期</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="width-35" >
                                        <input name="cardNo" htmlEscape="false" maxlength="11" class="form-control required digits" value="" />
                                    </td>
                                    <td  class="width-15 active">
                                        <label class="pull-left">一年</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td  class="width-15 active">
                                        <label class="pull-left">*证件号</label>
                                    </td>
                                    <td  class="width-15 active">
                                        <label class="pull-left">生效日期自领卡之日起生效</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="width-35" >
                                        <select name="identityType"  class="form-control">
                                            <option value="0" selected="selected" >身份证</option>
                                            <option value="1" >军官证</option>
                                            <option value="2" >护照</option>
                                        </select>
                                    </td>
                                    <td  class="width-15 active">
                                        <label class="pull-left">过期后调整至 eater(免费)</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td  class="width-15 active">
                                        <input name="identityNo" htmlEscape="false" maxlength="50" class="form-control required digits" value="" />
                                    </td>
                                    <td class="width-35" >
                                        <input type="radio" name="sex" value="0" checked="checked" />男&nbsp;
                                        <input type="radio" name="sex" value="1" />女
                                    </td>
                                </tr>
                                <tr>
                                    <td  class="width-15 active">
                                        <label class="pull-left">会员姓名</label>
                                    </td>
                                    <td  class="width-15 active">
                                        <label class="pull-left">出生年月日</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="width-35" >
                                        <input name="userName" htmlEscape="false" maxlength="50" class="form-control required"
                                            <#if memberBackstageDetailDTO.userName??>
                                                value="${memberBackstageDetailDTO.userName}"
                                            </#if>
                                         />
                                    </td>
                                    <td class="width-35" >
                                        请选择时间:<input type="text" class="input-sm form-control " data-date-format="mm-dd" id="brithday" name="strBrithday" readonly />
                                    </td>
                                </tr>
                                <tr>
                                    <td  class="width-15 active">
                                        <label class="pull-left">会员职业</label>
                                    </td>
                                    <td  class="width-15 active">
                                        <label class="pull-left">会员地址</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="width-35" >
                                        <input name="occupation" htmlEscape="false" maxlength="50" class="form-control required"
                                            <#if memberBackstageDetailDTO.occupation??>
                                                value="${memberBackstageDetailDTO.occupation}"
                                            </#if>
                                        />
                                    </td>
                                    <td class="width-35" >
                                        <input name="address" htmlEscape="false" maxlength="50" class="form-control required"
                                            <#if memberBackstageDetailDTO.address??>
                                                value="${memberBackstageDetailDTO.address}"
                                            </#if>
                                        />
                                    </td>
                                </tr>
                            </thead>
                        <#else>
                            <thead>
                                <tr>
                                    <td  class="width-15 active">
                                        <label class="pull-left">查询会员信息失败!</label>
                                    </td>
                                </tr>
                            </thead>
                        </#if>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</div>
<!--
<script type="text/javascript" src="/member/bindCard.js"></script>
-->
</body>
</html>
