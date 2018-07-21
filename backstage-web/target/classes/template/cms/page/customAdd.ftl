<html>
<head>
    <title>自定义活动</title>

    <meta name="decorator" content="default"/>

    <script src="/static/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <link href="/static/bootstrap/3.3.4/css_default/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="/static/bootstrap/3.3.4/js/bootstrap.min.js"  type="text/javascript"></script>
    <link href="/static/awesome/4.4/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/static/common/css/style.css?v=3.2.0" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="/static/artDialog/jquery.artDialog.js?skin=green"></script>
    <script type="text/javascript" src="/static/artDialog/plugins/iframeTools.source.js"></script>
    <style>
        .edit {
            background-color: #D8D8D8; /* Green */
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

<h1 align="center">自定义活动</h1>

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


<table align="center" style="padding: 10px">
    <tbody>
        <tr>
            <td>
                <label>图片:</label>
            </td>
            <td>
                <img id="image" src="<#if image??>${image}</#if>" width="300px">
                <input type="file" id="imageButton"/>
            </td>
            <#--<td>-->
                <#--<button id="uploadImage" class="edit">生成链接</button>-->
            <#--</td>-->
            <#--<td>-->
                <#--<label style="color: red;">(图片格式要求: 像素：1080*230 px<>大小：不超过100K)</label>-->
            <#--</td>-->
        </tr>
        <tr>
            <td>
                <label>页面文件:</label>
            </td>
            <td>
                <label id="filePath" style="color: forestgreen"><#if filePath??>${filePath}</#if></label>
                <input type="file" id="fileButton"/>
            </td>
            <#--<td>-->
                <#--<button id="uploadFile" class="edit">生成链接</button>-->
            <#--</td>-->
            <#--<td>-->
                <#--<label style="color: red;">文件格式要求:</label>-->
            <#--</td>-->
        </tr>
        <tr>
            <td>
                <label>页面标题:</label>
            </td>
            <td>
                <input id="title" value="<#if title??>${title}</#if>"/>
            </td>
        </tr>
        <tr>
            <td>
                <div style="height: 30px"></div>
            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td>
                <button class="edit" id="save">保存</button>
            </td>
        </tr>
    </tbody>
</table>

<script>



    $(function () {

        $("#save").click(function () {
            var id = $("#id").val();
            var cmd = $("#cmd").val();
            var image = $("#image").attr("src");
            if (!image){
                alert("请选择图片");
                return;
            }


            var templateId = $("#templateId").val();
            var moduleId = $("#moduleId").val();
            var filePath = $("#filePath").text();
            if(!filePath){
                alert("请选择文件");
                return;
            }
            var title =$.trim($("#title").val());
            if(!title){
                alert("请填写页面标题");
                return;
            }
            $.get("/cms/page/custom/edit?cmd="+cmd+"&id="+id+"&storeId=<#if storeId??>${storeId?c}</#if>"
                    + "&templateId=" + templateId
                    + "&filePath=" + filePath
                    + "&image=" + image
                    + "&moduleId=" + moduleId
                    + "&title=" + title, function (data) {
                var str = "保存成功";
                if (!data) {
                    str = "保存失败";
                }
                alert(str);
                $.artDialog.close();
            });
        });

        $("#imageButton").change(function () {
            var imgFile = document.getElementById("imageButton").files[0];

            var reader = new FileReader();
            reader.readAsDataURL(imgFile);
            reader.onload = function(theFile) {
                var image = new Image();
                image.src = theFile.target.result;
                image.onload = function() {

                    var imagePath= $("#imageButton").val();
                    var extStart=imagePath.lastIndexOf(".");
                    var ext=imagePath.substring(extStart,imagePath.length).toUpperCase();
                    if(ext!=".PNG"&&ext!=".JPG"&&ext!=".JPEG"){
                        alert("图片限于png,jpeg,jpg格式");
                        $("#image").attr("src","");
                        return ;
                    }

                    $("#image").attr("src","");
                    createImageLink();
                };
            };





        });
        $("#fileButton").change(function () {
            $("#filePath").html("");
            createFileLink();
        });


        //创建图片链接
        function createImageLink() {
            var fileObj = document.getElementById("imageButton").files[0]; // js 获取文件对象
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
                    $("#image").attr("src", result);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("error");
                }
            });
        };
    //创建文件链接
        function createFileLink() {
            var fileObj = document.getElementById("fileButton").files[0]; // js 获取文件对象
            if (typeof (fileObj) == "undefined" || fileObj.size <= 0) {
                alert("请选择图片");
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