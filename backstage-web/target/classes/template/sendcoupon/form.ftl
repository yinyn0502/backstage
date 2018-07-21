<html>
<head>
    <title>创建发券</title>
    <script src="/static/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <link href="/static/bootstrap/3.3.4/css_default/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <script src="/static/bootstrap/3.3.4/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="/static/awesome/4.4/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="/static/common/css/style.css?v=3.2.0" type="text/css" rel="stylesheet"/>

    <script type="text/javascript" src="/static/artDialog/jquery.artDialog.js?skin=green"></script>
    <script type="text/javascript" src="/static/artDialog/plugins/iframeTools.source.js"></script>
    <meta name="decorator" content="default"/>


    <script type="text/javascript">
        $(function () {
            $("#selectCoupon").click(function () {
                var selectedCouponValue = $("#couponActivityIds").val();
                $.artDialog.open("/sendcoupon/coupon/select?selectedCouponValue="+selectedCouponValue, {
                    title: "选择优惠券",
                    width: 800,
                    height: 600,
                    lock: true,
                    close: function () {
                        $("#selectedCoupon").text("");
                        var couponInfo = art.dialog.data('couponInfo'); // 读取子窗口返回的数据
                        if(couponInfo!=null){
                            var couponStr = couponInfo.toString();
                            var couponResStr = couponStr.substr(0,couponStr.length-1);
                            var couponSplit = couponResStr.toString().split(",");
                            var couponActivityIds = "";
                            for(var j=0;j<couponSplit.length;j++){
                                var newHtml ="<tr><td ><label id='couponId_"+j+"'>"+couponSplit[j]+"</label><button id='coupon_"+j+"' onclick='deleteCoupon("+j+")'>删除</button></td></tr>";
                                $("#selectedCoupon").append(newHtml);
                                var labelValue = $("#couponId_"+j).text();
                                var labelSplit = labelValue.split("_");

                                couponActivityIds = couponActivityIds+labelSplit[0]+","
                            }
                            var couponIdStr = couponActivityIds.substr(0,couponActivityIds.length-1);
                            $("#couponActivityIds").val(couponIdStr);
                        }else{
                            $("#couponActivityIds").val("");
                        }

                    }
                });
            });

            $("#file").change(function () {
                $("#filePath").html("");
                uploadExcelFile();
            });
            function uploadExcelFile() {
                var fileObj = document.getElementById("file").files[0]; // js 获取文件对象
                if (typeof (fileObj) == "undefined" || fileObj.size <= 0) {
                    alert("请选择文件");
                    return;
                }
                var formFile = new FormData();
                formFile.append("action", "/sendcoupon/uploadFile");
                formFile.append("myfile", fileObj); //加入文件对象
                var data = formFile;
                $.ajax({
                    url: "/sendcoupon/uploadFile",
                    data: data,
                    type: "post",
                    dataType: "json",
                    cache: false,
                    processData: false,
                    contentType: false,
                    success: function (result) {
                        var str = "上传成功";
                        if (result == "-1") {
                            str = "上传失败";
                        } else {
                            str = result;
                        }
                        $("#filePath").text(result);
                        $("#updateFilePath").remove();
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("上传error");
                        console.log(errorThrown);
                        console.log(textStatus);
                    }
                });
            }

            var str = "保存成功";
            $("#confirmButton").click(function () {
                var operateType = $("#operateType").val();
                var sendActivityId = $("#sendActivityId").val();
                var sendActivityName = $("#sendActivityName").val();
                var targetType = $("#targetType").val();
                var filePath = $("#filePath").text();
                var couponActivityIds = $("#couponActivityIds").val();
                if (!sendActivityName) {
                    alert("活动名字不能为空");
                    return;
                }
                if (!filePath) {
                    alert("请选择文件");
                    return;
                }
                if(!couponActivityIds) {
                    alert("请选择要发放的优惠券");
                    return;
                }
                $.get("/sendcoupon/addAndEdit?operateType=" + operateType
                        + "&sendActivityId=" + sendActivityId
                        + "&sendActivityName=" + sendActivityName
                        + "&targetType=" + targetType
                        + "&filePath=" + filePath
                        + "&couponActivityIds=" + couponActivityIds
                        , function (data) {
                    if (data=="0") {
                        $.artDialog.close();
                    } else {
                        alert(data);
                    }
                });

            })

            $("#cancelButton").click(function () {
                $.artDialog.close();
            })


        });



        function deleteCoupon(count) {
            var ss = $("#coupon_"+count).parent().parent();
            ss.remove();
        }

        function downLoadExcel(){
            var form = $("<form>");
            form.attr('style', 'display:none');
            form.attr('target', '');
            form.attr('method', 'post');
            form.attr('action', '/sendcoupon/downLoadTemplate');
            $('body').append(form);

            form.submit();
            form.remove();
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
            width: 80%;
            text-align: center;
            border-radius: 5px;
            border-top: 30px;
        }

        input, select {
            border: 1px solid #ccc;
            padding: 7px 0px;
            border-radius: 3px;
            padding-left: 5px;
        }

        tr {
            text-align: left;
        }

        .button {
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            padding: 10px 22px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 12px;
            border-radius: 7px;
        }

    </style>
</head>

<input hidden value="<#if operateType??>${operateType}</#if>" name="operateType" id="operateType"/>
<input hidden value="<#if sendCouponAttribute??><#if sendCouponAttribute.sendActivityId??>${sendCouponAttribute.sendActivityId}</#if></#if>" name="sendActivityId" id="sendActivityId"/>
<input style="display: none" value="<#if sendCouponAttribute??><#if sendCouponAttribute.selectedCouponIds??>${sendCouponAttribute.selectedCouponIds}</#if></#if>" name="couponActivityIds" id="couponActivityIds"/>

<body>
<table align="center">
    <thead>
    <tr>
        <td>
            <h1>创建发券活动</h1><br/>
        </td>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>
            <h1>基本信息*</h1>
            <hr/>
        </td>
    </tr>
    <tr>
        <td>
            <label>活动名称:</label>
            <input name="sendActivityName" id="sendActivityName" maxlength="15" <#if sendCouponAttribute??><#if sendCouponAttribute.sendActivityName??>value="${sendCouponAttribute.sendActivityName}"<#else>
                   value=""</#if></#if>/>
            <label>（内部备注，不超过15个字）</label>
        </td>
    </tr>
    <tr>
        <td><label>活动目标:</label>
            <select id="targetType" name="targetType">
                <option value="1" <#if sendCouponAttribute??><#if sendCouponAttribute.targetType??&&sendCouponAttribute.targetType==1>selected</#if></#if>>
                    拉新
                </option>
                <option value="2" <#if sendCouponAttribute??><#if sendCouponAttribute.targetType??&&sendCouponAttribute.targetType==2>selected</#if></#if>>
                    沉默激活
                </option>
                <option value="3" <#if sendCouponAttribute??><#if sendCouponAttribute.targetType??&&sendCouponAttribute.targetType==3>selected</#if></#if>>
                    下单奖励
                </option>
                <option value="4" <#if sendCouponAttribute??><#if sendCouponAttribute.targetType??&&sendCouponAttribute.targetType==4>selected</#if></#if>>
                    社群运营
                </option>
                <option value="5" <#if sendCouponAttribute??><#if sendCouponAttribute.targetType??&&sendCouponAttribute.targetType==5>selected</#if></#if>>
                    用户补偿
                </option>
                <option value="6" <#if sendCouponAttribute??><#if sendCouponAttribute.targetType??&&sendCouponAttribute.targetType==6>selected</#if></#if>>
                    品类推广
                </option>
                <option value="7" <#if sendCouponAttribute??><#if sendCouponAttribute.targetType??&&sendCouponAttribute.targetType==7>selected</#if></#if>>
                    目标用户促活
                </option>
                <option value="8" <#if sendCouponAttribute??><#if sendCouponAttribute.targetType??&&sendCouponAttribute.targetType==8>selected</#if></#if>>
                    第三方合作
                </option>
                <option value="9" <#if sendCouponAttribute??><#if sendCouponAttribute.targetType??&&sendCouponAttribute.targetType==9>selected</#if></#if>>
                    其他
                </option>
            </select>
        </td>
    </tr>
    <tr>
        <td colspan="1">
            <h1>添加目标用户*</h1>
            <hr/>
        </td>
    </tr>
    <tr>
        <td colspan="1">

        </td>
    </tr>
    <tr>
        <td>
            <input id="file" name="file" type="file"  />
            <label id="filePath" style="color: red" hidden><#if filePath??>${filePath}</#if></label>
            <#if operateType??><#if operateType=='update'>
                <a id="updateFilePath" href="/sendcoupon/downloadExcel?mobileText=<#if sendCouponAttribute??><#if sendCouponAttribute.mobileText??>${sendCouponAttribute.mobileText}<#else></#if></#if>">下载明细</a>

            </#if></#if>

            <button onclick="downLoadExcel()">下载模板</button>
        </td>
    </tr>
    <tr>
        <td colspan="1">
            <h1>绑定优惠券</h1>
            <hr/>
        </td>
    </tr>
    <tbody id="selectedCoupon">

        <#if activityList??>
            <#list activityList as item>
            <tr><td><label id="coupon_${item_index}">${item.activityId?c}_${item.activityName}</label>
                <button id="coupon_${item_index}" onclick="deleteCoupon(${item_index})">删除</button>
            </td>
                </tr>
            </#list>
        </#if>
    </tbody>

    <tr>
        <td>
            <button id="selectCoupon">选择优惠券</button>
        </td>
    </tr>

    <tr>
        <td align="right">
            <button id="cancelButton" class="button">取消</button>
            <button id="confirmButton" class="button">保存</button>
        </td>
    </tr>
    </tbody>
</table>
</body>
</html>

