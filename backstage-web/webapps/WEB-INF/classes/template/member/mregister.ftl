<html>
<head>
    <title>会员管理</title>
    <#include "../ahead.ftl">
    <#include "../treeview.ftl" >
    <#include "../treetable.ftl" >
    <meta name="decorator" content="default"/>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="ibox">
        <div class="ibox-title">
            <h3>新增付费会员<font style="color:red;">*为必填，否则无法保存会员信息</font> </h3>
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
            <form id="inputForm" modelAttribute="memberDTO" action="/member/register" method="post" class="form-horizontal">
                <!-- <#include "../message.ftl"> -->
                <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
                    <tbody>
                            <thead>
                                <tr>
                                    <td colspan="2" class="width-30 active">
                                        <label class="pull-left">会员基本信息</label>
                                    </td>
                                <tr>
                                <tr>
                                <tr>
                                    <td  class="width-15 active">
                                        <label class="pull-left">
                                        <font style="color:red;">*</font>手机号;
                                        </label>
                                        <input id="mobile" name="mobile" htmlEscape="false" maxlength="11" class="form-control" />
                                    </td>
                                    <td  class="width-15 active">
                                        <label class="pull-left">姓名:(暂未开放!)
                                        </label>
                                        <input id="userName" name="userName" htmlEscape="false" maxlength="50" class="form-control" disabled="disabled" />
                                    </td>
                                </tr>
                                <tr>
                                    <td  class="width-15 active">
                                        <label class="pull-left">
                                        <font style="color:red;">*</font>身份证号:
                                        </label>
                                        <input id="identityNo" name="identityNo" htmlEscape="false" maxlength="50" class="form-control"/>
                                    </td>
                                    <td  class="width-15 active">
                                        <label class="pull-left">职业:
                                        </label>
                                        <input id="occupation" name="occupation" htmlEscape="false" maxlength="50" class="form-control" />
                                    </td>
                                </tr>
                                <tr>
                                    <td  class="width-15 active">
                                        <label class="pull-left">企业纳税码:(暂未开放!)
                                        </label>
                                        <input name="enterpriseTaxNo" htmlEscape="false" maxlength="50" class="form-control" disabled="disabled" />
                                    </td>
                                    <td  class="width-15 active">
                                        <label class="pull-left">地址:
                                        </label>
                                        <input id="address" name="address" htmlEscape="false" maxlength="50" class="form-control" />
                                    </td>
                                <tr>
                                <tr>
                                    <td colspan="2" class="width-30 active">
                                        <label class="pull-left">会员卡信息</label>
                                    </td>
                                <tr>
                                </thead>
                                <thead>
                                <tr>
                                    <td  class="width-15 active">
                                        <label class="pull-left">
                                            <font style="color:red;">*</font>开卡门店:
                                        </label>
                                        <select id="storeId" class="form-control" name="storeId">
                                        <#if storeInfo??>
                                            <option  value="<#if data??&&data.storeId??>${data.storeId?c}</#if>"><#if data??&&data.storeName??>${data.storeName}<#else >请选择</#if></option>
                                            <#list storeInfo as item>
                                                <option storeType="<#if item.type??>${item.type?c}</#if>" value="<#if item.id??>${item.id}</#if>"><#if item.id??>${item.id}-</#if><#if item.name??>${item.name}</#if></option>
                                            </#list>
                                        </#if>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td  class="width-15 active">
                                        <label class="pull-left">
                                        <font style="color:red;">*</font>会员卡号:
                                        </label>
                                        <input id="cardNo" name="cardNo" htmlEscape="false" maxlength="8" class="form-control" value="" />
                                    </td>
                                    <td  class="width-15 active">
                                        <label class="pull-left">
                                        <font style="color:red;">*</font>付费会员生效日:
                                        </label>
                                        <input type="text" class="form-control" data-date-format="yyyy-mm-dd hh:ii:ss" id="strStartTime" name="strStartTime" readonly />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="width-15" >
                                         <label class="pull-left">会员卡等级:
                                             <font id="cardLevel" ></font>
                                         </label>
                                    </td>
                                    <td  class="width-15 active">
                                        <label class="pull-left">会员卡有效期一年</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="width-15" >
                                        <label class="pull-left">
                                            家庭日:
                                            <select id="familyDayType" name="familyDayType" class="form-control">
                                                <option value="0" selected="selected" >特殊纪念日</option>
                                                <option value="1" >成员生日</option>
                                                <option value="2" >家庭聚会日</option>
                                            </select>
                                        </label>
                                    </td>
                                    <td  class="width-15 active">
                                        <label class="pull-left">请选择家庭日:
                                        </label>
                                        <input type="text" class="form-control" data-date-format="mm-dd" id="familyDay" name="strFamilyDay" readonly />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="width-30 active">
                                        <label class="pull-left">备注:
                                        </label>
                                        <input name="remarks" htmlEscape="false" maxlength="500" class="form-control" value="" />
                                    </td>
                                </tr>
                            </thead>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript" src="/member/mregister.js"></script>
</body>
</html>
