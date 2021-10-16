package com.computer.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShoppingCar {
	
	private Integer id;//购物车编号
	private String userId;//用户编号
	private String comId;//商品编号
	private String sum;//商品数量

}
