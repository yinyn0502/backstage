package com.ueater.backstage.common.model.coupon;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;
/**
 * @author xurupeng
 * @version 1.0.0
 * @date 2017年4月12日 下午2:00:48
 */
@Data
public class IndustryCategoryDTO implements Serializable{
	
	private Long id;
	
	private String name;
	
	private Long parentId;
	
	private String path;
	
	private Integer depth;
	
	private List<IndustryCategoryDTO> list;
	
}
