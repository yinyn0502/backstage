<html>
<head>
    <title></title>
    <meta name="decorator" content="default"/>
<#include "../ahead.ftl">
<#include "../treeview.ftl" >
<#include "../treetable.ftl" >
    <link rel="stylesheet" href="/static/jquery-select2/3.4/select2.min.css"
          type="text/css">
</head>
<body class="hideScroll">
<form id="inputForm" modelAttribute="createActivityTO" action="/activity/create" method="post" class="form-horizontal">
    <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
        <tbody>
        <tr>
            <td  class="width-15" class="active"><label class="pull-right">活动类型:</label></td>
            <td class="width-35">
                <select name="activityType" id="activityType" required >
                    <option value="">-请选择-</option>
                    <option value="2">礼券活动</option>
                    <option value="4">领券活动</option>
                </select>
            </td>
            <td class="width-15" class="active"><label class="pull-right">礼券活动子类型:</label></td>
            <td class="width-35">
                <select name="activitySubType" id="activitySubType" style="width: 200px;" required>
                    <option value="">-请选择-</option>
                </select>
            </td>
        </tr>
        <tr>
            <td class="width-15" class="active"><label class="pull-right">活动名称：</label></td>
            <td class="width-35">
                <input name="activityName" htmlEscape="false" maxlength="50" class="form-control required"/>
            </td>

            </td>
            <td class="width-15" class="active"><label class="pull-right">活动副标题:</label></td>
            <td class="width-35">
                <input id="activitySubName" name="activitySubName" class="form-control required"/>
            </td>
        </tr>

        <tr>
            <td class="width-15" class="active"><label class="pull-right">活动门店:</label></td>
            <td class="width-35">
                <input id="storeId" name="storeId" class="form-control required"/>
            </td>
            <td class="width-15" class="active"><label class="pull-right">活动描述:</label></td>
            <td class="width-35">
                <input id="activityDescription" name="activityDescription" class="form-control required"/>
            </td>
        </tr>

        <tr>
            <td class="width-15" class="active"><label class="pull-right">活动维度类型:</label></td>
            <td class="width-35">
                <table class="table table-bordered">
                    <tr>
                        <td class="width-35">
                            <input type="radio" value="0" name="activityDimension" class="ace ace-switch ace-switch-4 btn-flat" />不限制活动维度
                            <input type="radio" value="1" name="activityDimension" class="ace ace-switch ace-switch-4 btn-flat" />限制活动维度
                        </td>
                    </tr>

                </table>

            </td>
            <#--<td class="width-15" class="active"><label class="pull-right">活动维度值:</label></td>-->
            <td class="width-35" colspan="2">
                <table id="dimensionValueTable" class="table table-bordered">

                    <tr>
                        <td class="width-15">
                            <input type="checkbox" value="2" name="dimensionType" class="ace ace-switch ace-switch-4 btn-flat"/>用户级别
                        </td>
                        <td class="width-35">
                            <input type="checkbox" value="0" name="memberLevel" class="ace ace-switch ace-switch-4 btn-flat"/>普通会员
                            <input type="checkbox" value="1" name="memberLevel" class="ace ace-switch ace-switch-4 btn-flat"/>家庭会员
                            <input type="checkbox" value="2" name="memberLevel" class="ace ace-switch ace-switch-4 btn-flat"/>企业会员
                        </td>
                    </tr>
                    <tr>
                        <td class="width-15">
                            <input type="checkbox" id="platform" value="1" name="dimensionType" class="ace ace-switch ace-switch-4 btn-flat"/>平台
                        </td>
                        <td class="width-35">
                            <input type="checkbox" id="ios"  value="0" name="platformValue" class="ace ace-switch ace-switch-4 btn-flat"/>IOS
                            <input type="checkbox" id="android"  value="1" name="platformValue" class="ace ace-switch ace-switch-4 btn-flat"/>ANDROID
                            <input type="checkbox" id="hfive"  value="2" name="platformValue" class="ace ace-switch ace-switch-4 btn-flat"/>H5
                            <input type="checkbox"  id="offline"  value="3" name="platformValue" class="ace ace-switch ace-switch-4 btn-flat"/>OFFLINE
                        </td>
                    </tr>
                    <tr>
                        <td class="width-15">
                            <input type="checkbox" value="3" name="dimensionType" class="ace ace-switch ace-switch-4 btn-flat"/>注册渠道
                        </td>
                        <td class="width-35">
                            <input id="registerChannel" name="registerChannel" class="form-control" style=""/>
                        </td>
                    </tr>
                </table>

            </td>
        </tr>


        <tr>
            <td class="width-15" class="active"><label class="pull-right">开始时间:</label></td>
            <td class="width-35">
                <input type="text" class="input-sm form-control " data-date-format="yyyy-mm-dd hh:ii:ss" id="startDate" name="startDate" readonly />

            </td>
            <td class="width-15" class="active"><label class="pull-right">结束时间:</label></td>
            <td class="width-35">
                <input type="text" class="input-sm form-control " data-date-format="yyyy-mm-dd hh:ii:ss" id="endDate" name="endDate" readonly />

            </td>
        </tr>

        <tr>
            <td class="width-15" class="active"><label class="pull-right">活动下单品列表:</label></td>
            <td class="width-35"><textarea name="activityProductIdList" htmlEscape="false" rows="3" maxlength="200" class="form-control "></textarea></td>
            <td class="width-15" class="active"><label class="pull-right">活动下例外品列表:</label></td>
            <td class="width-35"><textarea name="activityExceptProductIdList" htmlEscape="false" rows="3" maxlength="200" class="form-control "></textarea></td>
        </tr>
        <tr>
            <td class="width-15" class="active"><label class="pull-right">活动下分类类型</label></td>
            <td class="width-35">
                <input type="checkbox" name="activityGroupType" class="ace" value="1" />商品分类
                <input type="checkbox" name="activityGroupType" class="ace" value="2" />门店
            </td>
            <td class="width-15" class="active"><label class="pull-right">活动下分类值</label></td>
            <td class="width-35">
                商品分类：<textarea name="activityCategoryGroupValue" htmlEscape="false" rows="3" maxlength="200"
                          class="form-control" value="请输入商品分类"
                          onfocus="this.value=''" onblur="if(this.value==''){this.value='请输入商品分类'}" ></textarea>

                门店：<textarea name="activityStoreGroupValue" htmlEscape="false" rows="3" maxlength="200"
                          class="form-control" value="请输入门店"
                          onfocus="this.value=''" onblur="if(this.value==''){this.value='请输入门店'}" ></textarea>

            </td>
        </tr>
        <tr>
            <td class="width-15" class="active"><label class="pull-right">活动下例外组类型:</label></td>
            <td class="width-35"><input type="radio" name="activityExceptGroupType" class="ace" value="1" />商品分类</td>
            <td class="width-15" class="active"><label class="pull-right">活动下例外组值:</label></td>
            <td class="width-35"><textarea name="activityGroupValue" htmlEscape="false" rows="3" maxlength="200" class="form-control "></textarea></td>
        </tr>



</form>
<script src="/static/jquery-select2/3.4/select2.min.js"></script>
<script type="text/javascript">
    var validateForm;
    function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
        if(validateForm.form()){
            $("#inputForm").submit();
            return true;
        }
        return false;
    }
    $(document).ready(function() {
        $('#startDate').datetimepicker({
            format: 'yyyy-mm-dd hh:ii:ss',
            autoclose: true,
            minView: 0,
            minuteStep:1
        });
        $( "#endDate" ).datetimepicker({
            format: 'yyyy-mm-dd hh:ii:ss',
            autoclose: true,
            minView: 0,
            minuteStep:1
        });
        //绑定分类下拉框选项变化事件
        $("#activityType").on('change',
                function () {
                    var activityType = $(this).val();
                    $('#activitySubType').val('').trigger('change');

                    if (activityType == '') {
                        $("#activitySubType").empty().append('<option value="" >-请选择-</option>');
                        return;
                    }

                    var activitysMap = {};
                    if (activityType == '2') {
                        var activitysMap = {
                            '1':'商品券','2':'现金券','3':'运费券',
                        };
                    } else if (activityType == '4') {
                        var activitysMap = {
                            '1':'新人大礼包','2':'会员升级大礼包','3':'领券活动子类型',
                        };
                    }


                    var option = "";
                    for (var i in activitysMap) {
                        option += '<option value="' + i + '"  >' + activitysMap[i] + '</option>';
                    }

                    $("#activitySubType").empty().append('<option value="" >-请选择-</option>'+option);


                });

        validateForm = $("#inputForm").validate({
            submitHandler: function(form){
                loading('正在提交，请稍等...');
                form.submit();
                closeTip();
            }
        });
    });

    //控制platform的显示
    var flag = 0;
    //全选/全不选
    $('#platform').click(function(){
        if(this.checked){
            $("[name=platformValue]:checkbox").attr('checked',true);
            flag=4;
        }else {
            $("[name=platformValue]:checkbox").attr('checked',false);
            flag=0;
        }
    });
    //选中ios
   $("#ios").click(function(){
            if(this.checked){
                $("#android").attr("checked",true);
                flag = flag+2;
            }else {
                $("#android").attr("checked",false);
                flag = flag-2;
            }
        checkedisnull(flag);
       });
   //选中android
    $("#android").click(function(){
        if(this.checked){
            $("#ios").attr("checked",true);
            flag = flag+2;
        }else {
            $("#ios").attr("checked",false);
            flag = flag-2;
        }
        checkedisnull(flag);
    });
//选中H5
    $("#hfive").click(function(){
        if(this.checked){
            flag = flag+1;
        }else {
            flag = flag-1;
        }
        checkedisnull(flag);
    });
    //选中线下
    $("#offline").click(function(){
        if(this.checked){
            flag = flag+1;
        }else {
            flag = flag-1;
        }
        checkedisnull(flag);
    });

    //子复选框是否有选中的
    function checkedisnull(flag) {
        if (flag==0){
            $('#platform').attr("checked",false);
        }else {
            $('#platform').attr("checked",true);
        }
    }


</script>
</body>
</html>