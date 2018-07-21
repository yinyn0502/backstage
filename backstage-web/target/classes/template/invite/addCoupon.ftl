<html>
<head>
    <title>添加优惠券</title>
    <script src="/static/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <link href="/static/bootstrap/3.3.4/css_default/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <script src="/static/bootstrap/3.3.4/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="/static/awesome/4.4/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="/static/common/css/style.css?v=3.2.0" type="text/css" rel="stylesheet"/>

    <script type="text/javascript" src="/static/artDialog/jquery.artDialog.js?skin=green"></script>
    <script type="text/javascript" src="/static/artDialog/plugins/iframeTools.source.js"></script>

    <script src="/static/bootstrap-datetimepicker/bootstrap-datetimepicker.js" charset="UTF-8"></script>
    <script src="/static/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
    <link href="/static/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <meta name="decorator" content="default"/>


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

        .add {
            background-color: #1ab394; /* Green */
            border: none;
            color: white;
            padding: 9px 24px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 15px;
            border-radius: 7px;
        }
        .radio{ width: 30px;}
    </style>


</head>


<body class="gray-bg">


<div class="wrapper wrapper-content" style="border: 1px ;color: black">

    <table border="2" align="center" style="padding-top: 30px;">
        <tr style="height: 30px; line-height: 30px; border-top: 1px solid #000;">
            <th>选择</th>
            <th width="14%">领券活动id</th>
            <th width="14%">优惠券id</th>
            <th width="20%">优惠券名称</th>
            <th width="16%">剩余券数</th>
            <th width="36%">优惠券有效期</th>
        </tr>
    <#if data??>
        <#list data as item>
            <tr id="tr_${item_index}" style="border-bottom: 1px solid #000;">
            <#--<td>
                <input id="radio_${item_index}" type="radio" name="radio" value="${item_index}"/>
            </td>
            <td rowspan="<#if item.couponTOList??>${item.couponTOList?size}</#if>">
                <label id="distributeActivityId_${item_index}"><#if item.distributeActivityId??>${item.distributeActivityId?c}</#if></label>
            </td>-->
                <#if item.couponTOList??>
                    <td>
                        <input class="radio" id="radio_${item_index}" type="radio" name="radio" value="${item_index}"/>
                    </td>
                    <td style="display: block; border: none; " rowspan="<#if item.couponTOList??>${item.couponTOList?size}</#if>">
                        <label id="distributeActivityId_${item_index}"><#if item.distributeActivityId??>${item.distributeActivityId?c}</#if></label>
                    </td>
                    <td>
                        <#list item.couponTOList as copon>
                            <label id="couponId_${copon_index}"><#if copon.couponId??>${copon.couponId?c}</#if></label><br/>
                        </#list>
                    </td>
                    <td>
                        <#list item.couponTOList as copon>
                            <label id="couponName_${copon_index}"><#if copon.couponName??>${copon.couponName}</#if></label><br/>
                        </#list>
                    </td>
                    <td>
                        <#list item.couponTOList as copon>
                            <label id="leftCoupnoNum_${copon_index}"><#if copon.leftCoupnoNum??>${copon.leftCoupnoNum}</#if></label><br/>
                        </#list>
                    </td>
                    <td>
                        <#list item.couponTOList as copon>
                            <label><#if copon.startTime??>${copon.startTime}</#if></label>
                            ~
                            <label><#if copon.endTime??>${copon.endTime}</#if></label><br/>
                        </#list>
                    </td>
                </#if>
            </tr>
        </#list>
    <#else >
        <tr>
            <td align="center" colspan="6">
                <label>没有优惠券,快去添加吧</label>
            </td>
        </tr>
    </#if>

    </table>
<div style="padding-top: 30px;">
    <button id="back">返回</button>

    <button id="confirm">确定</button>
</div>
</div>
</body>

<script type="text/javascript">

    $("#back").click(function () {
        art.dialog.close();
    });


    $("#confirm").click(function () {
        var index = $('input:radio[name="radio"]:checked').val();
        //alert(index);
        var distributeActivityId = $("#distributeActivityId_" + index).text();
        artDialog.data("distributeActivityId", distributeActivityId);
        art.dialog.close();
    });


</script>


</html>
