<html>
<head>
    <title>banner</title>

    <meta name="decorator" content="default"/>

    <script src="/static/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <link href="/static/bootstrap/3.3.4/css_default/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="/static/bootstrap/3.3.4/js/bootstrap.min.js"  type="text/javascript"></script>
    <link href="/static/awesome/4.4/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/static/common/css/style.css?v=3.2.0" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="/static/artDialog/jquery.artDialog.js?skin=green"></script>
    <script type="text/javascript" src="/static/artDialog/plugins/iframeTools.source.js"></script>
    <style>
        .button {
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

<h1 align="center">买手推荐</h1>

<#if productIds??>
<input hidden value="${productIds}" name="productIds" id="productIds"/>
</#if>
<#if moduleTypeId??>
<input hidden value="${moduleTypeId?c}" name="moduleTypeId" id="moduleTypeId"/>
</#if>
<#if moduleId??>
<input hidden value="${moduleId?c}" name="moduleId" id="moduleId"/>
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

<input hidden value="<#if id??>${id?c}</#if>" name="id" id="id"/>

<table align="center">
    <thead>
        <tr>
            <td>
                <label>位置:</label>

                <input type="hidden" id="formerSort" value="<#if sort??>${sort?c}</#if>"/>
                <input  id="sort" value="<#if sort??>${sort?c}</#if>"/>
                <label id="sortTip" style="color: red"></label>
                <script>

                    $("#sort").change(function () {
                       var cmd = $("#cmd").val();
                       if(cmd=="save") {
                           $.get("/cms/page/verifyLocation?templateId=<#if templateId??>${templateId?c}</#if>&moduleId=<#if moduleId??>${moduleId?c}</#if>&sort=" + $("#sort").val(), function (data) {
                               if (data) {
                                   $("#sortTip").text("该位置已有资源!");
                               } else {
                                   $("#sortTip").text("");
                               }
                           });
                       }
                    });

                </script>
            </td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            <label>买手名称:</label>
                        </td>
                        <td>
                            <input id="buyer" value="<#if buyer??>${buyer}</#if>"></input>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>商品图:</label>
                        </td>
                        <td>
                            <img id="headImage" src="<#if headImage??>${headImage}</#if>" href="头像图" width="174px">
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <label style="color: red">图片尺寸:300*300</label>
                                </tr>
                                <tr>
                                    <input id="headImageButton" type="file"/>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>文案:</label>
                        </td>
                        <td>
                            <textarea id="document" maxlength="36"><#if document??>${document}</#if></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <label style="color: red">加上标点符号,最多36个字</label>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <table>
                    <tr>
                        <td></td>
                        <td>
                            <label class="tips" id="tips" style="color: red"></label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>商品ID:</label>
                        </td>
                        <td>
                            <input id="productId" value="<#if productId??>${productId?c}</#if>"></input>
                            <input hidden id="hasProduct" value="<#if productId??>${productId?c}</#if>"/>
                        </td>
                        <td>
                            <button class="query">查询</button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>商品图:</label>
                        </td>
                        <td>
                            <img id="productImg" src="<#if productImage??>${productImage}</#if>" href="头像图" width="150px">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>商品价格:</label>
                        </td>
                        <td>
                            <label id="productPrice"><#if price??>${price?c}</#if></label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>商品名称:</label>
                        </td>
                        <td>
                            <label id="productTitle"><#if productTitle??>${productTitle}</#if></label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>副标题:</label>
                        </td>
                        <td>
                            <label id="productSubtitle"><#if productSubTitle??>${productSubTitle}</#if></label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>可售库存:</label>
                        </td>
                        <td>
                            <label id="productStock"><#if stock??>${stock}</#if></label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>销售状态:</label>
                        </td>
                        <td>
                            <label id="status"><#if status??>${status}</#if></label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <input id="isMore" type="checkbox" <#if isMore??&&isMore>checked</#if>/>
                <label>更多推荐</label>
            </td>
        </tr>
        <tr>
            <td>
                 <label>页面文件:</label>
                <label id="filePath" style="color: red;"><#if filePath??>${filePath}</#if></label>
                <input id="fileButton" type="file"/>
                <#--<button class="uploadFile" data-file="filePath" data-button="fileButton">生成链接</button>-->
            </td>
        </tr>
        <tr>
            <td>
                <label>页面标题:</label>
                <input id="title" value="<#if title??>${title}</#if>"/>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <button id="save">保存</button>
            </td>
        </tr>
    </tbody>
</table>

<script>
    $(function () {
        $("#productId").change(function () {

            var productId= $("#productId").val();
            var productIds = $("#productIds").val();
            var attr =  productIds.split(",");
            for(var i =0;i<attr.length;i++){
                if(productId==attr[i]&&productId!=""&&productId!=null){
                    alert("此模块以包含此商品");
                    $("#productId").val("");
                    $("#productImg").attr("src", "");
                    $("#productPrice").html("");
                    $("#productStock").html("");
                    $("#productTitle").html("");
                    $("#status").html("");
                    $("#productSubtitle").html("");
                    return;
                }
            }



            $.get("/product/productInfo?storeId="+$("#storeId").val()+"&productId="+$("#productId").val(), {}, function (result) {
                if (result) {
                    $("#hasProduct").val($("#productId").val());
                    $("#productImg").attr("src", result.productImage);
                    $("#productPrice").html(result.price);
                    $("#productStock").html(result.stock);
                    $("#productTitle").html(result.productTitle);
                    $("#status").html(result.status);
                    $("#productSubtitle").html(result.productSubtitle);
                    if (result.status == "不在该门店销售") {
                        $("#tips").text("该门店无此商品");
                    } else {
                        $("#tips").text("");
                    }
                } else {
                    alert("无法找到该商品");
                    $("#hasProduct").val("");
                    $("#productImg").attr("src", "");
                    $("#productPrice").html("");
                    $("#productStock").html("");
                    $("#productTitle").html("");
                    $("#productSubtitle").html("");
                }
            });
        });

        $("#isMore").click(function () {
            var isMore = $("#isMore").prop("checked");
            if(isMore){
                $("#fileButton").attr("disabled", false);
                $("#title").attr("disabled", false);
            }else{
                $("#fileButton").attr("disabled", true);
                $("#title").attr("disabled", true);
            }
        });
        var isMore = $("#isMore").prop("checked");
        if(isMore){
            $("#fileButton").attr("disabled", false);
            $("#title").attr("disabled", false);
        }else {
            $("#fileButton").attr("disabled", true);
            $("#title").attr("disabled", true);
        }


        $("#headImageButton").change(function () {
            var imgFile = document.getElementById("headImageButton").files[0];

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

                    var imagePath =$("#headImageButton").val();
                    var extStart=imagePath.lastIndexOf(".");
                    var ext=imagePath.substring(extStart,imagePath.length).toUpperCase();
                    if(ext!=".PNG"&&ext!=".JPG"&&ext!=".JPEG"){
                        alert("图片限于png,jpeg,jpg格式");
                        $("#headImage").attr("src", "");
                        return ;
                    }
                    if(width!=300||height!=300){
                        alert("图片尺寸不对，重新上传");
                        $("#headImage").attr("src", "");
                        return;
                    }

                    createImageLink();
                };
            };





        });

        $("#fileButton").change(function () {
            $("#filePath").html("");
            createFileLink();
        });

        $("#save").click(function () {
            var buyer =$.trim($("#buyer").val());
            var sort = $("#sort").val();
            var productId = $("#productId").val();
            var hasProduct = $("#hasProduct").val();
            var headImage = $("#headImage").attr("src");
            var document = $("#document").val();
            var filePath = "";
            var title = "";
            var status =  $("#status").html();

            if(status=="不在该门店销售"||status=="仅线下可售"||status=="不可售"){
                alert("有该门店不可售的商品");
                return;
            }
            if (!productId) {
                alert("请填写[商品ID]");
                return;
            }
            if (!hasProduct) {
                alert("该商品不存在");
                return;
            }
            if (!sort) {
                alert("请填写[位置]");
                return;
            }

            if (!buyer) {
                alert("请填写买手名称");
                return;
            }
//            if (!headImage){
//                alert("请选择图片或者生成链接");
//                return;
//            }

            if (!document){
                alert("请填写文案");
                return;
            }

            if ($("#isMore").prop("checked")){
                filePath = $("#filePath").text();
                title = $("#title").val();
                if (!filePath){
                    alert("请上传文件");
                    return ;
                }
                if (!title){
                    alert("请填写页面标题");
                    return ;
                }
            }

            <#if cmd=="save">
                var tip = $("#sortTip").text();
                if (tip) {
                    alert("该位置已有资源");
                    return;
                }
            </#if>
            var formerSort="";
            <#if cmd=="update">
                formerSort = $("#formerSort").val();
            </#if>

            var cmd = $("#cmd").val();
            var id = $("#id").val();
            var storeId = $("#storeId").val();
            var moduleId = $("#moduleId").val();
            var templateId = $("#templateId").val();

            var buyer = $("#buyer").val();
            var document = $("#document").val();
            /*var productId = $("#productId").val();*/
            var isMore = $("#isMore").prop("checked");
//            var filePath = $("#filePath").text();
            var headImage = $("#headImage").attr("src");


            $.get("/cms/page/recommendation/edit", {"cmd": cmd,
                "formerSort":formerSort,
                "sort": sort,
                "id": id,
                "storeId": storeId,
                "buyer": buyer,
                "moduleId": moduleId,
                "templateId": templateId,
                "headImage": headImage,
                "productId": productId,
                "document": document,
                "isMore": isMore,
                "title": title,
                "filePath": filePath}, function (data) {
                var str = "保存成功";
                if(!data) {
                    str = "保存失败";
                }
                alert(str);
                $.artDialog.close();
            });

        });

        $(".query").click(function () {
           var productId= $("#productId").val();
            var productIds = $("#productIds").val();
            var attr =  productIds.split(",");
            for(var i =0;i<attr.length;i++){
                if(productId==attr[i]&&productId!=""&&productId!=null){
                    alert("此模块以包含此商品");
                    $("#productId").val("");
                    $("#productImg").attr("src", "");
                    $("#productPrice").html("");
                    $("#productStock").html("");
                    $("#productTitle").html("");
                    $("#status").html("");
                    $("#productSubtitle").html("");
                    return;
                }
            }


            /*$("").text();*/
            $.get("/product/productInfo?storeId="+$("#storeId").val()+"&productId="+$("#productId").val(), {}, function (result) {
                if (result) {
                    $("#hasProduct").val($("#productId").val());
                    $("#productImg").attr("src", result.productImage);
                    $("#productPrice").html(result.price);
                    $("#productStock").html(result.stock);
                    $("#productTitle").html(result.productTitle);
                    $("#status").html(result.status);
                    $("#productsubtitle").html(result.productSubtitle);
                    if (result.status == "不在该门店销售") {
                        $("#tips").text("该门店无此商品");
                    } else {
                        $("#tips").text("");
                    }
                } else {
                    alert("无法找到该商品");
                    $("#hasProduct").val("");
                    $("#productImg").attr("src", "");
                    $("#productPrice").html("");
                    $("#productStock").html("");
                    $("#productTitle").html("");
                    $("#status").html("");
                    $("#productSubtitle").html("");
                }
            });
        });

        //生成图片链接
        function createImageLink() {
            var fileObj = document.getElementById("headImageButton").files[0]; // js 获取文件对象
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
                    $("#headImage").attr("src", result);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("error");
                }
            });
        };
        //生成文件链接
        function createFileLink() {

            var fileObj = document.getElementById("fileButton").files[0]; // js 获取文件对象
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
                    $("#filePath").text(result);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("error");
                    console.log(errorThrown);
                    console.log(textStatus);
                }
            });
        };
    });
</script>

</html>