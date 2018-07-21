package com.ueater.backstage.outerservice.facade;

import com.ueater.backstage.common.dto.product.StoreProductQueryDTO;
import com.ueater.backstage.common.model.business.BusinessPosDTO;
import com.ueater.backstage.common.model.business.PosDeviceListTO;
import com.ueater.backstage.common.model.couponmanage.CouponProductBackstageDTO;
import com.ueater.backstage.common.model.couponmanage.IndustryCategoryQueryDTO;
import com.ueater.backstage.common.model.product.PosIndustryCategoryDTO;
import com.ueater.tool.response.Response;

import java.util.List;
import java.util.Map;

public interface IProductApiHandler {

    Response<List<CouponProductBackstageDTO>> listStoreProduct(StoreProductQueryDTO storeProductQueryDTO);

    Response<Map<String, PosIndustryCategoryDTO>> queryIndustryCategoryByPath(IndustryCategoryQueryDTO industryCategoryQueryDTO);

    Response<PosDeviceListTO> queryAllPosDevice(Integer currentPage, Integer pageCount, Long id, Long storeId, String posNo);

    Response<BusinessPosDTO> bindingPosStore(BusinessPosDTO businessPosDTO, String operator);

}
