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
	private String price;//单价
	private ComType type;//商品关联的类型
	private String picture;//商品图片
	private String hits;//购物率
	private String comment;

}
