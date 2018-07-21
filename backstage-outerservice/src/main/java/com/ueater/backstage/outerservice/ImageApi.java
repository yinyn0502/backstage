package com.ueater.backstage.outerservice;

import com.ueater.backstage.common.model.image.ImageCountTO;
import com.ueater.tool.response.Response;
import feign.Param;
import feign.RequestLine;

/**
 * @author fanlei
 * @version 1.0.0
 * @date 八月 16 2017 下午4:12
 */
public interface ImageApi {

    @RequestLine("GET /image/reverse/upload?id={reverseId} HTTP/1.1")
    Response<Object> submitReverseImage(@Param("reverseId") Long reverseId);

    /**
     * 查询申请单图片数量
     *
     * @param reverseId
     * @return
     */
    @RequestLine("GET /image/count?id={reverseId}&type={type} HTTP/1.1")
    Response<ImageCountTO> count(@Param("reverseId") Long reverseId, @Param("type") Integer type);

    /**
     * 删除图片
     *
     * @param reverseId
     * @return
     */
    @RequestLine("DELETE /image/remove?id={reverseId}&num={num}&type={type} HTTP/1.1")
    Response<Object> deleteImage(@Param("id") Long reverseId, @Param("num") Integer num, @Param("type") Integer type);





}
