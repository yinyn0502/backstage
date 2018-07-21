<html>
<head>
    <title>添加商品</title>

    <meta name="decorator" content="default"/>

    <script src="/static/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="/static/jqPaginator/jqPaginator.js" type="text/javascript"></script>
    <link href="/static/bootstrap/3.3.4/css_default/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <script src="/static/bootstrap/3.3.4/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="/static/awesome/4.4/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="/static/common/css/style.css?v=3.2.0" type="text/css" rel="stylesheet"/>

    <script type="text/javascript" src="/static/artDialog/jquery.artDialog.js?skin=green"></script>
    <script type="text/javascript" src="/static/artDialog/plugins/iframeTools.source.js"></script>
    <style>
        .add {
            background-color: #4A90E2; /* Green */
            border: none;
            color: white;
            padding: 10px 21px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
        }

        table {
            font-family: verdana, arial, sans-serif;
            font-size: 11px;
            color: #333333;
            border-width: 1px;
            border-color: #666666;
            border-collapse: collapse;
            width: 80%;
            text-align: center;
            border-radius: 5px;
            border-top: 30px;
        }
    </style>

</head>


<#if storeId??>
<input hidden value="${storeId?c}" name="storeId" id="storeId"/>
</#if>


<h2>新增商品</h2> <br>

<label>门店</label> &nbsp;

<label><#if storeName??>${storeName}</#if></label><br>

<label>商品ID</label>&nbsp;

<input type="text" width="300px" id="productIds" oninput="this.value=this.value.replace(/[^\d\,]/g,'')" maxlength="350"/>&nbsp;

<button id="query">查询</button>
<br>
<label>(多商品ID用英文,间隔，如100221,100222)</label>
<br>

<table align="center" id="table" border="1px"  class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footer">
    <tr>
        <th>
            <input type="checkbox" id="checkbox"/>全选
        </th>
        <th>商品ID</th>
        <th>商品名称</th>
        <th>促销</th>
        <th>售卖状态</th>
        <th>库存</th>
        <th>当前售价</th>
    </tr>
</table>

<#--<ul class="pagination" id="pagination2" style="float: right" ></ul> <br>-->

<div style="text-align: right; margin: 15px">
    <button class="add" id="cancel">取消</button>
    <button class="add" id="sure">确定</button>
</div>

<script>


    //取消
    $("#cancel").click(function () {
        artDialog.data("productIds", "");
        art.dialog.close();
    });
    //确定
    $("#sure").click(function () {
        var ck =document.getElementsByName("ck");
        var productIds = "";
        for(var i=0;i<ck.length;i++) {
            //判断全选按钮的状态是不是选中的
            if(ck[i].checked){
                var next = ck[i].parentNode.nextSibling.innerHTML;
                productIds+=next+",";
            }
        }
        artDialog.data("productIds", productIds);
        artDialog.data("productCount", <#if productCount??>${productCount}</#if>);
        art.dialog.close();
    });
    $("#query").click(function () {
        var productIds = $("#productIds").val();
        var storeId = $("#storeId").val();
        $("#table").html("<tr><th><input type='checkbox' onclick='quanxuan(this)' id='checkbox'/>全选</th><th>商品ID</th><th>商品名称</th><th>促销</th><th>售卖状态</th><th>库存</th><th>当前售价</th></tr>");
        $.get("/seckill/edit/queryProduct?productIds=" + productIds + "&storeId=" + storeId, function (result) {
            var val = "";

            for (var i = 0; i < result.length; i++) {

                val += "<tr class='count'>";
                val += "<td>";
                if(result[i].saleStatus=="不可售"||result[i].saleStatus=="仅线下可售"||result[i].salesInventory==0){
                    val += "";
                }else {
                    val += "<input type='checkbox' name='ck'/>";
                }
                val += "</td>";
                val += "<td id='productId'>" + result[i].productId + "</td>";
                val += "<td>" + result[i].productName + "</td>";
                val += "<td>";
                if (result[i].existPromo) {
                    val += "<label style='color: red'>有</label>";
                } else {
                    val += "<label>无</label>";
                }
                val += "</td>";
                val += "<td>" ;
                if(result[i].saleStatus=="不可售"){
                    val += "<label style='color: red'>"+result[i].saleStatus+"</label>";
                }else if(result[i].saleStatus=="仅线下可售"){
                    val += "<label style='color: red'>"+result[i].saleStatus+"</label>";
                }else{
                    val += "<label>"+result[i].saleStatus+"</label>";
                }
                val +="</td>";
                val += "<td>" ;
                if(result[i].salesInventory<10){
                    val += "<label style='color: red'>"+result[i].salesInventory+"</label>";
                }else{
                    val += "<label>"+result[i].salesInventory+"</label>";
                }
                val += "</td>";
                val += "<td>" + result[i].salePrice + "</td>";
                val += "</tr>";
            }
            $("#table").append(val);
        });
    });

    //全选按钮点击事件
    function quanxuan(a) {
        //找到下面所有的复选框
        var ck =document.getElementsByName("ck");
        //遍历所有复选框，设置选中状态。
        for(var i=0;i<ck.length;i++) {
            //判断全选按钮的状态是不是选中的
            if(a.checked){
                ck[i].checked=true;//如果是选中的，就让所有的状态为选中。
            } else {
                ck[i].checked=false;//如果不是选中的，就移除所有的状态是checked的选项。
            }
        }
    }

</script>

</html>