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
            <h3>会员详情 </h3>
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
            <form id="inputForm" modelAttribute="modifyDTO" action="/member/modify" method="post" class="form-horizontal">
                <!-- 会员详情 -->
                <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
                    <tbody>
                        <#if memberBackstageDetailDTO?? >
                            <thead>
                                <tr>
                                    <td  class="width-15 active"><label class="pull-left">*手机号</label></td>
                                    <td  class="width-15 active">
                                        <label class="pull-left">familyday&nbsp;:&nbsp;</label>
                                        <#if memberBackstageDetailDTO.familyDay?? >
                                            ${memberBackstageDetailDTO.familyDay}
                                        </#if>
                                    </td>
                                </tr>
                                <tr>
                                    <#if memberBackstageDetailDTO.id??>
                                        <input name="memberId" type="hidden" value="${memberBackstageDetailDTO.id?c}" >
                                    </#if>
                                    <#if memberBackstageDetailDTO.mobile??>
                                        <td class="width-35" >
                                            <input name="mobile" htmlEscape="false" maxlength="50" class="form-control required" value="${memberBackstageDetailDTO.mobile}" />
                                            <input name="primaryMobile" type="hidden" value="${memberBackstageDetailDTO.mobile}" >
                                        </td>
                                    <#else>
                                        <td class="width-35" >
                                            <input name="mobile" htmlEscape="false" maxlength="50" class="form-control required" value="" />
                                        </td>
                                    </#if>
                                    <td  class="width-15 active"><label class="pull-left">会员等级&nbsp;:&nbsp;</label>
                                        <#if memberBackstageDetailDTO.levelValue?? >
                                            ${memberBackstageDetailDTO.levelValue}
                                        </#if>
                                    </td>
                                </tr>
                                <tr>
                                    <td  class="width-30 active"><label class="pull-left">开卡门店&nbsp;:&nbsp;</label>
                                        <#if memberBackstageDetailDTO.storeName?? >
                                        ${memberBackstageDetailDTO.storeName}
                                        </#if>
                                    </td>
                                    <td  class="width-30 active"><label class="pull-right"></label>

                                    </td>
                                </tr>
                            </thead>
                            <thead>
                                <tr>
                                    <td  class="width-15 active">	<label class="pull-left">会员卡号&nbsp;:&nbsp;</label>
                                        <#if memberBackstageDetailDTO.cardNo?? >
                                            ${memberBackstageDetailDTO.cardNo}
                                        </#if>
                                    </td>
                                    <td  class="width-15 active">	<label class="pull-left">付费会员有效期&nbsp;:&nbsp;</label>
                                        <#if memberBackstageDetailDTO.payMemberEffectiveDate?? >
                                            ${memberBackstageDetailDTO.payMemberEffectiveDate}
                                        </#if>
                                    </td>
                                </tr>
                                <tr>
                                    <td  class="width-15 active">	<label class="pull-left">会员姓名&nbsp;:&nbsp;</label>
                                        <#if memberBackstageDetailDTO.userName?? >
                                            ${memberBackstageDetailDTO.userName}
                                        </#if>
                                    </td>
                                    <td  class="width-15 active">	<label class="pull-left">出生年月日&nbsp;:&nbsp;</label>
                                        <#if memberBackstageDetailDTO.brithday?? >
                                            ${memberBackstageDetailDTO.brithday}
                                        </#if>
                                    </td>
                                </tr>
                                <tr>
                                    <td  class="width-15 active">	<label class="pull-left">会员性别&nbsp;:&nbsp;</label>
                                        <#if memberBackstageDetailDTO.sex?? >
                                            ${memberBackstageDetailDTO.sex}
                                        </#if>
                                    </td>
                                    <td  class="width-15 active">	<label class="pull-left">证件号&nbsp;:&nbsp;</label>
                                        <#if memberBackstageDetailDTO.identityNo?? >
                                            ${memberBackstageDetailDTO.identityNo}
                                        </#if>
                                    </td>
                                </tr>
                                <tr>
                                    <td  class="width-15 active">
                                        <label class="pull-left">会员地址</label>
                                    </td>
                                    <td  class="width-15 active">
                                        <label class="pull-left">会员身份（eg：老师）</label>
                                    </td>
                                </tr>
                                <tr>
                                    <#if memberBackstageDetailDTO.address?? >
                                        <td class="width-35" >
                                            <input name="address" htmlEscape="false" maxlength="50" class="form-control required" value="${memberBackstageDetailDTO.address}" />
                                            <input name="primaryAddress" type="hidden" value="${memberBackstageDetailDTO.address}" >
                                        </td>
                                    <#else>
                                        <td class="width-35" >
                                            <input name="address" htmlEscape="false" maxlength="50" class="form-control required" value="" />
                                        </td>
                                    </#if>
                                    <#if memberBackstageDetailDTO.occupation?? >
                                        <td class="width-35" >
                                            <input name="occupation" htmlEscape="false" maxlength="50" class="form-control required" value="${memberBackstageDetailDTO.occupation}" />
                                            <input name="primaryOccupation" type="hidden" value="${memberBackstageDetailDTO.occupation}" >
                                        </td>
                                    <#else>
                                        <td class="width-35" >
                                            <input name="occupation" htmlEscape="false" maxlength="50" class="form-control required" value="" />
                                        </td>
                                    </#if>
                                </tr>
                            </thead>
                            <thfoot>
                                <div class="pull-right">
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
                                </div>
                            </thfoot>
                        <#else>
                            <thead>
                                <tr>
                                    <td  class="width-15 active"><label class="pull-left">查询会员详情失败!</label></td>
                                </tr>
                            </thead>
                        </#if>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript" src="/member/detail.js"></script>
</body>
</html>
