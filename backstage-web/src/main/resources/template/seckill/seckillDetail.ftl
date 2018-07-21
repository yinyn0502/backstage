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
            margin: 7px;
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

        tr {
            text-align: left;
        }

        .left {
            text-align: right;
            width: 100px;
            margin: 5px;
        }
        .right {
            text-align: left;
            margin: 5px;
        }
        label {
            margin: 5px;
        }
    </style>
</head>

<h1 align="center">秒杀场次明细</h1>

<#if activityId??>
<input hidden value="${activityId?c}" name="activityId" id="activityId"/>
</#if>

<#if data??>

    <div align="left" >
        <table align="left">
            <tr>
                <td class="left">
                    <label>最后操作人:  </label>
                </td>
                <td>
                    <label><#if data.lastOperator??>${data.lastOperator}</#if></label>
                </td>
            </tr>
            <tr>
                <td class="left">
                    <label>最后操作时间:  </label>
                </td>
                <td>
                    <label><#if data.lastTime??>${data.lastTime}</#if></label>
                </td>
            </tr>
        </table>

        <table align="left">
            <thead>
                <tr>
                    <td colspan="2">
                        <h2>场次信息</h2>
                        <hr/>
                    </td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="left">
                        <label>门店:  </label>
                    </td>
                    <td class="right">
                        <label><#if data.storeName??>${data.storeName}</#if></label>
                    </td>
                </tr>
                <tr>
                    <td class="left">
                        <label>场次名称:  </label>
                    </td>
                    <td class="right">
                        <label><#if data.seckillName??>${data.seckillName}</#if></label>
                    </td>
                </tr>
                <tr>
                    <td class="left">
                        <label>开始时间:  </label>
                    </td>
                    <td class="right">
                        <label><#if data.startTime??>${data.startTime}</#if></label>
                    </td>
                </tr>
                <tr>
                    <td class="left">
                        <label>结束时间:  </label>
                    </td>
                    <td class="right">
                        <label><#if data.endTime??>${data.endTime}</#if></label>
                    </td>
                </tr>
            </tbody>
        </table>

        <table align="left">
            <thead>
                <tr>
                    <td colspan="2">
                        <h2>专题页配置</h2>
                        <hr/>
                    </td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="left">
                        <label style="width: 100px">页面标题* </label>
                    </td>
                    <td class="right">
                        <label><#if data.pageTitle??>${data.pageTitle}</#if></label>
                    </td>
                </tr>
                <tr>
                    <td class="left">
                        <label style="width: 100px">分享标题* </label>
                    </td>
                    <td class="right">
                        <label><#if data.shareTitle??>${data.shareTitle}</#if></label>
                    </td>
                </tr>
                <tr>
                    <td class="left">
                        <label style="width: 100px">分享描述* </label>
                    </td>
                    <td class="right">
                        <label><#if data.shareDescribe??>${data.shareDescribe}</#if></label>
                    </td>
                </tr>
                <tr>
                    <td class="left">
                        <label style="width: 100px">分享小图* </label>
                    </td>
                    <td class="right">
                        <img width="100px" src="<#if data.shareImage??>${data.shareImage}</#if>"/>
                    </td>
                </tr>
                <tr>
                    <td class="left" width="70px">
                        <label style="width: 100px">banner图片* </label>
                    </td>
                    <td class="right">
                        <img width="400px" src="<#if data.bannerImage??>${data.bannerImage}</#if>"/>
                    </td>
                </tr>
            </tbody>
            <tfoot>
            <tr>
                <td colspan="3">
                    <h2>配置商品</h2>
                    <hr />
                </td>
            </tr>
            </tfoot>
        </table>

    </div>

    <table align="center" id="table" class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footer">
        <tbody>
        <tr>
            <th>序号</th>
            <th>商品ID</th>
            <th>商品名称</th>
            <th>当前售卖状态</th>
            <th>当前可售库存</th>
            <th>正常售价</th>
            <th>活动售价</th>
            <th>活动库存</th>
            <th>每人限购数</th>
            <th>专题页排序</th>
        </tr>
        <#if productList??>
            <#list productList as item>
                <tr>
                    <td>${item_index+1}</td>
                    <td><#if item.productId??>${item.productId?c}</#if></td>
                    <td><#if item.productName??>${item.productName}</#if></td>
                    <td><#if item.saleStatus??>${item.saleStatus}</#if></td>
                    <td><#if item.salesInventory??>${item.salesInventory}</#if></td>
                    <td><#if item.salePrice??>${item.salePrice}</#if></td>
                    <td><#if item.activityPrice??>${item.activityPrice?c}</#if></td>
                    <td><#if item.activityInventory??>${item.activityInventory}</#if></td>
                    <td><#if item.limitCount??>${item.limitCount?c}</#if></td>
                    <td><#if item.sort??>${item.sort}</#if></td>
                </tr>
            </#list>
        </#if>
        </tbody>
        <#if pagination??>
        <tfoot>
            <tr>
                <td colspan="5" align="left">
                    <#if pagination.totalCount??>
                        共有<label>${pagination.totalCount}</label>条数据
                    </#if>
                    <#if pagination.lastPage??>
                    共有<label>${pagination.lastPage}</label>页
                    </#if>
                    <#if pagination.currentPage??>
                    当前第<label>${pagination.currentPage}</label>页
                    </#if>

                </td>
                <td colspan="5" align="right">
                    <button class="page" data-page="1" <#if !pagination.hasPreviousPage>disabled</#if>>首页</button>
                    <button class="page" data-page="<#if pagination.prePage??>${pagination.prePage}</#if>" <#if !pagination.hasPreviousPage>disabled</#if>>上一页</button>
                    <button class="page" data-page="<#if pagination.nextPage??>${pagination.nextPage}</#if>" <#if !pagination.hasNextPage>disabled</#if>>下一页</button>
                    <button class="page" data-page="<#if pagination.lastPage??>${pagination.lastPage}</#if>" <#if !pagination.hasNextPage>disabled</#if>>末页</button>
                    <input id="currentPage" type="number" min="1" <#if pagination.lastPage??>max="${pagination.lastPage}"</#if> value="<#if pagination.currentPage??>${pagination.currentPage}</#if>"/>
                    <select id="pageSize">
                        <option <#if pagination.pageCount??><#if pagination.pageCount==5>selected</#if></#if>>5</option>
                        <option <#if pagination.pageCount??><#if pagination.pageCount==10>selected</#if></#if>>10</option>
                        <option <#if pagination.pageCount??><#if pagination.pageCount==15>selected</#if></#if>>15</option>
                        <option <#if pagination.pageCount??><#if pagination.pageCount==20>selected</#if></#if>>20</option>
                        <option <#if pagination.pageCount??><#if pagination.pageCount==50>selected</#if></#if>>50</option>
                    </select>
                </td>
            </tr>
            <#if audit??>
                <tr>
                    <td colspan="10" align="right">
                        <button id="back" class="button" style="background-color: deeppink">返回</button>
                        <button class="btn btn-primary btn-lg button" data-toggle="modal"  id="backButton">驳回</button>
                        <button class="btn btn-primary btn-lg button" data-toggle="modal"  id="stopButton">终止</button>
                        <button id="auditPass" class="button" style="background-color: deeppink">审核通过</button>
                    </td>
                </tr>
            </#if>
        </tfoot>
        </#if>
    </table>
</#if>
<script>
    $(function () {
        $("#backButton").click(function () {
            <#if createdBy??&&currentUser??>
            <#if currentUser==createdBy>
                alert("不能审核自己创建的秒杀活动");
                return;
            </#if>
                $("#myModal1").modal();
            </#if>
        });

        $("#stopButton").click(function () {
        <#if createdBy??&&currentUser??>
            <#if currentUser==createdBy>
                alert("不能审核自己创建的秒杀活动");
                return;
            </#if>
            $("#myModal2").modal();
        </#if>
        });

        $(".page").click(function () {
            var page = $(this).data("page");
            window.location.href = "/seckill/detail?activityId=<#if activityId??>${activityId?c}</#if>&currentPage=" + page + "&pageSize=" + $("#pageSize").val();
        });

        $("#pageSize").change(function () {
            window.location.href = "/seckill/detail?activityId=<#if activityId??>${activityId?c}</#if>&currentPage=" + 1 + "&pageSize=" + $("#pageSize").val();
        });

        $("#currentPage").change(function () {
            var page = $(this).val();
            window.location.href = "/seckill/detail?activityId=<#if activityId??>${activityId?c}</#if>&currentPage=" + page + "&pageSize=" + $("#pageSize").val();
        });

        $("#back").click(function () {
            $.artDialog.close();
        });

        $("#stop").click(function () {
            $.get("/seckill/audit/stop", {
                "activityId" : $("#activityId").val(),
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
            $.get("/seckill/audit/refuse", {
                "activityId" : $("#activityId").val(),
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
            $.get("/seckill/audit/pass", {
                "activityId" : $("#activityId").val(),
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