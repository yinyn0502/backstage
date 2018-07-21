
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

        function statusChange() {
            var saleStatusType = $("#saleStatusType").val();
            $("#changeSaleStatus").val(saleStatusType);
        }

        function editProduct() {
            var productId = $("#productId").text();
            var subTitle = $("#subTitle").val();
            var saleStatusType = $("#changeSaleStatus").val();
            var storeId = $("#storeId").val();
            var haveImage = $("#haveImage").text();
            var oldSaleStatusType = $("#oldSaleStatusType").val();
            $.get("/product/edit", {
                "productIds" : productId + ":" + oldSaleStatusType + ":" +haveImage,
                "subTitle" : subTitle,
                "saleStatusType" : saleStatusType,
                "storeId" : storeId,
                "oldSaleStatusType" : oldSaleStatusType
            }, function (data) {
                if (data) {
                    if(data.code!=0){
                        var info = "";
                        if(data.message){
                            for(var i=0;i<data.message.length;i++){
                                var params = data.message[i].params;
                                for(var j in params){
                                    info += j + ":" +params[j] + "\r\n";
                                }
                            }
                            alert(info);
                        }
                        $.artDialog.close();
                    }
                    if(data.code==0){
                        if(data.message){
                            if(data.message.length>0){
                                var info = "以下商品修改状态失败:"+ "\r\n";
                                for(var i=0;i<data.message.length;i++){
                                    var params = data.message[i].params;
                                    for(var j in params){
                                        info += j + ":" +params[j] + "\r\n";
                                    }
                                }
                                alert(info);
                            }
                        }
                        $.artDialog.close();
                    }
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
            margin: 20px;
        }
    </style>


</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <#if productBackstageTO??>
    <table  style="border-collapse:separate; border-spacing:0px 10px;" align="left">
        <tbody>
        <tr>
            <td>
                <label>商品ID</label>
            </td>
            <td>
                <label id="productId"><#if productBackstageTO.productId??>${productBackstageTO.productId?c}</#if></label>
                <input id="storeId" type="hidden" value="<#if productBackstageTO.storeId??>${productBackstageTO.storeId?c}</#if>"/>
            </td>
        </tr>
        <tr>
            <td>
                <label>商品名称</label>
            </td>
            <td>
                <label><#if productBackstageTO.productName??>${productBackstageTO.productName}</#if></label>
            </td>
        </tr>
        <tr>
            <td>
                <label>商品副标题</label>
            </td>
            <td>
                <input id="subTitle" maxlength="20" value="<#if productBackstageTO.subTitle??>${productBackstageTO.subTitle}</#if>"></input>
            </td>
            <td>
                <label>不超过20个字</label>
            </td>
        </tr>
        <tr>
            <td>
                <label>有无商品图</label>
            </td>
            <td>
                <label id="haveImage"><#if productBackstageTO.haveImage>有<#else>无</#if></label>
            </td>
        </tr>
        <tr>
            <td>
                <label>所属门店</label>
            </td>
            <td>
                <label><#if productBackstageTO.storeName??>${productBackstageTO.storeName}</#if></label>
            </td>
        </tr>
        <tr>
            <td>
                <label>当前售价</label>
            </td>
            <td>
                <label><#if productBackstageTO.originPrice??>${productBackstageTO.originPrice?c}</#if></label>
            </td>
        </tr>
        <tr>
            <td>
                <label>可售库存</label>
            </td>
            <td>
                <label><#if productBackstageTO.salesInventory??>${productBackstageTO.salesInventory?c}</#if></label>
            </td>
        </tr>
        <tr>
            <td>
                <label>销售状态</label>
            </td>
            <td>
                <#if productBackstageTO.saleStatusType??>
                    <input id="oldSaleStatusType" type="hidden" value="#{productBackstageTO.saleStatusType}">
                </#if>
                <#if productBackstageTO.saleStatusType??&&productBackstageTO.saleStatusType==0&&productBackstageTO.productId<100000000>
                    <label>请在ERP中修改该商品状态</label>
                <#elseif productBackstageTO.productId gt 100000000>
                    <input type="hidden" id="changeSaleStatus" >
                <select id="saleStatusType" onchange="statusChange()">
                    <option value="3" <#if productBackstageTO.saleStatusType??&&productBackstageTO.saleStatusType==3>selected</#if>>仅线下可售</option>
                    <option value="2" <#if productBackstageTO.saleStatusType??&&productBackstageTO.saleStatusType==2>selected</#if>>仅线上可售</option>
                    <option value="1" <#if productBackstageTO.saleStatusType??&&productBackstageTO.saleStatusType==1>selected</#if>>线上线下可售</option>
                    <option value="0" <#if productBackstageTO.saleStatusType??&&productBackstageTO.saleStatusType==0>selected</#if>>不可售</option>
                </select>
                <#else >
                    <input type="hidden" id="changeSaleStatus" >
                    <select id="saleStatusType" onchange="statusChange()">
                        <option value="3" <#if productBackstageTO.saleStatusType??&&productBackstageTO.saleStatusType==3>selected</#if>>仅线下可售</option>
                        <option value="2" <#if productBackstageTO.saleStatusType??&&productBackstageTO.saleStatusType==2>selected</#if>>仅线上可售</option>
                        <option value="1" <#if productBackstageTO.saleStatusType??&&productBackstageTO.saleStatusType==1>selected</#if>>线上线下可售</option>
                    </select>
                </#if>
            </td>
        </tr>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="3" align="right">
                    <button class="button" onclick="cancel()">取消</button>
                    <button class="button" onclick="editProduct()">保存</button>
                </td>
            </tr>
        </tfoot>
    </table>
    </#if>
    <script>
        function cancel() {
            $.artDialog.close();
        }
    </script>
</div>
</body>
</html>
