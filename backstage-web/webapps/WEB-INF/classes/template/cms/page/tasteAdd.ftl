
<html>
<head>
    <title>纯粹味道</title>

    <meta name="decorator" content="default"/>

    <script src="/static/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <link href="/static/bootstrap/3.3.4/css_default/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="/static/bootstrap/3.3.4/js/bootstrap.min.js"  type="text/javascript"></script>
    <link href="/static/awesome/4.4/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/static/common/css/style.css?v=3.2.0" type="text/css" rel="stylesheet" />

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
    </style>

</head>

<h1 align="center">纯粹味道</h1>


<#if moduleTypeId??>
<input hidden value="${moduleTypeId?c}" name="moduleTypeId" id="moduleTypeId"/>
</#if>

<input hidden value="<#if moduleId??>${moduleId?c}</#if>" name="moduleId" id="moduleId"/>

<#if templateId??>
<input hidden value="${templateId?c}" name="templateId" id="templateId"/>
</#if>
<#if storeId??>
<input hidden value="${storeId?c}" name="storeId" id="storeId"/>
</#if>
<#if cmd??>
<input hidden value="${cmd}" name="cmd" id="cmd"/>
</#if>
<#if cmsTasteVO??>
<table align="center">
    <tr style="border-bottom: solid 1px; border-top: #66dc33 1px">
        <td>
            <table>
                <tr>
                    <td>
                        <hr style=" height:2px;border:none;border-top:2px dotted #185598;" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label style="color: forestgreen">位置:</label>
                    </td>
                    <td>
                        <input type="hidden" id="formerSort" value="<#if cmsTasteVO.sort??>${cmsTasteVO.sort}</#if>"/>
                        <input type="text" id="sort" style="color: red" value="<#if cmsTasteVO.sort??>${cmsTasteVO.sort}</#if>"/>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label style="color: forestgreen">模块名称:</label>
                    </td>
                    <td>
                        <input  id="moduleName" value="<#if cmsTasteVO.moduleName??>${cmsTasteVO.moduleName}</#if>"/>
                    </td>
                    <td>
                        <span data-color="#FF0000">最多四个汉字+一个中文字符</span>
                    </td>
                </tr>

            </table>
        </td>
    </tr>
        <#if cmsTasteVO.cmsProductInfoList??>
            <#list cmsTasteVO.cmsProductInfoList as product>
                <tr class="count">
                    <td>
                        <table align="center" style="border-top: solid 1px; border-right: 1px" width="550px">
                            <tr>
                                <td>
                                    <table>
                                        <#if product.sort==1>

                                                <tr>
                                                    <td>
                                                        <label>商品${product.sort}</label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="80px">
                                                        <input <#if product.productId??>checked="checked"</#if> type="radio"  name="one" id="oneProduct_${product_index}"/>
                                                        <label>商品ID:</label>
                                                    </td>
                                                    <td>
                                                        <input class="productId" data-index="${product_index}" type="text" id="productId_${product_index}"  value="<#if product.productId??>${product.productId?c}</#if>"/>
                                                        <input class="hasProduct" hidden id="hasProduct_${product_index}" value="<#if product.productId??>${product.productId?c}</#if>"/>
                                                        <input hidden id="id_${product_index}" value="<#if product.id??>${product.id?c}</#if>"></input>
                                                        <button class="query" data-index="${product_index}">查询</button>
                                                    </td>
                                                    <td>
                                                        <label class="tips" id="tips_${product_index}" style="color: red"></label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label>商品图:</label>
                                                    </td>
                                                    <td>
                                                        <img id="productImg_${product_index}" src="<#if product.productImage??>${product.productImage}</#if>" href="test" height="150px" width="350px">
                                                        <input type="file" id="uploadImage_${product_index}" onchange="imageChange(${product_index})"/>
                                                    </td>
                                                    <td>
                                                        <label style="color: red">(图片格式要求: 像素：750*240 )</label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="80px">
                                                        <label>商品名称:</label>
                                                    </td>
                                                    <td>
                                                        <label id="productTitle_${product_index}"><#if product.productTitle??>${product.productTitle}</#if></label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="80px">
                                                        <label>副标题:</label>
                                                    </td>
                                                    <td>
                                                        <label id="productSubtitle_${product_index}"><#if product.productSubtitle??>${product.productSubtitle}</#if></label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="80px">
                                                        <label>商品价格:</label>
                                                    </td>
                                                    <td>
                                                        <label id="price_${product_index}"><#if product.price??>${product.price?c}</#if></label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="80px">
                                                        <label>可售库存:</label>
                                                    </td>
                                                    <td>
                                                        <label id="stock_${product_index}"><#if product.stock??>${product.stock?c}</#if></label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="80px">
                                                        <label>可售状态:</label>
                                                    </td>
                                                    <td>
                                                        <label id="status_${product_index}"><#if product.status??>${product.status}</#if></label>
                                                    </td>
                                                </tr>
                                            <tr>
                                                <td width="80px">
                                                    <input type="radio" name="one" id="oneActivity_${product_index}" <#if !product.productId??>checked="checked"</#if> />
                                                    <label>活动页:</label>
                                                </td>
                                                <td>
                                                    <label id="filePath_${product_index}"><#if product.targetValue??>${product.targetValue}</#if></label>
                                                    <input type="file" id="oneActivityFile_${product_index}" onchange="createFileLink(${product_index})"/>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="80px">
                                                    <label>页面标题:</label>
                                                </td>
                                                <td>
                                                    <input type="text"  id="title_${product_index}" value="<#if product.targetTitle??>${product.targetTitle}</#if>"/>
                                                </td>
                                            </tr>
                                        </#if>




                                        <#if (product.sort>=2&&product.sort<7)>
                                            <tr>
                                                <td>
                                                    <label>商品${product.sort}</label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="80px">
                                                    <label>商品ID:</label>
                                                </td>
                                                <td>
                                                    <input class="productId" data-index="${product_index}" type="text" id="productId_${product_index}"  value="<#if product.productId??>${product.productId?c}</#if>"/>
                                                    <input class="hasProduct" hidden id="hasProduct_${product_index}" value="<#if product.productId??>${product.productId?c}</#if>"/>
                                                    <input hidden id="id_${product_index}" value="<#if product.id??>${product.id?c}</#if>"></input>
                                                    <button class="query" data-index="${product_index}">查询</button>
                                                </td>
                                                <td>
                                                    <label class="tips" id="tips_${product_index}" style="color: red"></label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label>商品图:</label>
                                                </td>
                                                <td>
                                                    <img id="productImg_${product_index}" src="<#if product.productImage??>${product.productImage}</#if>" href="test" height="250px">
                                                    <input type="file" id="uploadImage_${product_index}" onchange="imageChange(${product_index})"/>
                                                </td>
                                                <td>
                                                    <label style="color: red">(图片格式要求: 像素：370*370 )</label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="80px">
                                                    <label>商品名称:</label>
                                                </td>
                                                <td>
                                                    <label id="productTitle_${product_index}"><#if product.productTitle??>${product.productTitle}</#if></label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="80px">
                                                    <label>副标题:</label>
                                                </td>
                                                <td>
                                                    <label id="productSubtitle_${product_index}"><#if product.productSubtitle??>${product.productSubtitle}</#if></label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td width="80px">
                                                    <label>商品价格:</label>
                                                </td>
                                                <td>
                                                    <label id="price_${product_index}"><#if product.price??>${product.price?c}</#if></label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="80px">
                                                    <label>可售库存:</label>
                                                </td>
                                                <td>
                                                    <label id="stock_${product_index}"><#if product.stock??>${product.stock?c}</#if></label>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="80px">
                                                    <label>可售状态:</label>
                                                </td>
                                                <td>
                                                    <label id="status_${product_index}"><#if product.status??>${product.status}</#if></label>
                                                </td>
                                            </tr>
                                        </#if>



                                        <#if product.sort==7>
                                            <tr>
                                                <td width="80px">
                                                    <label>查看更多:</label>
                                                    <input hidden id="id_${product_index}" value="<#if product.id??>${product.id?c}</#if>"></input>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="80px">
                                                    <label>背景图:</label>
                                                </td>
                                                <td>
                                                    <img id="productImg_${product_index}" src="<#if product.productImage??>${product.productImage}</#if>" href="test" height="250px">
                                                    <input type="file" id="uploadImage_${product_index}" onchange="imageChange(${product_index})"/>
                                                </td>
                                                <td>
                                                    <label style="color: red">(图片格式要求: 像素：370*540 )</label>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td width="80px">
                                                    <label >分类页:</label>
                                                    <input  id="classLink_${product_index}" <#if product.targetTitle?length lte 0>checked="checked"</#if> class="radio2" type="radio" name="radio2" />
                                                </td>
                                                <td>
                                                    <label style="color: red" id="classLocation_${product_index}" ><#if product.targetTitle?length lte 0>${product.targetValue}</#if></label>
                                                    <select id="classSelect" onchange="selectClass(${product_index})">
                                                       <#if industryCategory??>
                                                           <option value="">请选择</option>
                                                           <#list industryCategory as item>
                                                                <option value="<#if item.id??>${item.id?c}</#if>"><#if item.id??>${item.id?c}</#if> : <#if item.name??>${item.name}</#if></option>
                                                           </#list>
                                                       </#if>

                                                    </select>
                                                </td>
                                            </tr>

                                                <tr>
                                                    <td width="80px">
                                                        <label>活动页:</label>
                                                        <input id="oneActivity_${product_index}" <#if product.targetTitle?length gt 0>checked="checked"</#if> class="radio2" type="radio" name="radio2" />
                                                    </td>
                                                    <td>
                                                        <label id="filePath_${product_index}"><#if product.targetTitle?length gt 0>${product.targetValue}</#if></label>
                                                        <input type="file" id="oneActivityFile_${product_index}" onchange="createFileLink(${product_index})"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="80px">
                                                        <label >页面标题:</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" id="title_${product_index}" value="<#if product.targetTitle?length gt 0>${product.targetTitle}</#if>"/>
                                                    </td>
                                                </tr>
                                        </#if>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </#list>
        </#if>
    <tr>
        <td colspan="2" align="center">
            <button id="save">保存</button>
        </td>
    </tr>
</table>
</#if>
<script>

    $(function(){

        var categoryUrl = $("#classLocation_6").text();
        if(!categoryUrl){
            return;
        }
        var splitArr =  categoryUrl.split("=");
        var categoryId  = splitArr[1];
        $("#classSelect option").each(function () {
            console.log($(this).val());
            if($(this).val() == categoryId){
                $(this).attr("selected",true);
                return;
            }
        });
    });

    function selectClass(index) {
        var value=$("#classSelect").val();
        $("#classLocation_"+index).html("ueater://categorypage?categoryID="+value);
    }

    $("#oneActivity_0").click(function () {
        $("#productId_0").val("");
    });

    function query(index) {
        var productId = $("#productId_" + index).val();
        var count = $(".count").size();

        for(var i=0;i<count-1;i++){
            if (i!=index){
                var productId1 = $("#productId_" + i).val();
                if(productId==productId1&&productId1!=null&&productId1!=""){
                    alert("此模块以包含此商品");
                    $("#productId_" + index).val("");
                    $("#price_" + index).html("");
                    $("#stock_" + index).html("");
                    $("#productTitle_" + index).html("");
                    $("#status_" + index).html("");
                    $("#productSubtitle_"+index).html("");
                    return;
                }

            }

        }


        var storeId = $("#storeId").val();
        $.get("/product/productInfo?storeId=" + storeId + "&productId=" + productId, {}, function (result) {
            if (result) {
                $("#price_" + index).html(result.price);
                $("#stock_" + index).html(result.stock);
                $("#productTitle_" + index).html(result.productTitle);
                $("#productSubtitle_" + index).html(result.productSubtitle);
                $("#status_" + index).html(result.status);
                $("#hasProduct_" + index).val(productId);
                if (result.status == "不在该门店销售") {
                    $("#tips_" + index).text("该门店无此商品");
                } else {
                    $("#tips_" + index).text("");
                }
            } else {
                alert("该商品不存在");
//                $("#productImg_" + index).attr("src", "");
                $("#price_" + index).html("");
                $("#stock_" + index).html("");
                $("#productTitle_" + index).html("");
                $("#status_" + index).html("");
                $("#hasProduct_" + index).val("");
                $("#productSubtitle_" + index).html("");
            }        });
    }

    //按钮查询用的。
    $(".query").click(function () {
        query($(this).data("index"));
    });

    //只要输入框改变就触发
    $(".productId").change(function () {

        query($(this).data("index"));
    });

    $("#save").click(function () {
        var cmd = $("#cmd").val();
        var moduleId = $("#moduleId").val();
        var templateId = $("#templateId").val();
        var sort = $("#sort").val();
        var moduleName = $.trim($("#moduleName").val());
        if(!sort){
            alert("位置不能为空");
            return;
        }
        if(sort>10||sort<5){
            alert("位置只能是5-10");
            return;
        }
        if(!moduleName){
            alert("模板名字不许空嗷");
            return;
        }




        var productIds = "";
        var images = "";
        var ids = "";
        //一号坑
        //商品id
        var oneProductId="";
        //活动链接
        var oneFilePath = "";
        //title
        var oneTitle = "";
        //预计两条sql 此字段标识执行哪个，涉及到覆盖清除
        var proIdORActi = "";

        //七号坑
        var actiORClass = "";
        var sevenFilePath="";
        var sevenTitle = "";
        var sevenClassLink = "";

        for (var i = 0; i < 7; i++) {

            //一号坑
            if (i==0){
                if($('#oneProduct_'+i).is(':checked')){

                    proIdORActi =1;
                    oneProductId=  $("#productId_"+i).val();
                    if(!oneProductId){
                        alert("1号位的商品不能为空");
                        return;
                    }

                    if (!$("#hasProduct_" + i).val()) {
                        alert("该商品不存在, productId: " + $("#productId_" + i).val());
                        return;
                    }
                    var status =  $("#status_"+i).html();
                    if(status=="不在该门店销售"||status=="仅线下可售"||status=="不可售"){
                        alert("有该门店不可售的商品");
                        return;
                    }

                    productIds=productIds+oneProductId+",";
                }
                if($('#oneActivity_'+i).is(':checked')){
                    proIdORActi =3;
                    oneFilePath= $("#filePath_"+i).html();
                    oneTitle=$("#title_"+i).val();
                    if(!oneFilePath){
                        alert("1号位活动链接不能为空");
                        return;
                    }
                    if(!oneTitle){
                        alert("1号位标题不能为空");
                        return;
                    }
                }
                //1号位置，图片
                var imagePath = $("#productImg_"+i).attr("src");
                if (!imagePath){
                    alert("1号位图片不能为空");
                    return;
                }
            }
            //七号坑
            if(i==6){
                if($('#classLink_'+i).is(':checked')){
                    actiORClass =4;
                    sevenClassLink=  $("#classLocation_"+i).html();
                    if(!sevenClassLink){
                        alert("7号位分类链接不能为空");
                        return;
                    }


                }
                if($('#oneActivity_'+i).is(':checked')){
                    actiORClass =3;
                    sevenFilePath= $("#filePath_"+i).html();
                    sevenTitle=$("#title_"+i).val();
                    if(!sevenFilePath){
                        alert("7号位活动链接不能为空");
                        return;
                    }
                    if(!sevenTitle){
                        alert("7号位标题不能为空");
                        return;
                    }

                }

            }
            if(i>=1&&i<=5){
                if(!$("#productId_" + i).val()){
                    alert((i+1)+"号位的商品id不能为空");
                    return
                }

                if (!$("#hasProduct_" + i).val()) {
                    alert("该商品不存在, productId: " + $("#productId_" + i).val());
                    return;
                }
                var status =  $("#status_"+i).html();
                if(status=="不在该门店销售"||status=="仅线下可售"||status=="不可售"){
                    alert("有该门店不可售的商品");
                    return;
                }
                productIds += ($("#productId_" + i).val() + ",");

            }
            ids += ($("#id_" + i).val() + ",");
            images += ($("#productImg_" + i).attr("src") + ",");
        }

        var url = "/cms/page/taste/edit?cmd=" + cmd +"&moduleId="+moduleId +"&productIds="+productIds +"&ids="+ids +"&images="+images +"&templateId="+templateId;

            url+="&oneFilePath="+oneFilePath+"&oneTitle="+oneTitle+"&proIdORActi="+proIdORActi;

            url+="&sevenClassLink="+sevenClassLink+"&actiORClass="+actiORClass;

            url+="&sevenFilePath="+sevenFilePath+"&sevenTitle="+sevenTitle+"&sort="+$("#sort").val()+"&moduleName="+$("#moduleName").val()+"&formerSort="+$("#formerSort").val();

        $.get(url, function (data) {
            var str = "保存成功";
            if (!data) {
                str = "保存失败";
            }
            alert(str);
            $.artDialog.close();
        });
    });

    function imageChange(index) {
        var imgFile = document.getElementById("uploadImage_"+index).files[0];


        var width="";
        var height="";
        var reader = new FileReader();
        reader.readAsDataURL(imgFile);
        reader.onload = function(theFile) {
            var image = new Image();
            image.src = theFile.target.result;
            image.onload = function() {
                width = this.width;
                height = this.height;

                var imagePath= $("#uploadImage_"+index).val();
                var extStart=imagePath.lastIndexOf(".");
                var ext=imagePath.substring(extStart,imagePath.length).toUpperCase();
                if(ext!=".PNG"&&ext!=".JPG"&&ext!=".JPEG"){
                    alert("图片限于png,jpeg,jpg格式");
                    $("#productImg_"+index).attr("src", "");
                    return ;
                }

                if (index==0){
                    if(width!=750||height!=240){
                        alert("图片尺寸不对，重新上传");
                        $("#productImg_"+index).attr("src", "");
                        return;
                    }
                }

                if(index>=1&&index<=5){
                    if(width!=370||height!=370){
                        alert("图片尺寸不对，重新上传");
                        $("#productImg_"+index).attr("src", "");
                        return;
                    }

                }
                //七号坑
                if(index==6){
                    if(width!=370||height!=540){
                        alert("图片尺寸不对，重新上传");
                        $("#productImg_"+index).attr("src", "");
                        return;
                    }

                }

                $("#productImg_" + index).attr("src", "");
                createImageLink(index);
            };
        };
    }

   function createImageLink(index) {

        var fileObj = document.getElementById("uploadImage_"+index).files[0]; // js 获取文件对象
        if (typeof (fileObj) == "undefined" || fileObj.size <= 0) {
            alert("请选择图片");
            return;
        }
        var formFile = new FormData();
        formFile.append("action", "/cms/upload/image");
        formFile.append("file", fileObj); //加入文件对象

        var data = formFile;
        $.ajax({
            url: "/cms/upload/image",
            data: data,
            type: "post",
            dataType: "json",
            cache: false,
            processData: false,
            contentType: false,
            success: function (result) {
                var str = "OK";
                if (result == "-1") {
                    str = "上传失败";
                } else {
                    str = result;
                }
                $("#productImg_" +index ).attr("src", result);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("error");
            }
        });
    };

    function createFileLink(index) {
        var fileObj = document.getElementById("oneActivityFile_"+index).files[0]; // js 获取文件对象
        if (typeof (fileObj) == "undefined" || fileObj.size <= 0) {
            alert("请选择文件");
            return;
        }
        var formFile = new FormData();
        formFile.append("action", "/cms/upload/file");
        formFile.append("file", fileObj); //加入文件对象

        var data = formFile;
        $.ajax({
            url: "/cms/upload/file",
            data: data,
            type: "post",
            dataType: "json",
            cache: false,
            processData: false,
            contentType: false,
            success: function (result) {
                var str = "OK";
                if (result == "-1") {
                    str = "上传失败";
                } else {
                    str = result;
                }
                $("#filePath_"+index).text(result);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("error");
                console.log(errorThrown);
                console.log(textStatus);
            }
        });
    };

</script>

</html>