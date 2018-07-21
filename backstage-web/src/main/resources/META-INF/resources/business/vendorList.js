/**
 * 条件查询
 */
function query() {

    var flg = $('#searchForm').validate().form();
    if (!flg){
        return;
    }
    //供应商id
    var vendorId = $('#vendorId').val();

    //供应商名称
    var vendorName = $('#vendorName').val();
    if (!vendorName && !vendorId){
        layer.alert('请至少输入一个查找条件', {icon: 2});
        return;
    }

    window.location.href = "/bussiness/vendorList?vendorName="+vendorName+"&vendorId="+vendorId;

    // getVendorList(vendorName, vendorId);
}

/**
 * 重置查询条件
 */
function cleanBtn() {
    $('#vendorId').val('');
    $('#vendorName').val('');
}

/**
 * 开通商户
 * @param storeId
 * @param venderId
 */
function activate(storeId, venderId) {

    layer.confirm('确定要开通商户吗？', {
        btn: ['确定','取消'] //按钮
    }, function(){

        $.get("/bussiness/activateMerchant",{"storeId":storeId,"venderId":venderId},function (data) {
            if (data.code == 0 ) {
                layer.msg('开通成功！', {icon: 1},function () {
                    var vendorName = $('#vendorName').val();
                    var vendorId = $('#vendorId').val();
                    window.location.href = "/bussiness/vendorList?vendorName="+vendorName+"&vendorId="+vendorId;
                });

            }else {
                layer.msg('开通失败！', {icon: 5});
            }

        });
    }, function(){

    });

}

$(function () {

    $("#searchForm").validate({
        rules:{
            vendorId:{digits :true}
        },
        messages:{
            vendorId:{digits :"请输入有效数字"}
        }
    });
});