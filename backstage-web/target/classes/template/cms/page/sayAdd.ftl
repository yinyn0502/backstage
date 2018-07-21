<html>
<head>
    <title>eat说</title>

    <meta name="decorator" content="default"/>

    <script src="/static/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <link href="/static/bootstrap/3.3.4/css_default/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="/static/bootstrap/3.3.4/js/bootstrap.min.js"  type="text/javascript"></script>
    <link href="/static/awesome/4.4/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/static/common/css/style.css?v=3.2.0" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="/static/artDialog/jquery.artDialog.js?skin=green"></script>
    <script type="text/javascript" src="/static/artDialog/plugins/iframeTools.source.js"></script>

    <!-- bootstrap-datetimepicker 时间控件 和语言包-->
    <script src="/static/bootstrap-datetimepicker/bootstrap-datetimepicker.js"  charset="UTF-8"></script>
    <script src="/static/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
    <link href="/static/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>

<h1 align="center">eat说</h1>

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

<table style="padding: 20px" align="center">
    <thead style="border-bottom: 1px">
    <tr>
        <td >
            <label style="width: 100px">一共8个位置</label>
        </td>
    </tr>
    <tr>

            <label style="color: red">(图片格式要求: 1 5 8位置像素：(334*334) 2 4 7位置像素：(334*252)  3 6位置像素：(334*448)   大小：不超过100K)</label>

    </tr>
    <#if cmsSayVOS??>
        <#list cmsSayVOS as item>

        <tr>
            <td>
                <input type="hidden"  value="<#if item.id??>${item.id?c}</#if>"  id="id_${item_index}"/>
            </td>
            <td>
                <label><#if item.sort??>${item.sort+1}</#if></label>
            </td>
        </tr>

        <tr>
            <td>
                <label>图片:</label>
            </td>
            <td>
                <img id="imageUrl_${item_index}"  src="<#if item.imagePath??>${item.imagePath}</#if>" href="test" width="200px"/>
            </td>
            <td>
                <input id="imageUpload_${item_index}" onchange="imageChange(${item_index})" name="image_${item_index}" type="file" value="上传图片"/>
            </td>

        </tr>

        <tr>
            <td>
                <label style="width: 100px">页面文件:</label>
            </td>
            <td>
                <label id="filePath_${item_index}" style="color: red"><#if item.filePath??>${item.filePath}</#if></label>
            </td>
            <td>
                <input id="file_${item_index}" name="file_${item_index}" type="file" onchange="fileChange(${item_index})" />
            </td>
        </tr>

        <tr>
            <td>
                <label style="width: 100px">页面标题:</label>
            </td>
            <td>
                <input maxlength="50" id="title_${item_index}" value="<#if item.title??>${item.title}</#if>"/>
            </td>
        </tr
        </#list>
    </#if>
    <tr>
        <td colspan="4">
            <button id="save" class="button">保存</button>
        </td>
    </tr>
</table>

<script>

    function imageChange(index) {
        var imagSize = document.getElementById("imageUpload_" + index).files[0].size;
        var imgFile = document.getElementById("imageUpload_" + index).files[0];

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

                var imagePath =$("#imageUpload_"+index).val();
                var extStart=imagePath.lastIndexOf(".");
                var ext=imagePath.substring(extStart,imagePath.length).toUpperCase();
                if(ext!=".PNG"&&ext!=".JPG"&&ext!=".JPEG"){
                    alert("图片限于png,jpeg,jpg格式");
                    $("#imageUrl_" + index).attr("src", "");
                    return ;
                }


                if (index == 0 || index == 4 || index == 7) {
                    if (width != 334 || height != 334) {
                        alert("图片尺寸不对，重新上传");
                        $("#imageUrl_" + index).attr("src", "");
                        return;
                    }
                }
                if (index == 1 || index == 3 || index == 6) {
                    if (width != 334 || height != 252) {
                        alert("图片尺寸不对，重新上传");
                        $("#imageUrl_" + index).attr("src", "");
                        return;
                    }
                }
                if (index == 2 || index == 5 ) {
                    if (width != 334 || height != 448) {
                        alert("图片尺寸不对，重新上传");
                        $("#imageUrl_" + index).attr("src", "");
                        return;
                    }
                }

                if(imagSize>1024*100){
                    alert("图片太大了，重新上传(100kb以内)");
                    $("#imageUrl_" + index).attr("src", "");
                    return;
                }

                $("#imageUrl_" + index).attr("src", "");
                createImageLink(index);
            };
        };


    }
    function fileChange(index) {
        $("#filePath_"+index).html("");
        createFileLink(index);
    }

    function createImageLink(index) {

        var fileObj = document.getElementById("imageUpload_"+index).files[0]; // js 获取文件对象
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
                $("#imageUrl_" + index).attr("src", result);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("error");
            }
        });
    };

    function createFileLink(index) {

        var fileObj = document.getElementById("file_"+index).files[0]; // js 获取文件对象
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
                $("#filePath_" + index).text(result);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("error");
                console.log(errorThrown);
                console.log(textStatus);
            }
        });
    };
    $(function () {

        $("#save").click(function () {
            var imagePaths = "";
            var filePaths = "";
            var titles = "";
            var ids = "";
            for (var i = 0;i<8;i++){
                var imagePath = $("#imageUrl_"+i).attr("src");
                var filePath = $("#filePath_"+i).html();
                var title = $.trim($("#title_"+i).val());
                var id = $("#id_"+i).val();
                if (!imagePath||!filePath||!title||!id){
                    alert("请检查下，有没填写的");
                    return;
                }
                imagePaths = imagePaths+imagePath+",";
                filePaths = filePaths+filePath+",";
                titles =titles +title+",";
                ids = ids+id+",";

            }

            var storeId = $("#storeId").val();
            var moduleId = $("#moduleId").val();
            var templateId = $("#templateId").val();


            $.get("/cms/page/say/edit?cmd=update"
                    + "&ids=" + ids
                    + "&storeId=" + storeId
                    + "&moduleId=" + moduleId
                    + "&imagePaths=" + imagePaths
                    + "&templateId=" + templateId
                    + "&filePaths=" + filePaths
                    + "&titles=" + titles
                    , function (data) {
                var str = "保存成功";
                if (!data) {
                    str = "保存失败";
                }
                alert(str);
                $.artDialog.close();
            });
        });
    });
</script>

</html>