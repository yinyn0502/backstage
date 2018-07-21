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
<#if audit??>
<h1 align="center">审核邀请活动</h1>
<#else >
<h1 align="center">查看邀请活动</h1>
</#if>

<#if activityId??>
<input hidden value="${activityId?c}" name="activityId" id="activityId"/>
</#if>
<#if data??>
<label>最后操作人:  </label>
<label><#if data.handler??>${data.handler}</#if></label>
&nbsp;
<label>最后操作时间:  </label>
<label><#if data.handleTimeString??>${data.handleTimeString}</#if></label>

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
                    <label><#if data.storeName??>${data.storeName}</#if></label>
                </td>
            </tr>
            <tr>
                <td>
                    <label>活动名称:  </label>
                </td>
                <td align="left">
                    <label><#if data.activityName??>${data.activityName}</#if></label>
                </td>

            </tr>
            <tr>
                <td>
                    <label>开始时间:  </label>
                </td>
                <td>
                    <label><#if data.activityStartTimeStr??>${data.activityStartTimeStr}</#if></label>
                </td>
                <td>
                    <label>结束时间:  </label>
                </td>
                <td>
                    <label><#if data.activityEndTimeStr??>${data.activityEndTimeStr}</#if></label>
                </td>
            </tr>
        </table>
    </div>
    <br>
    <h2>规则配置</h2>
    <label>老用户返券规则</label>

    <#if activityRuleList??>
        <#list activityRuleList as item>
                <div>
                    <label>阶梯${item_index + 1} </label> <br>
                    邀请
                    <label><#if item.awardQualificationFloor??>${item.awardQualificationFloor}</#if></label>
                    <#if item.awardQualificationCeil??>
                        &nbsp;
                        至
                        <label><#if item.awardQualificationCeil??>${item.awardQualificationCeil}</#if></label>
                        &nbsp;人
                    <#else >
                        人以上&nbsp;
                    </#if>
                    返券
                    <br>
                    <table style="border: 1px" >
                        <tr>
                            <th>活动id</th>
                            <th>优惠券信息</th>
                            <th>剩余券数</th>
                            <th>有效期</th>
                        </tr>
                        <#if item.couponTOList??>
                            <#list item.couponTOList as coupon>
                            <tr>
                                <td>
                                    <label><#if item.awardBenefitId??>${item.awardBenefitId}</#if></label>
                                </td>
                                <td>
                                    <label><#if coupon.couponId??>${coupon.couponId}</#if></label>
                                    -
                                    <label><#if coupon.couponName??>${coupon.couponName}</#if></label>
                                </td>
                                <td>
                                    <label><#if coupon.leftCoupnoNum??>${coupon.leftCoupnoNum}</#if></label>
                                </td>
                                <td>
                                    <label><#if coupon.startTime??>${coupon.startTime}</#if></label>
                                    ~
                                    <label><#if coupon.endTime??>${coupon.endTime}</#if></label>
                                </td>
                            </tr>
                            </#list>
                        </#if>
                    </table>
                    <br>
                </div>
            <br>
        </#list>
    </#if>
        <h2>新用户规则 </h2>
        <br>
        <div>
            <br>
            新人大礼包
            <br>
            <#if data.newUserBenefitId??>
                邀请专享
                <br>
                <table style="border: 1px" >
                    <tr>
                        <th>活动id</th>
                        <th>优惠券信息</th>
                        <th>剩余券数</th>
                        <th>有效期</th>
                    </tr>
                    <#if data.couponTOList??>
                        <#list data.couponTOList as coupon>
                            <tr>
                                <td>
                                    <label><#if data.newUserBenefitId??>${data.newUserBenefitId}</#if></label>
                                </td>
                                <td>
                                    <label><#if coupon.couponId??>${coupon.couponId}</#if></label>
                                    -
                                    <label><#if coupon.couponName??>${coupon.couponName}</#if></label>
                                </td>
                                <td>
                                    <label><#if coupon.leftCoupnoNum??>${coupon.leftCoupnoNum}</#if></label>
                                </td>
                                <td>
                                    <label><#if coupon.startTime??>${coupon.startTime}</#if></label>
                                    ~
                                    <label><#if coupon.endTime??>${coupon.endTime}</#if></label>
                                </td>
                            </tr>
                        </#list>
                    </#if>
                </table>
            </#if>
            <br>
            <label>活动规则说明</label><br>
            <textarea  style="width: 600px;height: 300px" id="activityRule" disabled><#if data.activityIntroduce??>${data.activityIntroduce}</#if></textarea>
        </div>
        <br>
    <#if activityMaterialInfo??>
        <div>
            <h2>老用户邀请页面配置 </h2>
            <br>
            <label>分享标题*   </label>
            <label><#if activityMaterialInfo.shareTitle??>${activityMaterialInfo.shareTitle}</#if></label>
            &nbsp;
            <br>
            <label>分享描述*   </label>
            <label><#if activityMaterialInfo.shareDescription??>${activityMaterialInfo.shareDescription}</#if></label>
            &nbsp;
            <br>
            <label>分享小图*  </label>
            <img id="shareImage" width="100px" src="<#if activityMaterialInfo.shareImageURL??>${activityMaterialInfo.shareImageURL}</#if>"/>
        </div>
        <br>
        <div>

            <#if productList??>
                <h2>新用户注册页面配置 </h2>
                <br>
            <label>人气商品展示 : </label><br>
            <table border="1px" id="table">
                <tbody>
                <tr>
                    <th>商品id和名字</th>
                    <th>库存</th>
                    <th>售卖状态</th>
                </tr>

                    <#list productList as item>
                        <tr class="count" id="tr_${item_index+1}">
                            <td>
                                <#if item.productId??> ${item.productId?c}</#if>
                                -
                                <#if item.productName??> ${item.productName}</#if>
                            </td>
                            <td><#if item.salesInventory??> ${item.salesInventory}</#if></td>
                            <td><#if item.saleStatus??> ${item.saleStatus}</#if></td>
                        </tr>
                    </#list>
                </#if>
                </tbody>
                <tfoot>
                    <#if audit??>
                    <tr>
                        <td colspan="10" align="right">
                            <button id="back" class="btn btn-primary btn-lg button">返回</button>
                            <button class="btn btn-primary btn-lg button" data-toggle="modal"  id="backButton">驳回</button>
                            <button id="auditPass" class="btn btn-primary btn-lg button">审核通过</button>
                        </td>
                    </tr>
                    </#if>
                </tfoot>

            </table>
        </div>
    </#if>

</div>

</#if>


<script>

    $(function () {
        $("#backButton").click(function () {
        <#if createdBy??&&currentUser??>
            <#if currentUser==createdBy>
                alert("不能审核自己创建的邀请有礼活动");
                return;
            </#if>
            $("#myModal1").modal();
        </#if>
        });

        $("#stopButton").click(function () {
        <#if createdBy??&&currentUser??>
            <#if currentUser==createdBy>
                alert("不能审核自己创建的邀请有礼活动");
                return;
            </#if>
            $("#myModal2").modal();
        </#if>
        });


        $("#back").click(function () {
            $.artDialog.close();
        });

        $("#stop").click(function () {
            var activityId = $("#activityId").val();
            if (activityId != null && activityId != undefined){
                activityId = Number(activityId);
            }
            $.get("/invite/audit/stop", {
                "activityId" : activityId,
            "createdBy" : <#if createdBy??>"${createdBy}"<#else>""</#if>
            }, function (data) {
                if (data) {
                    if (data.code == 0) {
                        alert("禁用成功咯");
                        $.artDialog.close();
                    } else {
                        alert(data.message[0].message);
                    }
                } else {
                    alert("请求失败");
                }
            });
        });

        $("#refuse").click(function () {
            var activityId = $("#activityId").val();
            if (activityId != null && activityId != undefined){
                activityId = Number(activityId);
            }
            var reason = $("#reason").val().trim();
            if(reason==null||reason==''||reason==undefined){
                alert("请输入驳回原因!");
                return;
            }
            $.get("/invite/audit/refuse", {
                "activityId" : activityId,
                "reason" : $("#reason").val(),
            "createdBy" : <#if createdBy??>"${createdBy}"<#else>""</#if>
            }, function (data) {
                if (data) {
                    if (data.code == 0) {
                        alert("驳回成功咯");
                        $.artDialog.close();
                    } else {
                        alert(data.message[0].message);
                    }
                } else {
                    alert("请求失败");
                }
            });
        });

        $("#auditPass").click(function () {
            var activityId = $("#activityId").val();
            if (activityId != null && activityId != undefined){
                activityId = Number(activityId);
            }
            $.get("/invite/audit/pass", {
                "activityId" : activityId,
            "createdBy" : <#if createdBy??>"${createdBy}"<#else>""</#if>
            }, function (data) {
                if (data) {
                    if (data.code == 0) {
                        alert("审核通过咯");
                        $.artDialog.close();
                    } else {
                        alert(data.message[0].message);
                    }
                } else {
                    alert("请求失败");
                }
            });
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

<!-- 审核驳回 -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">驳回</h4>
            </div>
            <div class="modal-body">
                <table>
                    <tr>
                        <td>
                            <label>驳回原因</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <textarea id="reason" maxlength="50" style="width: 540px; height: 60px"></textarea>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="refuse">提交</button>
            </div>
        </div>
    </div><!-- /.modal -->
</div>
<!-- 审核终止 -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>

            </div>
            <div class="modal-body">确认终止该活动吗</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button id="stop" type="button" class="btn btn-primary">终止</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>