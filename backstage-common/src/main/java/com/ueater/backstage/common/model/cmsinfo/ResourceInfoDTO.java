package com.ueater.backstage.common.model.cmsinfo;


import lombok.Data;

/**
 * Created by zhangjiannan on 2018/1/16.
 */
@Data
public class ResourceInfoDTO extends AbtractDTO {

    private Long entityIdType; //实体id类型(1 商品id,2 活动id)

    private String entityIdValue; //id值

    private String imageValue;//图片地址(运营自己上传的不规则图片地址...嘘嘘..)买手头像地址

    private Long resourceTypeId;//资源类型id(这个资源类型不知道会不会变，就没设置枚举)

    private Integer sort;//资源展示顺序

    private Long targetType;//目标类型  有枚举定义了

    private String targetValue;//目标地址(上传的链接地址，包括买手推荐上传的文件)

    private String textValue;//文本值(买手文案)

    private String titleValue;//描述信息（买手名字）

    private String targetTitle;//链接目标标题
}
