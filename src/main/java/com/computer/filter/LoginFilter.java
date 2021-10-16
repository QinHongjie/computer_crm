package com.computer.filter;

import com.computer.model.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 用户登录过滤器 拦截用户操作系统url，判断用户是否已经登录 否则返回登录页面
 * 
 * @author lenovo
 * 
 */
public class LoginFilter implements Filter {

	/**
	 * 初始化过滤器
	 */
	public void init(FilterConfig config) throws ServletException {}

	/**
	 * 执行过滤器
	 */
	public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
		// 将请求强制转换成HTTPServlet请求
		HttpServletRequest httpRequest = (HttpServletRequest) request;

		// 获取当前session
		HttpSession session = httpRequest.getSession();

		// 获取会话中当前登录的用户
		User user = (User) session.getAttribute("USER_SESSION");

		// 判断当前用户是否为空，为空表示会话结束
		if (user == null) {
			// 获取用户提交的请求
			String url = httpRequest.getRequestURI();

			// 如果.do结束的url，需要放行登录、退出、注册、验证请求
			if (url.contains("login.do")
					|| url.contains("logout.do")
					|| url.contains("register.do")) {
				chain.doFilter(request, response);// 否则继续执行
			} else {
				// 若用户还没登录 则跳转至结果提示 并且跳转至登录页
				request.setAttribute("msg", "你还没有登录 ，请先登录！");
				request.setAttribute("href", "public/login.jsp");
				request.getRequestDispatcher("public/result.jsp").forward(request, response);
			}
		} else {
			chain.doFilter(request, response);// 否则继续执行
		}
	}

	/**
	 * 执行过滤器
	 */
	public void destroy() {
	}
}
