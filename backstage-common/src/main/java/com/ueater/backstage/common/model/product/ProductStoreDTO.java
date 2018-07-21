package com.ueater.backstage.common.model.product;

import lombok.Data;

/**
 * Created by caoli on 2018/3/21.
 */
@Data
public class ProductStoreDTO {

    private Long productId;				//商品id

    private String productTitle;			//商品标题

    private String productSubtitle;      //商品副标题

    private String salesAttributeValue;	//销售属性值

    private Integer saleStatus;			//销售状态

    private Integer productManageType;   //状态

    private Long poolStoreId; 			//联营storeId

    private String categoryPath;			//分类路径

    private String unit;
}
