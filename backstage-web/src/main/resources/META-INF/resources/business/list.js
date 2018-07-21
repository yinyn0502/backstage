/**
 * 条件查询
 */
function query() {
    var flg = $('#searchForm').validate().form();
    if (!flg){
        return;
    }
    //门店id
    var storeId = $('#storeIds').val();
    if (!storeId) {
        layer.tips('请选择对应门店', $('#storeIds'), {tips: [2,'#ba081d']});
        return;
    }
    //商户状态
    var businessStatus = $('#businessStatus').val();
    if (!businessStatus) {
        layer.tips('请选择状态', $('#businessStatus'), {tips: [2,'#ba081d']});
        return;
    }

    //商户名称
    var businessName = $('#businessName').val();

    //商户id
    var businessId = $('#businessId').val();
    getData(storeId, businessStatus, businessName, businessId);


}

/**
 * 重置按钮
 */
function cleanBtn() {
    $('#storeIds').val('');
    $('#businessName').val('');
    $('#businessId').val('');
    $('#businessStatus').val('');
}

function tipsBtn(index) {
    var tips = "";
    if (index == 0 ) {
        tips = "如需再次开通商家，请在erp操作开通对应供应商";
    } else {
        tips = '如需关闭商家，请在erp操作关闭对应供应商';
    }
    layer.alert(tips);
}

/**
 * 获取数据列表
 */
function getData(storeId, status, businessName, businessId) {
    if (!storeId || !status ) {
        return;
    }
    var storeName = $("#storeIds option:selected").text();

    $.get("/bussiness/getBusinessList", {
            "storeId":storeId,
            "status":status,
            "businessName":businessName,
            "businessId":businessId
    }, function (data) {
        if (data && data.data) {
            var list = data.data.merchantList;
            var content = "";
            if (list.length > 0) {
                for(var i = 0; i < list.length; i++) {
                    var item = list[i];
                    var status = "";
                    switch(item.status){
                        case 0:
                            status = '关闭';
                            break;
                        default:status = '正常';
                    }
                    content += "<tr><td>"+(i+1)+"</td>" +
                        "<td>"+storeName+"</td>" +
                        "<td>"+item.id+"</td>" +
                        "<td>"+item.merchantName+"</td>" +
                        "<td>"+status+"<button onclick='tipsBtn("+item.status+")' id='tipsBtn_'"+i+" style='margin-left: 7px;border-radius:14px;width:25px;height: 24px;background:black;color:white'>?</button></td><td>"+item.createTime+"</td><td>"+item.createdBy+"</td>" +
                        "<td>"+item.updatedBy+"</td>" +
                        "<td>"+item.updateTime+"</td></tr>";
                }
                $('#nodata').css('display', 'none');
            }else {
                $('#nodata').css('display', '');
            }
            $('#content').html(content);
        }
    });
}


/**
 * 开通新商户
 */
function add() {
    window.location.href = "/bussiness/vendorList";

}

$(function () {

    $("#searchForm").validate({
        rules:{
            businessId:{digits :true}
        },
        messages:{
            businessId:{digits :"请输入有效数字"}
        }
    });
});