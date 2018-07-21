package com.ueater.backstage.common.model.couponmanage;

import lombok.Data;

import java.io.Serializable;
import java.util.List;
/**
 * @author xurupeng
 * @version 1.0.0
 * @date 2017年4月12日 下午2:00:48
 */
@Data
public class IndustryCategoryDTO implements Serializable{
	
	/*private Long id;
	
	private String name;
	
	private Long parentId;
	
	private String path;
	
	private Integer depth;
	
	private List<IndustryCategoryDTO> list;*/

	private Long id;
	private Long categoryCode;
	private String path;
	private String name;
	private Long parentId;
	private Integer level;
	private Integer isDelete;
	private Boolean existPromo;
	private List<IndustryCategoryDTO> list;
	
}
