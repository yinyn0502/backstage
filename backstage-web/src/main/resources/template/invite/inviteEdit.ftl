<html>
<head>
    <title>邀请活动编辑</title>

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
<h1 align="center"><#if cmd=="add">新增邀请活动<#else >编辑邀请活动</#if></h1>
</#if>
<#if cmd??>
<input hidden value="${cmd}" name="cmd" id="cmd"/>
</#if>
<#if activityId??>
<input hidden value="${activityId?c}" name="activityId" id="activityId"/>
</#if>
<#if activityStatus??>
<input hidden value="${activityStatus}" name="activityId" id="activityStatus"/>
</#if>

    <div align="left" >
            <h2>基本信息</h2>
        <hr />
       <div>
        <table>
            <tr>
                <td>
                    <label>门店:  </label>
                </td>
                <td align="left">
                    <select id="storeId" onchange="storeChange()" <#if activityStatus??&&(activityStatus=="进行中"||activityStatus=="审核通过")>disabled</#if>>
                    <#if storeInfo??>
                        <option  value="<#if data??&&data.storeId??>${data.storeId?c}</#if>"><#if data??&&data.storeName??>${data.storeName}<#else >请选择</#if></option>
                        <#list storeInfo as item>
                            <option storeType="<#if item.type??>${item.type?c}</#if>" value="<#if item.id??>${item.id}</#if>"><#if item.name??>${item.name}</#if></option>
                        </#list>
                    </#if>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <label>活动名称:  </label>
                </td>
                <td align="left">
                    <input type="text" <#if activityStatus??&&(activityStatus=="进行中"||activityStatus=="审核通过")>disabled</#if> id="activityName" maxlength="15" value="<#if data??>${data.activityName}</#if>" />
                </td>
                <td>
                    &nbsp; <label>  不超过15个字 ,用户可见 </label>
                </td>
            </tr>
            <tr>
                <td>
                    <label>开始时间:  </label>
                </td>
                <td>
                    <input <#if activityStatus??&&(activityStatus=="进行中"||activityStatus=="审核通过")>disabled</#if> style="max-width: 200px" type="text"  class="input-sm form-control " data-date-format="yyyy-mm-dd hh:ii:ss" id="startTime" name="startTime"  value="<#if data??&&data.activityStartTimeStr??>${data.activityStartTimeStr}</#if>" onchange="timeChange()"/>
                </td>
                <td>
                    <label>结束时间:  </label>
                </td>
                <td>
                     <input <#if activityStatus??&&(activityStatus=="进行中"||activityStatus=="审核通过")>disabled</#if> style="max-width: 200px" type="text"  class="input-sm form-control " data-date-format="yyyy-mm-dd hh:ii:ss" id="endTime" name="endTime"  value="<#if data??&&data.activityEndTimeStr??>${data.activityEndTimeStr}</#if>" onchange="timeChange()"/>
                </td>
            </tr>
        </table>
       </div>
        <br>
            <h2>规则配置</h2>
            <label>老用户返券规则</label>

    <div>
            <label>阶梯1 必填  </label> <br>
            邀请
            <input type="text" disabled="disabled"  id="oneMiniMum" value="1" />
            &nbsp;
            至
             <input type="text" oninput="this.value=this.value.replace(/[^\.\d]/g,'');this.value=this.value.replace('.','');" onchange="oneLadder()" <#if activityStatus??&&(activityStatus=="进行中"||activityStatus=="审核通过")>disabled</#if>  id="oneMaxMum" value="<#if activityRule1??&&activityRule1.awardQualificationCeil??>${activityRule1.awardQualificationCeil}</#if>" />
                &nbsp;
                人,不填写表示上不封顶
                <br>
                <table style="border: 1px" id="oneTable">
                   <thead>
                    <tr>
                        <th>活动id</th>
                        <th>优惠券信息</th>
                    </tr>
                   </thead>
                    <tbody id="oneBody">
                        <#if activityRule1??&&activityRule1.couponTOList??>
                        <tr>
                            <td rowspan="${activityRule1.couponTOList?size}">
                                <label id="oneJiaZhi" hidden><#if activityRule1.awardBenefitValue??>${activityRule1.awardBenefitValue?c}</#if></label>
                                <label id="oneId"><#if activityRule1.awardBenefitId??>${activityRule1.awardBenefitId?c}</#if></label>
                            </td>
                                <#list activityRule1.couponTOList as item>
                                    <td><#if item.couponId??>${item.couponId?c}</#if> - <#if item.couponName??>${item.couponName}</#if></td>
                                </#list>
                        </tr>
                        </#if>
                    </tbody>
                </table>
                <br>
                <input type="button" onclick="oneClick()" <#if activityStatus??&&(activityStatus=="进行中"||activityStatus=="审核通过")>disabled</#if> id="oneCoupon" value="选择领券活动"/>

    </div>
        <br>
    <div>
            <label>阶梯2</label>

            <input type="checkbox" onchange="twoCkChange()" <#if activityRule2??&&activityRule2.awardQualificationFloor??>checked</#if> <#if activityStatus??&&(activityStatus=="进行中"||activityStatus=="审核通过")>disabled</#if> id="twoCk"/>勾选后启用

            <br>
            邀请
            <input type="text" value="<#if activityRule2??&&activityRule2.awardQualificationFloor??>${activityRule2.awardQualificationFloor}<#elseif activityRule1??&&activityRule1.awardQualificationCeil??>${activityRule1.awardQualificationCeil+1}</#if>"  id="twoMiniMum" disabled="disabled" />
            &nbsp;
            至
            <input type="text" onchange="twoLadder()" <#if activityStatus??&&(activityStatus=="进行中"||activityStatus=="审核通过")>disabled</#if> oninput="this.value=this.value.replace(/[^\.\d]/g,'');this.value=this.value.replace('.','');" id="twoMaxMum" value="<#if activityRule2??&&activityRule2.awardQualificationCeil??>${activityRule2.awardQualificationCeil}</#if>" disabled="disabled"/>
            &nbsp;
            人,不填写表示上不封顶
            <br>
            <table style="border: 1px" id="twoTable">
                <thead>
                <tr>
                    <th>活动id</th>
                    <th>优惠券信息</th>
                </tr>
                </thead>
                <tbody id="twoBody">
                <#if activityRule2??&&activityRule2.couponTOList??>
                <tr>
                <td rowspan="${activityRule2.couponTOList?size}">
                    <label id="twoJiaZhi" hidden><#if activityRule2.awardBenefitValue??>${activityRule2.awardBenefitValue?c}</#if></label>
                    <label id="twoId">${activityRule2.awardBenefitId?c}</label>
                </td>
                    <#list activityRule2.couponTOList as item>
                        <td><#if item.couponId??>${item.couponId?c}</#if> - <#if item.couponName??>${item.couponName}</#if></td>
                    </#list>
                </tr>
                </#if>
                </tbody>

            </table>
            <br>
            <input type="button" onclick="twoClick()" <#if activityStatus??&&(activityStatus=="进行中"||activityStatus=="审核通过")>disabled</#if> id="twoCoupon" value="选择领券活动" disabled="disabled"/>

    </div>
        <br>
    <div>
            <label>阶梯3 </label>

            <input type="checkbox" onchange="threeCkChange()" <#if activityRule3??&&activityRule3.awardQualificationFloor??>checked</#if> <#if activityStatus??&&(activityStatus=="进行中"||activityStatus=="审核通过")>disabled</#if> id="threeCk" />勾选后启用
            <br>
            邀请
            <input type="text" value="<#if activityRule3??&&activityRule3.awardQualificationFloor??>${activityRule3.awardQualificationFloor}<#elseif activityRule2??&&activityRule2.awardQualificationCeil??>${activityRule2.awardQualificationCeil+1}</#if>"  id="threeMiniMum" disabled="disabled"  />
            &nbsp;
            至
            <input type="text" onchange="threeLadder()" <#if activityStatus??&&(activityStatus=="进行中"||activityStatus=="审核通过")>disabled</#if> oninput="this.value=this.value.replace(/[^\.\d]/g,'');this.value=this.value.replace('.','');"  id="threeMaxMum" value="<#if activityRule3??&&activityRule3.awardQualificationCeil??>${activityRule3.awardQualificationCeil}</#if> " disabled="disabled"/>
            &nbsp;
            人,不填写表示上不封顶
            <br>
            <table style="border: 1px" id="threeTable">
                <thead>
                <tr>
                    <th>活动id</th>
                    <th>优惠券信息</th>
                </tr>
                </thead>
                <tbody id="threeBody">
                <#if activityRule3??&&activityRule3.couponTOList??>
                <tr>
                    <td rowspan="${activityRule3.couponTOList?size}">
                        <label id="threeJiaZhi" hidden><#if activityRule3.awardBenefitValue??>${activityRule3.awardBenefitValue?c}</#if></label>
                        <label id="threeId">${activityRule3.awardBenefitId?c}</label>
                    </td>
                    <#list activityRule3.couponTOList as item>
                        <td><#if item.couponId??>${item.couponId?c}</#if> - <#if item.couponName??>${item.couponName}</#if></td>
                    </#list>
                </tr>
                </#if>
                </tbody>
            </table>
            <br>
            <input type="button" onclick="threeClick()" <#if activityStatus??&&(activityStatus=="进行中"||activityStatus=="审核通过")>disabled</#if> id="threeCoupon" value="选择领券活动" disabled="disabled"/>

    </div>

        <br>
    <div>
            <label>新用户规则 </label>
            <br>
            <input type="checkbox" disabled id="newUser"  checked="checked"/> 新人大礼包 &nbsp;&nbsp;&nbsp;必选,如果门店未配置新人大礼包则不返
            <br>
            <input type="checkbox" <#if data??&&data.newUserBenefitId??>checked</#if> <#if activityStatus??&&(activityStatus=="进行中"||activityStatus=="审核通过")>disabled</#if> id="newCk" onchange="newCkChange()"/> 邀请专享券
            &nbsp;&nbsp;&nbsp;选填,除新人大礼包外,通过邀请注册的新用户可以获得
            <br>
            <table style="border: 1px" id="newTable">
                <thead>
                <tr>
                    <th>活动id</th>
                    <th>优惠券信息</th>
                </tr>
                </thead>
                <tbody id="newBody">
                <#if data??&&data.couponTOList??>

                    <tr>
                        <td rowspan="${data.couponTOList?size}">
                            <label id="newJiaZhi" hidden><#if data.newUserAwardValue??>${data.newUserAwardValue?c}</#if></label>
                            <label id="newId"><#if data.newUserBenefitId??>${data.newUserBenefitId?c}</#if></label>
                        </td>
                    <#list data.couponTOList as item>
                        <td><#if item.couponId??>${item.couponId?c}</#if> - <#if item.couponName??>${item.couponName}</#if></td>
                    </#list>
                    </tr>

                </#if>
                </tbody>
            </table>
            <br>
            <input type="button" onclick="newClick()" id="newCoupon" <#if activityStatus??&&(activityStatus=="进行中"||activityStatus=="审核通过")>disabled</#if> value="选择邀请专享券" disabled="disabled"/>
            <br>
            <label>活动规则说明*(规则按条需换行填写)</label><br>
            <textarea id="activityRule"  <#if activityStatus??&&(activityStatus=="进行中"||activityStatus=="审核通过")>disabled</#if> style="width: 600px;height: 300px" ><#if data??&&data.activityIntroduce??>${data.activityIntroduce}</#if></textarea>

    </div>
        <br>
<#if activityMaterialInfo??>
    <div>
            <h2>老用户邀请页面配置 </h2>
            <br>
            <label>分享标题*   </label>
            <input type="text" maxlength="15" <#if activityStatus??&&(activityStatus=="进行中"||activityStatus=="审核通过")>disabled</#if>  id="shareTitle" value="<#if activityMaterialInfo??&&activityMaterialInfo.shareTitle??>${activityMaterialInfo.shareTitle}</#if>" />
            <label>限制15字</label>
            &nbsp;
            <br>
            <label>分享描述*   </label>
            <input type="text" maxlength="30" <#if activityStatus??&&(activityStatus=="进行中"||activityStatus=="审核通过")>disabled</#if> value="<#if activityMaterialInfo??&&activityMaterialInfo.shareDescription??>${activityMaterialInfo.shareDescription}</#if>" id="shareDescribe" />
            <label>限制30字</label>
            &nbsp;
            <br>
            <label>分享小图*  </label>
            <img id="shareImage" width="100px" src="<#if activityMaterialInfo??&&activityMaterialInfo.shareImageURL??>${activityMaterialInfo.shareImageURL}</#if>"/>
            <input type="file" id="shareImageLoad" <#if activityStatus??&&(activityStatus=="进行中"||activityStatus=="审核通过")>disabled</#if>/> &nbsp;
            <label>图片大小 375 * 375</label>

    </div>
    <br>
    <div>
        <h2>新用户注册页面配置 </h2>
        <br>
        <input type="button" id="addProduct" value="选择商品"/> 选填,请添加偶数个商品<br>
        <label>人气商品展示 : </label><br>
        <table border="1px" id="table">
           <thead>
            <tr>
                <th>商品id和名字</th>
                <th>操作</th>
           </tr>
           </thead>
            <tbody id="productBody">
            <#if activityMaterialInfo??&&activityMaterialInfo.recommendProductInfos??>
                <#list activityMaterialInfo.recommendProductInfos as item>
                <tr class="count" id="tr_${item_index}">
                    <td>
                    <label class="productId" id="productId_${item_index}"><#if item.productId??>${item.productId?c}</#if></label>
                        -
                    <label><#if item.productName??> ${item.productName}</#if></label>

                    </td>
                    <td><input type="button" id="delete_${item_index}" onclick="deleteProduct(${item_index})" value="删除"/></td>
                </tr>
                </#list>
            </#if>
            </tbody>
        </table>

    </div>
<#else >
    <div>
        <h2>老用户邀请页面配置 </h2>
        <br>
        <label>分享标题*   </label>
        <input type="text" maxlength="15"  id="shareTitle"  />
        <label>限制15字</label>
        &nbsp;
        <br>
        <label>分享描述*   </label>
        <input type="text" maxlength="30"  id="shareDescribe" />
        <label>限制30字</label>
        &nbsp;
        <br>
        <label>分享小图*  </label>
        <img id="shareImage" width="100px" />
        <input type="file" id="shareImageLoad"/> &nbsp;
        <label>图片大小 375 * 375</label>

    </div>
    <br>
    <div>
        <h2>新用户注册页面配置 </h2>
        <br>
        <input type="button" id="addProduct" value="选择商品"/> 选填,请添加偶数个商品<br>
        <label>人气商品展示 : </label><br>
        <table border="1px" id="table">
           <thead>
            <tr>
                <th>商品id和名字</th>
                <th>操作</th>
            </tr>
           </thead>
            <tbody id="productBody">

            </tbody>
        </table>

    </div>
</#if>

    </div>


<button id="save">保存并提交审核</button>

<script>

    function storeChange() {
        $("#oneMaxMum").val("");
        $("#twoMiniMum").val("");
        $("#twoMaxMum").val("");
        $("#threeMaxMum").val("");
        $("#threeMiniMum").val("");

        $("#oneBody").html("");
        $("#twoBody").html("");
        $("#threeBody").html("");
        $("#newBody").html("");
        $("#productBody").html("");


        var twoCk = document.getElementById("twoCk");
        var threeCk = document.getElementById("threeCk");
        var newCk = document.getElementById("newCk");
        twoCk.checked=false;
        threeCk.checked=false;
        newCk.checked=false;
    }

    function timeChange() {
        $("#oneMaxMum").val("");
        $("#twoMiniMum").val("");
        $("#twoMaxMum").val("");
        $("#threeMaxMum").val("");
        $("#threeMiniMum").val("");

        $("#oneBody").html("");
        $("#twoBody").html("");
        $("#threeBody").html("");
        $("#newBody").html("");

        var twoCk = document.getElementById("twoCk");
        var threeCk = document.getElementById("threeCk");
        var newCk = document.getElementById("newCk");
        twoCk.checked=false;
        threeCk.checked=false;
        newCk.checked=false;
    }
    //保存
    $("#save").click(function () {
        var cmd = $("#cmd").val();
        var storeId = $.trim($("#storeId").val());
        if (!storeId){
            alert("请选择门店");
            return;
        }

        var activityName = $.trim($("#activityName").val());
        if (!activityName){
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
        //判断时间
        var startTimed =new Date($("#startTime").val()).getTime();
        var endTimed =new Date($("#endTime").val()).getTime();
        var nowDate =new Date();
        var nowTime = nowDate.getTime();

        if(cmd == "add"){
            if (nowTime > startTimed){
                alert("请把活动时间设置在当前时间之后");
                return;
            }
            if (startTimed > endTimed){
                alert("开始时间不能大于结束时间嗷");
                return;
            }
        }

        var oneMaxMum = $.trim($("#oneMaxMum").val());
        var oneMiniMum = $.trim($("#oneMiniMum").val());
        var oneId = $.trim($("#oneId").text());
        var oneJiaZhi=$.trim($("#oneJiaZhi").text());
        var activityStatus = $("#activityStatus").val();
        var twoMaxMum = "";
        var twoMiniMum = "";
        var twoId = "";
        var twoJiaZhi = "";

        var threeMaxMum = "";
        var threeMiniMum = "";
        var threeId = "";
        var threeJiaZhi = "";

        var newId = "";
        var newJiaZhi = "";

        var twoCk = document.getElementById("twoCk");
        var threeCk = document.getElementById("threeCk");
        var newCk = document.getElementById("newCk");

        if(!oneId){
            alert("请选择1阶梯奖励领券活动!");
            return;
        }
        if(oneMaxMum){
            if (parseInt(oneMaxMum) < parseInt(oneMiniMum)){
                alert("1阶梯上线不能小于下线");
                return;
            }
        }
        if (twoCk.checked){
            twoMaxMum = $.trim($("#twoMaxMum").val());
            twoMiniMum = $.trim($("#twoMiniMum").val());
            twoId = $.trim($("#twoId").text());
            twoJiaZhi = $.trim($("#twoJiaZhi").text());

            if(twoMaxMum){
                if (parseInt(twoMaxMum) < parseInt(twoMiniMum)){
                    alert("2阶梯上线不能小于下线");
                    return;
                }
            }
            if(!twoId){
                alert("请选择2阶梯奖励领券活动!");
                return;;
            }
        }
        if (threeCk.checked){
            threeMaxMum = $.trim($("#threeMaxMum").val());
            threeMiniMum = $.trim($("#threeMiniMum").val());
            threeId = $.trim($("#threeId").text());
            threeJiaZhi = $.trim($("#threeJiaZhi").text());

            if(threeMaxMum){
                if (parseInt(threeMaxMum) < parseInt(threeMiniMum)){
                    alert("3阶梯上线不能小于下线");
                    return;
                }
            }
            if(!threeId){
                alert("请选择3阶梯奖励领券活动!");
                return;
            }
        }
        if (newCk.checked){
            newId =$.trim($("#newId").text());
            newJiaZhi = $.trim($("#newJiaZhi").text());
        }
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
        var shareImage = $("#shareImage").attr("src");
        if (!shareImage){
            alert("分享图不能为空");
            return;
        }

        var activityRule = $("#activityRule").val();
        if(activityRule!=null){
            activityRule = activityRule.replace(/\n|\r\n/g,"<br/>");
        }
        activityRule = $.trim(activityRule);
        if (!activityRule){
            alert("活动规则不能为空");
            return;
        }
        var productIds = "";
        var count = $(".productId");
        if(count.size() >= 0 && count.size() <= 20){
            if(parseInt(count.size()) % 2 != 0 ){
                alert("商品要是偶数个,请重新选择");
                return;
            }
          for(var i = 0 ;i < count.size() ; i++){
                if (productIds.indexOf($.trim($(count[i]).html())) != -1){
                    //alert(productIds);
                    alert("商品重复");
                    return;
                }
              productIds+=$.trim($(count[i]).html())+",";
          }
          //alert(productIds);
        }else {
            alert("商品最多20");
            return;
        }
        /*var twoMaxMum = "";
        var twoMiniMum = "";
        var twoId = "";
        var twoJiaZhi = "";

        var threeMaxMum = "";
        var threeMiniMum = "";
        var threeId = "";
        var threeJiaZhi = "";

        var newId = "";
        var newJiaZhi = "";*/

        var url = "/invite/addOrEditInvite";
        $.post(url, {
            "cmd" : cmd,
            "activityStatus" : activityStatus,
            "activityId" : $("#activityId").val(),
            "activityName":activityName,
            "storeId" : storeId,
            "startTime" : Number(startTimed),//Long类型
            "endTime" : Number(endTimed),//Long类型
            "shareDescribe" : shareDescribe,
            "shareTitle" : shareTitle,
            "shareImage" : shareImage,
            "productIds" : productIds,
            "oneMaxMum":Number(oneMaxMum),
            "oneMiniMum":Number(oneMiniMum),
            "oneId":Number(oneId),
            "oneJiaZhi":oneJiaZhi,
            "twoMaxMum":Number(twoMaxMum),
            "twoMiniMum":Number(twoMiniMum),
            "twoId":Number(twoId),
            "twoJiaZhi":twoJiaZhi,
            "threeMaxMum":Number(threeMaxMum),
            "threeMiniMum":Number(threeMiniMum),
            "threeId":Number(threeId),
            "threeJiaZhi":threeJiaZhi,
            "newId":Number(newId),
            "newJiaZhi":newJiaZhi,
            "activityRule":activityRule
        }, function (data) {
            if (data){
                if (data.code == 1){
                    alert("成功");
                    $.artDialog.close();
                }
                if (data.code == 2){
                    if(data.message!=null&&data.message!=''&&data.message!=undefined){
                        alert(data.message);
                    }else{
                        alert("失败");
                    }

                }

            }else {
                alert("请求服务器失败,找开发人员");
            }

        });



    });

    //去添加商品页面
    $("#addProduct").click(function () {
        var storeId =  $("#storeId").val();
        var productCount =$(".count").size();
        if(!storeId||storeId==""){
            alert("请选择门店");
            return;
        }
        var storeName =  $("#storeId").find("option:selected").text();

        $.artDialog.open("/invite/edit/toAddProductPage?storeId="+storeId+"&storeName="+storeName+"&productCount="+productCount, {
            title : "选择商品",
            width : 800,
            height : 600,
            lock : true,
            cancelVal: "取消",
            close: function () {
                var productIds = art.dialog.data('productIds'); // 商品id集合
                var productCount = art.dialog.data('productCount'); // 商品数


                $.get("/invite/edit/queryProduct?productIds=" + productIds + "&storeId=" + storeId, function (result) {
                    var val = "";

                    for (var i = 0; i < result.length; i++) {
                        var g = productCount+i+1;
                        val+="<tr class='count' id='tr_"+g+"'>";
                        val+="<td id='productId_"+g+"'><label class='productId' id='productId_"+g+"'>"+result[i].productId+"</label>-<label>"+result[i].productName+"</label></td>";
                        val+="<td><input type='button' id='delete_"+g+"' onclick='deleteProduct("+g+")' value='删除'/></td>";
                        val+="</tr>";
                    }
                    $("#productBody").append(val);
                });
            }
        });
    });

    //删除商品
    function deleteProduct(index) {
        $("#tr_"+index).remove();
    }

    function oneLadder() {
      var oneMaxMum = $.trim($("#oneMaxMum").val());
      if (oneMaxMum){
          if (parseInt(oneMaxMum) >= 1){
              $("#twoMiniMum").val(parseInt(oneMaxMum) + 1);
              var twoCk = document.getElementById("twoCk");
              var threeCk = document.getElementById("threeCk");
              twoCk.disabled=false;
              threeCk.disabled=false;
          }else {
              alert("上线不能小于下线");
              $("#oneMaxMum").val("");
          }
      }else {
          var twoCk = document.getElementById("twoCk");
          var threeCk = document.getElementById("threeCk");
          $("#twoMaxMum").val("");
          $("#twoMiniMum").val("");
          $("#threeMaxMum").val("");
          $("#threeMiniMum").val("");
          twoCk.checked=false;
          threeCk.checked=false;
          twoCk.disabled=true;
          threeCk.disabled=true;
      }
    }
    function twoLadder() {
        var twoMaxMum = $.trim($("#twoMaxMum").val());
        var twoMiniMum = $.trim($("#twoMiniMum").val());

        if(!twoMiniMum){
            alert("下线为空呢");
            $("#twoMaxMum").val("");
        }

        if (twoMaxMum){
            if (parseInt(twoMaxMum) >= parseInt(twoMiniMum)) {
                $("#threeMiniMum").val(parseInt(twoMaxMum) + 1);
                var threeCk = document.getElementById("threeCk");
                threeCk.disabled=false;
            }else {
                alert("上线不能小于下线");
                $("#twoMaxMum").val("");
            }
        }else {
            var threeCk = document.getElementById("threeCk");
            $("#threeMaxMum").val("");
            $("#threeMiniMum").val("");
            threeCk.checked=false;
            threeCk.disabled=true;
        }

    }
    function threeLadder() {
        var threeMaxMum = $.trim($("#threeMaxMum").val());
        var threeMiniMum = $.trim($("#threeMiniMum").val());
        if(!threeMiniMum){
            alert("下线为空呢");
            $("#threeMaxMum").val("");
        }

        if (threeMaxMum && parseInt(threeMaxMum) < parseInt(threeMiniMum)){
            alert("上线不能为空并且不能小于下线");
            $("#threeMaxMum").val("");
        }

    }


    function twoCkChange() {
       var twoCk = document.getElementById("twoCk");
       if (twoCk.checked){
           var oneMaxMum = $.trim($("#oneMaxMum").val());
           if (!oneMaxMum){
               alert("1阶梯是无限制的");
               twoCk.checked = false;
           }else {
               $("#twoMaxMum").removeAttr("disabled");
               $("#twoCoupon").removeAttr("disabled");
           }
       }else {
           $("#twoMaxMum").attr("disabled","disabled");
           $("#twoCoupon").attr("disabled","disabled");
           $("#twoBody").html("");
       }




    }


    function newCkChange() {
        var newCk = document.getElementById("newCk");
        if (!newCk.checked){
            $("#newCoupon").attr("disabled","disabled");
            $("#newBody").html("");
            }else {
            $("#newCoupon").removeAttr("disabled");
        }
    }


    function threeCkChange() {
        var threeCk = document.getElementById("threeCk");
        if (threeCk.checked){
            var twoMaxMum = $.trim($("#twoMaxMum").val());
            if (!twoMaxMum){
                alert("2阶梯是无限制的");
                threeCk.checked = false;
            }else {
                $("#threeMaxMum").removeAttr("disabled");
                $("#threeCoupon").removeAttr("disabled");
            }
        }else {
            $("#threeMaxMum").attr("disabled","disabled");
            $("#threeCoupon").attr("disabled","disabled");
            $("#threeBody").html("");
        }
    }


    function oneClick() {
        appCoupon("oneBody");
    }
    function twoClick() {
        appCoupon("twoBody");
    }
    function threeClick() {
        appCoupon("threeBody");
    }
    function newClick() {
        appCoupon("newBody");
    }

    function appCoupon(str) {


        var storeId =  $("#storeId").val();
        if(!storeId||storeId==""){
            alert("请选择门店");
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
        //判断时间
        var startTimed =new Date($("#startTime").val()).getTime();
        var endTimed =new Date($("#endTime").val()).getTime();







        $.artDialog.open("/invite/edit/toAddCouponPage?storeId="+storeId+"&startTimed="+startTimed+"&endTimed="+endTimed, {
            title : "选择优惠券",
            width : 800,
            height : 600,
            lock : true,
            cancelVal: "取消",
            close: function () {
                var distributeActivityId = art.dialog.data('distributeActivityId');

                distributeActivityId = parseInt(distributeActivityId);
                var twoCk = document.getElementById("twoCk");
                var threeCk = document.getElementById("threeCk");
                var newCk = document.getElementById("newCk");
                if (str == "oneBody"){
                    if (twoCk.checked){
                        var twoId = $("#twoId").text();
                        if (parseInt(twoId) == distributeActivityId){
                            alert("有相同优惠券");
                            $("#oneBody").html("");
                            return;
                        }
                    }
                    if (threeCk.checked){
                        var threeId = $("#threeId").text();
                        if (parseInt(threeId) == distributeActivityId){
                            alert("有相同优惠券");
                            $("#oneBody").html("");
                            return;
                        }
                    }
                    if (newCk.checked){
                        var newId = $("#newId").text();
                        if (parseInt(newId) == distributeActivityId){
                            alert("有相同优惠券");
                            $("#oneBody").html("");
                            return;
                        }
                    }


                }
                if (str == "twoBody"){
                    var oneId = $("#oneId").text();
                    if (parseInt(oneId) == distributeActivityId){
                        alert("有相同优惠券");
                        $("#twoBody").html("");
                        return;
                    }
                    if (threeCk.checked){
                        var threeId = $("#threeId").text();
                        if (parseInt(threeId) == distributeActivityId){
                            alert("有相同优惠券");
                            $("#twoBody").html("");
                            return;
                        }
                    }
                    if (newCk.checked){
                        var newId = $("#newId").text();
                        if (parseInt(newId) == distributeActivityId){
                            alert("有相同优惠券");
                            $("#twoBody").html("");
                            return;
                        }
                    }

                }
                if (str == "threeBody"){

                    var oneId = $("#oneId").text();
                    if (parseInt(oneId) == distributeActivityId){
                        alert("有相同优惠券");
                        $("#threeBody").html("");
                        return;
                    }
                    if (twoCk.checked){
                        var twoId = $("#twoId").text();
                        if (parseInt(twoId) == distributeActivityId){
                            alert("有相同优惠券");
                            $("#threeBody").html("");
                            return;
                        }
                    }
                    if (newCk.checked){
                        var newId = $("#newId").text();
                        if (parseInt(newId) == distributeActivityId){
                            alert("有相同优惠券");
                            $("#threeBody").html("");
                            return;
                        }
                    }
                }
                if (str == "newBody"){
                    var oneId = $("#oneId").text();
                    if (parseInt(oneId) == distributeActivityId){
                        alert("有相同优惠券");
                        $("#newBody").html("");
                        return;
                    }
                    if (twoCk.checked){
                        var twoId = $("#twoId").text();
                        if (parseInt(twoId) == distributeActivityId){
                            alert("有相同优惠券");
                            $("#newBody").html("");
                            return;
                        }
                    }
                    if (threeCk.checked){
                        var threeId = $("#threeId").text();
                        if (parseInt(threeId) == distributeActivityId){
                            alert("有相同优惠券");
                            $("#newBody").html("");
                            return;
                        }
                    }


                }



                $.get("/invite/edit/queryCoupon?storeId="+storeId+"&distributeActivityId="+distributeActivityId+"&str="+str, function (result) {
                    var content = "";
                    //alert(JSON.stringify(result));
                    if (result){

                        //alert(result.length);
                        for (var i = 0 ; i < result.length; i++){
                            var row  = result[i];
                            var rowStep  = result[0];
                            var step = rowStep.step;
                            if(step=="oneBody"){
                                content+="<tr>";
                                content+="<td rowspan='"+row.couponTOList.length+"'>";
                                content+="<lable id='oneId'>"+row.distributeActivityId+"</lable>";
                                content+="<lable hidden id='oneJiaZhi'>"+row.distributeActivityTotalValue+"</lable>";
                                content+="</td>";
                                for (var j = 0 ; j < row.couponTOList.length; j++){
                                    var coupon = row.couponTOList[j];
                                    content+="<td>";
                                    content+="<lable>"+coupon.couponId+"</lable>-";
                                    content+="<lable>"+coupon.couponName+"</lable>";
                                    content+="</td> ";
                                }
                                content+="</tr>";
                            }else if(step=="twoBody"){
                                content+="<tr>";
                                content+="<td rowspan='"+row.couponTOList.length+"'>";
                                content+="<lable id='twoId'>"+row.distributeActivityId+"</lable>";
                                content+="<lable hidden id='twoJiaZhi'>"+row.distributeActivityTotalValue+"</lable>";
                                content+="</td>";
                                for (var j = 0 ; j < row.couponTOList.length; j++){
                                    var coupon = row.couponTOList[j];
                                    content+="<td>";
                                    content+="<lable>"+coupon.couponId+"</lable>-";
                                    content+="<lable>"+coupon.couponName+"</lable>";
                                    content+="</td> ";
                                }
                                content+="</tr>";
                            }else if(step=="threeBody"){
                                content+="<tr>";
                                content+="<td rowspan='"+row.couponTOList.length+"'>";
                                content+="<lable id='threeId'>"+row.distributeActivityId+"</lable>";
                                content+="<lable hidden id='threeJiaZhi'>"+row.distributeActivityTotalValue+"</lable>";
                                content+="</td>";
                                for (var j = 0 ; j < row.couponTOList.length; j++){
                                    var coupon = row.couponTOList[j];
                                    content+="<td>";
                                    content+="<lable>"+coupon.couponId+"</lable>-";
                                    content+="<lable>"+coupon.couponName+"</lable>";
                                    content+="</td> ";
                                }
                                content+="</tr>";
                            }else if(step=="newBody"){
                                content+="<tr>";
                                content+="<td rowspan='"+row.couponTOList.length+"'>";
                                content+="<lable id='newId'>"+row.distributeActivityId+"</lable>";
                                content+="<lable hidden id='newJiaZhi'>"+row.distributeActivityTotalValue+"</lable>";
                                content+="</td>";
                                for (var j = 0 ; j < row.couponTOList.length; j++){
                                    var coupon = row.couponTOList[j];
                                    content+="<td>";
                                    content+="<lable>"+coupon.couponId+"</lable>-";
                                    content+="<lable>"+coupon.couponName+"</lable>";
                                    content+="</td> ";
                                }
                                content+="</tr>";
                            }

                        }
                        $("#"+str).html("");
                        $("#"+str).append(content);
                    }else {
                        $("#"+str).append("无可用活动");
                    }

                });
            }
        });
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

                createImageLink("shareImageLoad","shareImage");
            };
        };

    });


    //生成链接
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
                    //alert(str);
                } else {
                    $("#"+img).attr("src", result);
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("error");
            }
        });
    };
    //时间
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

        var introduce = $('#activityRule').val();
        if(introduce!=null){
            var reg = new RegExp("<br/>","g");
            var newString = introduce.replace(reg,"\n");
            $('#activityRule').val(newString);
        }
    });



</script>

</html>