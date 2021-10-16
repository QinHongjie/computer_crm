package com.computer.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.io.UnsupportedEncodingException;

/**
 * 判断请求方式，实现get编码设置
 * 使用wapper类重新封装request对象的属性
 * @author Administrator
 * 
 */
public class CharacterRequestHandler extends HttpServletRequestWrapper {

	// 获取传递过来的request请求
	public CharacterRequestHandler(HttpServletRequest request)
	{
		// 采用Wapper重新封装request请求
		super(request);

	}

	/**
	 * 重写Wapper类的方法
	 */
	public String getParameter(String name) {

		// 根据域中属性的名字获取数据
		String value = super.getParameter(name);

		// 如果无法获取属性，则其值也是null
		if (null == name||value==null) {
			return null;
		}

		// 获取属性method属性的值，即请求的类型
		String method = super.getMethod();

		// 如果是get请求，则处理编码
		if ("get".equalsIgnoreCase(method)) {
			try 
			{
				//处理get方法的中文
				value = new String(value.getBytes("iso-8859-1"), "utf-8");
			} catch (UnsupportedEncodingException e) {

				// 处理编码异常
				e.printStackTrace();
			}
		}
		// 返回处理好的参数数据，由wapper类重新封装到新的request对象中
		return value;
	}
}
