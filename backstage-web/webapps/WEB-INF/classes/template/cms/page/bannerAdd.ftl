<html>
<head>
    <title>banner添加</title>

    <meta name="decorator" content="default"/>

    <script src="/static/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <link href="/static/bootstrap/3.3.4/css_default/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <script src="/static/bootstrap/3.3.4/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="/static/awesome/4.4/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="/static/common/css/style.css?v=3.2.0" type="text/css" rel="stylesheet"/>

    <script type="text/javascript" src="/static/artDialog/jquery.artDialog.js?skin=green"></script>
    <script type="text/javascript" src="/static/artDialog/plugins/iframeTools.source.js"></script>
</head>
<h1 align="center">banner</h1>


<input hidden value="<#if moduleTypeId??>${moduleTypeId?c}</#if>" name="moduleTypeId" id="moduleTypeId"/>


<input hidden value="<#if moduleId??>${moduleId?c}</#if>" name="moduleId" id="moduleId"/>


<input hidden value="<#if templateId??>${templateId?c}</#if>" name="templateId" id="templateId"/>


<input hidden value="<#if storeId??>${storeId?c}</#if>" name="storeId" id="storeId"/>


<input hidden value="<#if cmd??>${cmd}</#if>" name="cmd" id="cmd"/>


<input hidden value="<#if id??>${id?c}</#if>" name="id" id="id"/>


    <table align="center">
        <tr>
            <td>
                <label>位置:</label>
            </td>
            <td>
                <input <#if cmd=="update">disabled</#if> id="sort" type="number" value="<#if sort??>${sort}</#if>"></input><label id="sortTip" style="color: red"></label>
                <script>
                    $("#sort").change(function () {
                        $.get("/cms/page/verifyLocation?templateId=<#if templateId??>${templateId?c}</#if>&moduleId=<#if moduleId??>${moduleId?c}</#if>&sort=" + $("#sort").val(), function (data) {
                            if (data) {
                                $("#sortTip").text("该位置已有资源!");
                            } else {
                                $("#sortTip").text("");
                            }
                        });
                    });
                </script>
            </td>
        </tr>
        <tr>
            <tr>
                <td>
                    <label>图片:</label>
                </td>
                <td>
                    <img id="imageUrl" src="<#if imageUrl??>${imageUrl}</#if>" href="test" width="200px">
                </td>
                <td>
                    <input id="imageUpload"  name="image" type="file" value="上传图片"/>
                </td>
                <td>
                    <label style="color: red">(图片格式要求: 像素：750*320 )</label>
                </td>
            </tr>
        </tr>


        <tr>
            <td width="100px">
                <label >请选择页面文件生成链接:</label>
                <input  id="one" <#if targetType??&&targetType==1>checked="checked"</#if>  type="radio" name="banner" />
            </td>
        </tr>
        <tr>
            <td>
                <label>页面文件:</label>
            </td>
            <td>
                <label id="filePath" style="color: red"> <#if targetType??&&targetType==1&&filePath??>${filePath}</#if></label>
            </td>
            <td>
                <input id="file" name="file" type="file"  />
            </td>
        </tr>
        <tr>
            <td>
                <label>页面标题:</label>
            </td>
            <td>
                <input id="title" type="text" name="file" value="<#if targetType??&&targetType==1&&title??>${title}</#if>"/>
            </td>
        </tr>




        <tr>
            <td width="100px">
                <label >自定义网页链接:</label>
                <input id="two"  <#if targetType??&&targetType==2>checked="checked"</#if>  type="radio" name="banner" />
            </td>
        </tr>
        <tr>
            <td>
                <label>链接地址:</label>
            </td>
            <td>
                <input id="twoFile" name="file" type="text" value="<#if targetType??&&targetType==2&&filePath??>${filePath}</#if>" />
            </td>
        </tr>
        <tr>
            <td>
                <label>页面标题:</label>
            </td>
            <td>
                <input id="twoTitle" type="text" name="file" value="<#if targetType??&&targetType==2&&title??>${title}</#if>"/>
            </td>
        </tr>



        <tr>
            <td width="100px">
                <label >App商品详情页:</label>
                <input id="three" <#if targetType??&&targetType==3>checked="checked"</#if>  type="radio" name="banner" />
            </td>
        </tr>
        <tr>
            <td>
                <label>商品id:</label>
            </td>
            <td>
                <input id="productText" name="file" type="text" value="<#if targetType??&&targetType==3&&filePath??>${filePath}</#if>" />
                <script>
                    $(function () {
                        var checked = $("#three").attr("checked");
                        if (checked){
                            var filePath = $("#productText").val() ;
                            var filepaths = filePath.split("=");
                            $("#productText").val(filepaths[1]);
                        }
                    });
                </script>

            </td>
        </tr>



        <tr>
            <td width="100px">
                <label >App分类商品列表页:</label>
                <input id="four"   <#if targetType??&&targetType==4>checked="checked"</#if> type="radio" name="banner" />
            </td>
        </tr>
        <tr>
            <td>
                <label>分类id:</label>
            </td>
            <td>
                <input id="categoryText" name="file" type="text" value="<#if targetType??&&targetType==4&&filePath??>${filePath}</#if>" />
                <script>
                    $(function () {
                        var checked = $("#four").attr("checked");
                        if (checked){
                           var filePath = $("#categoryText").val() ;
                           var filepaths = filePath.split("=");
                            $("#categoryText").val(filepaths[1]);
                        }
                    });
                </script>
            </td>
        </tr>



        <tr>
            <td width="100px">
                <label >指定App页面:</label>
                <input  id="five" <#if targetType??&&targetType==5>checked="checked"</#if> type="radio" name="banner" />
            </td>
        </tr>
        <tr>
            <td>
                <label>页面地址:</label>
            </td>
            <td>
                <input id="fiveFile" name="file" type="text" value="<#if targetType??&&targetType==5&&filePath??>${filePath}</#if>" />
            </td>
        </tr>




        <tr>
            <td></td>
            <td></td>
            <td>
                <button id="save">保存</button>
            </td>
        </tr>
    </table>
<script>
    $(function () {
        $("#one").click(function () {
            $("#one").attr('checked',true);
            $("#two").attr('checked',false);
            $("#three").attr('checked',false);
            $("#four").attr('checked',false);
            $("#five").attr('checked',false);
        });
        $("#two").click(function () {
            $("#one").attr('checked',false);
            $("#two").attr('checked',true);
            $("#three").attr('checked',false);
            $("#four").attr('checked',false);
            $("#five").attr('checked',false);
        });
        $("#three").click(function () {
            $("#one").attr('checked',false);
            $("#two").attr('checked',false);
            $("#three").attr('checked',true);
            $("#four").attr('checked',false);
            $("#five").attr('checked',false);
        });
        $("#four").click(function () {
            $("#one").attr('checked',false);
            $("#two").attr('checked',false);
            $("#three").attr('checked',false);
            $("#four").attr('checked',true);
            $("#five").attr('checked',false);
        });
        $("#five").click(function () {
            $("#one").attr('checked',false);
            $("#two").attr('checked',false);
            $("#three").attr('checked',false);
            $("#four").attr('checked',false);
            $("#five").attr('checked',true);
        });


        $("#imageUpload").change(function () {
            var imgFile = document.getElementById("imageUpload").files[0];
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
                   var imagePath= $("#imageUpload").val();
                    var extStart=imagePath.lastIndexOf(".");
                    var ext=imagePath.substring(extStart,imagePath.length).toUpperCase();
                    if(ext!=".PNG"&&ext!=".JPG"&&ext!=".JPEG"){
                        alert("图片限于png,jpeg,jpg格式");
                        $("#imageUrl").attr("src", "");
                        return ;
                    }

                        if (width != 750 || height != 320) {
                            alert("图片尺寸不对，重新上传");
                            $("#imageUrl").attr("src", "");
                            return;
                        }
                    createImageLink();
                };
            };

        });


        //选择页面资源
        $("#file").change(function () {
            $("#filePath").html("");
            createFileLink();
        });



        $("#save").click(function () {

            var sort = $("#sort").val();
            if (!sort) {
                alert("请填写[位置]");
                return;
            }


            var imageUrl = $("#imageUrl").attr("src");

            if (!imageUrl) {
                alert("请选择图片或者生成链接");
                return;
            }

            var filePath = "";
            var title = "";
            var targetType="";

            if($("#one").attr('checked')){
                targetType = 1;
                filePath = $("#filePath").html();
                if (filePath=="") {
                    alert("请填写页面文件或者生成链接");
                    return;
                }
                title = $("#title").val();
                if (!title) {
                    alert("请填写页面标题");
                    return;
                }
            }
            if($("#two").attr('checked')){
                targetType = 2;
                filePath = $("#twoFile").val();
                if (filePath=="") {
                    alert("请填写链接地址");
                    return;
                }
                title = $("#twoTitle").val();
                if (!title) {
                    alert("请填写页面标题");
                    return;
                }


            }
            if($("#three").attr('checked')){
                targetType = 3;
                filePath = $("#productText").val();
                if (filePath=="") {
                    alert("请填写商品id");
                    return;
                }
                filePath = "ueater://productdetailspage?productID="+filePath;
            }
            if($("#four").attr('checked')){
                targetType = 4;
                filePath = $("#categoryText").val();
                if (filePath=="") {
                    alert("请填写分类id");
                    return;
                }
                filePath="ueater://categorypage?categoryID="+filePath;
            }
            if($("#five").attr('checked')){
                targetType = 5;
                filePath = $("#fiveFile").val();
                if (filePath=="") {
                    alert("请填写页面地址");
                    return;
                }
            }

            <#if cmd=="save">
                var tip = $("#sortTip").text();
                if (tip) {
                    alert("该位置已有资源");
                    return;
                }
            </#if>

            var cmd = $("#cmd").val();

            if (!sort || sort < 1) {
                alert("请填写位置!!");
                return;
            }

            var imageUrl = $("#imageUrl").attr("src");
            var id = $("#id").val();
            var moduleId = $("#moduleId").val();
            var storeId = $("#storeId").val();
            var templateId = $("#templateId").val();
            var str = "保存成功";
            $.get("/cms/page/banner/edit?cmd=" + cmd
                    + "&sort=" + sort
                    + "&title=" + title
                    + "&imageUrl=" + imageUrl
                    + "&filePath=" + filePath
                    + "&moduleId=" + moduleId
                    + "&storeId=" + storeId
                    + "&templateId=" + templateId+"&targetType="+targetType
                    + "&id=" + id, function (data) {
                if (!data) {
                    str = "保存失败";
                }
                alert(str);
                $.artDialog.close();
            });
        });
        //生成链接
        function createImageLink() {
            var fileObj = document.getElementById("imageUpload").files[0]; // js 获取文件对象
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
                    $("#imageUrl").attr("src", result);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("error");
                }
            });
        };

        function createFileLink() {

            var fileObj = document.getElementById("file").files[0]; // js 获取文件对象
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