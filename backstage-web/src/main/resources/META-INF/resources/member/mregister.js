var cardStatus = 0;
var memberIsOk = true;
/**
 * 页面载入事件
 */
$(document).ready(function(e) {
    trigger();
    $('#familyDay').datetimepicker({
        format: 'mm-dd',
         weekStart: 1,
         autoclose: true,
         startView: 2,
         minView: 2,
         forceParse: false,
         language: 'zh-CN'
    });
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

    $('#startTime').datetimepicker({
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

    $('#endTime').datetimepicker({
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


    $('#auditStartTime').datetimepicker({
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

    $('#auditEndTime').datetimepicker({
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
    validateForm = $("#inputForm").validate({
        submitHandler: function(form){
            loading('正在提交，请稍等...');
            form.submit();
            closeTip();
        }
    });
});

function trigger(){
    $("#mobile").change(function(){
         var mobile = $("#mobile").val();
         if( isNullOrEmpty(mobile) ){
             alert("请输入手机号!");
         }else{
            if( mobile.length == 11 ){
               getMemberInfo(mobile);
            }else{
               alert("请输入正确的手机号!")
            }
         }
    });
    $("#cardNo").change(function(){
         var cardNo = $("#cardNo").val();
         if( isNullOrEmpty(cardNo) ){
             alert("请输入会员卡号!");
         }else{
            if( cardNo.length == 8 ){
               getMemberCardInfo(cardNo);
            }else{
               alert("请输入正确的会员卡号!")
            }
         }
    });
}

function determineOpen(){
    $(".layui-layer-btn0").attr("href","");
}
function determineClose(){
    $(".layui-layer-btn0").attr("href","javascript:return false;");
}

/**
 * 获取member信息
 */
function getMemberInfo(mobile){
    $.ajax({
        url: "/member/save/query/info?mobile="+mobile,
        type: "get",
        dataType:"json",
        async: false,
        success: function (data) {
            if( data != null ){
                if( data.cardNo != null ){
                    $("#familyDayType").find("option[value='0']").attr("selected",true);
                    $("#familyDayType").attr("disabled",false);
                    $("#identityNo").val("");
                    $("#familyDay").val("");
                    $("#familyDay").attr("disabled",false);
                    $("#userName").val("");
                    determineClose();
                    alert("用户已绑定会员卡!");
                    memberIsOk = false;
                }else{
                    memberIsOk = true;
                    $("#familyDayType").attr("disabled",false);
                    $("#familyDay").attr("disabled",false);
                    if( data.userName != null && data.userName != "" ){
                        $("#userName").val(data.userName);
                    }else{
                        $("#userName").val("");
                    }
                    if( data.identityNo != null && data.identityNo != "" ){
                        $("#identityNo").val(data.identityNo);
                    }else{
                        $("#identityNo").val("");
                    }
                    if( data.familyDayType != null ){
                        $("#familyDayType").find("option[value='"+data.familyDayType+"']").attr("selected",true);
                        $("#familyDayType").attr("disabled",true);
                        $("#familyDay").val(data.familyDay);
                        $("#familyDay").attr("disabled",true);
                    }else{
                        $("#familyDay").val("");
                        $("#familyDayType").find("option[value='0']").attr("selected",true);
                    }
                }
            }else{
                memberIsOk = true;
            }
        },
        error: function () {
        }
    });
}

/**
 * 获取member信息
 */
function getMemberCardInfo(cardNo){
    $.ajax({
        url: "/member/card/detail?cardNo="+cardNo,
        type: "get",
        dataType:"json",
        async: false,
        success: function (data) {
            if( data != null ){
                if( data.memberId != null ){
                    cardStatus = 1;
                    alert("此会员卡已绑定过会员!");
                }else{
                    cardStatus = 0;
                    if( data.cardLevel != null ){
                        $("#cardLevel").text(data.cardLevel);
                    }
                }
            }else{
                cardStatus = 2;
                alert("请输入正确的会员卡号!");
            }
        },
        error: function () {
        }
    });
}

///**
// * 检查会员名称
// */
//function checkMemberName(userName){
//    $.ajax({
//        url: "/member/check/name",
//        type: "GET",
//        dataType:"json",
//        async: false,
//        data:{
//            "userName":userName
//        },
//        success: function (data) {
//            if( data != null ){
//                if( data == true ){
//                    $("#userNameFont").text("该用户名已存在").css("color","red");
//                }else{
//                    $("#userNameFont").text("√").css("color","green");
//                }
//            }else{
//                alert("系统异常!");
//            }
//        },
//        error: function () {
//        }
//    });
//}
function isNullOrEmpty(value){
    if( value == '' || value == 'null' || value == null ){
        return true;
    }
    return false;
}
/**
 * 校验并提交
 */
function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
    if(validateForm.form()){
        var mobile = $("#mobile").val();
        var identityNo = $("#identityNo").val();
        var cardNo = $("#cardNo").val();
        var strStartTime = $("#strStartTime").val();
        var storeId = $("#storeId").val();
        if( isNullOrEmpty(mobile) ){
            alert("请输入手机号!");
            return false;
        }
        if( isNullOrEmpty(storeId) ){
            alert("请选择门店!");
            return false;
        }
        if( mobile.length != 11 ){
            alert("请输入正确的手机号!")
            return false;
        }
        if( !memberIsOk ){
            alert("该用户已绑定会员卡!");
            return false;
        }
        if( isNullOrEmpty(identityNo) ){
            alert("请输入身份证号!");
            return false;
        }
        if( isNullOrEmpty(cardNo) ){
            alert("请输入会员卡号!");
            return false;
        }
        if( cardNo.length != 8 ){
            alert("请输入正确的会员卡号!")
            return false;
        }
        if( cardStatus == 1 ){
            alert("此会员卡已绑定过会员!");
            return false;
        }else if( cardStatus == 2 ){
            alert("请输入正确的会员卡号!");
            return false;
        }
        if( isNullOrEmpty(strStartTime) ){
            alert("请输入会员生效日!")
            return false;
        }
        $("#inputForm").submit();
        return true;
    }
    return false;
}