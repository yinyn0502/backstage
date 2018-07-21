
<html>
<head>
    <title>商品审核管理</title>
    <#include "../ahead.ftl">
    <#include "../treeview.ftl" >
    <#include "../treetable.ftl" >
    <script type="text/javascript" src="/static/artDialog/jquery.artDialog.js?skin=green"></script>
    <script type="text/javascript" src="/static/artDialog/plugins/iframeTools.source.js"></script>
    <style>
        table {
            font-family: verdana, arial, sans-serif;
            font-size: 11px;
            color: #333333;
            border-width: 1px;
            border-color: #666666;
            border-collapse: collapse;
            text-align: center;
            border-radius: 5px;
            border-top: 30px;
        }
        th {
            text-align: center;
        }
        input, select {
            border: 1px solid #ccc;
            padding: 7px 0px;
            border-radius: 3px;
            padding-left: 5px;
            width: 200px;
        }

        .hr{
            margin:0px;height:1px;border:0px;background-color:#D5D5D5;color:#D5D5D5;
        }
        .button {
            background-color: #1ab394; /* Green */
            border: none;
            color: white;
            padding: 9px 24px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 15px;
            border-radius: 7px;
            margin: 20px;
        }
    </style>


</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <#if data??>
    <input id = 'userName' type="hidden" <#if userName??>value="${userName}" </#if>/>
    <input id = 'queueId' type="hidden" <#if queueId??>value="${queueId}" </#if>/>
    <table  style="border-collapse:separate; border-spacing:0px 10px;" align="left">
        <tbody>
        <tr align="left">
            <td style="font-size: 20px;"><strong>基本信息</strong><hr class="hr" /></td>

        </tr>

        <tr>
            <td>
                <label>门店</label>
            </td>
            <td>
                <label><#if storeName??>${storeName}</#if></label>
            </td>
        </tr>
        <tr>
            <td>
                <label>商户名称</label>
            </td>
            <td>
                <label><#if data.merchantName??>${data.merchantName}</#if></label>
            </td>
        </tr>
        <tr>
            <td>
                <label>商品编码</label>
            </td>
            <td>
                <label><#if data.productId??>${data.productId?c}</#if></label>
            </td>
        </tr>
        <tr>
            <td>
                <label>商品分类</label>
            </td>
            <td>
                <label><#if data.categoryBreadcrumb??>${data.categoryBreadcrumb}</#if></label>
            </td>
        </tr>
        <tr>
            <td>
                <label>商品名称</label>
            </td>
            <td>
                <label><#if data.title??>${data.title}</#if></label>
            </td>
        </tr>

        <tr align="left">
            <td style="font-size: 20px;"><strong>销售信息</strong><hr class="hr"/></td>
        </tr>


        <tr>
            <td>
                <label>商品售价</label>
            </td>
            <td>
                <label><#if data.price??>${data.price}<#else > 本次无修改</#if></label>
            </td>
        </tr>
        <tr>
            <td>
                <label>商品进价</label>
            </td>
            <td>
                <label><#if data.purchasePrice??>${data.purchasePrice}<#else >本次无修改</#if></label>
            </td>
        </tr>
        <tr>
            <td>
                <label>商品库存</label>
            </td>
            <td>
                <label><#if data.inventory??>${data.inventory}<#else >本次无修改</#if></label>
            </td>
        </tr>

        <tr align="left">
            <td style="font-size: 20px;"><strong>商品属性</strong><hr class="hr"/></td>
        </tr>

        <tr>
            <td>
                <label>销售单位</label>
            </td>
            <td>
                <label><#if data.unit??>${data.unit}</#if></label>
            </td>
        </tr>
        <tr>
            <td>
                <label>销售规格</label>
            </td>
            <td>
                <label><#if data.specification??>${data.specification}</#if></label>
            </td>
        </tr>
        <tr>
            <td>
                <label>存储温度</label>
            </td>
            <td>
                <label><#if data.storageCondition??>${data.storageCondition}</#if></label>
            </td>
        </tr>
        <tr>
            <td>
                <label>保质期</label>
            </td>
            <td>
                <label><#if data.qualityGuaranteePeriod??>${data.qualityGuaranteePeriod}</#if></label>
            </td>
        </tr>


        <tr align="left">
            <td style="font-size: 20px;"><strong>操作记录</strong><hr class="hr"/></td>
        </tr>
        <tr>
            <td>操作时间</td>
            <td>操作人</td>
            <td>操作</td>
        </tr>
        <#if data.reviewRecordDTOList??>
            <#list data.reviewRecordDTOList as list>
                <tr>
                    <td><#if list.handleTime??>${date.transferLongToDate(list.handleTime)}</#if></td>
                    <td><#if list.handler??>${list.handler}</#if></td>
                    <td style="width: 300px;">
                        <#if list.handleType??>${list.handleType}</#if>
                    </td>
                </tr>
            </#list>
        </#if>


        <tr>
            <td colspan="3" align="center">
                <#if reviewStatus??>
                    <#if reviewStatus == 0 >
                        <button class="button" style="background-color:red" onclick="checkReview(2)">审核不通过</button>
                        <button class="button" onclick="checkReview(1)">审核通过</button>
                    <#else >
                       <button class="button" onclick="$.artDialog.close();">关闭</button>
                    </#if>
                </#if>
            </td>
        </tr>
        </table>
        </tbody>

    </table>
    </#if>
    <script>
        function checkReview(status) {
            if (status == 2 ) {
                layer.prompt({title:"拒绝原因",area:['60%', '40%'],formType:2,maxlength:100},function (val, index) {
                    if (val) {
                        review(status, val);
                        layer.close(index);
                    }
                })
            }else {

                layer.confirm('请再次确认审核的商品信息无误\n' +
                        '审核通过后，商品信息将展示在卖场中',{btn: ['确定','取消']},function () {
                    review(status);
                    layer.close(index);
                })

            }


        }

        /**
         * 审核商品
         * @param status
         * @param reviewProduct
         */
        function review(status, reviewProduct) {
            $.post('/product/merchant/reviewProduct',{
                'reviewStatus':status,
                'rejectReason':reviewProduct,
                'handler':$('#userName').val(),
                'queueId':$('#queueId').val(),
                contentType : 'application/json;charset=UTF-8'
            },function (data) {
                var tips = '', icon = 1;
                if (data.code == 0 ) {
                    tips = '操作成功';

                }else {
                    tips = '操作失败';
                    icon = 0;
                }
                layer.msg(tips, {icon: icon},function () {
                    $.artDialog.close();
                    window.location.href = '/product/reviewProductList';
                });

            });
        }
    </script>
</div>
</body>
</html>
