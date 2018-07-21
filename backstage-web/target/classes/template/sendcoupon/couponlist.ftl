
<html>
<head>
    <title>选择优惠券</title>
    <script src="/static/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <link href="/static/bootstrap/3.3.4/css_default/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="/static/bootstrap/3.3.4/js/bootstrap.min.js"  type="text/javascript"></script>
    <link href="/static/awesome/4.4/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/static/common/css/style.css?v=3.2.0" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="/static/artDialog/jquery.artDialog.js?skin=green"></script>
    <script type="text/javascript" src="/static/artDialog/plugins/iframeTools.source.js"></script>
    <meta name="decorator" content="default"/>


    <script type="text/javascript">

        $(function () {
            $("#selectButton").click(function () {

                var couponInfo = "";

                $('input[name="couponcheck"]:checked').each(function(){

                    var s =$(this).val();
                    couponInfo = couponInfo+s+","

                });
                artDialog.data("couponInfo", couponInfo); //将值存起来，供父页面读取

                $.dialog.close();
            });
            $("#cancelButton").click(function () {
                $.dialog.close();
            });


        });

    </script>

    <style>
        .button {
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
        }
    </style>


</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="ibox">

        <div class="ibox-content">

            <table>
                <tr>
                    <td align="center"><label>券ID</label></td>
                    <td align="center"><label>券名称</label></td>
                    <td align="center" class="width-35"><label>创建日期</label></td>
                    <td align="center"><label>剩余数量</label></td>
                </tr>


                <#if list??>
                <#list list as item>
                <tr>
                    <td align="center"><input type="checkbox" <#if item.couponSelected==0>checked</#if> name="couponcheck" value="${item.activityId?c}_${item.couponName}"/>
                        <#if item.activityId??>
                            <label id="activityId_${item_index}" value="${item.activityId?c}"><#if item.activityId??>${item.activityId?c}</#if></label>
                        </#if>
                    </td>

                    <td align="center">
                        <#if item.couponName??>
                            <label id="couponName_${item_index}" value="${item.couponName}"><#if item.couponName??>${item.couponName}</#if></label>
                        </#if>
                    </td>
                    <td align="center">
                        <#if item.createTime??>
                            <label id="createTime_${item_index}"><#if item.createTime??>${item.createTime}</#if></label>
                        </#if>
                    </td>
                    <td align="center">
                        <#if item.remainNum??>
                            <label id="remainNum_${item_index}"><#if item.remainNum??>${item.remainNum?c}<#else> 0 </#if></label>
                        <#else>
                            0
                        </#if>
                    </td>
                </tr>

                </#list>
                </#if>
                <tr>
                    <td></td>
                    <td></td>
                    <td><input type="button" id="selectButton" value="选好了"></td>
                    <td><input type="button" id="cancelButton" value="取消"></td>
                </tr>
                </tbody>
            </table>
            <br/>

        </div>
    </div>
</div>
</body>
</html>
