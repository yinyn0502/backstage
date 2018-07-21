<html>
<head>
    <title>角色管理</title>

    <meta name="decorator" content="default"/>


<#include "../../ahead.ftl">
<#include "../../treeview.ftl" >
<#include "../../treetable.ftl" >

    <!--引入js  -->
<#--<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>-->
    <!--引入bootstrap -->

    <script src="/static/fileinput/js/fileinput.js" type="text/javascript"></script>
    <script src="/static/fileinput/js/locales/zh.js" type="text/javascript"></script>

    <link href="/static/fileinput/css/fileinput.css" rel="stylesheet">
    <link href="/static/bootstrap/3.3.4/css_default/bootstrap-theme.css" rel="stylesheet">


    <script type="text/javascript">
        var validateForm;
        function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
            if(validateForm.form()){
                loading('正在提交，请稍等...');
                $("#inputForm").submit();
                closeTip();
                return true;
            }

            return false;
        }

        $("#myFile").fileinput({
            language : 'zh',
            uploadUrl : "/cmsinfo/uplode/photo",
            autoReplace : true,
            maxFileCount : 1,
            allowedFileExtensions : [ "jpg", "png", "gif" ],
            browseClass : "btn", //按钮样式
            previewFileIcon : "<i class='glyphicon glyphicon-king'></i>"
        }).on("fileuploaded", function(e, data) {
            var res = data.response;
            alert(res.success);
            $("#logo").attr("value", res.success);
        })





    </script>

    <script type="text/javascript">
        $(".myfile").fileinput({
            //上传的地址
            uploadUrl:"/cmsinfo/uploadFile",
            uploadAsync : true, //默认异步上传
            showUpload : false, //是否显示上传按钮,跟随文本框的那个
            showRemove : false, //显示移除按钮,跟随文本框的那个
            showCaption : true,//是否显示标题,就是那个文本框
            showPreview : true, //是否显示预览,不写默认为true
            dropZoneEnabled : false,//是否显示拖拽区域，默认不写为true，但是会占用很大区域
            //minImageWidth: 50, //图片的最小宽度
            //minImageHeight: 50,//图片的最小高度
            //maxImageWidth: 1000,//图片的最大宽度
            //maxImageHeight: 1000,//图片的最大高度
            //maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
            //minFileCount: 0,
            maxFileCount : 1, //表示允许同时上传的最大文件个数
            enctype : 'multipart/form-data',
            validateInitialCount : true,
            previewFileIcon : "<i class='glyphicon glyphicon-king'></i>",
            msgFilesTooMany : "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
            allowedFileTypes : [ 'image' ],//配置允许文件上传的类型
            allowedPreviewTypes : [ 'image' ],//配置所有的被预览文件类型
            allowedPreviewMimeTypes : [ 'jpg', 'png', 'gif' ],//控制被预览的所有mime类型
            language : 'zh'
        })
        //异步上传返回结果处理
        $('.myfile').on('fileerror', function(event, data, msg) {
            console.log("fileerror");
            console.log(data);
        });
        //异步上传返回结果处理
        $(".myfile").on("fileuploaded", function(event, data, previewId, index) {
            console.log("fileuploaded");
            var ref = $(this).attr("data-ref");
            $("input[name='" + ref + "']").val(data.response.url);

        });

        //同步上传错误处理
        $('.myfile').on('filebatchuploaderror', function(event, data, msg) {
            console.log("filebatchuploaderror");
            console.log(data);
        });

        //同步上传返回结果处理
        $(".myfile").on("filebatchuploadsuccess",
                function(event, data, previewId, index) {
                    console.log("filebatchuploadsuccess");
                    console.log(data);
                });

        //上传前
        $('.myfile').on('filepreupload', function(event, data, previewId, index) {
            console.log("filepreupload");
        });
    </script>
</head>
<body class="hideScroll">

<#--   <input name="id" type="hidden" <#if bean.moduleId??>value="${bean.moduleId}"</#if>/>-->
<#if message??>${message}</#if>
<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
    <tbody>
    <#if bean.resourceInfoDTOS??>
        <#list bean.resourceInfoDTOS as r>
        <tr>
            <td class="width-15 active"><label class="pull-right">位置${r.sort}:</label></td>
            <td class="width-35">

                <#if r.imageValue??>
                    <img src="${r.imageValue}" width="100px" height="100px">
                </#if>

            <#-- <div class="form-group">
                <label for="" class="col-sm-2 control-label">个人头像</label>
                <div class="col-sm-10">
                    <input id="myFile" type="file" name="myFile" class="fileloading">
                </div>
                <input type="hidden" name="user.logo" id="logo">
            </div>
           <div class="form-group">
                <label for="" class="col-sm-2 control-label">个人头像</label>
                <div class="col-sm-10">
                    <input id="myFile" type="file" name="myFile" class="fileloading">
                </div>
                <input type="hidden" name="user.logo" id="logo">
            </div>-->

            <#--<div class="container kv-main">
                <div class="page-header">
                    <h1>Bootstrap File Input Example
                        <small><a href="https://github.com/kartik-v/bootstrap-fileinput-samples"><i
                                class="glyphicon glyphicon-download"></i> Download Sample Files</a></small>
                    </h1>
                </div>
                <form enctype="multipart/form-data" action="/cmsinfo/uploadFile">
                    <div class="file-loading">
                        <input id="kv-explorer" type="file" multiple>
                    </div>
                    <br>
                    <div class="file-loading">
                        <input id="file-0a" class="file" type="file" multiple data-min-file-count="1">
                    </div>
                    <br>
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button type="reset" class="btn btn-default">Reset</button>
                </form>
                <hr>


            </div>-->


                <form class="form-horizontal" role="form" method="post"
                      action="/cmsinfo/uploadFile" enctype="multipart/form-data">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">名称</label>
                        <div class="col-sm-10">
                            <input type="text" name="describ" class="col-sm-10 form-control"
                                   placeholder="菜谱名称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">封面</label>
                        <div class="col-sm-10">
                            <input type="file" name="myfile" data-ref="url2" class="file"
                                   value="" multiple /> <input type="hidden"
                                                               name="url2" value="">
                        </div>
                    </div>
                </form>

            </td>

        </tr>
        </#list>
    </#if>

    </tbody>
</table>


</body>
</html>