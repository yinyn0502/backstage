<#include "../../../ahead.ftl">
<#include "../../../treeview.ftl" >
<#include "../../../treetable.ftl" >
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
                jQuery.validator.addMethod("isReverseOrder", function(value, element) {
                    var length = value.length;
                    var od=/^((\d{13})){1}||(;(\d{13})){2,20}$/;
                    return this.optional(element) || (length > 0 && od.test(value));
                }, "请正确填写20个申请单ID，每个ID以；分割");

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


                    var $orderIds = $.trim($("#orderIdList").val());
                    if($orderIds.length>0){
                        flag=true;
                    }
                    var $reverseIds = $.trim($("#reverseIdList").val());
                    if($reverseIds.length>0){
                        flag=true;
                    }
                    return true;
                   /* return flag;*/
                },"请至少填写一项");
                $("#searchForm").validate({
                    errorElement : 'span',
                    errorClass : 'help-block',
                    rules : {
                        storeId:{
                            isEmp:true
                        },

                        status:{
                            isEmp:true
                        },
                        memberPhone : {
                            isPhone:true,
                            isEmp:true

                        },
                        memberCardId : {
                            isNum:true,
                            minlength : 10,
                            maxlength : 15,
                            isEmp:true
                        },
                        orderIdList:{
                            isEmp:true,
                            isOrder:true
                        },
                        reverseIdList:{
                            isEmp:true,
                            isReverseOrder:true
                        }

                    },
                    messages : {
                        storeId:{
                            isEmp:""
                        },
                        status:{
                            isEmp:""
                        },
                        memberPhone : {
                            isPhone:"请输入手机号"
                        },
                        memberCardId : {
                            isNum : "请输入正确的卡号"
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
<div class="ibox">
    <div class="ibox-title">
        <h5>待确认退款列表 </h5>
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
                <form id="searchForm" modelAttribute="dict" action="/order/return/tabs?queryType=3" method="post" class="form-inline">
                <#--<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
                <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
                <table:sortColumn id="orderBy" name="orderBy" value="${page.orderBy}" callback="sortOrRefresh();"/>
               -->
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-1">
                                <span>门店：</span>
                            </div>
                            <div class="col-md-3">
                                <select class="form-control" name="storeId" id="storeId" onchange="selectOnchang(this)">
                                    <option value="">全部</option>
                                <#if storeList??>
                                    <#list storeList as d>
                                        <#if d??>
                                        <option <#if d.id??>value="${d.id}" <#if storeId??&&d.id==storeId>selected</#if></#if> ><#if d.name??>${d.name}</#if>
                                            </#if>
                                    </option>
                                    </#list>
                                </#if>
                                </select>
                            </div>
                            <div class="col-md-1">
                                <span>会员手机号 ：</span>
                            </div>
                            <div class="col-md-3">
                                <input name="memberPhone" id="memberPhone" oninput="/^\d[;0-9]*$/.test(this.value)?this.value:this.value=this.value.replace(/[^;0-9]/g,'')" onkeyup="this.value=this.value.replace(/\D/g,'')" <#if memberPhone??>value="${memberPhone}"</#if> htmlEscape="false" maxlength="30" class="form-control"/>
                            </div>
                            <div class="col-md-1">
                                <span>会员卡ID ：</span>
                            </div>
                            <div class="col-md-3">
                                <input name="memberCardId" id="memberCardId" onkeyup="this.value=this.value.replace(/\D/g,'')" <#if memberCardId??>value="${memberCardId}"</#if> htmlEscape="false" maxlength="30" class="form-control"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-1">
                                <span>原订单ID ：</span>
                            </div>
                            <div class="col-md-3">
                                <textarea name="orderIdList" id="orderIdList" oninput="/^\d[;0-9]*$/.test(this.value)?this.value:this.value=this.value.replace(/[^;0-9]/g,'')" onkeyup="this.value=this.value.replace(/\D/g,'')"<#if orderIdList??>value="${orderIdList}"</#if> class="form-control"></textarea>
                            </div>
                            <div class="col-md-1">
                                <span>申请单ID ：</span>
                            </div>
                            <div class="col-md-3">
                                <textarea name="reverseIdList" id="reverseIdList" oninput="/^\d[;0-9]*$/.test(this.value)?this.value:this.value=this.value.replace(/[^;0-9]/g,'')" onkeyup="this.value=this.value.replace(/\D/g,'')" <#if orderIdList??>value=${reverseIdList}"</#if> class="form-control"></textarea>
                            </div>
                            <div class="col-md-1">
                                <span>申请单状态 ：</span>
                            </div>
                            <div class="col-md-3">
                                <select class="form-control" name="status" value="status" id="status" onchange="selectOnchang(this)">
                                    <option value="9999">全部</option>
                                <#if dictLists??>
                                    <#list dictLists as dict>
                                        <#if dict??>
                                        <option <#if dict.status??>value="${dict.status?c}" <#if status??&&dict.status==status>selected</#if></#if> ><#if dict.names??>${dict.names}</#if>
                                            </#if>
                                    </option>
                                    </#list>
                                </#if>
                                </select>
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
                    <shiro:hasPermission name="sys:dict:add">
                        <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" onclick="add()" title="添加"><i class="fa fa-plus"></i> 添加</button>

                        <script type="text/javascript">
                            function add(){
                                openDialog("新增"+'字典',"/sys/dict/form","800px", "500px","");
                            }
                        </script><!-- 增加按钮 -->
                    </shiro:hasPermission>
                    <shiro:hasPermission name="sys:dict:edit">
                        <table:editRow url="/sys/dict/form" id="contentTable"  title="字典"></table:editRow><!-- 编辑按钮 -->
                    </shiro:hasPermission>
                    <shiro:hasPermission name="sys:dict:del">
                        <table:delRow url="/sys/dict/deleteAll" id="contentTable"></table:delRow><!-- 删除按钮 -->
                    </shiro:hasPermission>
                    <button class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" onclick="sortOrRefresh()" title="刷新"><i class="glyphicon glyphicon-repeat"></i> 刷新</button>

                </div>
                <div class="pull-right">
                    <button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="search()" ><i class="fa fa-search"></i> 查询</button>
                    <button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="reset()" ><i class="fa fa-refresh"></i> 重置</button>
                </div>
            </div>
        </div>

        <table id="contentTable" class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footer">
            <thead>
            <tr>
                <th><label>序号</label></th>
                <th  class="sort-column value">门店名称</th>
                <th>申请单ID</th>
                <th  class="sort-column type">申请单类型</th>
                <th  class="sort-column description">申请单详情</th>
                <th  class="sort-column sort">用户名称</th>
                <th>预计退款金额</th>
                <th>申请单状态</th>
                <th>申请单提交时间</th>
                <th>最后修改时间</th>
                <th>最后操作人</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <#if pageInfo??&&pageInfo.list??>
                <#list pageInfo.list as b>

                <tr>
                    <td><label>${b_index+1}</label> <input style="display: none;" id="${b.reverseId?string}" class="i-checks"></td>
                    <td><#if b.storeName??>${b.storeName}</#if></td>
                    <td>${b.reverseId?c}</td>
                    <td>
                        <#if dictList??>
                                    <#list dictList as dict>
                            <#if b.type??&&b.type==dict.type>
                                <#if dict.names??>${dict.names}</#if>
                            </#if>
                        </#list>
                                </#if>
                    </td>
                    <td>
                        <#if b.reverseProductInfo??&&b.reverseProductInfo.productIdList??>
                                    <#list b.reverseProductInfo.productIdList as p>
                                        <a href="#" onclick="openDialogView('查看退换货明細', '/order/return/form?reverseId=${b.reverseId?c}','800px', '500px')"> <img src="<#if imageUrl??>${imageUrl}</#if>/${p%99}/${p%37}/${p?c}_1_0_N.jpg" width="30" height="30"/></a>
                        </#list>
                                </#if>
                    </td>
                    <td>
                        <#if b.username??>${b.username}</#if>
                    </td>
                    <td>

                        <#if b.reverseProductInfo??&&b.reverseProductInfo.totalPrice??>
                        ${b.reverseProductInfo.totalPrice}
                        <#else>
                            0
                        </#if>
                    </td>

                    <td>
                        <#if b.reverseStatusName??>${b.reverseStatusName}<#else>--</#if>
                    </td>
                    <td>
                        <#if b.screateTime??>
                        ${b.screateTime}
                        <#else>
                            创建时间
                        </#if>
                    </td>
                    <td>

                        <#if b.reverseOrderOperationTO??&&b.reverseOrderOperationTO.supdateTime??>
                                ${ b.reverseOrderOperationTO.supdateTime}
                                <#else>
                                --
                        </#if>
                    </td>

                    <td>
                        <#if b.reverseOrderOperationTO??>
                                ${ b.reverseOrderOperationTO.updateBy}
                                <#else>

                        </#if>
                    </td>
                    <td>
                        <shiro:hasPermission name="order:return:view">
                            <a href="#" onclick="openDialogView('查看退换货明細', '/order/return/form?reverseId=${b.reverseId?c}','800px', '500px')" class="btn btn-info btn-xs" ><i class="fa fa-search-plus"></i> 查看</a>
                        </shiro:hasPermission>

                        <#if b.operationName??&&b.operationName=='审核'>
                            <shiro:hasPermission name="order:return:audit">
                                <#if b.operationName??> <a href="#" onclick="openDialog('审核退换货', '/order/return/form?reverseId=${b.reverseId?c}&flag=91','800px', '500px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> ${b.operationName}通过</a></#if>
                            </shiro:hasPermission>

                            <shiro:hasPermission name="order:return:auditnot">
                                <#if b.operationName??> <a href="#" onclick="openDialog('审核退换货', '/order/return/form?reverseId=${b.reverseId?c}&flag=92','800px', '500px')" class="btn btn-danger btn-xs" ><i class="fa fa-trash"></i> ${b.operationName}不通过</a></#if>
                            </shiro:hasPermission>
                        </#if>
                        <#if b.operationName??&&b.operationName=='收货'>
                            <shiro:hasPermission name="order:return:confirmgoods">
                                <#if b.operationName??>  <a href="#" onclick="openDialog('审核收货', '/order/return/form?reverseId=${b.reverseId?c}&flag=93','800px', '500px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i>确认收到退货</a></#if>
                            </shiro:hasPermission>

                            <shiro:hasPermission name="order:return:confirmgoodsnot">
                                <#if b.operationName??> <a href="#" onclick="openDialog('审核收货', '/order/return/form?reverseId=${b.reverseId?c}&flag=94','800px', '500px')" class="btn btn-danger btn-xs" ><i class="fa fa-trash"></i>核验退货异常</a></#if>
                            </shiro:hasPermission>
                        </#if>
                    </td>
                </tr>
                </#list>
            </#if>
            </tbody>
        </table>

    <#include "../tabPage.ftl" >
        <br/>
        <br/>
    </div>
</div>