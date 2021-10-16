package com.computer.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
	
	private Integer id;//用户编号
	private String userName;//用户名
	private String password;//密码
	private String tel;//电话
	private String address;//地址
	
}
