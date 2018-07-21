package com.ueater.backstage.common.dto.invite;

import com.ueater.backstage.common.dto.member.BasePagination;
import lombok.Data;
import org.assertj.core.util.Lists;

import java.util.List;

/**
 * Created by mayumeng on 2018-05-08.
 */
@Data
public class ShareActivityListDTO {

    private BasePagination basePagination = new BasePagination();

    private List<ShareActivityInfoDTO> shareActivityInfoDTOList = Lists.newArrayList();

}
