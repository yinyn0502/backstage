
<html>
<head>
    <title>修改</title>

    <meta name="decorator" content="default"/>
<#include "../../ahead.ftl">
<#include "../../treeview.ftl" >
<#include "../../treetable.ftl" >



    <script type="text/javascript">
        var tree;
        var validateForm;
        function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
            if(validateForm.form()){
                $("#inputForm").submit();
                closeTip();
                return true;
            }
            return false;
        }
        $(document).ready(function() {
            $('#strStartTime').datetimepicker({
                format: 'yyyy-mm-dd hh:ii:ss',
                weekStart: 1,
                todayBtn: 1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 2,
                forceParse: 0,
                showMeridian: 1,
                language: 'zh-CN'
            });


            $('#strEndTime').datetimepicker({
                format: 'yyyy-mm-dd hh:ii:ss',
                weekStart: 1,
                todayBtn: 1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 2,
                forceParse: 0,
                showMeridian: 1,
                language: 'zh-CN'
            });
            //$("#value").focus();
            validateForm = $("#inputForm").validate({
                submitHandler: function(form){
                    loading('正在提交，请稍等...');
                    form.submit();
                    closeTip();
                },
                errorContainer: "#messageBox",
                errorPlacement: function(error, element) {
                    $("#messageBox").text("输入有误，请先更正。");
                    if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });
        });
    </script>



</head>
<body class="hideScroll">
<form id="inputForm" modelAttribute="couponActivityCreateDTO" action="/couponmanage/query/save" method="post" class="form-horizontal">
<#--<input type="hidden" name="id" <#if dict.id??>value="${dict.id}"</#if>/>
<input type="hidden" name="createBy" <#if dict.createBy??>value="${dict.createBy}"</#if>/>
<input type="hidden" name="delFlag" <#if dict.delFlag??>value="${dict.delFlag}"</#if>/>-->
<#include "../../message.ftl">
    <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
        <tbody>
        <tr>
            <div id="messageBox"></div>
            <td  class="width-15 active" colspan="3">
                <label class="pull-left">基本信息</label>
                <input type="hidden" id="categoryIdsTop" name="categoryIdsTop">
            </td>
        </tr>
        <tr>

            <td  class="width-15 active">	<label class="pull-right">优惠券名称:</label></td>
            <td class="width-30" ><input name="couponName" htmlEscape="false" maxlength="50" class="form-control required" value="<#if couponName??>${couponName}</#if>"/></td>
            <td  class="width-20 active">	（展示在券面，不超过15个字）</td>

        </tr>
        <tr>
            <td  class="width-15 active">	<label class="pull-right">优惠券副标题:</label></td>
            <td class="width-30" ><input name="couponSubName" htmlEscape="false" maxlength="50" class="form-control required abc" /></td>
            <td  class="width-20 active">	（展示在券面，不超过15个字）</td>
        </tr>
        <tr>
            <td  class="width-15 active">	<label class="pull-right">描述:</label></td>
            <td class="width-35" ><input name="description" htmlEscape="false" maxlength="11" class="form-control required abc"/></td>
            <td  class="width-15 active">	（内部描述字段）</td>
        </tr>

        <tr>
            <td  class="width-15 active">	<label class="pull-right">规则说明:</label></td>
            <td class="width-35" ><input name="couponIntroduce" htmlEscape="false" maxlength="11" class="form-control required abc"/></td>
            <td  class="width-15 active">	</td>
        </tr>


        <tr>
            <td  class="width-15 active">	<label class="pull-right">有效期:</label></td>
            <td class="width-30" >
                <input type="text" class="form-control" data-date-format="yyyy-mm-dd hh:ii:ss" id="strStartTime" name="strStartTime" readonly />
                <span>至 ：</span>
                <input type="text" class="form-control" data-date-format="yyyy-mm-dd hh:ii:ss" id="strEndTime" name="strEndTime" readonly />
            </td>
            <td  class="width-20 active"></td>
        </tr>


        <tr>
            <td class="width-15 active"><label class="pull-right">绑定至用户账户当天算起:</label></td>
            <td class="width-30" ><input name="continueDate" htmlEscape="false" maxlength="11" class="form-control required digits"/></td>
            <td class="width-20 active">天有效</td>
        </tr>
        <tr>
            <td  class="width-15 active" colspan="3">
                <label class="pull-left">作用范围</label>
            </td>

        </tr>

        <tr>
            <td class="width-15 active"><label class="pull-right">优惠劵类型:</label></td>
            <td class="width-30" >
                <select class="form-control" name="strCouponType" id="strCouponType" >
                <#--  <option value="9999">全部</option>-->
                <#if couponTypeList??>
                    <#list couponTypeList as d>
                        <#if d??>
                        <option <#if d.type??>value="${d.type}"  <#if type??&&d.type==type>selected</#if></#if> ><#if d.names??>${d.names}</#if>
                                                    </#if>
                    </option>
                    </#list>
                </#if>
                </select>

            </td>
            <td class="width-20 active"></td>
        </tr

        <tr>
            <td class="width-15 active"><label class="pull-right">门店:</label></td>

            <td class="width-30" >
                <input type="hidden" name="strStoreIds" value="" id="storeIds"/>
                <input type="hidden" name="storeNames" value="" id="storeNames"/>
                <div id="stores"></div>
            <#--<a href="#" onclick="openDialog('修改字典', '/sys/dict/form?id=1','800px', '500px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> 选择门店</a>-->

                <!-- 按钮触发模态框 -->
                <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#myModal"><i class="fa fa-edit"></i>选择门店</button>
                <!-- 模态框（Modal） -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabel">选择名店</h4>
                            </div>
                            <div class="modal-body">
                                <table id="contentTable" class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footer">
                                    <thead>
                                    <tr>
                                        <th> <input type="checkbox" class="i-checks"></th>
                                        <th  class="sort-column value">门店ID</th>
                                        <th >城市</th>
                                        <th  class="sort-column type">门店名称</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#if storeList??>
                                        <#list storeList as store>
                                        <tr>

                                            <td> <input type="checkbox" id="${store.id}" class="i-checks" name="storeId" value="${store.id}"></td>
                                            <td>${store.id}</td>
                                            <td></td>
                                            <td>${store.name}</td>
                                        </tr>
                                        </#list>
                                    </#if>
                                    </tbody>
                                </table>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" onclick="update()">提交更改</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>

            <#--<select class="form-control" name="storeId" id="storeId" onchange="selectOnchang(this)">
                <option value="">全部</option>
            <#if storeList??>
                <#list storeList as d>
                    <#if d??>
                    <option <#if d.id??>value="${d.id}" <#if storeId??&&d.id==storeId>selected</#if></#if> ><#if d.name??>${d.name}</#if>
                     </#if>
                </option>
                </#list>
            </#if>
            </select>-->
            </td>
            <td class="width-20 active"></td>
        </tr>

        <tr>
            <td class="width-15 active"><label class="pull-right">增加分类/商品:</label></td>
            <td class="width-30" >
                <input type="hidden" name="strProductIds" value="" id="productIds"/>
                <input type="hidden" name="productNames" value="" id="productNames"/>



                <!-- 按钮触发模态框 -->
                <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#mModal"><i class="fa fa-edit"></i>选择分类</button>
                <!-- 模态框（Modal） -->
                <div class="modal fade" id="mModal" tabindex="-1" role="dialog" aria-labelledby="mModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="mModalLabel">分类</h4>
                            </div>
                            <div>
                            <#include "category.ftl">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" onclick="updateCategory()">提交分类</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>


                <div id="products"></div>
                <!-- 按钮触发模态框 -->
                <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#nModal"><i class="fa fa-edit"></i>选择商品</button>
                <!-- 模态框（Modal） -->
                <div class="modal fade" id="nModal" tabindex="-1" role="dialog" aria-labelledby="nModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="nModalLabel">商品</h4>
                            </div>
                            <div class="modal-body">

                                <div class="modal-header">
                                <#-- <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>-->
                                    <h4 class="modal-title" id="myModalLabel">选择商品</h4>
                                    <!-- 查询条件 -->

                                    <div class="row">
                                        <div class="col-sm-12">

                                        <#--<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
                                        <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
                                        <table:sortColumn id="orderBy" name="orderBy" value="${page.orderBy}" callback="sortOrRefresh();"/>
                                       -->
                                            <div class="form-group">

                                                <input type="text" name="searchstoreIds" value="" id="searchstoreIds"/>
                                                <span>门店名称 ：</span>
                                                <input name="storeName" htmlEscape="false" maxlength="50" class="form-control" id="storeName" readonly/>

                                                <span>商品ID ：</span>
                                                <input name="searchproductIds" id="searchproductIds" htmlEscape="false" maxlength="50" class="form-control" <#if description??>value="${description}"<#else>value=""</#if>/>


                                            </div>
                                            <div class="pull-right">
                                                <button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="searchajax()" ><i class="fa fa-search"></i> 查询</button>
                                                <button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="reset()" ><i class="fa fa-refresh"></i> 重置</button>
                                            </div>



                                            <br/>
                                        </div>
                                    </div>

                                </div>
                                <div>



                                    <table id="monitor-table" class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footer">
                                        <thead>
                                        <tr>
                                            <th><input type="checkbox" class="i-checks"></th>
                                            <th class="sort-column value">门店ID</th>
                                            <th class="sort-column value">门店名称</th>
                                            <th class="sort-column value">商品ID</th>
                                            <th class="sort-column value">商品名称</th>
                                            <th class="sort-column value">促销</th>
                                            <th class="sort-column value">促销状态</th>
                                            <th class="sort-column value">当前售价</th>
                                        </tr>
                                        </thead>
                                    </table>





                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" onclick="updateProduct()">提交</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->






                </div>
                <div id="exproducts"></div>
                <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#hModal"><i class="fa fa-edit"></i>选择排除商品</button>

                <input type="hidden" name="exstrProductIds" value="" id="exstrProductIds"/>
                <input type="hidden" name="exproductNames" value="" id="exproductNames"/>

                <!-- 模态框（Modal） -->
                <div class="modal fade" id="hModal" tabindex="-1" role="dialog" aria-labelledby="hModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="hModalLabel">商品</h4>
                            </div>
                            <div class="modal-body">

                                <div class="modal-header">
                                <#-- <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>-->
                                    <h4 class="modal-title" id="hModalLabel">选择商品</h4>
                                    <!-- 查询条件 -->

                                    <div class="row">
                                        <div class="col-sm-12">

                                        <#--<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
                                        <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
                                        <table:sortColumn id="orderBy" name="orderBy" value="${page.orderBy}" callback="sortOrRefresh();"/>
                                       -->
                                            <div class="form-group">

                                                <input type="text" name="searchstoreIds" value="" id="searchexstoreIds"/>
                                                <span>门店名称 ：</span>
                                                <input name="storeName" htmlEscape="false" maxlength="50" class="form-control" id="exstoreName" readonly/>

                                                <span>商品ID ：</span>
                                                <input name="searchproductIds" id="searchexproductIds" htmlEscape="false" maxlength="50" class="form-control" <#if description??>value="${description}"<#else>value=""</#if>/>


                                            </div>
                                            <div class="pull-right">
                                                <button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="searchexajax()" ><i class="fa fa-search"></i> 查询</button>
                                                <button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="reset()" ><i class="fa fa-refresh"></i> 重置</button>
                                            </div>

                                            <br/>

                                            <table id="ex-monitor-table" class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footer">
                                                <thead>
                                                <tr>
                                                    <th></th>
                                                    <th class="sort-column value">门店ID</th>
                                                    <th class="sort-column value">门店名称</th>
                                                    <th class="sort-column value">商品ID</th>
                                                    <th class="sort-column value">商品名称</th>
                                                    <th class="sort-column value">促销</th>
                                                    <th class="sort-column value">促销状态</th>
                                                    <th class="sort-column value">当前售价</th>
                                                </tr>
                                                </thead>
                                            </table>
                                        </div>
                                    </div>

                                </div>
                                <div>









                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" onclick="updateExProduct()">提交</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->

            </td>
            <td class="width-20 active"></td>
        </tr>


        <tr>
            <td  class="width-15 active" colspan="3">
                <label class="pull-left">限制条件</label>
            </td>
        </tr>


        <tr>
            <td class="width-15 active"><label class="pull-right">会员类型:</label></td>
            <td class="width-30" >

                <select class="form-control" name="strMemberLevel" id="strMemberLevel" >
                <#--  <option value="9999">全部</option>-->
                <#if memberCardTypeList??>
                    <#list memberCardTypeList as d>
                        <#if d??>
                        <option <#if d.type??>value="${d.type}"  <#if type??&&d.type==type>selected</#if></#if> ><#if d.levelName??>${d.levelName}</#if>
                                                    </#if>
                    </option>
                    </#list>
                </#if>
                </select>
            </td>
        </tr>

        <tr>
            <td class="width-15 active"><label class="pull-right">使用渠道:</label></td>
            <td class="width-30" >
            <#if dimensionAppTypeList??>
                <#list dimensionAppTypeList as d>
                    <input type="checkbox" id="${d.type}" class="i-checks" value="${d.type}" name="useChannel"/>
                ${d.names}
                </#list>
            </#if>
            </td>
        </tr>

        <tr>
            <td class="width-15 active"><label class="pull-right">领取限制:</label></td>
            <td class="width-30" >

                每个用户限领数 <input name="sMemberCount" htmlEscape="false" maxlength="50" class="form-control digits" />(不填表示不限制)<br/>
                限领总数<input name="sTotalCount" htmlEscape="false" maxlength="50" class="form-control digits" />(不填表示不限制)
            </td>
        </tr>

        <tr>
            <td  class="width-15 active" colspan="3">
                <label class="pull-left">优惠规则</label>
            </td>
        </tr>

        <tr>
            <td class="width-15 active"> <label class="pull-right"><span><input id="isShow2" name="qualificationType" class="i-checks " type="radio" value="0" checked/><label for="isShow2">无门槛:</label></td>
            <td class="width-30" >

                <select class="form-control" name="benefitType" id="benefitType" >

                <#if benefitTypeList??>
                    <#list benefitTypeList as d>
                        <#if d??>
                        <option <#if d.type??>value="${d.type}"  <#if type??&&d.type==type>selected</#if></#if> ><#if d.names??>${d.names}</#if>
                                                    </#if>
                    </option>
                    </#list>
                </#if>
                </select>

            </td>
            <td class="width-30" ><input name="sBenefitValue" htmlEscape="false" maxlength="50" class="form-control required" />（例：8折填0.8）</td>

        </tr>



        <#-- <tr>
             <td class="width-15 active"> <label class="pull-right"><span><input id="isShow1" name="qualificationType" class="i-checks " type="radio" value="0" /><label for="isShow1">有门槛:</label></td>
             <td class="width-30" >
             </td>
             <td class="width-15 active"></td>
         </tr>-->

        <tr>
            <td  class="width-15 active" colspan="3">
                <label class="pull-left">其他属性</label>
            </td>
        </tr>


        <tr>
            <td class="width-15 active"> <label class="pull-right">是否预算内:</label></td>
            <td class="width-30" >
                <select class="form-control" name="budget" id="budget" >
                    <#--<option value="9999">全部</option>-->
                <#if budgetList??>
                    <#list budgetList as d>
                        <#if d??>
                        <option <#if d.status??>value="${d.status}"  <#if status??&&d.status==status>selected</#if></#if> ><#if d.names??>${d.names}</#if>
                                                    </#if>
                    </option>
                    </#list>
                </#if>
                </select>
            </td>
            <td class="width-30" ></td>

        </tr>


        </tbody>
</form>
</body>
<script>













    //提交更改
    function searchajax(){
        //获取模态框数据
        var storeIds=$('#searchstoreIds').val();
        var productIds = $('#searchproductIds').val();
        var stIds="";
        var stNames="";
        $.ajax({
            type: "post",
            url: "/json/product",
            data: "searchproductIds="+productIds+"&searchstoreIds="+storeIds,
            dataType: 'html',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            success: function(result) {

                var jsondata = $.parseJSON(result);
                var datas=jsondata.data;
                var $table = $("#monitor-table");
                $.each(datas.couponProductBackstageDTOList, function(i, item) {

                    /*stIds=stIds+item.id+","
                    $("#stores").append(item.name);
                    $("#stores").append("<br/>");
                    stNames=stNames+item.name+","*/
                    /*alert(item.list);*/



                    //alert(item.productId+"-----jsonArray-------"+item.productName);
                    var $tr = $('<tr>');
                    var $tdcheck=$('<td>').html("<input type='checkbox' class='i-checks' value='"+item.storeId+"-"+item.productId+"-"+item.productName+"' name='productId'/>");
                    var $td = $('<td>').html(item.productId);
                    var $existPromo=$('<td>');
                    var $tdproductName = $('<td>').html(item.productName);
                    if(item.existPromo){
                        $existPromo = $existPromo.html('有');
                    }else{
                        $existPromo = $existPromo.html('无');
                    }
                    var $saleStatus = $('<td>').html(item.saleStatus);
                    var $salePrice=$('<td>').html(item.salePrice);
                    var $storeName=$('<td>').html(item.storeName);
                    var $storeId=$('<td>').html(item.storeId);
                    $tr.append($tdcheck).append($storeId).append($storeName).append($td).append($tdproductName).append($existPromo).append($saleStatus).append($salePrice);
                    $table.append($tr);

                    /* if(item.couponProductBackstageDTOList!=null){
                         $.each(item.couponProductBackstageDTOList,function(n,value) {
                             alert(n+' '+value.productName);
                             /!*var trs = "";
                             trs += " < tr > <td > " + value.productId +" < /td> <td>" + value.productName +"</td > </tr>";
                             $table += trs;*!/
                             var $tr = $('<tr>');
                             var $tdcheck=$('<td>').html("<input type='checkbox' class='i-checks' value='"+value.productId+"' name='productId'/>");
                             var $td = $('<td>').html(value.productId);
                             var $existPromo=$('<td>');
                             var $tdproductName = $('<td>').html(value.productName);
                             if(value.existPromo){
                                 $existPromo = $existPromo.html('有');
                             }else{
                                 $existPromo = $existPromo.html('无');
                             }
                             var $saleStatus = $('<td>').html(value.saleStatus);
                             var $salePrice=$('<td>').html(value.salePrice);
                             var $store=$('<td>').html(value.storeName);
                             $tr.append($tdcheck).append($store).append($td).append($tdproductName).append($existPromo).append($saleStatus).append($salePrice);
                             $table.append($tr);
                         });
                     }*/
                });
                /* $("#storeIds").attr("value",stIds);
                 $("#searchstoreIds").attr("value",stIds);
                 $("#storeNames").attr("value",stNames);
                 $("#storeName").attr("value",stNames);*/
                //location.reload();
                //alert("storeId:"+storeId);
                //$('#myModal').modal('hide');
            }
        });
    }


    //提交更改
    function searchexajax(){
        //获取模态框数据
        var storeIds=$('#searchexstoreIds').val();
        var productIds = $('#searchexproductIds').val();
        var stIdss="";
        var stNamess="";
        //alert(storeIds);
        //alert(productIds);
        $.ajax({
            type: "post",
            url: "/json/exproduct",
            data: "searchexproductIds="+productIds+"&searchexstoreIds="+storeIds,
            dataType: 'html',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            success: function(result) {
                //alert("@@@@@@@@@@@"+result);
                var jsondatas = $.parseJSON(result);
                var datass=jsondatas.data;
                var $extable = $("#ex-monitor-table");
                $.each(datass.couponProductBackstageDTOList, function(i, item) {

                    /*stIds=stIds+item.id+","
                    $("#stores").append(item.name);
                    $("#stores").append("<br/>");
                    stNames=stNames+item.name+","*/
                    /*alert(item.list);*/



                    //alert(item.productId+"-----jsonArray-------"+item.productName);
                    var $tr = $('<tr>');
                    var $tdcheck=$('<td>').html("<input type='checkbox' class='i-checks' value='"+item.storeId+"-"+item.productId+"-"+item.productName+"' name='exproductId'/>");
                    var $td = $('<td>').html(item.productId);
                    var $existPromo=$('<td>');
                    var $tdproductName = $('<td>').html(item.productName);
                    if(item.existPromo){
                        $existPromo = $existPromo.html('有');
                    }else{
                        $existPromo = $existPromo.html('无');
                    }
                    var $saleStatus = $('<td>').html(item.saleStatus);
                    var $salePrice=$('<td>').html(item.salePrice);
                    var $storeName=$('<td>').html(item.storeName);
                    var $storeId=$('<td>').html(item.storeId);
                    $tr.append($tdcheck).append($storeId).append($storeName).append($td).append($tdproductName).append($existPromo).append($saleStatus).append($salePrice);
                    $extable.append($tr);

                });
                console.log($($extable).html() );
            }
        });
    }


    //提交更改
    function update(){
        //获取模态框数据
        /* var stuno = $('#stuno').val();
         var pass = $('#pass').val();
         var name = $('#stuname').val();*/
        var storeVal="";
        var groupCheckbox=$("input[name='storeId']");
        for(i=0;i<groupCheckbox.length;i++){
            if(groupCheckbox[i].checked){
                var val =groupCheckbox[i].value;
                storeVal=storeVal+val+","
            }
        }

        //  alert(storeVal);
        $.ajax({
            type: "post",
            url: "/json/store",
            data: "storeId="+storeVal,
            dataType: 'html',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            success: function(result) {
                var stIds="";
                var stNames="";
                var jsondata = $.parseJSON(result);
                var datas=jsondata.data;
                $.each(datas, function(i, item) {
                    var $table = $("#monitor-table");
                    stIds=stIds+item.id+","
                    $("#stores").append(item.name);
                    $("#stores").append("<br/>");
                    stNames=stNames+item.name+","

                    //alert(item.id+"-----jsonArray-------"+item.name);



                    if(item.couponProductBackstageInfoDTO.couponProductBackstageDTOList!=null){
                        $.each(item.couponProductBackstageInfoDTO.couponProductBackstageDTOList,function(n,value) {
                            //alert(n+' '+value.couponProductBackstageDTOList);
                            /*var trs = "";
                            trs += " < tr > <td > " + value.productId +" < /td> <td>" + value.productName +"</td > </tr>";
                            $table += trs;*/
                            var $tr = $('<tr>');
                            var $tdcheck=$('<td>').html("<input type='checkbox' class='i-checks' value='"+value.productId+"' name='productId'/>");
                            var $td = $('<td>').html(value.productId);
                            var $existPromo=$('<td>');
                            var $tdproductName = $('<td>').html(value.productName);
                            if(value.existPromo){
                                $existPromo = $existPromo.html('有');
                            }else{
                                $existPromo = $existPromo.html('无');
                            }
                            var $saleStatus = $('<td>').html(value.saleStatus);
                            var $salePrice=$('<td>').html(value.salePrice);
                            var $store=$('<td>').html(value.storeName);
                            $tr.append($tdcheck).append($store).append($td).append($tdproductName).append($existPromo).append($saleStatus).append($salePrice);
                            $table.append($tr);
                        });
                    }
                });
                $("#storeIds").attr("value",stIds);
                $("#searchstoreIds").attr("value",stIds);
                $("#searchexstoreIds").attr("value",stIds);
                $("#storeNames").attr("value",stNames);
                $("#exstoreName").attr("value",stNames);
                $("#storeName").attr("value",stNames);
                //location.reload();
                //alert("storeId:"+storeId);
                $('#myModal').modal('hide');
            }
        });
    }


    function updateProduct(){
        //获取模态框数据
        /* var stuno = $('#stuno').val();
         var pass = $('#pass').val();
         var name = $('#stuname').val();*/
        var storeIds = $('#storeIds').val();
        var storeVal="";
        var groupCheckbox=$("input[name='productId']");
        for(i=0;i<groupCheckbox.length;i++){
            if(groupCheckbox[i].checked){
                var val =groupCheckbox[i].value;
                storeVal=storeVal+val+","
            }
        }
        //alert(storeVal);
        $.ajax({
            type: "post",
            url: "/json/updateproduct",
            data: "searchproductIds="+storeVal,
            dataType: 'html',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            success: function(result) {

                //alert(result);
                var jsondata = $.parseJSON(result);
                var datas=jsondata;
                var stIdss="";
                var stNamess="";

                $.each(datas, function(i, item) {
                    stIdss=stIdss+item.storeId+"-"+item.productId+"-"+item.productName+",";
                    stNamess=stNamess+item.productName+",";

                    //stNamess=stNamess+item.productName+","
                    /*alert(item.list);*/
                });
                $("#products").append(stNamess);
                $("#products").append("<br/>");
                /*  $("#storeIds").attr("value",stIds);
                  $("#storeNames").attr("value",stNames);
                  $("#storeName").attr("value",stNames);*/

                $("#productIds").attr("value",stIdss);
                $("#productNames").attr("value",stNamess);

                $('#nModal').modal('hide');
            }
        });
    }



    function updateExProduct(){
        //获取模态框数据
        /* var stuno = $('#stuno').val();
         var pass = $('#pass').val();
         var name = $('#stuname').val();*/
        var storeIds = $('#storeIds').val();
        var storeVal="";
        var groupCheckbox=$("input[name='exproductId']");
        for(i=0;i<groupCheckbox.length;i++){
            if(groupCheckbox[i].checked){
                var val =groupCheckbox[i].value;
                storeVal=storeVal+val+","
            }
        }
        //alert(storeVal);
        var stIdss="";
        var stNamess="";
        $.ajax({
            type: "post",
            url: "/json/updateproduct",
            data: "searchproductIds="+storeVal,
            dataType: 'html',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            success: function(result) {

                //alert(result);
                var jsondata = $.parseJSON(result);
                var datas=jsondata;


                $.each(datas, function(i, item) {
                    stIdss=stIdss+item.storeId+"-"+item.productId+"-"+item.productName+",";
                    stNamess=stNamess+item.productName+",";

                    //stNamess=stNamess+item.productName+","
                    /*alert(item.list);*/
                });
                $("#exproducts").append(stNamess);
                $("#exproducts").append("<br/>");
                $("#exstrProductIds").attr("value",stIdss);
                $("#exproductNames").attr("value",stNamess);

                $('#hModal').modal('hide');
            }
        });
    }





    function updateCategory(){
        //获取模态框数据

        var ids = [], nodes = tree.getCheckedNodes(true);
        for(var i=0; i<nodes.length; i++) {
            ids.push(nodes[i].id);
        }
        $("#menuIds").val(ids);
        $("#categoryIdsTop").val(ids);
        var m = $('#menuIds').val();
        //alert(m);
        //alert(storeVal);

        //$('#nModal').modal('hide');
        /*$.ajax({
            type: "post",
            url: "/json/category",
            data: "categoryIds="+m,
            dataType: 'html',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            success: function(result) {

                alert(result);

               //$('#nModal').modal('hide');
            }
        });*/
        $('#mModal').modal('hide');
    }

</script>
</html>