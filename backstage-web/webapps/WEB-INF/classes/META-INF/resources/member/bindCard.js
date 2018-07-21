var validateForm;
/**
 * 页面载入事件
 */
$(document).ready(function(e) {
    $('#brithday').datetimepicker({
         format: 'yyyy-mm-dd',
         weekStart: 1,
         autoclose: true,
         startView: 2,
         minView: 2,
         forceParse: false,
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

/**
 * 校验并提交
 */
function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
    if(validateForm.form()){
        $("#inputForm").submit();
        return true;
    }
    return false;
}