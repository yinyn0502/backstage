package com.ueater.backstage.outerservice.facade;

import com.ueater.backstage.common.dto.price.PromotionPriceDTO;
import com.ueater.backstage.common.dto.price.StoreProductPriceTO;
import com.ueater.backstage.common.model.price.ActivityQueryTO;
import com.ueater.backstage.common.model.price.PriceProductActivityDTO;
import com.ueater.tool.response.Response;

import java.util.List;

public interface IPriceApiHandler {

    Response<PriceProductActivityDTO> loadProductsPrice(ActivityQueryTO activityQueryTO);

    Response<List<PromotionPriceDTO>> activitySeckillPrice(StoreProductPriceTO storeProductPriceTO);

}
