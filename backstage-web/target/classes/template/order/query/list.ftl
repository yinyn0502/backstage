
<html>
<head>
    <title>订单查询</title>
<#include "../../ahead.ftl">
<#include "../../treeview.ftl" >
<#include "../../treetable.ftl" >
    <meta name="decorator" content="default"/>
    <script type="text/javascript">

        var validateForm;





        function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
            if(validateForm.form()){
                $("#searchForm").submit();
                return true;
            }
            return false;
        }

        function page(n,s){
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }

        function selectOnchang(obj){
            return obj.selectedIndex;
        }

        function checkTime(){
            var starttime = $("#startDate").val();
            var endtime = $("#endDate").val();
            var start = new Date(starttime.replace("-", "/").replace("-", "/"));
            var end = new Date(endtime.replace("-", "/").replace("-", "/"));
            //endTime>当前时间
            alert(start+":"+end);
            if(end>start){
                return false;
            }else{
                return true;
            }
        }

        function checkEndTime(){
            var starttime = new Date().form('yyyy-mm-dd hh:ii:ss');
            var endtime = $("#endDate").val();
            var start = new Date(starttime.replace("-", "/").replace("-", "/"));
            var end = new Date(endtime.replace("-", "/").replace("-", "/"));
            if(end>start){
                return false;
            }else{
                return true;
            }
        }



        $(document).ready(
            function() {
            var flag=false;




                $("#startDate").datetimepicker({
                format: 'yyyy-mm-dd hh:ii:ss',
                autoclose: true,
                minView: 0,
                minuteStep:1

            }).on('changeDate',function (e) {
                    var startTime = e.date;
                    $('#endDate').datetimepicker('setStartDate',startTime);
                });
            $( "#endDate" ).datetimepicker({
                format: 'yyyy-mm-dd hh:ii:ss',
                autoclose: true,
                minView: 0,
                minuteStep:1
            }).on('changeDate',function (e) {
                var endTime = e.date;
                $('#startDate').datetimepicker('setEndDate',endTime);
            });
            // 手机号码验证
            jQuery.validator.addMethod("isPhone", function(value, element) {
                var length = value.length;
                return this.optional(element) || (length == 11 && /^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/.test(value));
            }, "请正确填写您的手机号码。");

            jQuery.validator.addMethod("isOrder", function(value, element) {
                    var length = value.length;
                    var od=/^((\d{12})){1}||(;(\d{12})){2,20}$/;
                    //var od=/^((\d{12};)){1,20}$/; // 区号－3、4位 号码－7、8位
                    return this.optional(element) || (length > 0 && od.test(value));
                }, "请正确填写20个订单ID，每个ID以；分割");


            // 电话号码验证
            jQuery.validator.addMethod("isTel", function(value, element) {
                var tel = /^(\d{3,4}-)?\d{7,8}$/g; // 区号－3、4位 号码－7、8位
                return this.optional(element) || (tel.test(value));
            }, "请正确填写您的电话号码。");
            // 匹配密码，以字母开头，长度在6-12之间，必须包含数字和特殊字符。
            jQuery.validator.addMethod("isNum", function(value, element) {
                var str = /[0-9]/;
                return this.optional(element) || str.test(value);
            }, "请填写数字类型");
            jQuery.validator.addMethod("isEmp", function(value, element) {
                        var store=$("#storeId").val();
                        if(store.length>0&&store!=0){
                            flag=true;
                        }
                        var channel=$("#channel").val();
                        if(channel.length>0&&channel!=0){
                            flag=true;
                        }
                        var status=$("#status").val();
                        if(status.length>0&&status!=9999){
                            flag=true;
                        }
                        var memberPhone=$("#memberPhone").val();
                        if(memberPhone.length>0){
                            flag=true;
                        }
                        var memberCardId=$("#memberCardId").val();
                        if(memberCardId.length>0){
                            flag=true;
                        }
                        var startDate=$("#startDate").val();
                        if(startDate.length>0){
                            flag=true;
                        }
                        var endDate=$("#endDate").val();
                        if(endDate.length>0){
                            flag=true;
                        }

                        var $orderIds = $.trim($("#orderId").val());
                        if($orderIds.length>0){
                            flag=true;
                        }
                        /*return flag;*/
                        return true;
                    },"请至少填写一项");
            $("#searchForm").validate({
                errorElement : 'span',
                errorClass : 'help-block',
                rules : {
                    storeId:{
                        isEmp:true
                    },
                    channel:{
                        isEmp:true
                    },
                    status:{
                        isEmp:true
                    },
                    memberPhone : {
                        isPhone:true,
                        isEmp:true

                    },
                    startDate:{
                        isEmp:true
                    },
                    endDate:{
                        isEmp:true
                    },
                    orderId:{
                        isEmp:true,
                        isOrder:true,
                        isNum:true
                    },
                    memberCardId : {
                        isNum:true
                    }
                },
                messages : {
                    storeId:{
                        isEmp:""
                    },
                    channel:{
                        isEmp:""
                    },
                    status:{
                        isEmp:""
                    },
                    memberPhone : {
                        isPhone:"请输入手机号"
                    },
                    orderId:{
                        isNum : "订单号错误",

                    },
                    memberCardId : {
                        isNum : "请输入正确的卡号"
                    },
                    startDate:{
                        isEmp:"startDate请至少选择填写或选择一项"
                    },
                    endDate:{
                        isEmp:"endDate请至少选择填写或选择一项"
                    }
                },
                //自定义错误消息放到哪里
                errorPlacement : function(error, element) {
                    //element.next().remove();//删除显示图标
                    //element.after('<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>');
                    //element.closest('.form-group').append(error);//显示错误消息提示

                    var ele = element.closest('.form-group');
                    if (!flag){
                        if (ele.html().indexOf("请至少填写一项")==-1&&error.html()=="请至少填写一项"){
                            ele.append(error);//显示错误消息提示
                        }
                    }else{
                        ele.append(error);//显示错误消息提示
                    }
                },
                //给未通过验证的元素进行处理
                highlight : function(element) {
                    $(element).closest('.form-group').addClass('has-error has-feedback');
                },
                //验证通过的处理
                success : function(label) {
                    var el=label.closest('.form-group');
                    //el.next().remove();//与errorPlacement相似
                    //el.after('<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>');
                    label.closest('.form-group').removeClass('has-error').addClass("has-feedback has-success");
                    label.remove();

                }

            });


        }
        );








    </script>


</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="ibox">
        <div class="ibox-title">
            <h5>订单列表 </h5>
            <div class="ibox-tools">
                <a class="collapse-link">
                    <i class="fa fa-chevron-up"></i>
                </a>
                <a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
                    <i class="fa fa-wrench"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#">选项1</a>
                    </li>
                    <li><a href="#">选项2</a>
                    </li>
                </ul>
                <a class="close-link">
                    <i class="fa fa-times"></i>
                </a>
            </div>
        </div>

        <div class="ibox-content">


        <#if message??>
            <div id="messageBox" class="alert alert-success">
                <button data-dismiss="alert" class="close">×</button>  ${message} </div>
            <script type="text/javascript">if(!top.$.jBox.tip.mess){top.$.jBox.tip.mess=1;top.$.jBox.tip("${message}","success",{persistent:true,opacity:0});$("#messageBox").show();}</script>
        </#if>



            <!-- 查询条件 -->
            <div class="row">
                <div class="col-sm-12">


                    <form id="searchForm" modelAttribute="dict" action="/order/query/list" method="post" class="form-inline">
                    <#--<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
                    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
                    <table:sortColumn id="orderBy" name="orderBy" value="${page.orderBy}" callback="sortOrRefresh();"/>
                   -->
                        <div class="form-group" style="width: 99%">
                            <div class="row">
                                <div class="col-md-3">
                            <span>门店</span><br/>
                            <select name="storeId" class="form-control " id="storeId" onchange="selectOnchang(this)">
                                <option value="">全部门店</option>
                            <#if storeList??>
                                <#list storeList as s>
                                    <#if s??>
                                    <option <#if s.id??>value="${s.id}"</#if> <#if storeId??&& storeId==s.id>selected</#if> ><#if s.name??>${s.name}</#if>
                                    </#if>
                                </option>
                                </#list>
                            </#if>

                            </select>
                                    </div>
                                    <div class="col-md-3">
                            <span>会员手机号：</span>
                            <input  type="text" name="memberPhone" id="memberPhone" maxlength="11" placeholder="请输入11位手机号" oninput="/^\d[;0-9]*$/.test(this.value)?this.value:this.value=this.value.replace(/[^;0-9]/g,'')" onkeyup="this.value=this.value.replace(/\D/g,'')" class="form-control" <#if memberPhone??>value="${memberPhone}"</#if>/>
                                        </div><div class="col-md-3">
                            <span>会员卡ID：</span>
                            <input  type="text" name="memberCardId" id="memberCardId" maxlength="15" oninput="/^\d[;0-9]*$/.test(this.value)?this.value:this.value=this.value.replace(/[^;0-9]/g,'')" onkeyup="this.value=this.value.replace(/\D/g,'')" class="form-control" <#if memberCardId??>value="${memberCardId}"</#if>/>
                                        </div><div class="col-md-3">
                            <span>订单ID：</span><br/>
                            <textarea name="orderId"  class="form-control" id="orderId" style="font-size:12px" maxlength="339" placeholder="请输入要查询的订单号,多个订单号以';'分隔，最多20个订单号.例如:111111;222222;333333"   oninput="/^[;0-9]*$/.test(this.value)?this.value:this.value=this.value.replace(/[^;0-9]/g,'')"  onkeyup="/^\d[;0-9]*$/.test(this.value)?this.value:this.value=this.value.replace(/[^;0-9]/g,'')" ><#if orderId??>${orderId}</#if></textarea>
                                        </div>
                            </div>
                            <div class="row">
                            <div class="col-md-3">
                            <span>订单状态：</span><br/>
                            <select class="form-control" name="status" id="status" onchange="selectOnchang(this)">
                                <option value="9999">全部</option>
                            <#if dictList??>
                                <#list dictList as dict>
                                    <#if dict??>
                                    <option <#if dict.state??>value="${dict.state?c}"</#if> <#if status??&& status==dict.state?c>selected</#if>><#if dict.stateName??>${dict.stateName}</#if>
                                    </option>
                                     </#if>
                                </#list>
                            </#if>
                            </select>
                            </div><div class="col-md-3">
                            <span>订单类型：</span><br/>
                            <SELECT class="form-control" name="channel" id="channel" onchange="selectOnchang(this)">
                                <option value="">全部</option>
                            <#if orderChannelList??>
                                <#list orderChannelList as dict>
                                    <#if dict??>
                                    <option <#if dict.type??>value="${dict.type?c}"</#if> <#if channel??&& channel==dict.type>selected</#if>>
                                        <#if dict.names??>${dict.names}</#if>
                                </option>
                                    </#if>
                                </#list>
                            </#if>
                            </SELECT>
                            </div><div class="col-md-3">
                            <span>开始时间:</span>
                                <input type="text" class="input-sm form-control " data-date-format="yyyy-mm-dd hh:ii:ss"
                                       id="startDate" name="startTime" <#if startTime??>value="${startTime}"</#if>
                                       readonly/>`
                            </div><div class="col-md-3">

                            <span>结束时间:</span>
                                <input type="text" class="input-sm form-control " data-date-format="yyyy-mm-dd hh:ii:ss"
                                       id="endDate" name="endTime" <#if endTime??>value="${endTime}"</#if>
                                       readonly/>
                            </div>


                        </div>
</div>



                    </form>
                    <br/>
                </div>
            </div>

            <!-- 工具栏 -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="pull-left">

<#--

                        <button class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" onclick="sortOrRefresh()" title="刷新"><i class="glyphicon glyphicon-repeat"></i> 刷新</button>
-->

                    </div>
                    <div class="pull-right">

                        <button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="search()"><i class="fa fa-search"></i> 查询</button>
                        <button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="myreset()" ><i class="fa fa-refresh"></i> 重置</button>
                    </div>
                </div>
            </div>

            <table id="contentTable" class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footer">
                <thead>
                <tr>
                    <th> <label>序号</label></th>
                    <th  class="sort-column value">门店名称</th>
                    <th >订单类型</th>
                    <th  class="sort-column type">订单ID</th>
                    <th  class="sort-column description">会员名称</th>
                    <th  class="sort-column sort">订单详情</th>
                    <th>订单成交金额（已减优惠）</th>
                    <th>积分</th>
                    <th>现金券优惠</th>
                    <th>其他方式支付</th>
                    <th>订单状态</th>
                    <th>订单提交时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <#if pageInfo.list??>
                    <#list pageInfo.list as bean>
                    <tr>
                        <td>${bean_index+1} </td>
                        <td><#if bean.storeName??>${bean.storeName}</#if></td>
                        <td><#if bean.orderChannel??>${bean.orderChannel}</#if></td>
                        <td><#if bean.orderId??>${bean.orderId?c}</#if></td>
                        <td><#if bean.memberName??>${bean.memberName}</#if></td>
                        <td><#if bean.productIdList??>
                            <#list bean.productIdList as p>
                                <a href="#" onclick="openDialogView('查看详情', '/order/query/form?orderId=${bean.orderId?c}&memberId=${bean.memberId?c}','1000px', '700px')" ><#if (p_index>3)>...<#else><img src="${imageUrl}/${p%99}/${p%37}/${p?c}_1_0_N.jpg" width="30" height="30"/></#if></a>
                            </#list>
                        </#if></td>
                        <td><#if bean.bargainAmount??>${bean.bargainAmount}</#if></td>
                        <td><#if bean.memberPointPayed??>${bean.memberPointPayed}</#if></td>
                        <td><#if bean.cashCouponAmount??>${bean.cashCouponAmount}</#if></td>
                        <td><#if bean.otherPayed??>${bean.otherPayed}</#if></td>
                        <td><#if bean.status??>${bean.status}</#if></td>
                        <td><#if bean.orderCreateTime??>${bean.orderCreateTime}</#if></td>
                        <td>

                            <#list bean.operationList as o>
                                <#if o.operationType==1>
                                    <shiro:hasPermission name="order:query:view">
                                        <#if o.operationName??> <a href="#" onclick="openDialogView('查看订单详情', '/order/query/form?orderId=${bean.orderId?c}&memberId=${bean.memberId?c}','800px', '500px')" class="btn btn-info btn-xs" ><i class="fa fa-search-plus"></i> ${o.operationName}</a></#if>
                                    </shiro:hasPermission>
                                <#elseif o.operationType==2>
                                    <shiro:hasPermission name="order:query:payview">
                                        <#if o.operationName??> <a href="#" onclick="openDialog('确认收款', '/order/query/payview?orderId=${bean.orderId?c}&amount=<#if bean.shouldPayAmount??>${bean.shouldPayAmount?c}</#if>&orderType=<#if bean.orderType??>${bean.orderType}</#if>','300px', '200px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> ${o.operationName}</a></#if>
                                    </shiro:hasPermission>
                                <#elseif o.operationType==3>
                                    <shiro:hasPermission name="order:query:audit">
                                        <#if o.operationName??> <a href="#" onclick="openDialog('开发票', '/order/return/question?orderId=${bean.orderId?c}&memberId=${bean.memberId?c}','800px', '500px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> ${o.operationName}</a></#if>
                                    </shiro:hasPermission>
                                <#elseif o.operationType==4>
                                    <shiro:hasPermission name="order:query:audit">
                                        <#if o.operationName??>
                                            <a href="#" onclick="openDialog('申请退换货', '/order/return/question?orderId=${bean.orderId?c}&memberId=${bean.memberId?c}','800px', '500px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> ${o.operationName}</a>
                                        </#if>
                                    </shiro:hasPermission>

                                </#if>
                            </#list>



                        </td>
                    </tr>
                    </#list>
                </#if>
                </tbody>
            </table>

        <#include "../../page.ftl" >
            <br/>
            <br/>
        </div>
    </div>
</div>
</body>
</html>
<#---->