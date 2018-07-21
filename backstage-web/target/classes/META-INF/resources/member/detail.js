/**
 * 页面载入事件
 */
$(document).ready(function(e) {
});

/**
 * 校验并提交
 */
function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
    $("#inputForm").submit();
    return true;
}
/**
 * 参数校验
 */
function judgeParam(param){
    if( param == null || param == "null" ){
        return "";
    }
    return param;
}

