package com.computer.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ChapterFilter implements Filter
{
	 // 设置字符编码
	 private String charSet;            
	
	/**
	 * 初始化过滤器
	 */
	public void init(FilterConfig config) throws ServletException
	{ 
		// 取得在web.xml中配置的初始化参数
		charSet = config.getInitParameter("charSet"); 
		
		System.out.println("字符编码： " + charSet);
	}
	
	/**
	 * 执行过滤器
	 */
	public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException
	{
		//将ServletRequest类强制类型转换成其子类，针对HTTP协议的HttpServletRequest，加入getHeader等方法
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		
		// 设置统一编码
		req.setCharacterEncoding(charSet);
		res.setCharacterEncoding(charSet);
		res.setContentType("text/html;charset=" + charSet);

		//通过封装类，将request里面的中文参数处理
		CharacterRequestHandler requestHandler = new CharacterRequestHandler(req);

		// 将封装好的请求继续传递给相应的资源
		chain.doFilter(requestHandler, res); 
	}

	/**
	 * 执行过滤器
	 */
	public void destroy()
	{
		System.out.println("** 过滤器销毁。");
	}
}

