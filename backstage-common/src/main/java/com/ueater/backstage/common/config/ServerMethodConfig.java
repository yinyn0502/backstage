package com.ueater.backstage.common.config;

/**
 * @author liutao
 * @version 1.0.0
 * @date 2017/11/8 19:35
 */
public class ServerMethodConfig {

    //purchasing-process interface
    public static class MApi {
        //ActivityController
        public static String MAPI_ACTIVITY_QUERY_PRODUCT_BY_ACTIVITYID = "mapi.activity.queryProductByActivityId";//查询活动下的商品列表
        public static String MAPI_ACTIVITY_AVAILABLE_COUNT = "mapi.activity.availableCount";//

        //AddressBookController
        public static String MAPI_MEMBER_ADDRESSBOOK_lIST = "mapi.member.addressBook.list";//根据用户id获取多个地址
        public static String MAPI_MEMBER_ADDRESSBOOK_ID_DETAIL = "mapi.member.addressBook.id.detail";//根据用户id获取地址详情
        public static String MAPI_MEMBER_ADDRESSBOOK_LATELYORDER_ = "mapi.member.addressBook.latelyOrder";//根据用户id获取最近下单地址
        public static String MAPI_MEMBER_ADDRESSBOOK_POST = "mapi.member.addressBook.post";//添加地址
        public static String MAPI_MEMBER_ADDRESSBOOK_PUT = "mapi.member.addressBook.put";//修改地址
        public static String MAPI_MEMBER_ADDRESSBOOK_ID = "mapi.member.addressBook.id";//删除地址
        public static String MAPI_MEMBER_ADDRESSBOOK_DEFAULTADDRESS_ID = "mapi.member.addressBook.defaultAddress.id";//修改默认地址
        public static String MAPI_MEMBER_ADDRESSBOOK_STORE = "mapi.member.addressBook.store";//根据定位获得地址和店铺

        //AppVersionController
        public static String MAPI_APP_VERSION = "mapi.appversion";//

        //CartController
        public static String MAPI_CART_CHECK_PUT = "mapi.cart.check.put";//购物车商品勾选
        public static String MAPI_CART_UNCHECK = "mapi.cart.uncheck";//购物车商品取消勾选
        public static String MAPI_CART_ITEM_COUNT_PUT = "mapi.cart.itemCount.put";//更新购物车商品数量
        public static String MAPI_CART_GET = "mapi.cart.get";//查询购物车
        public static String MAPI_CART_ITEMS = "mapi.cart.items";//加车
        public static String MAPI_CART_ITEM_COUNT_GET = "mapi.cart.itemCount.get";//查询购物车商品数量
        public static String MAPI_CART_DELTTE = "mapi.cart.delelte";//删除购物车商品
        public static String MAPI_CART_CHECK_GET = "mapi.cart.check.get";//结算前检查

        //CheckoutController
        public static String MAPI_CHECKOUT_GET = "mapi.checkout.get";//查看结算单
        public static String MAPI_CHECKOUT_ADDRESSBOOK = "mapi.checkout.addressBook";//保存地址本
        public static String MAPI_CHECKOUT_DELIVERYTYPEANDTIME = "mapi.checkout.deliveryTypeAndTime";//保存配送时间
        public static String MAPI_CHECKOUT_ORDER = "mapi.checkout.order";//结算下单
        public static String MAPI_CHECKOUT_COUPON_CHOOSE = "mapi.checkout.coupon.choose";//结算，礼券中心，选择礼券
        public static String MAPI_CHECKOUT_COUPON_UNCHOOSE = "mapi.checkout.coupon.unchoose";//结算，礼券中心，取消选择
        public static String MAPI_CHECKOUT_CREATE = "mapi.checkout.create";//餐厅订单创建接口
        public static String MAPI_CHECKOUT_SHOW = "mapi.checkout.show";//展示餐厅结算单
        public static String MAPI_CHECKOUT_CREDITS_CHECK = "mapi.checkout.credits.check";//结算页选择使用积分
        public static String MAPI_CHECKOUT_CREDITS_UNCHECK = "mapi.checkout.credits.uncheck";//结算页取消使用积分

        //CmsController
        public static String MAPI_CMS_GETHOMEPAGELABLE = "mapi.cms.getHomePageLabel";//
        public static String MAPI_CMS_GETUPGRADEVERSION = "mapi.cms.getUpgradeVersion";//

        //CouponDistributeController
        public static String MAPI_COUPON_DISTRIBUTE_RECEIVE = "mapi.coupon.distribute.receive";//

        //CreditsController
        public static String MAPI_CREDITS_COUNT_QUERY = "mapi.credits.count.query";//
        public static String MAPI_CREDITS_DETAIL_PAGE_QUERY = "mapi.credits.detail.page.query";//

        //DateController
        public static String MAPI_CURRENTTIME = "mapi.currentTime";//

        //ImageController
        public static String MAPI_IMAGE_RELATION = "mapi.image.relation";//

        //LoginController
        public static String MAPI_MEMBER_LOGIN = "mapi.member.login";//登陆
        public static String MAPI_MEMBER_LOGOUT = "mapi.member.logout";//登出
        public static String MAPI_MEMBER_VERIFYCODE = "mapi.member.verifyCode";//发送验证码
        public static String MAPI_SESSION = "mapi.session";//生成新session

        //MemberController
        public static String MAPI_MEMBER_BASWINFO = "mapi.member.baseinfo";//会员基本信息
        public static String MAPI_MEMBER_DEVICEINFO = "mapi.session.deviceInfo";//查询用户同时登陆的设备(消息推送的时候需要知道用户同时登陆的设备)
        public static String MAPI_MEMBER_PERSONAL_COUPON = "mapi.coupon.personalCoupon";//个人中心展示礼劵
        public static String MAPI_MEMBER_ISNEWMEMBER = "mapi.member.isNewMember";//查看是否是新会员
        public static String MAPI_MEMBER_PERFECT = "mapi.member.perfect";//修改会员信息
        public static String MAPI_MEMBER_WECHAT_TOKEN = "mapi.member.wechat.token";//获取微信token

        //MessageController
        public static String MAPI_MESSAGE_JPUSH = "mapi.message.jpush";//

        //OrderController
        public static String MAPI_ORDER_DETAIL = "mapi.order.detail";//订单详情
        public static String MAPI_ORDER_LIST = "mapi.order.list";//订单列表
        public static String MAPI_ORDER_STATUS_NUMBER = "mapi.order.status.number";//获取各个状态的订单数量
        public static String MAPI_ORDER_CANCEL = "mapi.order.cancel";//取消订单
        public static String MAPI_ORDER_CONFIRM_RECEIPT = "mapi.order.confirmReceipt";//确认收货
        public static String MAPI_PAYORDER = "mapi.payOrder";//查询订单要支付金额
        public static String MAPI_ORDER_FLOW = "mapi.order.flow";//订单跟踪流程查询
        public static String MAPI_ORDER_ISPAIDSUCCESS = "mapi.order.isPaidSuccess";//查询订单支付状态(餐厅订单)
        public static String MAPI_ORDER_PAYMENTTYPE_SAVE = "mapi.order.paymentType.save";//保存支付方式(收银台调用)
        public static String MAPI_ORDER_PICKUP = "mapi.order.pickup";//客服确认，已取货

        //PaymentController
        public static String MAPI_PAYMENT_WECHAT_UNIFIEDORDER = "mapi.payment.wechat.unifiedorder";//微信统一下单
        public static String MAPI_PAYMENT_WECHAT_ORDER = "mapi.payment.wechat.order";//微信查询订单支付结果
        public static String MAPI_PAYMENT_WECHAT_CLOSEORDER = "mapi.payment.wechat.closeorder";//关闭支付订单
        public static String MAPI_PAYMENT_REFUND = "mapi.payment.refund";//申请退款（微信和支付宝统一调用）
        public static String MAPI_PAYMENT_WECHAT_REFUND_GET = "mapi.payment.wechat.refund.get";//查询退款
        public static String MAPI_PAYMENT_ALIPAY_SIGN_ORDER = "mapi.payment.alipay.sign.order";//支付宝得到签名后的订单
        public static String MAPI_PAYMENT_ALIPAY_VERIFY_ORDER = "mapi.payment.alipay.verify.order";//支付宝支付成功后确认支付有效性
        public static String MAPI_PAYMENT_LICHU_JSPAY_POST = "mapi.payment.lichu.jspay.post";//利楚公众号支付生成预付单
        public static String MAPI_PAYMENT_LICHU_jSPAY_GET = "mapi.payment.lichu.jspay.get";//利楚查询支付结果
        public static String MAPI_PAYMENT_CASHIER = "mapi.payment.cashier";//收银台展示
        public static String MAPI_PAYMENT_NOCASH_PAYEDORDER = "mapi.payment.noCashayedOrder";//支付成功页无现金支付的订单查询

        //PriceController
        public static String MAPI_PRICE_CALCULATEPRICE = "mapi.price.calculatePrice";//

        //ProductController
        public static String MAPI_PRODUCT_PRODUCTID_BASEINFO = "mapi.product.productId.baseInfo";//查询商品基本信息
        public static String MAPI_PRODUCT_DETAIL = "mapi.product.detail";//商品详情信息
        public static String MAPI_PRODUCT_INDUSTRYCATEGORY_LIST = "mapi.product.industryCategory.list";//分类列表信息
        public static String MAPI_PRODUCT_INDUSTRYCATEGORY_CATEGORYID_LIST = "mapi.product.industryCategory.categoryId.list";//分类下商品列表
        public static String MAPI_PRODUCT_CHECK_SHARE = "mapi.product.check.share";//检查分享商品和当前门店商品的变化

        //ReverseOrderController
        public static String MAPI_REVERSE_PRE_SHOW = "mapi.reverse.pre.show";//退换货申请展示
        public static String MAPI_REVERSE_ORDER_SAVE = "mapi.reverse.order.save";//退换货申请提交
        public static String MAPI_REVERSE_ORDER_RECPRDS = "mapi.reverse.order.records";//售后页展示接口
        public static String MAPI_REVERSE_CANCEL = "mapi.reverse.cancel";//申请单取消
        public static String MAPI_REVERSE_DELETE = "mapi.reverse.delete";//申请单删除
        public static String MAPI_REVERSE_DETAIL = "mapi.reverse.detail";//查看逆向单详情
        public static String MAPI_REVERSE_APPLY_RECORDS = "mapi.reverse.apply.records";//查询该用户所有退换货申请记录
        public static String MAPI_REVERSE_APPLY_ORDER_LIST = "mapi.reverse.apply.order.list";//查询可申请退换货订单列表
        public static String MAPI_REVERSE_FLOW = "mapi.reverse.flow";//退换单跟踪流程查询
        public static String MAPI_REVERSE_IMAGE_UPLOAD = "mapi.reverse.image.upload";//退换货申请图片上传
        public static String MAPI_REVERSE_PRODUCT_AMOUNT = "mapi.reverse.product.amount";//申请单填写页商品金额计算
        public static String MAPI_REVERSE_CONFIRMRECEIPT = "mapi.reverse.confirmReceipt";//用户确认收货
        public static String MAPI_REVERSE_ORDER_PASS = "mapi.reverse.order.pass";//逆向单审核通过
        public static String MAPI_REVERSE_PREORDER_REFUSE = "mapi.reverse.order.refuse";//逆向单审核不通过
        public static String MAPI_REVERSE_REFUND_PASS = "mapi.reverse.refund.pass";//退款审核通过
        public static String MAPI_REVERSE_REFUND_REFUSE = "mapi.reverse.refund.refuse";//退款审核拒绝
        public static String MAPI_REVERSE_RECEIVEGOODS_CONFIRM = "mapi.reverse.receiveGoods.confirm";//退货单 客服 确认收货
        public static String MAPI_REVERSE_RECEIVEGOODS_DENY = "mapi.reverse.receiveGoods.deny";//退货单 客服 未收货

        //StoreController
        public static String MAPI_STORE_ADDRESS_DELIVERY_CHECK = "mapi.store.address.delivery.check";//根据坐标，返回可配送店铺id
        public static String MAPI_STORE_AREA_LIST = "mapi.store.area.list";//获取可配送地址列表
        public static String MAPI_STORE_LIST = "mapi.store.list";//获取门店列表

        //ZKController
        public static String MAPI_CLIENT_CONFIG = "mapi.client.config";//
    }

    public static class CartApi {

        public static String CART_SHOW = "cart.show";

        public static String CART_ADD_ITEMS = "cart.add.items";

        public static String CART_GET_ITEMS_COUNT = "cart.get.items.count";

        public static String CART_UPDATE_ITEMS_COUNT = "cart.update.items.count";

        public static String CART_DELETE_ITEMS = "cart.delete.items";

        public static String CART_CHECK_ITEMS = "cart.check.items";

        public static String CART_UNCHECK_ITEMS = "cart.uncheck.items";

        public static String CART_ITEMS_CHECK = "cart.items.check";

        public static String CART_GET_CHECKED_ITEMS = "cart.get.checked.items";

        public static String CART_MERGE = "cart.merge";

    }

    public static class CheckoutApi {
        public static String CHECKOUT_STATUS_PULLED = "checkout.status.pulled";
        public static String CHECKOUT_PULL = "checkout.pull";
        public static String CHECKOUT_CREATE = "checkout.create";
        public static String CHECKOUT_SHOW = "checkout.show";
        public static String CHECKOUT = "checkout";
        public static String CHECKOUT_ADDRESSBOOK = "checkout.addressBook";
        public static String CHECKOUT_DELIVERYTYPEANDTIME = "checkout.deliveryTypeAndTime";
        public static String CHECKOUT_ORDER = "checkout.order";
        public static String CHECKOUT_NOPAY = "checkout.nopay";
        public static String CHECKOUT_ITEMS = "checkout.items";
        public static String CHECKOUT_COUPON_CHOOSE = "checkout.coupon.choose";
        public static String CHECKOUT_COUPON_UNCHOOSE = "checkout.coupon.unchoose";
        public static String CHECKOUT_CREDITS_CHECK = "checkout.credits.check";
        public static String CHECKOUT_CREDITS_UNCHECK = "checkout.credits.uncheck";
        public static String CHECKOUT_INVOICE_SAVE = "checkout.invoice.save";
        public static String CHECKOUT_INVOICEINFO = "checkout/invoiceInfo";
    }

    public static class OrderApi {
        public static String GET_ORDER = "order.detail";//订单详情
        public static String ORDER_LIST = "order.list";//订单列表
        public static String ORDER_STATUS_NUMBER = "order.status.number";//订单各个状态的订单数量
        public static String ORDER_PAY_GET = "order.pay.get";//得到待付款订单的支付信息
        public static String ORDER_POS = "order.pos";//pos 订单回传
        public static String ORDER_ORDERID = "order.orderId";//pos用billid查orderId
        public static String ORDER_PRE_POST = "order.pre.post";//用户线下第一次登录，pos调用，生成orderId
        public static String ORDER_PRE_PUT = "order.pre.put";//针对pos调用,更新memberId和token
        public static String ORDER_TOKEN = "order.token";//针对pos调用,获取token,若member_id有改变,更新order表member_id
        public static String ORDER_FLOW = "order.flow";//订单跟踪流程查询
        public static String ORDER_APPORTIONITEM = "order.apportionItem";//根据itemId查对应的分摊信息
        public static String ORDER_PRODUCTSINFO = "order.productsInfo";//reverse获取订单商品及分摊信息
        public static String ORDER_HASFINISHORDER = "order.hasFinishOrder";//查询用户是否有成功的订单
        public static String ORDER_REALEXPRESSCHARGE = "order.realExpressCharge";//获取订单用户实际付的运费
        public static String ORDER_PUSH_ERP = "order.push.erp";//订单推送erp
        public static String ORDER_OUTINVENTORY = "order.outinventory";//报缺分摊
        public static String ORDER_NOCASHPAYEDORDER = "order.noCashPayedOrder";//查询支付订单信息(全部为优惠抵扣,无现金支付的订单)
        public static String ORDER_PAYMENTTYPE_SAVE = "order.paymentType.save";//保存订单支付方式（收银台）
        public static String ORDER_TYPE = "order.type";//查询订单类型(查询支付结果需返回订单类型)
        public static String ORDER_RESTAURANT_PAYSTATUS = "order.restaurant.payStatus";//查询订单支付状态(餐厅订单)
        public static String ORDER_LOGISTICS_ORDERINFO = "order.logistics.orderInfo";//查询订单信息(物流调用获取基础信息创建物流单)
        public static String ORDER_CREDITS_DETAIL = "order.credits.detail";//查询订单积分明细
        public static String ORDER_PRODUCTIDS = "order.getProductIds";//通过orderId集合查询对应的productId(供reverseOrder使用)
        public static String ORDER_GETITEMINFO = "order.getItemInfo";//根据orderId查询订单明细信息
        public static String ORDER_QUERYSTATUSANDTYPE = "order.queryStatusAndType";//查询订单的状态和类型


        public static String ORDER_MQ_CREATEORDER = "order.mq.createOrder";//新订单产生消息


        public static String ORDER_BACKSTAGE_LIST = "order.backStage.list";//订单后台查询列表
        public static String ORDER_BACKSTAGE_DETAIL = "order.backStage.detail";//订单后台查询订单详情


        public static String ORDER_NEWORDER = "order.newOrder";//查询新订单（未支付订单）
        public static String ORDER_QUERYCANAPPLYREVERSEORDER = "order.queryCanApplyReverseOrder";//查询可以申请退换货订单
        public static String ORDER_CONFIRMRECEIPT = "order.confirmReceipt";//确认收货
        public static String ORDER_CANCEL = "order.cancel";//取消订单
        public static String ORDER_PAY_POST = "order.pay.put";//支付完成，修改订单状态
        public static String ORDER_STATUS = "order.status";//获取订单状态
        public static String ORDER_PICKUP = "order.pickup";//订单已取货

        public static String ORDER_INVOICE_LIST = "order.invoice.list";//可开和已开发票订单列表
        public static String ORDER_INVOICE_SUPPLYMENT = "order.invoice.supplyment";//补发发票接口
        public static String ORDER_INVOICE_INFO = "order.invoice.info";//补发发票,查询订单信息
    }

    public static class PaymentApi {
        public static String ALIPAY_PAYMENT_ORDER = "payment.alipay.sign.order";//支付宝生成加签名后的支付单
        public static String VERIFY_ALIPAY_PAYMENT_ORDER = "payment.alipay.verify.order";//支付宝支付成功后确认支付有效性
        public static String ALIPAY_NOTIFY = "payment.alipay.notify";//支付宝异步通知

        public static String BARCODE_PAY = "payment.lichu.barcodepay";//利楚条码支付
        public static String GET_LICHU_PAYMENT = "payment.lichu.query";//利楚查询支付结果
        public static String REFUND = "payment.lichu.refund";//利楚退款
        public static String JSPAY = "payment.lichu.jspay.post";//利楚jspay预支付
        public static String JSPAY_QUERY = "payment.lichu.jspay.get";//利楚jspay查询支付结果
        public static String LICHU_NOTICE = "payment.lichu.callback";//利楚回告

        public static String UNIFIED_ORDER = "payment.wechat.unifiedorder";//微信统一下单
        public static String QUERY_PAYMENT_ORDER = "payment.wechat.order";//微信查询订单支付结果
        public static String WECHAT_CALLBACK = "payment.wechat.callback";//微信支付回告

        public static String CREDITS_CONSUME = "payment.memberPoint.consume";//积分消费
        public static String CREDITS_CONSUME_REVERSE = "payment.memberPoint.consumeReverse";//积分消费冲正
        public static String CREDITS_REFUND = "payment.memberPoint.refund";//积分退款
        public static String CASHCOUPON_CONSUME = "payment.cashCoupon.consume";//现金劵消费
        public static String CASHCOUPON_CONSUME_REVERSE = "payment.cashCoupon.consumeReverse";//现金劵消费冲正
        public static String CASHCOUPON_REFUND = "payment.cashCoupon.refund";//现金劵退款
        public static String GIFTCARD_CONSUME = "payment.giftcard.consume";//礼品卡消费
        public static String GIFTCARD_CONSUME_REVERSE = "payment.giftcard.consumeReverse";//礼品卡消费冲正
        public static String GIFTCARD_REFUND = "payment.giftcard.refund";//礼品卡退款
        public static String CHANGE_COUPON_STATUS = "payment.coupon.use";//礼劵使用和退回(商品劵&运费劵)
        public static String CASH_PAY = "payment.offline.cashPay";//线下现金&线下刷银行卡支付

        public static String REFUND_CALCULATE = "payment.order.refundCalculate";//退款计算
        public static String CREATE_PAYMENT_REFUND = "payment.order.paymentRefund";//统一退款
        public static String LIST_REFUND_INFO = "payment.order.refundInfoList";//查询订单某一退款类型的退款信息集合
        public static String GET_REVERSE_REFUND_DETAIL = "payment.order.reverseRefundDetail";//退换货获取退款明细(包括积分奖励扣除)
        public static String PAYMENT_REVERSE_HASOFFLINECARDPAYTYPE = "payment.reverse.hasOffLineCardPaytype";//订单中是否有银行卡支付

        public static String PAYMENT_ORDER_CASHPAYTYPELIST = "payment.order.cashPaytypeList";//订单支付方式查询(第三方支付方式)
    }

    public static class ReverseOrderApi {
        public static String REVERSE_APPLY_RECORDS = "reverse.apply.records";
        public static String REVERSE_BACKSTAGE_AMOUNT = "reverse.backstage.amount";
        public static String REVERSE_BACKSTAGE_AUDIT_PASS = "reverse.backstage.audit.pass";
        public static String REVERSE_BACKSTAGE_AUDIT_REFUSE = "reverse.backstage.audit.refuse";
        public static String REVERSE_BACKSTAGE_DETAIL = "reverse.backstage.detail";
        public static String REVERSE_BACKSTAGE_LISTRECORD = "reverse.backstage.listRecord";
        public static String REVERSE_BACKSTAGE_LISTRECORDCOUNT = "reverse.backstage.listRecordCount";
        public static String REVERSE_BACKSTAGE_PICKUP = "reverse.backstage.pickup";
        public static String REVERSE_BACKSTAGE_PREPAGE = "reverse.backstage.prePage";
        public static String REVERSE_BACKSTAGE_RECEIVEGOODS_CONFIRM = "reverse.backstage.receiveGoods.confirm";
        public static String REVERSE_BACKSTAGE_RECEIVEGOODS_CONFIRM_EXCEPTION = "reverse.backstage.receiveGoods.confirm.exception";
        public static String REVERSE_BACKSTAGE_RECEIVEGOODS_DENY = "reverse.backstage.receiveGoods.deny";
        public static String REVERSE_BACKSTAGE_REFUND_PASS = "reverse.backstage.refund.pass";
        public static String REVERSE_BACKSTAGE_REFUND_REFUSE = "reverse.backstage.refund.refuse";
        public static String REVERSE_BACKSTAGE_REVERSEORDER_SAVE = "reverse.backstage.reverseOrder.save";
        public static String REVERSE_CANCLE = "reverse.cancel";
        public static String REVERSE_CONFIRMRECEIPT = "reverse.confirmReceipt";
        public static String REVERSE_COUNT = "reverse.count";
        public static String REVERSE_COUNT_BATCH = "reverse.count.batch";
        public static String REVERSE_DELETE = "reverse.delete";
        public static String REVERSE_DETAIL = "reverse.detail";
        public static String REVERSE_FLOW = "reverse.flow";
        public static String REVERSE_IMAGE = "reverse.image";
        public static String REVERSE_ISCANAPPLY = "reverse.isCanApply";
        public static String REVERSE_LOGISTICS_REVERSEINFO = "reverse.logistics.reverseInfo";
        public static String REVERSE_MODIFY = "reverse.modify";
        public static String REVERSE_ORDER = "reverse.order";
        public static String REVERSE_CANC = "reverse.cancel";
        public static String REVERSE_ORDER_SAVE = "reverse.order.save";
        public static String REVERSE_ORDER_RECORDS = "reverse.order.records";
        public static String REVERSE_POS = "reverse.pos";
        public static String REVERSE_PRECREATE4POS = "reverse.preCreate4Pos";
        public static String REVERSE_PRODUCT_AMOUNT = "reverse.product.amount";
        public static String REVERSE_QUERYUNABLEAPPLYORDERIDS = "reverse.queryUnableApplyOrderIds";
        public static String REVERSE_REMOVE = "reverse.remove";
        public static String REVERSE_REVERSEIRDERID = "reverse.reverseOrderId";
        public static String REVERSE_REVERSEORDERINFO = "reverse.reverseOrderInfo";
        public static String REVERSE_TOKEN = "reverse.token";
        public static String REVERSE_UPDATE4POS = "reverse.update4Pos";
        public static String REVERSE_UPLOADIMG = "reverse.uploadImg";
        public static String REVERSE_ORDER_PASS = "reverse.order.pass";
        public static String REVERSE_ORDER_REFUSE = "reverse.order.refuse";
        public static String REVERSE_REVEIVEGOODS_CONFIRM = "reverse.receiveGoods.confirm";
        public static String REVERSE_POS_CANCEL = "reverse.pos.cancel";
    }

    public static class GiftcardApi {
        public static String QUERY_GIFTCARD = "giftCard.queryInfo";//查询礼品卡
        public static String CONSUME_GIFTCARD = "giftCard.consume";//礼品卡消费
        public static String COUNSUME_REVERSE_GIFTCARD = "giftCard.consumeReversal";//礼品卡消费冲正
        public static String REFUND_GIFTCARD = "giftCard.refund";//礼品卡退款
    }

    public static class LogisticsApi {
        public static String LOGISTICS_ORDER_CREATE = "logistics.order.create";//下放订单
        public static String GET_LOGISTICS_ORDER_INFO = "logistics.order.info";//获取物流骑手信息
    }

    public static class PickingApi {
        public static String PICKING_STATUS_MODIFY = "picking.status.modify";//拣货过程状态改变回告
        public static String PICKING_REVIEW = "picking.review";//复核完成
        public static String PICKING_LOCK = "picking.lock";//报缺&报缺取消

        public static String TRANFER_ORDER = "picking.tranferOrder";//推送拣货
        public static String CANCLE_ORDER = "picking.cancel";//取消拣货
    }

    public static class InventoryApi {

        public static String INVENTORY_SALE = "inventory.sale";

        public static String INVENTORY_OCCUPATION = "inventory.occupation";

        public static String INVENTORY_RELEASE = "inventory.release";

        public static String INVENTORY_ENTITY = "inventory.entity";

        public static String INVENTORY_SYNC_PRODUCT = "inventory.sync.product";

        public static String INVENTORY_SYNC_GOODSSTOCK = "inventory.job.syncData.goodsStock";

        public static String INVENTORY_SYNC_RELEASE_GOODSSTOCK = "inventory.job.syncData.releaseStock";

    }

    public static class StoreApi {

        public static String STORE_ADDRESS_DELIVERY_CHECK = "store.address.delivery.check";//根据坐标，返回可配送店铺id
        public static String STORE_AREA_LIST = "store.area.list";//获取可配送城市列表
        public static String STORE_LIST = "store.list";//根据城市获取门店列表
        public static String STORE_NAMES = "store.names";//获取门店名称
        public static String STORE_DETAIL = "store.detail";//获取门店信息
        public static String STORE_ALL = "store.all";//获取所有门店id
        public static String STORE_TIME = "store.time";//获取门店营业时间
        public static String STORE_DELIVERY = "store.delivery";//根据传入门店时间判断是否在营业时间,返回预计送达时间的对象
        public static String STORE_DELIVERYSTRING = "store.deliverystring";//根据传入门店时间判断是否在营业时间,返回预计送达时间的字符串
        public static String STORE_AREA_NAMES = "store.area.names";//批量获取城市名称
        public static String STORE_POST = "store.post";//创建店铺 目前未启用
        public static String STORE_PUT = "store.put";//更新店铺信息 目前未启用
        public static String STORE_ERP_ORDER = "store.erp.order";//erp订单回传提供的erpStoreId
        public static String STORE_ERP_ACTIVITY = "store.erp.activity";//erp促销提供的storeId
        public static String STORE_LIST_DETAIL = "store.list.detail";//erp促销提供的门店详情
        public static String STORE_NAME_ALL = "store.name.all";//获取所有门店名称
        public static String STORE_SALETAXNO = "store.saletaxno";//获取门店销方税号
        public static String STORE_CHECK = "store.check";//检查门店是否存在

    }

    //会员
    public static class MemberApi {

        public static String MEMBER_ADDRESSBOOK_DETAIL = "member.addressbook.detail";//根据用户id获取地址详情
        public static String MEMBER_ADDRESSBOOK_LIST = "member.addressbook.list";//根据用户id获取多个地址
        public static String MEMBER_ADDRESSBOOK_SETTLEMENT = "member.addressbook.settlement";//根据用户id获取结算页地址
        public static String MEMBER_ADDRESSBOOK_LATELYORDER = "member.addressbook.latelyorder";//根据用户id获取最近下单地址
        public static String MEMBER_ADDRESSBOOK_POST = "member.addressbook.post";//添加地址
        public static String MEMBER_ADDRESSBOOK_PUT = "member.addressbook.put";//修改地址
        public static String MEMBER_ADDRESSBOOK_DELETE = "member.addressbook.delete";//删除地址
        public static String MEMBER_ADDRESSBOOK_DEFAULTADDRESS = "member.addressbook.defaultaddress";//修改默认地址
        public static String MEMBER_ADDRESSBOOK_LASTORDER = "member.addressbook.lastorder";//修改上次下单地址
        public static String MEMBER_ADDRESSBOOK_LOCATION = "member.addressbook.location";//根据定位获得的地址
        public static String MEMBER_BACKSTAGE_LIST_MEMBERINFO = "member.backstage.list.memberinfo";//(后台)查询用户信息列表
        public static String MEMBER_BACKSTAGE_MEMBERINFO = "member.backstage.memberinfo";//后台)查询用户信息详情
        public static String MEMBER_CARD_FROZEN = "member.card.frozen";//会员卡冻结
        public static String MEMBER_CARD_BINDING = "member.card.binding";//会员卡绑卡
        public static String MEMBER_CARD_THAW = "member.card.thaw";//会员卡解冻
        public static String MEMBER_CARD_RETREAT = "member.card.retreat";//退卡
        public static String MEMBER_LOGIN = "member.login";//用户登录注册
        public static String MEMBER_BASICINFO = "member.basicinfo";//查询用户基础信息
        public static String MEMBER_VERIFYCODE_POST = "member.verifycode.post";//给用户发送短息
        public static String MEMBER_VERIFYCODE_GET = "member.verifycode.get";//获取最近一条未验证的验证码记录
        public static String MEMBER_FIRSTVALIDATETIME = "member.firstvalidatetime";
        public static String MEMBER_LASTLOGINSUCCESSVERIFYINFO = "member.lastloginsuccessverifyinfo";//获取指定手机号最后一次登陆成功的验证信息
        public static String MEMBER_MEMBERINFO4POS = "member.memberinfo4pos";//pos 查询用户信息
        public static String MEMBER_MEMBERINFO = "member.memberinfo";//pos查询用户信息
        public static String MEMBER_UPGRADE = "member.upgrade";//生成会员订单
        public static String MEMBER_PUT = "member.put";//修改用户
        public static String MEMBER_INFO_BATCH = "member.info.batch";//根据会员id批量查询会员信息
        public static String MEMBER_NUMBER = "member.number";//根据手机号或会员卡号查询会员id
        public static String MEMBER_CREATE = "member.create";//新增用户
        public static String MEMBER_QUERY_MEMBERDETAIL = "member.query.memberdetail";//查询用户信息
        public static String MEMBER_QUERY_LOGINRECORD = "member.query.loginrecord";//查询用户登录记录
        public static String MEMBER_LOGOUT = "member.logout";//登出
        public static String MEMBER_MESSAGE_SENDMESSAGE = "member.message.sendmessage";//推送短信或者消息
        public static String WECHAT_INITBLOCKCODE = "wechat.initblockcode";//获取微信服务号的带参数二维码
        public static String WECHAT_REFURBISH_TOKEN = "wechat.refurbish.token";//生成微信token
        public static String WECHAT_SCENETAG = "wechat.scenetag";//生成微信用户标签
        public static String WECHAT_CREATEMEUN = "wechat.createmeun";//增加微信公众号菜单
        public static String WECHAT_PUSHMEUN = "wechat.pushmeun";//生成微信公众号菜单
        public static String WECHAT_EDITMEUN = "wechat.editmeun";//修改微信公众号菜单
        public static String WECHAT_GETMEUN = "wechat.getmeun";//获取微信公众号菜单
        public static String WECHAT_PUSH = "wechat.push";//获取北京微信服务号的事件推送
        public static String WECHAT_LOGIN = "wechat.login";//微信小程序登录
        public static String WECHAT_CERCATE = "wechat.cercate";
        public static String WECHAT_TOKEN = "wechat.token";//生成微信token
        public static String WECHAT_USERINFO = "wechat.user.info";
        public static String WECHAT_TAGS_GET = "wechat.tags.get";
        public static String WECHAT_QRCODE = "wechat.qrcode";
        public static String WECHAT_TAGS_CREATE = "wechat.tags.create";
        public static String WECHAT_TAGS_DELETE = "wechat.tags.delete";
        public static String WECHAT_TAGS_BATCHTAGGING = "wechat.tags.batchtagging";
        public static String WECHAT_MENU_CREATE = "wechat.menu.create";
        public static String WECHAT_MENU_GET = "wechat.menu.get";
        public static String WECHAT_MENU_DELETE = "wechat.menu.delete";
        public static String MEMBER_CARD_DETAIL = "member.card.detail";
        public static String MEMBER_CHECK_NAME = "member.check.name";
        public static String MEMBER_SEND_BATCH_MESSAGE = "member.send.batch.message";
    }

    //营销
    public static class ActivityApi {

        public static String ACTIVITY_GET_ACTIVITY = "activity";//根据productid和维度信息查活动

        public static String ACTIVITY_GET_ACTIVITY_NAMELIST = "activity.nameList";//根据活动ID(集合)查询活动名称集合

        public static String ACTIVITY_GET_ACTIVITY_INFO = "activity.activityInfo";//根据活动ID(集合)查询活动信息

        public static String ACTIVITY_GET_ACTIVITY_BY_CONDITION = "activity.queryActivityByCondition";//根据条件查询活动列表，可分页

        public static String ACTIVITY_GET_PRODUCT_BY_ACTIVITY = "activity.productId";//根据活动ID和门店ID查询商品列表（分页）

        public static String ACTIVITY_GET_ACTIVITY_PROMOTYPE = "activity.promoType";//根据活动id获取促销类型名称

        public static String ACTIVITY_CHECK_DIMENSION = "activity.coupon.checkDimension";//校验活动维度

        public static String ACTIVITY_CREATE_ACTIVITY = "activity.createActivity";//创建活动

        public static String ACTIVITY_GET_DISTRIBUTE_ACTIVITY = "activity.queryDistributeActivity";//查询当前用户可用的领券活动

        public static String ACTIVITY_COUNT_ACTIVITY = "activity.type.countActivity";//查询指定类型的活动数量

        public static String ACTIVITY_UPDATELIMITCOUNT = "activity.pdateLimitCount";

        public static String ACTIVITY_BACKSTAGE_SECKILL = "activity.backstage.seckill";

        public static String ACTIVITY_QUERYDISTRIBUTEACTIVITY = "activity.queryDistributeActivity";//查询当前用户可用的领券活动
    }

    public static class PriceApi {

        public static String PRICE_SYN_SIMPLE_DATA = "price.syncEditSimpleData";

        public static String PRICE_SYN_DATA = "price.syncEditData";

        public static String PRICE_SYN_DROP_SIMPLE_DATA = "price.syncDropSimpleData";

        public static String PRICE_PACKAGE = "price.package";

        public static String PRICE_SYN_DROP_PACKAGE_DATA = "price.syncDropPackageData";

        public static String PRICE_SYN_DROP_DATA = "price.syncDropData";

        public static String PRICE_SEARCH_PRICE = "price.searchPrice";

        public static String PRICE_PRODUCT_ERP_PROMO = "price.product.erpPromo";

        public static String PRICE_STORE_PRODUCT = "price.store.product";

        public static String PRICE_PRODUCT_LIST = "price.product.list";

        public static String PRICE_PROMOTION = "price_promotion";

    }


    public static class PromoApi {

        public static String PROMO_INFO = "promo.info";

        public static String PROMO_INFO_BY_ACTIVITY = "promo.getPromoInfoByActivityId";

        public static String PROMO_CALCULATE = "promo.calculate";

        public static String PROMO_QUERY_FOR_POS = "promo.queryPromoForPos";

        public static String PROMO_TYPE = "promo.type";

        public static String PROMO_CREATE = "promo.creation";
    }

    public static class CouponApi {
        public static String COUPON_MEMBERCOUPON = "coupon.membercoupon";//绑券
        public static String COUPON_COUPONBAG_BINDCOUPON = "coupon.couponBag.bindCoupon";//绑定礼券包
        public static String COUPON_PERSONALCOUPON = "coupon.personalCoupon";//个人中心展示礼劵
        public static String COUPON_MEMBERCOUPONNUM = "coupon.memberCouponNum";
        public static String COUPON_BATCH_MEMBERCOUPONNUM = "coupon.batch.memberCouponNum";
        public static String COUPON_CHECKCOUPON = "coupon.checkCoupon";
        public static String COUPON_STATUS = "coupon.status";
        public static String COUPON_BINDLIST = "coupon.bindList";
        public static String COUPON_CALCULATECOUPON = "coupon.calculateCoupon";
        public static String COUPON_MEMBERCASHCOUPOM = "coupon.memberCashCoupom";
        public static String COUPON_CASH_CONSUME = "coupon.cash.consume";
        public static String COUPON_CASH_CONSUME_REVERSE = "coupon.cash.consume.reverse";
        public static String COUPON_CASH_REFUND = "coupon.cash.refund";
        public static String COUPON_CASH_REFUND_REVERSE = "coupon.cash.refund.reverse";
        public static String COUPON_CREATECOUPONATTRIBUTE = "coupon.createCouponAttribute";

    }

    public static class CouponDistributeApi {
        public static String COUPON_DISTRIBUTE_POST = "coupon.distribute.post";
        public static String COUPON_DISTRIBUTE_GET = "coupon.distribute.get";
        public static String COUPON_DISTRIBUTE_LIST = "coupon.distribute.list";
        public static String COUPON_DISTRIBUTE_DELETE = "coupon.distribute";
        public static String COUPON_DISTRIBUTE_ALL = "coupon.distribute.all";
        public static String COUPON_DISTRIBUTE_RECEIVE = "coupon.distribute.receive";
        public static String COUPON_CREATECOUPONDISTRIBUTEATTRIBUTE = "coupon.createCouponDistributeAttribute";
        public static String COUPON_DISTRIBUTE_RECEIVE_BATCH = "coupon.distribute.receive.batch";

    }

    public static class CmsApi {
        public static String CMS_QUERYAPPVERSION = "cms.queryAppVersion";
        public static String CMS_HOMEPAGE_LABEL = "cms.homePage.label";
        public static String CMS_GETUPGRADEVERSION = "cms.getUpgradeVersion";
        public static String CMS_HOMEPAGE_ADDLABEL = "cms.homePage.addLabel";
        public static String CMS_HOMEPAGE_QUERYLABELS = "cms.homePage.queryLabels";
        public static String CMS_HOMEPAGE_DELETELABEL = "cms.homePage.deleteLabel";
        public static String CMS_HOMEPAGE_UPDATELABEL = "cms.homePage.updateLabel";
    }

    public static class ProductApi {

        public static String PRODUCT_BASEINFO = "product.baseinfo";//查询商品基本信息
        public static String PRODUCT_PACKAGERELATION = "product.packagerelation";//主品与多规格商品关系
        public static String PRODUCT_DETAIL = "product.detail";//查询商品详情
        public static String PRODUCT_INDUSTRYCATEGORY_LIST = "product.industrycategory.list";//查询工业分类信息
        public static String PRODUCT_INDUSTRYCATEGORY_CATEGORYID_LIST = "product.industrycategory.categoryid.list";//查询工业分类下的商品
        public static String PRODUCT_INDUSTRYCATEGORY = "product.industrycategory";//查询当前单个工业分类的信息
        public static String PRODUCT_STORE_LIST_GET = "product.store.list.get";//获取商品店铺表的信息
        public static String PRODUCT_STORE_LIST_POST = "product.store.list.post";//获取商品店铺表的信息
        public static String PRODUCT_POS = "product.pos";//pos查询商品信息
        public static String PRODUCT_CHECK_SHARE = "product.check.share";//检查分享商品和当前门店商品的变化
        public static String PRODUCT_CATEGORYPRODUCTMAP = "product.categoryproductmap";//活动模块查询商品对应分类id，path
        public static String PRODUCT_SELECTALLPRODUCTBYSTORE = "product.selectallproductbystore";//查询门店下的所有商品
        public static String PRODUCT_SELECTALLPRODUCTBYPATH = "product.selectallproductbypath";//查询制定分类路径下的商品
        public static String PRODUCT_POS_INDUSTRYCATEGORY = "product.pos.industrycategory";//推送pos 分类
        public static String PRODUCT_ERP_ORDER = "product.erp.order";//erp订单回传
        public static String PRODUCT_PROMO = "product.promo";//促销查询商品id
        public static String PRODUCT_ERP_ACTIVITY = "product.erp.activity";//根据goodsId得到productId
        public static String PRODUCT_ERP_ACTIVITY_INDUSTRYCATEGORYPATH = "product.erp.activity.industrycategorypath";//根据categoryId得到path
        public static String PRODUCT_PICK_GETSKUID = "product.pick.getskuid";//根据productId获取拣货skuid
        public static String PRODUCT_INDUSTRYCATEGORYPATH = "product.industrycategorypath";//根据productId获取分类路径
        public static String PRODUCT_LIST = "product.list";
        public static String PRODUCT_BACKSTAGE_LIST = "product.backstage.productList";
        public static String PRODUCT_COUPON_INDUSTRYCATEGORY = "product.coupon.industryCategory";
        public static String PRODUCT_REVIEWPRODUCTLIST = "product.merchant.reviewProductList";
        public static String PRODUCT_REVIEWPRODUCTINFO = "product.merchant.reviewProductInfo";
        public static String PRODUCT_REVIEWPRODUCT = "product.merchant.reviewProduct";

    }

    public static class CreditsApi {
        public static String CREDITS_POS_CALCULATE_CREDITS_POST = "pos.calculateCredits";
        public static String CREDITS_LIST_COUNT_POST = "credits.list.count";
        public static String CREDITS_COUNT_GET = "credits.count";
        public static String CREDITS_REWARD_QUERY_POST = "credits.reward.query";
        public static String CREDITS_REVERSE_POST = "credits.reverse";
        public static String CREDITS_COUNT_QUERY_GET = "credits.count.query";
        public static String CREDITS_DETAIL_GET = "credits.detail";
        public static String CREDITS_CURRENTPAGE_DETAIL_GET = "credits.currentPage.detail";
        public static String CREDITS_REFUND_POST = "credits.refund";
        public static String CREDITS_MONEY_REVERSE_QUERY_GET = "credits.money.reverse.query";
        public static String CREDITS_QUERYREFUNDDEDUCT_GET = "credits.queryRefundDeduct";
        public static String CREDITS_CONSUME_POST = "credits.consume";
    }

    public static class MessageApi {
        public static String MESSAGE_CALLBACK_POST = "message.callback";
        public static String MESSAGE_ALLINFORMATION_GET = "message.allInformation";
        public static String MESSAGE_SMSVERIFYCODE_POST = "message.smsVerifyCode";
        public static String MESSAGE_JPUSH_POST = "message.jpush";
        public static String MESSAGE_JPUSHMESSAGE_POST = "message.jpushMessage";
        public static String MESSAGE_JPUSHBATCHBOOKMESSAGE_POST = "message.jpushBatchBookMessage";
        public static String SMS_V2_STD_SINGLE_SEND = "sms.v2.std.single.send";
        public static String SMS_V2_STD_BATCH_SEND = "sms.v2.std.batch.send";
        public static String SMS_V2_STD_MULTI_SEND = "sms.v2.std.multi.send";
        public static String SMS_V2_STD_GET_RPT = "sms.v2.std.get.rpt";
        public static String MESSAGE_BATCH_LIST = "MESSAGE.BATCH.LIST";
        public static String MESSAGE_BATCH_DETAIL = "MESSAGE.BATCH.DETAIL";
    }

    public static class ImageApi {
        public static String IMAGE_RELATION_GET = "image.relation";
        public static String IMAGE_REVERSE_UPLOAD_POST = "image.reverse.upload";
        public static String IMAGE_GETIMAGECOUNT_GET = "image.getImageCount";
        public static String IMAGE_COUNT = "image.count";
        public static String IMAGE_REMOVE_DELETE = "image.remove";
        public static String IMAGE_REVERSE_UPLOAD_GET = "image.reverse.upload;";
        public static String IMAGE_BACKSTAGE_IMAGE_UPLOAD = "image.backstage.image.upload;";
        public static String IMAGE_BACKSTAGE_FILE_UPLOAD = "image.backstage.file.upload;";

    }

    public static class BusinessApi {

        public static String BUSINESS_GETBUSINESSLIST_GET = "product.business.merchantList";

        public static String BUSINESS_VENDORLIST_GET = "product.business.vendorList";

        public static String BUSINESS_ACTIVATEMERCHANT_GET = "product.business.activateMerchant";

    }

}
