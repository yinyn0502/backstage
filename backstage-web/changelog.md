--------------2017-10-17-----------------
* [New Features]
    1. 后台日志记录
    2. 订单详情页添加退换货入口
    3. 添加收款功能
    4. 添加收货异常功能
    5. 添加退货单审核取回货品功能
    6. 各种校验
* [Fixed Bugs]
    1. 退款金额的计算
    2. 申请单客服确认收货异常
    3. 申请单审核通过异常
    4. 退款详情显示问题
    5. 分页
    
--------------2018-01-09-----------------
* [Fixed Bugs]
    1. 去除日志中用户密码的打印
    
--------------2018-01-22-----------------
* [New Features]
    1. 增加限购页面
    
--------------2018-01-29-----------------
* [New Features]
    1. 增加首页后台页面配置功能

--------------2018-01-30-----------------
* [New Features]
    1. 修改图片在properties中的配置
    
--------------2018-02-01-----------------
* [New Features]
    1. cms后台查询商品状态显示汉字
    2. cms对于不存在的商品做容错处理
    3. cms的页面跳转,如果有异常跳转错误页
    
--------------2018-02-01-----------------
* [New Features]
    1. cms后台加判空
    2. HealthController加日志
    3. cms新品发现传ModuleTypeId
    4. cms每日抢鲜模块添加的时候sort值的修改
    5. cms上线的时候的storeId之前传错了,现在更正
    6. cms新品发现和自定义在没有任何数据的时候不跳错误页
    
--------------2018-02-05-----------------
* [New Features]
    1. cms后台买手推荐加页面标题
    2. cms去掉新建模板的按钮
    3. cms加权限
    4. cms记录操作记录
    5. cms去掉取消按钮
    6. cms自定义活动如果有数据,添加按钮禁用
    
--------------2018-02-06-----------------
* [New Features]
    1. cms后台查询商品的时候如果在该门店不可售的话提示
    2. cms每日抢鲜限制label的width
    3. cms买手推荐和每日抢鲜的展示界面，商品信息添加销售状态
    4. 修改后台的登录超时为24小时
    5. 修改图片测试服务器地址
    6. 修复cms每日抢鲜编辑页的结束时间的取值
    
--------------2018-02-08-----------------
* [Fixed Bugs]
    1. 去掉select now()后面的分号
    2. CMS每日抢鲜时间显示格式调整
    3. CMS纯粹味道小图加判空
    
--------------2018-03-29-----------------
* [Fixed Bugs]
    1. 首页后台纯粹味道7号位置分类名称不显示修复
    2. 首页后台页面错乱修复
  
--------------2018-03-19-----------------
* [New Features]
    1. 新增优惠券后台和发券后台
    2. 纯粹味道和eat说页面重构
    3. bug修复和增加校验
    
--------------2018-03-14-----------------
* [New Features]
    1. 消息后台功能 增加 zk配置 templetID配置
    
--------------2018-03-22-----------------
* [New Features] @xurupeng
1.新增秒杀后台详情接口
    1. 消息后台功能 增加 zk配置 templetID配置,outer 增加message url配置
    2.消息列表，消息详情，新增消息

--------------2018-03-23-----------------
* [Fixed Bugs]@xurupeng
1.修改push列表和详情返回字段

--------------2018-03-23-----------------
* [Fixed Bugs]
    1. 修改发券列表页的样式
    2. 修改发券-查看-优惠券ID的展示格式
    
--------------2018-03-27-----------------
* [Fixed Bugs]
    1. 发券-选择剩余券数为0的优惠券-保存报错后应留在当前页面
    2. 发券-活动名称限制15个字超过不应允许输入
    3. 发券-选择优惠券-剩余券数为0应该展示为0，不应展示为空

--------------2018-04-02-----------------
* [Fixed Bugs]
   1. 修复秒杀列表页分页问题
   2. 添加逻辑,只有创建人才能编辑
   
--------------2018-04-04-----------------
* [Fixed Bugs]
   1. 修复秒杀列表详情页分页问题
   2. 添加秒杀驳回原因50字限制
   3. 处理驳回原因弹框太小
   4. 处理秒杀后台，有效期时间框显示难看
   5. 不能审核自己创建的秒杀活动
   6. 修复秒杀添加活动超过12个商品不能保存的问题
   7. 修复秒杀编辑的时候,活动售价的比较

--------------2018-04-08-----------------
* [Fixed Bugs]
   1. 创建优惠券只有两个选项：预算内（默认）、非预算内
   2. 创建优惠券(现金券)失败
   3. 优惠券列表页添加审核不通过原因的展示  
   4. 首页配置，banner配置页面文字显示折行
   5. 首页配置banner图，填写页面标题后保存，再次查看没显示页面标题
   6. 秒杀后台，新建秒杀时，页面标题、分享标题、分享描述字数没做限制
   7. 秒杀后台，添加商品每个场次最多支持50个商品
   8. 秒杀后台，活动库存与限购数只能是正整数
   9. 秒杀后台，场次有效时间不能重合
   10. 创建优惠券-优惠规则-默认选中有门槛
   11. cms后台eat说字段错误修复
   
--------------2018-04-09-----------------
* [Fixed Bugs]
   1. 消息后台错误提示及校验完善
   
--------------2018-04-09-----------------
* [Fixed Bugs]
   1. targetTitle字段回滚
   2. 传输对象修改do改成to
   3. 查询优惠券-创建人改为input
   4. 创建优惠券-优惠规则默认项均为『减』不是折
   5. 创建优惠券-优惠券名称和副标题超过15个字不应允许输入
   6. 优惠券管理,进行中不展示编辑按钮
   7. 优惠券创建报错的问题
   
--------------2018-04-10-----------------
* [Fixed Bugs]
   1. 秒杀列表门店显示空。
   2. 查询优惠券-在列表点击停用一张优惠券后，列表清空了
   3. 创建优惠券-选择预算内查看时显示了预算外
   4. 创建优惠券-门槛金额填100保存后变成1
   5. 创建优惠券-优惠规则默认项均为『减』不是折,change文案
   6. 修复修改秒杀时库存、价格有逗号的为题
   7. 修复时间错误给提示，正确时提示未消失问题。
   8. 审核优惠券-在优惠券列表点击审核-审核驳回或通过后点关闭-优惠券列表会被清空
   9. 消息后台错误提示与校验完善@zhouyujie
   
--------------2018-04-11-----------------
* [FixBugs]
   1. 产品新需求：门店有餐厅和超市类型，餐厅时，库存不需要限制
   2. 秒杀后台解决时间提示问题 
   3. 消息后台使用bootTime排序  
   4. 优惠券修改渠道失效问题
   5. 创建优惠券-选择现金券后排除商品也隐藏掉
   6. 修改优惠券-保存后的优惠券与修改不一致
   
--------------2018-04-12-----------------
* [Fixed Bugs]
   1. 消息发送成功提示处理，预约消息提示预约成功，实时消息提示发送成功
   2. 增加消息标题、内容长度校验
   3. 秒杀添加商品时，input输入框只允许输入数字和英文逗号正则校验
   4. 修复秒杀后台列表页空指针引起的页面内容错误的问题
   5. 优化秒杀添加和修改时删除按钮的样式
   
--------------2018-04-16-----------------
* [Fixed Bugs]
   1. 修复秒杀俩小时之后才能创建的bug
   2. 秒杀后台，有效期重置查询条件后，再次点击开始日期，日期显示问题
   3. 创建优惠券券-文案错误-选择商品-销售状态不是促销状态
   
--------------2018-04-17-----------------
* [Fixed Bugs]
   1. 增加zk配置(秒杀)
   2. 修改秒杀时间校验
   
--------------2018-04-18-----------------
* [Fixed Bugs]
   1. 创建优惠券后，第一次查看，不展示相对有效期
   2. 审核时不展示类别
   3. 集合品优惠券会创建为全门店可用的券
   4. 查商品输入框目前最多只能输入7个，应该支持到200个
   5. 订单管理列表页条件查询
   6. 秒杀处理没数据的时候空指针的问题
  
--------------2018-04-19-----------------
* [Fixed Bugs]
   1. 修复秒杀后台 查看和编辑 页面标题和分享标题错位问题
   2. 修复优惠券后台新增的时候选择运费券或者是现金券无法保存成功
  
--------------2018-04-22-----------------
* [Fixed Bugs]
   1. 商品管理后台,如果商品的状态是不可售,则不能参与批量修改
   2. 商品管理后台,不能把商品的状态改为不可售
   
--------------2018-04-24-----------------
* [Fixed Bugs]
   1. 商品管理后台修改商品副标题输入不能超过20个字符
   2. 商品管理后台批量修改商品副标题时修改了“不可售”状态的商品，而“仅线下可售”的商品没有修改
   3. 商品管理后台单个编辑不可售商品，销售状态一行没有展示“请在erp中修改商品状态”文字信息
   4. 修复秒杀后台 查看和编辑 页面标题和分享标题错位问题 回滚
   5. 优惠券管理审核时，排除商品没展示出来
   6. 创建时，排除商品，全选按钮没管用
   7. 查询50个商品，全部勾选后，点击提交没反应
   8. 将hotfix的内容合过来
   9. 订单管理后台,按照电话号查询的时候,17号段不能查询

--------------2018-05-02-----------------
* [New Features]
   1. 修改首页纯粹味道7号位图片尺寸
   2. 创建秒杀场次时，去掉活动库存必须小于等于可售库存的校验，活动库存允许大于可售库存，必须大于0
--------------2018-05-18-----------------
* [Fixed Bugs]
 1. 修改礼券详情不展示领券活动
 2. 修改状态文案展示
--------------2018-06-06-----------------
* [Fixed Bugs]
1. 修改点击会员详情报错Bug
 --------------2018-05-21-----------------
 * [Fixed Bugs]
 1. 修改审核通过的活动可以修改Bug
 --------------2018-05-29-----------------
 * [Fixed Bugs]
 1. 修改创建优惠券选择APP维度不生效Bug
 --------------2018-06-08-----------------
 * [Fixed Bugs]
 1. 修改商品管理后台相关逻辑
 --------------2018-06-08-----------------
 * [Fixed Bugs]
 1. 添加pos设备展示列表，和绑定，更改门店逻辑。@jinghao
 2.修改商品是否可以更改状态逻辑
 --------------2018-06-08-----------------
 * [Fixed Bugs]
 1. 修改商品管理后台修改状态Bug
 --------------2018-06-13-----------------
 * [Fixed Bugs]
 1. 修改商品管理后台修改失败时提示文案 
 --------------2018-06-19-----------------
 * [Fixed Bugs]
 1. 修改bug:商品管理后台，普通商品（非小码），没有图片时修改为仅线上可售时，没有提示语。@jinghao
 1. 修改bug:商品管理后台，商品id文本框输入非数字点击查询，提示internal server error。@jinghao