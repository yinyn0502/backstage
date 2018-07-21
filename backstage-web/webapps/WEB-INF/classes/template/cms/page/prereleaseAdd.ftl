<html>
<head>
    <title>每日抢鲜</title>

    <meta name="decorator" content="default"/>

    <script src="/static/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <link href="/static/bootstrap/3.3.4/css_default/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <script src="/static/bootstrap/3.3.4/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="/static/awesome/4.4/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="/static/common/css/style.css?v=3.2.0" type="text/css" rel="stylesheet"/>

    <script type="text/javascript" src="/static/artDialog/jquery.artDialog.js?skin=green"></script>
    <script type="text/javascript" src="/static/artDialog/plugins/iframeTools.source.js"></script>

    <!-- bootstrap-datetimepicker 时间控件 和语言包-->
    <script src="/static/bootstrap-datetimepicker/bootstrap-datetimepicker.js" charset="UTF-8"></script>
    <script src="/static/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
    <link href="/static/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">

    <script>
        $(function () {
            $("#startTime").datetimepicker({
                format: 'yyyy-mm-dd hh:ii:ss',
                autoclose: true,
                minView: 0,
                minuteStep:1

            }).on('changeDate',function (e) {
                var startTime = e.date;
                $('#endTime').datetimepicker('setStartDate',startTime);
            });
            $( "#endTime" ).datetimepicker({
                format: 'yyyy-mm-dd hh:ii:ss',
                autoclose: true,
                minView: 0,
                minuteStep:1
            }).on('changeDate',function (e) {
                var endTime = e.date;
                $('#startTime').datetimepicker('setEndDate',endTime);
            });

            $("#startTime").datetimepicker({
                format: 'yyyy-mm-dd hh:ii:ss',
                autoclose: true,
                minView: 0,
                minuteStep:1

            }).on('changeDate',function (e) {
                var startTime = e.date;
                $('#endTime').datetimepicker('setStartDate',startTime);
            });
        });
    </script>
</head>

<h1 align="center">每日抢鲜</h1>


<#if moduleTypeId??>
<input hidden value="${moduleTypeId?c}" name="moduleTypeId" id="moduleTypeId"/>
</#if>
<#if moduleId??>
<input hidden value="${moduleId?c}" name="moduleId" id="moduleId"/>
</#if>
<#if moduleIds??>
<input hidden value="${moduleIds}" name="moduleIds" id="moduleIds"/>
</#if>
<#if templateId??>
<input hidden value="${templateId?c}" name="templateId" id="templateId"/>
</#if>
<#if storeId??>
<input hidden value="${storeId?c}" name="storeId" id="storeId"/>
</#if>
<#if cmd??>
<input hidden value="${cmd}" name="cmd" id="cmd"/>
</#if>
<input hidden id="sort" value="<#if sort??>${sort?c}</#if>"/>


<table style="padding: 20px" align="center">
        <thead>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <label>第<#if sort??>${sort?c}</#if>组</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>开始时间:</label>
                            </td>
                            <td>
                                <input type="text" class="input-sm form-control " data-date-format="yyyy-mm-dd hh:ii:ss"
                                       id="startTime" name="startTime" readonly value="<#if cmsPrereleaseVO??><#if cmsPrereleaseVO.startTime??>${cmsPrereleaseVO.startTime}</#if></#if>"/>
                            <#--<label>2022-10-10 12:00:00</label>-->
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>结束时间:</label>
                            </td>
                            <td>
                                <input type="text" class="input-sm form-control " data-date-format="yyyy-mm-dd hh:ii:ss"
                                       id="endTime" readonly value="<#if cmsPrereleaseVO??><#if cmsPrereleaseVO.endTime??>${cmsPrereleaseVO.endTime}</#if></#if>"/>
                            <#--<label>2022-10-10 12:00:00</label>-->
                            </td>
                            <td>
                                <label style="color: red">每组商品数量: 4~10个</label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </thead>
        <tbody id="body">
            <#if cmsPrereleaseVO??>
            <#if cmsPrereleaseVO.productInfoList??>
            <#list cmsPrereleaseVO.productInfoList as item>
            <tr class="count">
                <td>
                    <table align="center">
                        <tr>
                            <td>
                                <label style="color: red">商品${item_index + 1}</label>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <label class="tips" id="tips_${item_index}" style="color: red"></label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>商品ID:</label>
                            </td>
                            <td>
                                <input hidden id="id_${item_index}" name="id" value="<#if item.id??>${item.id?c}</#if>"></input>
                                <input id="productId_${item_index}" data-index="${item_index}" onchange="queryInfo(${item_index})" name="productId" value="<#if item.productId??>${item.productId?c}</#if>"></input>
                                <input class="hasProduct" hidden id="hasProduct_${item_index}" value="<#if item.productId??>${item.productId?c}</#if>"/>
                                <button class="query" id="query_${item_index}" data-index="${item_index}" onclick="queryInfo(${item_index})">查询</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>商品名称:</label>
                            </td>
                            <td>
                                <label id="productTitle_${item_index}">
                                <#if item.productTitle??>${item.productTitle}</#if>
                                </label>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <label>副标题:</label>
                            </td>
                            <td>
                                <label id="productSubtitle_${item_index}"><#if item.productSubtitle??>${item.productSubtitle}</#if></label>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <label>图片:</label>
                            </td>
                            <td>
                                <img id="productImg_${item_index}" src="<#if item.productImage??>${item.productImage}</#if>" width="100px">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>商品价格:</label>
                            </td>
                            <td>
                                <label id="productPrice_${item_index}">
                                <#if item.price??>${item.price}</#if>
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>可售库存:</label>
                            </td>
                            <td>
                                <label id="productStock_${item_index}">
                                <#if item.stock??>${item.stock}</#if>
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>可售状态:</label>
                            </td>
                            <td>
                                <label id="status_${item_index}">
                                <#if item.status??>${item.status}</#if>
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td align="right">
                                <input type="button" data-index="${item_index}" class="button removeProduct" id="removeProduct_${item_index}" value="删除商品" onclick="deleteProduct(${item_index})"></input>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            </#list>
            </#if></#if>
        </tbody>
            <tr>
                <td></td>
                <td>
                    <input hidden id="moduleId" value="<#if cmsPrereleaseVO??><#if cmsPrereleaseVO.moduleId??>${cmsPrereleaseVO.moduleId?c}</#if></#if>"/>
                    <button id="addProduct" onclick="addProduct()">添加商品</button>
                </td>
            </tr>
        </table>
    </tr>
    <tr>
        <td>
            <button id="save">保存</button>
        </td>
    </tr>
</table>

<script>
    $(function () {
        $("#save").click(function () {
            /*var tips = $(".tips");
            for (var i= 0; i < tips.length; i++) {
                if ($(tips[i]).text()) {
                    alert("包含有本门店不可售的商品");
                    return;
                }
            }*/

            var cmd = $("#cmd").val();
            var count1 = $(".count1").size();
            var count = $(".count").size();

            var sort = $("#sort").val();

            var productIds = "";
            var ids = "";

            if (cmd=="save"){
                if (count1 <4) {
                    alert("不能少于4个商品");
                    return;
                }
                for(var i = 0; i < count1; i++) {
                    if (!$("#productId_" + i).val()) {
                        alert("商品Id不能为空");
                        return;
                    }
                    productIds = productIds + $("#productId_" + i).val() + ",";
                    ids = ids + $("#id_" + i).val() + ",";
                }
            }

            if(cmd=="update"){
                for(var i = 0; i < count; i++) {
                    if (!$("#productId_" + i).val()) {
                        alert("商品Id不能为空");
                        return;
                    }
                    productIds = productIds + $("#productId_" + i).val() + ",";
                    ids = ids + $("#id_" + i).val() + ",";
                }

                for(var i = count; i < count+count1; i++){
                    if (!$("#productId_" + i).val()) {
                        alert("商品Id不能为空");
                        return;
                    }
                    productIds = productIds + $("#productId_" + i).val() + ",";
                    ids = ids + $("#id_" + i).val() + ",";
                }
            }




            var cons = $(".hasProduct");
            for (var i = 0; i < cons.length; i++) {
                if (!$("#hasProduct_" + i).val()) {
                    alert("该商品不存在, productId: " + $("#productId_" + i).val());
                    return;
                }
            }
            var moduleId = $("#moduleId").val();
            var templateId = $("#templateId").val();
            var startTime = $("#startTime").val();
            if (!startTime) {
                alert("开始时间不能为空");
                return;
            }
            var endTime = $("#endTime").val();
            if (!endTime) {
                alert("结束时间不能为空");
                return;
            }
            var productIds = productIds;
            var str = "保存成功";
            $.get("/cms/page/prerelease/edit?cmd="+cmd
                    +"&moduleId="+moduleId
                    +"&templateId="+templateId
                    +"&startTime="+startTime
                    +"&endTime="+endTime
                    +"&sort="+sort
                    +"&productIds="+productIds
                    + "&ids=" + ids, function (data) {
                if (!data) {
                    str = "保存失败";
                }
                alert(str);
                $.artDialog.close();
            });
        });

    });
    var storeId = $("#storeId").val();
    //添加商品
    function addProduct() {
        var count = $(".count").size();
        var count1 = $(".count1").size();

        if (count+count1 >= 10) {
            $("#addProduct").attr("disabled", true);
            alert("不能添加超过10个商品");
            return;
        }else{
            $("#addProduct").attr("disabled", false);
        }
        count1=count+count1;

//        var org = $("#body").html();
        var newHtml = "<tr class='count1'>" +
                "<td><table>" +
                "<tr>" +
                "<td><label style='color: red'>商品"+(count1+1)+"</label></td>" +
                "</tr>" +
                "<tr>" +
                "<td></td>" +
                "<td><label class='tips' id='tips_"+count1+"' style='color: red'></label></td>" +
                "</tr>" +
                "<tr>" +
                "<td><label>商品ID:</label></td>" +
                "<td><input id='productId_"+count1+"' name='productId' onchange='queryInfo("+count1+")' value=''></input><input class='hasProduct' hidden id='hasProduct_"+count1+"'/><button class='query' id='query_"+count1+"' data-index='"+count1+"' onclick='queryInfo("+count1+")'>查询</button></td>" +
                "</tr>" +
                "<tr>" +
                "<td><label>商品名称:</label></td>" +
                "<td><label id='productTitle_"+count1+"'></label></td>" +
                "</tr>" +
                "<td><label>副标题:</label></td>"+
                "<td><label id='productSubtitle_"+count1+"'></label></td>"+
                "<tr>" +
                "<td><label>图片:</label></td>" +
                "<td><img id='productImg_"+count1+"' src='' width='100px'> </td>" +
                "</tr>" +
                "<tr>" +
                "<td><label>商品价格:</label></td>" +
                "<td><label id='productPrice_"+count1+"'></label></td>" +
                "</tr>" +
                "<tr>" +
                "<td><label>可售库存:</label></td>" +
                "<td><label id='productStock_"+count1+"'></label></td>" +
                "</tr>" +
                "<tr><td><label>可售状态:</label></td><td><label id='status_"+count1+"'></label></td></tr>" +
                "<tr><td></td><td align='right'><input type='button' class='button' id='removeProduct_"+count1+"' value='删除商品' onclick='deleteNewCreateProduct("+count1+")' ></input></td></tr>" +
                "</table></td></tr>";
        $("#body").append(newHtml);
    }

    function deleteNewCreateProduct(index) {
        var count = $(".count").size();
        //防止从中间删除，下标丢失
        var count1 = $(".count1").size()+count-1;
        if(count1!=index){
            alert("请从最后一个删除，或者可以修改");
            return;
        }
        var ss = $("#removeProduct_"+index).parent().parent().parent().parent().parent().parent();
        ss.remove();
        $("#addProduct").attr("disabled", false);
    }

    function deleteProduct(index) {

        var count = $(".count").size();
        if (count <= 4) {
            alert("商品已经不够删了");
            return;
        }


        var id = $("#id_" + index).val();
        $.get("/cms/moduleResource/delete?id="+id, function (data) {
            if (!data) {
                alert("失败, id:"+id);
            } else {
                alert("成功, id:"+id);
                $("#addProduct").attr("disabled", false);
                window.location.reload();
            }
            //art.dialog.open.origin.location.href="/cms/page/prerelease?moduleIds="+$("#moduleIds").val()+"&templateId="+$("#templateId").val()+"&storeId="+$("#storeId").val();
        });
    }

    //查询商品
    function queryInfo(index){
        var productId = $("#productId_" + index).val();
        var count = $(".count").size();
        var count1 = $(".count1").size();
        var cmd = $("#cmd").val();
        if(cmd=="save"){
            for(var i=0;i<count1;i++){
                if (i!=index){
                    var productId1 = $("#productId_" + i).val();
                    if(productId==productId1){
                        alert("此模块以包含此商品");
                        $("#productId_" + index).val("");
                        $("#productImg_" + index).attr("src", "");
                        $("#productPrice_" + index).html("");
                        $("#productStock_" + index).html("");
                        $("#productTitle_" + index).html("");
                        $("#status_" + index).html("");
                        $("#productSubtitle_"+index).html("");
                        return;
                    }

                }

            }

        }else{
            for(var i=0;i<count;i++){
                if (i!=index){
                    var productId1 = $("#productId_" + i).val();
                    if(productId==productId1){
                        alert("此模块以包含此商品");
                        $("#productId_" + index).val("");
                        $("#productImg_" + index).attr("src", "");
                        $("#productPrice_" + index).html("");
                        $("#productStock_" + index).html("");
                        $("#productTitle_" + index).html("");
                        $("#status_" + index).html("");
                        $("#productSubtitle_"+index).html("");
                        return;
                    }

                }

            }

        }

        var storeId = $("#storeId").val();
        $.get("/product/productInfo?storeId=" + storeId + "&productId=" + productId, {}, function (result) {
            if (result) {
                $("#productImg_" + index).attr("src", result.productImage);
                $("#productPrice_" + index).html(result.price);
                $("#productSubtitle_"+index).html(result.productSubtitle);
                $("#productStock_" + index).html(result.stock);
                $("#productTitle_" + index).html(result.productTitle);
                $("#status_" + index).html(result.status);
                $("#hasProduct_" + index).val(productId);

                if (result.status == "不在该门店销售") {
                    $("#tips_" + index).text("该门店无此商品");
                } else {
                    $("#tips_" + index).text("");
                }
            } else {
                alert("找不到该商品");
                $("#productImg_" + index).attr("src", "");
                $("#productPrice_" + index).html("");
                $("#productStock_" + index).html("");
                $("#productTitle_" + index).html("");
                $("#status_" + index).html("");
                $("#hasProduct_" + index).val("");
                $("#productSubtitle_"+index).html("");
            }
        });
    }
</script>
</html>