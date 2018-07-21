/**
 * 页面载入事件
 */
$(document).ready(function(e) {
});

/**
 * 获取地址栏参数值
 */
function getUrlParam(name){
    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
    if (r!=null) return unescape(r[2]); return ""; //返回参数值
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

/**
 * 刷新当前页面.
 */
function refresh(){
  window.location.reload();
};

/**
 * 条件查询事件
 */
function query(){
    var mobile = $("#mobile").val();
    var cardNo = $("#cardNo").val();
    var storeId = $("#storeId").val();
    mobile = judgeParam(mobile);
    cardNo = judgeParam(cardNo);
    storeId = judgeParam(storeId);
    if( mobile != "" || cardNo != "" || storeId != ""){
        window.location.href = "/member/list/info?pageNum=1&pageSize=10&mobile="+mobile+"&cardNo="+cardNo+"&storeId="+storeId;
    }else{
        window.location.href = "/member/list/info?pageNum=1&pageSize=10";
    }
}

/**
 * 新增会员
 */
function add(){
    openDialog("详情"+'会员',"/member/to/register","800px", "625px","");
}

/**
 * 会员详情
 */
function detail(memberId){
    var pageSize = getUrlParam("pageSize");
    var pageNum = getUrlParam("pageNum");
    var mobile = getUrlParam("mobile");
    var cardNo = getUrlParam("cardNo");
    openDialog("详情"+'会员',"/member/info?memberId="+memberId+"&pageSize="+pageSize+"&pageNum="+pageNum+"&mobile="+mobile+"&cardNo="+cardNo,"800px", "625px","");
}

/**
 * 退卡
 */
function retreatCard(memberId){
    $.ajax({
        url: "/member/card/retreat",
        type: "put",
        dataType:"json",
        data:{
               "memberId":memberId==null?"":memberId
           },
        async: false,
        success: function (data) {
            if ( data != null ) {
                if( data =true ){
                    refresh();
                    alert("退卡成功!");
                }else{
                    alert("退卡失败!");
                }
            }
        },
        error: function () {
        }
    });
}