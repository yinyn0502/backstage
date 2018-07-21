
<html>
<head>
    <title>商品管理后台</title>
    <script src="/static/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <link href="/static/bootstrap/3.3.4/css_default/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="/static/bootstrap/3.3.4/js/bootstrap.min.js"  type="text/javascript"></script>
    <link href="/static/awesome/4.4/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/static/common/css/style.css?v=3.2.0" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="/static/artDialog/jquery.artDialog.js?skin=green"></script>
    <script type="text/javascript" src="/static/artDialog/plugins/iframeTools.source.js"></script>

    <script src="/static/bootstrap-datetimepicker/bootstrap-datetimepicker.js"  charset="UTF-8"></script>
    <script src="/static/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
    <link href="/static/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <meta name="decorator" content="default"/>


    <script type="text/javascript">



        function editProductBatch() {
            var saleStatusType = null;
            if ($("#choseSaleStatus").prop("checked")){
                saleStatusType = $("#saleStatusType").val();
            } else {
                saleStatusType = null;
            }
            var productIds = <#if productIds??>"${productIds}"<#else>""</#if>;
            $.get("/product/edit" + ($("#choseSubTitle").prop("checked") ? ("?subTitle=" + $("#subTitle").val()) : ""), {
                "productIds" : productIds,
                "saleStatusType" : saleStatusType,
                "storeId" : $("#storeId").val()
            }, function (data) {
                if (data) {
                    if (data.data) {
                        alert(data.message[0].message);
                    } else {
                        $.artDialog.close();
                    }
                }
            });
        }




    </script>

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
        }
    </style>


</head>
<body class="gray-bg">
    <table  style="border-collapse:separate; border-spacing:0px 10px;" align="left">
        <thead>
            <tr>
                <td colspan="4">
                    <h1 align="left">批量修改</h1>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <h3 align="left">请勾选需要修改的字段</h3>
                </td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <input id="choseSubTitle" type="checkbox" style="width: 30px"/>
                </td>
                <td>
                    <label>商品副标题: </label>
                </td>
                <td>
                    <input id="subTitle" maxlength="20"/>
                    <input hidden id="storeId" value="<#if storeId??>${storeId?c}</#if>"/>
                </td>
                <td>
                    <label style="color: #ff0000">中文字符和数字、标点一共不超过20个</label>
                </td>
            </tr>
            <tr>
                <td>
                    <input id="choseSaleStatus" type="checkbox" style="width: 30px"/>
                </td>
                <td>
                    <label>销售状态:</label>
                </td>
                <td>
                    <input hidden id="changeSaleStatus">
                    <select id="saleStatusType">
                        <option value="">请选择</option>
                        <option value="3">仅线下可售</option>
                        <option value="2">仅线上可售</option>
                        <option value="1">线上线下可售</option>
                        <option value="0">不可售</option>

                    </select>
                </td>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="4" align="right">
                    <button class="button" onclick="editProductBatch()">保存</button>
                </td>
            </tr>
        </tfoot>
    </table>
</body>
</html>