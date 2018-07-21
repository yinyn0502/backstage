package com.ueater.backstage.common.model.business;

import com.ueater.backstage.common.model.BasePagination;
import lombok.Data;

import java.util.List;

/**
 * Created by jinghao on 2018/5/29.
 */
@Data
public class PosDeviceListTO {

    private BasePagination basePage;
    private List<BusinessPosDTO> deviceList;

}
