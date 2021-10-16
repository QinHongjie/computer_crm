package com.computer.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 商品实体类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Computer {
	
	private Integer id;//商品编号
	private String comName;//商品名称
	private String intro;//商品说明
	private Integer price;//单价
	private Integer type;//类型编号
	private String picture;//商品图片
	private Integer hits;//购物率

}
