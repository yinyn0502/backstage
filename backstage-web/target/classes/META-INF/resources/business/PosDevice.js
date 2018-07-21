/**
 * Created by jinghao on 2018/6/7.
 */
/**
 * 条件查询
 */
$(document).ready(function () {
    var storeId = $("#echoStore").attr("echoStoreId");
    if (!checkParam(storeId)) {
        $('#storeId_' + storeId).attr("selected", true);
    }
});
deviceId = null;
function query() {
    var params = "";
    var id = $('#deviceId').val();
    var storeId = $('#storeIds').val();
    var posNo = $('#posNo').val();
    if (!checkParam(id)) params += "&id=" + id;
    if (!checkParam(storeId)) params += "&storeId=" + storeId;
    if (!checkParam(posNo)) params += "&posNo=" + posNo;
    window.location.href = "/bussiness/posManagement?pageNum=1&pageSize=10" + params;
}
function checkParam(param) {
    return param === null || param == undefined || param === "null" || param === "undefined" || param === ""
}
/**
 * 重置按钮
 */
function cleanBtn() {
    $('#storeIds').val('');
    $('#deviceId').val('');
    $('#posNo').val('');
}

/**
 * pos设备绑定门店
 */
function bindingPosStore() {
    var storeId = $('#storeIdsPop').val();
    if (!checkParam(deviceId) && !checkParam(storeId)) {
        $.ajax({
            type: "put",
            url: "/bussiness/bindingPosStore",
            dataType: "json",
            headers: {
                "Accept": "application/json",
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "put"
            },
            data: JSON.stringify({
                "id": deviceId,
                "storeId": storeId
            }),
            success: function (data) {
                if (!checkParam(data))
                    query();
                else
                    layer.msg('绑定失败，请稍后重试');
            },
            error: function () {
                layer.msg('绑定失败，请稍后重试');
            },
            complete: function () {
                deviceId = null;
            }
        });
    }
}
function show(id) {
    deviceId = id;
    $(".popupWarp").show();
}
function hiddenPop() {
    $(".popupWarp").hide();
}