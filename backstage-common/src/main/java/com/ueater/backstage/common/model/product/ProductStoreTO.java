package com.ueater.backstage.common.model.product;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @author fanlei
 * @version 1.0.0
 * @date 八月 21 2017 上午10:02
 */

@Data
public class ProductStoreTO {

    private Long productId;                 //商品id
    private BigDecimal price;               //商品价格
    private String productTitle;            //商品标题
    private String salesAttributeValue;     //销售属性值(商品规格)
    private String productSubtitle;         //商品副标题
    private Integer saleStatus;             //可售状态
    private String unit;                    //单位
    private Integer productManageType;      //运营类型
    private Long poolStoreId;               //联营storeId
    private String categoryPath;
}
