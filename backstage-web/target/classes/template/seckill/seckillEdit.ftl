<html>
<head>
    <title>seckillDetail</title>

    <meta name="decorator" content="default"/>

    <script src="/static/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="/static/jqPaginator/jqPaginator.js" type="text/javascript"></script>
    <link href="/static/bootstrap/3.3.4/css_default/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="/static/bootstrap/3.3.4/js/bootstrap.min.js"  type="text/javascript"></script>
    <link href="/static/awesome/4.4/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/static/common/css/style.css?v=3.2.0" type="text/css" rel="stylesheet" />


    <script type="text/javascript" src="/static/artDialog/jquery.artDialog.js?skin=green"></script>
    <script type="text/javascript" src="/static/artDialog/plugins/iframeTools.source.js"></script>
    <!-- bootstrap-datetimepicker 时间控件 和语言包-->
    <script src="/static/bootstrap-datetimepicker/bootstrap-datetimepicker.js" charset="UTF-8"></script>
    <script src="/static/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
    <link href="/static/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">

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
        input, select {
            width: 200px;
            border-radius: 6px;
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
<#if cmd??>
<h1 align="center"><#if cmd=="add">添加秒杀<#else >编辑秒杀</#if></h1>
</#if>
<#if cmd??>
<input hidden value="${cmd}" name="cmd" id="cmd"/>
</#if>

<#if checkOutTime??>
<input hidden value="${checkOutTime}" name="checkOutTime" id="checkOutTime"/>
</#if>
<#if addSysTime??>
<input hidden value="${addSysTime?c}" name="addSysTime" id="addSysTime"/>
</#if>



<#if activityId??>
<input hidden value="${activityId?c}" name="activityId" id="activityId"/>
</#if>


    <div align="left" >
            <h2>场次信息</h2>
        <hr />
        <table>
            <tr>
                <td>
                    <label>门店:  </label>
                </td>
                <td align="left">
                    <select id="storeId">
                    <#if storeInfo??>
                        <option storeType="<#if storeType??>${storeType?c}</#if>" value="<#if storeId??>${storeId?c}</#if>"><#if storeName??>${storeName}<#else >请选择</#if></option>
                        <#list storeInfo as item>
                            <option storeType="<#if item.type??>${item.type?c}</#if>" value="<#if item.id??>${item.id}</#if>"><#if item.name??>${item.name}</#if></option>
                        </#list>
                    </#if>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <label>场次名称:  </label>
                </td>
                <td align="left">
                    <input type="text" id="seckillName" maxlength="15" value="<#if data??>${data.seckillName}</#if>"/>
                </td>
                <td>
                    &nbsp; <label>  不超过15个字  </label>
                </td>
            </tr>
            <tr>
                <td>
                    <label>开始时间:  </label>
                </td>
                <td>
                    <input hidden type="text" id="oldStartTime"   value="<#if data??>${data.startTime}</#if>"/>
                    <input style="max-width: 200px" type="text"  class="input-sm form-control " data-date-format="yyyy-mm-dd hh:ii:ss" id="startTime" name="startTime"  value="<#if data??>${data.startTime}</#if>"/>
                </td>
                <td>
                    <label>结束时间:  </label>
                </td>
                <td>
                    <input hidden type="text" id="oldEndTime"   value="<#if data??>${data.endTime}</#if>"/>
                     <input style="max-width: 200px" type="text"  class="input-sm form-control " data-date-format="yyyy-mm-dd hh:ii:ss" id="endTime" name="endTime"  value="<#if data??>${data.endTime}</#if>"/>
                </td>
            </tr>
        </table>

                <br>
            <h2>专题页配置</h2>
        <hr />
                <label>页面标题*   </label>
                <input type="text" maxlength="8" id="pageTitle" value="<#if data??>${data.pageTitle}</#if>"/>
                &nbsp; <label>  不超过8个字  </label>
                <br>
                <label>分享标题*   </label>
                <input type="text" maxlength="20" id="shareTitle" value="<#if data??>${data.shareTitle}</#if>"/>
                &nbsp; <label>  不超过20个字  </label>
                <br>
                <label>分享描述*   </label>
                <input type="text" maxlength="30" id="shareDescribe" value="<#if data??>${data.shareDescribe}</#if>"/>
                &nbsp; <label>  不超过30个字  </label>
                <br>
                <label>分享小图*  </label>
                <img id="shareImage" width="100px" src="<#if data??>${data.shareImage}</#if>"/>
                <input type="file" id="shareImageLoad"/> &nbsp; <label>  375*375 不超过200k  </label>
                 <br>
                <label>banner图片*  </label>
                <img id="bannerImage" width="300px" src="<#if data??>${data.bannerImage}</#if>"/>
                <input type="file" id="bannerImageLoad"/>&nbsp; <label>  750*190 不超过200k  </label>
                <br>
            <h2>配置商品</h2>
        <hr />
        <button id="addProduct">新增商品</button>
    </div>

    <table align="center" id="table" border="1px"  class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footer">
        <tr>
            <th class="number">序号</th>
            <th>商品ID</th>
            <th>商品名称</th>
            <th>当前售卖状态</th>
            <th>当前可售库存</th>
            <th>正常售价</th>
            <th>活动售价</th>
            <th>活动库存</th>
            <th>每人限购数</th>
            <th>专题页排序</th>
            <th>操作</th>
        </tr>
        <#if data??>
            <#list data.seckillActivityDTOList as item>
                <tr class="count" id="tr_${item_index}">
                    <td class="number">${item_index+1}</td>
                    <td class="productId"><#if item.productId??>${item.productId?c}</#if></td>
                    <td class="productName"><#if item.productName??>${item.productName}</#if></td>
                    <td class="saleStatus"><#if item.saleStatus??>${item.saleStatus}</#if></td>
                    <td class="salesInventory" id="salesInventory_${item_index+1}"><#if item.salesInventory??>${item.salesInventory?c}</#if></td>
                    <td class="salePrice" id="salePrice_${item_index+1}"><#if item.salePrice??>${item.salePrice?c}</#if></td>
                    <td >
                        <input style="width: 50px" onchange="comparePrice(${item_index+1})" id="activityPrice_${item_index+1}" class="activityPrice"  value="<#if item.activityPrice??>${item.activityPrice?c}</#if>"/>
                    </td>
                    <td>
                        <input type="text" oninput="this.value=this.value.replace(/[^\.\d]/g,'');this.value=this.value.replace('.','');" style="width: 50px"  onchange="compareInventory(${item_index+1})" id="activityInventory_${item_index+1}" class="activityInventory" value="<#if item.activityInventory??>${item.activityInventory?c}</#if>"/>
                    </td>
                    <td>
                        <input type="text"  oninput="this.value=this.value.replace(/[^\.\d]/g,'');this.value=this.value.replace('.','');" style="width: 50px"   class="limitCount" value="<#if item.limitCount??>${item.limitCount}</#if>"/>
                    </td>
                    <td><input type="text" oninput="this.value=this.value.replace(/[^\.\d]/g,'');this.value=this.value.replace('.','');" style="width: 50px" id="subjectSort_${item_index+1}" onchange="sortCheckout(${item_index+1})"  placeholder="正整数,非必填" class="sort" value="<#if item.sort??><#if item.sort==999><#else >${item.sort}</#if></#if>"/></td>
                    <td>
                        <input type="button" style='width: 50px' value='删除'  id="deleteProduct_${item_index}" onclick="deleteProduct(${item_index})"/>
                    </td>
                </tr>
            </#list>
        </#if>

    </table>

<button id="save">保存并提交审核</button>&nbsp&nbsp

<script>


    //校验专题页位置不能大于50
    function sortCheckout(index) {
        var subjectSort = document.getElementById("subjectSort_"+index).value;
        if (subjectSort>50){
            alert("专题页位置不能大于50");
            document.getElementById("subjectSort_"+index).value="";
            return;
        }
    }

    //删除商品
    function deleteProduct(index) {
        $("#tr_"+index).remove();
    }

    //分享图上传
    $("#shareImageLoad").change(function () {
        var imgFile = document.getElementById("shareImageLoad").files[0];
        var imagSize = document.getElementById("shareImageLoad").files[0].size;
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
                var imagePath= $("#shareImageLoad").val();
                var extStart=imagePath.lastIndexOf(".");
                var ext=imagePath.substring(extStart,imagePath.length).toUpperCase();
                if(ext!=".PNG"&&ext!=".JPG"){
                    alert("图片限于png,jpg格式");
                    $("#shareImage").attr("src", "");
                    return ;
                }

                if (width != 375 || height != 375) {
                    alert("图片尺寸不对，重新上传");
                    $("#shareImage").attr("src", "");
                    return;
                }
                if(imagSize>1024*200){
                    alert("图片太大了，重新上传(200kb以内)");
                    $("#shareImage").attr("src", "");
                    return;
                }

                createImageLink("shareImageLoad","shareImage");
            };
        };

    });

    //banner图上传
    $("#bannerImageLoad").change(function () {
        var imgFile = document.getElementById("bannerImageLoad").files[0];
        var imagSize = document.getElementById("bannerImageLoad").files[0].size;

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
                var imagePath= $("#bannerImageLoad").val();
                var extStart=imagePath.lastIndexOf(".");
                var ext=imagePath.substring(extStart,imagePath.length).toUpperCase();
                if(ext!=".PNG"&&ext!=".JPG"){
                    alert("图片限于png,jpg格式");
                    $("#bannerImage").attr("src", "");
                    return ;
                }

                if (width != 750 || height != 190) {
                    alert("图片尺寸不对，重新上传");
                    $("#bannerImage").attr("src", "");
                    return;
                }
                if(imagSize>1024*200){
                    alert("图片太大了，重新上传(200kb以内)");
                    $("#bannerImage").attr("src", "");
                    return;
                }

                createImageLink("bannerImageLoad","bannerImage");
            };
        };

    });

    function createImageLink(val,img) {
        var fileObj = document.getElementById(val).files[0]; // js 获取文件对象
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
                var str = "上传成功";
                if (result == "") {
                    str = "上传失败";
                    alert(str);
                } else {
                    $("#"+img).attr("src", result);
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("error");
            }
        });
    };



    //保存
    $("#save").click(function () {
        var cmd = $("#cmd").val();
        var oldStartTime = "";
        var oldEndTime = "";
        if (cmd == "edit"){
            oldStartTime = $("#oldStartTime").val();
            oldEndTime = $("#oldEndTime").val();
        }


        var activityId = $("#activityId").val();
        if(typeof (activityId) == "undefined"){
            activityId="-1";
        }
        var storeName =  $("#storeId").find("option:selected").text();
        //activity信息
        var storeId = $.trim($("#storeId").val());
        if (!storeId){
            alert("请选择门店");
            return;
        }

        var seckillName = $.trim($("#seckillName").val());
        if (!seckillName){
            alert("活动名字不能为空");
            return;
        }

        var startTime = $("#startTime").val();
        if (!startTime){
            alert("开始时间不能为空");
            return;
        }
        var endTime = $("#endTime").val();
        if (!endTime){
            alert("结束时间不能为空");
            return;
        }

        var startTimed =new Date(startTime).getTime();
        var endTimed =new Date(endTime).getTime();

        if (startTimed > endTimed){
            alert("开始时间不能大于结束时间嗷");
            return;
        }
        var addSysTime = $("#addSysTime").val();
        var date =new Date(startTime).getTime();
        //获取系统当前时间
        var nowDate =new Date();
        var nowtime = nowDate.getTime() + parseInt(addSysTime);
        var checkOutTime = $("#checkOutTime").val();

        if(date < nowtime){
            alert("请把秒杀时间设置在当前时间的 "+checkOutTime+"之后");
            return;
        }




        //物料信息
        var shareDescribe = $.trim($("#shareDescribe").val());

        if (!shareDescribe){
            alert("分享描述不能为空");
            return;
        }
        var shareTitle = $.trim($("#shareTitle").val());
        if (!shareTitle){
            alert("分享标题不能为空");
            return;
        }
        var pageTitle = $.trim($("#pageTitle").val());
        if (!pageTitle){
            alert("页面标题不能为空");
            return;
        }
        var shareImage = $("#shareImage").attr("src");
        if (!shareImage){
            alert("分享图不能为空");
            return;
        }
        var bannerImage = $("#bannerImage").attr("src");
        if (!bannerImage){
            alert("banner图不能为空");
            return;
        }
       var productCount =  $(".count").size();
        if(productCount <= 0 ){
            alert("商品不能为空呀");
            return;
        }
        //商品信息
        var pd = $(".productId");
        var productId = pd.size();
        var pn = $(".productName");
        var ss = $(".saleStatus");
        var si =$(".salesInventory");
        var sp = $(".salePrice");
        //input
        var ap = $(".activityPrice");
        var ai = $(".activityInventory");
        var lc = $(".limitCount");
        var s = $(".sort");

        var count = productId;

        var productIds="" ,
        productNames="" ,
        saleStatuss ="",
        salesInventorys="" ,
        salePrices ="",
        activityPrices ="",
        activityInventorys="" ,
        limitCounts ="",
        sorts ="";

        for (var i = 0; i < productId; i++){
            if (!$.trim($(ap[i]).val())) {
                alert("检查下活动价,不能为空嗷");
                return;
            }
            if (!$.trim($(ai[i]).val())) {
                alert("检查下活动库存,不能为空嗷");
                return;
            }
            if (!$.trim($(lc[i]).val())) {
                alert("检查下限购数量,不能为空嗷");
                return;
            }
            if (productIds.indexOf($.trim($(pd[i]).html())) == -1){
                productIds += $.trim($(pd[i]).html())+",";
            } else {
                alert("商品重复，请检查");
                return;
            }



            productNames += $.trim($(pn[i]).html())+",";
            saleStatuss += $.trim($(ss[i]).html())+",";
            salesInventorys += $.trim($(si[i]).html())+",";
            salePrices += $.trim($(sp[i]).html())+",";

            activityPrices+= $.trim($(ap[i]).val())+",";
            activityInventorys+= $.trim($(ai[i]).val())+",";
            limitCounts+= $.trim($(lc[i]).val())+",";

            if($.trim($(s[i]).val())==""||$.trim($(s[i]).val())==null){
                sorts += "isNull"+",";
            }else{
                for(var con = 0 ; con < s.size(); con++ ){
                    if(con!=i){
                        if ($.trim($(s[con]).val()) == $.trim($(s[i]).val())){
                            alert("专题页顺序重复了，请检查");
                            return;
                        }
                    }

                }
                sorts += $.trim($(s[i]).val())+",";
            }


        }

        var countSize = $(".count").size();
        if(countSize > 50){
            alert("商品最多50个,多出"+(countSize - 50)+"个商品");
            return;
        }



        var url = "/seckill/addOrEditSeckill";

        $.post(url, {
            "cmd" : cmd,
            "storeName" : storeName,
            "count" : count,
            "activityId" : activityId,
            "storeId" : storeId,
            "seckillName" : seckillName,
            "startTime" : startTime,
            "endTime" : endTime,
            "shareDescribe" : shareDescribe,
            "shareTitle" : shareTitle,
            "pageTitle" : pageTitle,
            "shareImage" : shareImage,
            "bannerImage" : bannerImage,
            "productIds" : productIds,
            "productNames" : productNames,
            "saleStatuss" : saleStatuss,
            "salesInventorys" : salesInventorys,
            "salePrices" : salePrices,
            "activityPrices" : activityPrices,
            "activityInventorys" : activityInventorys,
            "limitCounts" : limitCounts,
            "sorts" : sorts,
            "oldStartTime" : oldStartTime,
            "oldEndTime" : oldEndTime
        }, function (data) {
            if (data == 1) {
                alert("保存成功");
                $.artDialog.close();
            }
            if(data == 2){
                alert("保存失败");
                $.artDialog.close();
            }
            if(data == 3){
                alert("保存失败,该活动已经审核通过了");
                $.artDialog.close();
            }
            if(data == 4){
                alert("时间重叠,请检查");
            }
            if(data == 5){
                alert("保存失败,请找开发人员解决.");
                $.artDialog.close();
            }

        });

    });


    function comparePrice(index) {
      var salePrice =$("#salePrice_"+index).text();
      var activityPrice =  $.trim($("#activityPrice_"+index).val());
      if (parseFloat(activityPrice) > parseFloat(salePrice)){
          alert("活动价格不能比原价大");
          $("#activityPrice_"+index).val("");
          return;
      }

    }
    function compareInventory(index) {
      var salesInventory =   $("#salesInventory_"+index).text();
      var activityInventory = $.trim($("#activityInventory_"+index).val());
      var storeType = $("#storeId").find("option:selected").attr("storeType");

      if (parseInt(activityInventory) == 0) {
          alert("活动库存不能为0");
          $("#activityInventory_"+index).val("");
          return;
      }
    }



    $("#addProduct").click(function () {
            var storeId =  $("#storeId").val();
            var productCount ;
            if(!storeId||storeId==""){
                alert("请选择门店");
                return;
            }
            var storeName =  $("#storeId").find("option:selected").text();
            var number= $(".number");
            var count = number.size();

            if ($(number[count-1]).html()=="序号"){
                productCount = 0;
            }else {
                productCount = $(number[count-1]).html();
            }
            $.artDialog.open("/seckill/edit/toAddProductPage?storeId="+storeId+"&storeName="+storeName+"&productCount="+productCount, {
                title : "选择商品",
                width : 800,
                height : 600,
                lock : true,
                cancelVal: "取消",
                close: function () {
//                    art.dialog.open.origin.location.href="/seckill/list";
                    var productIds = art.dialog.data('productIds'); // 商品id集合
                    var productCount = art.dialog.data('productCount'); // 商品数

                    $.get("/seckill/edit/queryProduct?productIds=" + productIds + "&storeId=" + storeId, function (result) {
                        var val = "";

                        for (var i = 0; i < result.length; i++) {
                            var g = productCount+i+1;
                            val+= "<tr class='count' id='tr_"+g+"'>";
                            val+= "<td class='number'>"+g+"</td>";
                            val+= "<td class='productId'>"+result[i].productId+"</td>";
                            val+= "<td class='productName'>"+result[i].productName+"</td>";
                            val+= "<td class='saleStatus'>"+result[i].saleStatus+"</td>";
                            val+= "<td class='salesInventory' id='salesInventory_"+g+"'>"+result[i].salesInventory+"</td>";
                            val+= "<td class='salePrice' id='salePrice_"+g+"'>"+result[i].salePrice+"</td>";

                            val+= "<td>";
                            val+= "<input type='text' style='width: 50px' onchange='comparePrice("+g+")'  class='activityPrice' id='activityPrice_"+g+"' />";
                            val+= "</td>";
                            val+= "<td>";
                            val+= "<input type='text' oninput='this.value=this.value.replace(/[^\\.\\d]/g,\"\");this.value=this.value.replace(\".\",\"\");' style='width: 50px' onchange='compareInventory("+g+")' class='activityInventory' id='activityInventory_"+g+"' />";
                            val+= "</td>";
                            val+= "<td>";
                            val+= "<input type='text' oninput='this.value=this.value.replace(/[^\\.\\d]/g,\"\");this.value=this.value.replace(\".\",\"\");'  style='width: 50px' class='limitCount' />";
                            val+= "</td>";
                            val+= "<td>";
                            val+= "<input type='text' oninput='this.value=this.value.replace(/[^\\.\\d]/g,\"\");this.value=this.value.replace(\".\",\"\");' style='width: 50px' placeholder='正整数,非必填' id='subjectSort_"+g+"' onchange='sortCheckout("+g+")' class='sort'/>";
                            val+="</td>";
                            val+= "<td>";
                            val+= "<input type='button' style='width: 50px' value='删除' id='deleteProduct_"+g+"' onclick='deleteProduct("+g+")'/>";
                            val+= "</td>";
                            val+= "</tr>";
                        }
                        $("#table").append(val);
                    });
                }
            });
        });

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

</html>