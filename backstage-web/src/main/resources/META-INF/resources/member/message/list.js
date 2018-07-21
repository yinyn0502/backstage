/**
 * 页面载入事件
 */
$(document).ready(function(e) {
    $('#strStartDate').datetimepicker({
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
    $('#strEndDate').datetimepicker({
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
    //重置
    $("#reset").click(function(){
        $("#strStartDate").val("");
        $("#strEndDate").val("");
        $("#appType").find("option[value='2']").attr("selected",true);
        $("#searchForm").submit();
    });
});

///**
// * 获取地址栏参数值
// */
//function getUrlParam(name){
//    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
//    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
//    if (r!=null) return unescape(r[2]); return null; //返回参数值
//}
//
/**
 * 参数校验
 */
function judgeParam(param){
    if( param == null || param == "null" ){
        return "";
    }
    return param;
}
//
///**
// * 刷新当前页面.
// */
//function refresh(){
//  window.location.reload();
//};
//


/**
 * 新增会员
 */
function add(){
    openDialog("新增"+'push',"/message/toEdit","800px", "625px","");
}

/**
 * 会员详情
 */
function detail(id){
    openDialog("详情"+'push',"/message/detail?id="+id,"800px", "625px","");
}

