
<html>
<head>
    <title>优惠券详情</title>

    <meta name="decorator" content="default"/>
<#include "../ahead.ftl">
<#include "../treeview.ftl" >
<#include "../treetable.ftl" >

</head>
<body class="hideScroll">
<form id="inputForm" modelAttribute="couponDetailTO" action="/coupon/query/detail" method="post" class="form-horizontal">

    <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
        <tbody>
        <tr>
            <td  class="width-15 active" colspan="2">优惠券明细</td>
        </tr>
        <tr>
            <td class="width-15 active">	<label class="pull-left">最后操作:</label></td>
            <td class="width-20" > <#if couponDetailTO.lastHandler??>${couponDetailTO.lastHandler}<#else>-- </#if></td>

        </tr>
        <tr>
            <td class="width-15 active">	<label class="pull-left">操作时间:</label></td>
            <td class="width-20" > <#if couponDetailTO.handleTimeStr??>${couponDetailTO.handleTimeStr}<#else> </#if></td>
        </tr>
        <tr>
            <td  class="width-15 active" colspan="2">基本信息</td>
        </tr>
        <tr>
            <td class="width-15 active">	<label class="pull-left">优惠券名称:</label></td>
            <td class="width-20" > <#if couponDetailTO.couponName??>${couponDetailTO.couponName}<#else> </#if></td>
        </tr>

        <tr>
            <td class="width-15 active">	<label class="pull-left">优惠券副标题:</label></td>
            <td class="width-20" > <#if couponDetailTO.couponSubName??>${couponDetailTO.couponSubName}<#else> </#if></td>
        </tr>
        <tr>
            <td class="width-15 active">	<label class="pull-left">描述:</label></td>
            <td class="width-20" > <#if couponDetailTO.description??>${couponDetailTO.description}<#else> </#if></td>
        </tr>
        <tr>
            <td class="width-15 active">	<label class="pull-left">规则说明:</label></td>
            <td class="width-20" > <#if couponDetailTO.couponIntroduce??>${couponDetailTO.couponIntroduce}<#else> </#if></td>
        </tr>
        <tr>
            <td class="width-15 active">	<label class="pull-left">有效期:</label></td>
            <td class="width-20" >
            <#if couponDetailTO.startTime??>${couponDetailTO.startTimeStr}<#else>
            </#if>
            <#if couponDetailTO.endTime??>至${couponDetailTO.endTimeStr}<#else>
            </#if>
            </td>
        </tr>
        <#if couponDetailTO.continueDate??>
        <td class="width-15 active"></td>
        <td class="width-20" >
            绑定至用户账户当天算起${couponDetailTO.continueDate}天有效
        </td>
        </#if>


        <tr>
            <td  class="width-15 active" colspan="2">作用范围</td>
        </tr>
        <tr>
            <td  class="width-15 active">	<label class="pull-left">优惠券类型:</label></td>
            <td class="width-20" >
            <#if couponDetailTO.couponType==1>商品券</#if>
            <#if couponDetailTO.couponType==2>现金券</#if>
            <#if couponDetailTO.couponType==3>运费券</#if>
            </td>
        </tr>

        <tr>
            <td  class="width-15 active">	<label class="pull-left">门店:</label></td>
            <td class="width-20" > <#if couponDetailTO.storeName??>${couponDetailTO.storeName}<#else> </#if></td>
        </tr>

        <#if couponDetailTO.couponType==1>
            <tr>
                <td class="width-15 active">	<label class="pull-left">增加 分类/商品:</label></td>
                <td class="width-20" >

                </td>
            </tr>

            <#if couponDetailTO.categoryName??>
                <#list couponDetailTO.categoryName as name>
                <tr>
                    <td class="width-15 "></td>
                    <td class="width-20" >
                        <#if couponDetailTO.categoryName??>${name}<#else> </#if>
                    </td>
                </tr>
                </#list>
            </#if>

            <#if couponDetailTO.productStoreName??>
                <#list couponDetailTO.productStoreName as productName>
                <tr>
                    <td class="width-15 "></td>
                    <td class="width-20" >
                        ${productName}
                    </td>
                </tr>
                </#list>
            </#if>


            <tr>
                <td  class="width-15 active">	<label class="pull-left">排除 分类/商品:</label></td>
                <td class="width-20" >

                </td>
            </tr>
            <#if couponDetailTO.expCategoryName??>
                <#list couponDetailTO.expCategoryName as expName>
                <tr>
                    <td class="width-15 "></td>
                    <td class="width-20" >
                        <#if couponDetailTO.expCategoryName??>${expName}<#else> </#if>
                    </td>
                </tr>
                </#list>
            </#if>

            <#if couponDetailTO.expStoreProductName??>
                <#list couponDetailTO.expStoreProductName as expProductName>
                <tr>
                    <td class="width-15 "></td>
                    <td class="width-20" >
                        <#if expProductName??>${expProductName}<#else> </#if>
                    </td>
                </tr>
                </#list>
            </#if>
        </#if>



        <tr>
            <td  class="width-15 active" colspan="2">限制条件</td>
        </tr>
        <tr>
            <td  class="width-15 active">	<label class="pull-left">会员类型:</label></td>
            <td class="width-20" >
            ${couponDetailTO.memberLevelValue}

            </td>
        </tr>
        <tr>
            <td  class="width-15 active">	<label class="pull-left">使用渠道:</label></td>
            <td class="width-20" > ${couponDetailTO.useChannelValue}</td>

        </tr>

        <tr>
            <td  class="width-15 active">	<label class="pull-left">领取限制:</label></td>
            <td class="width-20" > <#if couponDetailTO.memberCount??>${couponDetailTO.memberCount?c}<#else> </#if></td>

        </tr>
        <tr>
            <td  class="width-15 active">	<label class="pull-left">限领总数：</label></td>
            <td class="width-20" ><#if couponDetailTO.totalCount??>${couponDetailTO.totalCount?c}<#else> </#if></td>
        </tr>
        <tr>
            <td  class="width-15 active" colspan="4">优惠规则</td>
        </tr>



        <tr>
            <#if couponDetailTO.qualificationType??>
                <#if  couponDetailTO.qualificationType==0>
                    <td  class="width-15 active"> <label class="pull-left">无门槛:</label></td>
                    <td class="width-20" >
                    <#if  couponDetailTO.benefitType==0>减${couponDetailTO.benefitValue?c}
                    </#if>
                    <#if  couponDetailTO.benefitType==1>打${couponDetailTO.benefitValue?c}折
                    </#if>
                    </td>
                </#if>
                <#if  couponDetailTO.qualificationType==1>
                    <td  class="width-15 active">	<label class="pull-left">满额</label></td>
                    <td class="width-20" >满${couponDetailTO.qualificationValue?c}
                        <#if  couponDetailTO.benefitType==0>减${couponDetailTO.benefitValue?c}
                        </#if>
                        <#if  couponDetailTO.benefitType==1>打${couponDetailTO.benefitValue?c}折
                        </#if>
                    </td>
                </#if>
            </#if>
        </tr>
        <tr>
            <td  class="width-15 active" colspan="4">其他属性</td>
        </tr>
        <tr>
            <td  class="width-15">
            <#if couponDetailTO.budget?? && couponDetailTO.budget==1>预算内
            </#if>
            <#if couponDetailTO.budget?? && couponDetailTO.budget==2>预算外
            <#else>默认
            </#if>
            </td>
        </tr>
        <#if couponDetailTO.couponAttributeIds??>
        <tr>
            <td  class="width-15">
                对应领券活动
            </td>
            <td class="width-20" > ${couponDetailTO.couponAttributeIds}</td>
        </tr>
        </#if>

        </tbody>
    </table>
</form>
</body>
</html>