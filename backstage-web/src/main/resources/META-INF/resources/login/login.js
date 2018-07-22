$(document).ready(function() {
    $("#loginForm").validate({
        rules: {
            validateCode: {remote: "/servlet/validateCodeServlet"}
        },
        messages: {
            username: {required: "请填写用户名."},password: {required: "请填写密码."},
            validateCode: {remote: "验证码不正确.", required: "请填写验证码."}
        },
        errorLabelContainer: "#messageBox",
        errorPlacement: function(error, element) {
            error.appendTo($("#loginError").parent());
        }
    });
});
// 如果在框架或在对话框中，则弹出提示并跳转到首页
if(self.frameElement && self.frameElement.tagName == "IFRAME" || $('#left').length > 0 || $('.jbox').length > 0){
    alert('未登录或登录超时。请重新登录，谢谢！');
    top.location = "";
}



$(document).ready(function() {
    $("#inputForm").validate({
        rules: {
            loginName: {remote: "/sys/user/validateLoginName"},
            mobile: {remote: "/sys/user/validateMobile"},
            randomCode: {

                remote:{

                    url:"/sys/register/validateMobileCode",

                    data:{
                        mobile:function(){
                            return $("#tel").val();
                        }
                    }

                }


            }
        },
        messages: {
            confirmNewPassword: {equalTo: "输入与上面相同的密码"},
            ck1: {required: "必须接受用户协议."},
            loginName: {remote: "此用户名已经被注册!", required: "用户名不能为空."},
            mobile:{remote: "此手机号已经被注册!", required: "手机号不能为空."},
            randomCode:{remote: "验证码不正确!", required: "验证码不能为空."}
        },
        submitHandler: function(form){
            loading('正在提交，请稍等...');
            form.submit();
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

    $("#resetForm").validate({
        rules: {
            mobile: {remote: "/sys/user/validateMobileExist"}
        },
        messages: {
            mobile:{remote: "此手机号未注册!", required: "手机号不能为空."}
        },
        submitHandler: function(form){
            loading('正在提交，请稍等...');
            form.submit();
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
    // 手机号码验证
    jQuery.validator.addMethod("isMobile", function(value, element) {
        var length = value.length;
        var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
        return (length == 11 && mobile.test(value));
    }, "请正确填写您的手机号码");



    $('#sendPassBtn').click(function () {
        if($("#tel_resetpass").val()=="" || $("#tel_resetpass-error").text()!=""){
            top.layer.alert("请输入有效的注册手机号码！", {icon: 0});//讨厌的白色字体问题
            return;

        }
        $("#sendPassBtn").attr("disabled", true);
        $.get("/sys/user/resetPassword?mobile="+$("#tel_resetpass").val(),function(data){
            if(data.success == false){
                top.layer.alert(data.msg, {icon: 0});//讨厌的白色字体问题
                //alert(data.msg);
                $("#sendPassBtn").html("重新发送").removeAttr("disabled");
                clearInterval(countdown);

            }

        });
        var count = 60;
        var countdown = setInterval(CountDown, 1000);
        function CountDown() {
            $("#sendPassBtn").attr("disabled", true);
            $("#sendPassBtn").html("等待 " + count + "秒!");
            if (count == 0) {
                $("#sendPassBtn").html("重新发送").removeAttr("disabled");
                clearInterval(countdown);
            }
            count--;
        }


    }) ;


    $('#sendCodeBtn').click(function () {
        if($("#tel").val()=="" || $("#tel-error").text()!=""){
            top.layer.alert("请输入有效的注册手机号码！", {icon: 0});//讨厌的白色字体问题
            return;

        }
        $("#sendCodeBtn").attr("disabled", true);
        $.get("/sys/register/getRegisterCode?mobile="+$("#tel").val(),function(data){
            if(data.success == false){
                //top.layer.alert(data.msg, {icon: 0});讨厌的白色字体问题
                alert(data.msg);
                $("#sendCodeBtn").html("重新发送").removeAttr("disabled");
                clearInterval(countdown);

            }

        });
        var count = 60;
        var countdown = setInterval(CountDown, 1000);
        function CountDown() {
            $("#sendCodeBtn").attr("disabled", true);
            $("#sendCodeBtn").html("等待 " + count + "秒!");
            if (count == 0) {
                $("#sendCodeBtn").html("重新发送").removeAttr("disabled");
                clearInterval(countdown);
            }
            count--;
        }


    }) ;

});

$(document).ready(function() {
    $(document).on('click', '.form-options a[data-target]', function(e) {
        e.preventDefault();
        var target = $(this).data('target');
        $('.widget-box.visible').removeClass('visible');//hide others
        $(target).addClass('visible');//show target
    });
});