package com.computer.listener;

import com.computer.model.User;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.ArrayList;
import java.util.List;

/**
 * 监听用户在线人数
 * @author Administrator
 *
 */
public class OnlineUserListener implements HttpSessionListener,
        HttpSessionAttributeListener {
	/**
	 * 往session会话中添加属性时回调的方法，在第一次添加某属性时调用session.setAttribute方法的时候会调用该方法
	 */
	public void attributeAdded(HttpSessionBindingEvent event)
	{
		// 获取Servlet上下文
		ServletContext context = event.getSession().getServletContext();

		// 首先获取当前在线用户姓名列表
		List<User> onlineUserList = (List<User>) context.getAttribute("onlineUserList");

		// 用户第一次登录，用户列表为空，需要创建一个用户列表
		if (null == onlineUserList) {
			onlineUserList = new ArrayList<User>();
		}
		// 如果当前是往session中添加用户名称，则在线用户加入一个
		if ("USER_SESSION".equals(event.getName()))
		{
			// 获取当前登录的用户名
			User user_session = (User) event.getSession().getAttribute("USER_SESSION");

			// 如果当前在线用户中该用户不存在，则将该用户名称加入在线用户列表中
			onlineUserList.add(user_session);
		}
		// 重新设置对应的在线用户列表
		context.setAttribute("onlineUserList", onlineUserList);

		// 重新设置对应的在线用户数
		context.setAttribute("onlineCount", onlineUserList.size());
	}

	/**
	 * 当有会话销毁的时候需要将在线用户列表去掉一个
	 */
	public void sessionDestroyed(HttpSessionEvent se)
	{
		// 获取Servlet上下文
		ServletContext context = se.getSession().getServletContext();

		// 获取当前在线用户列表
		List<User> onlineUserList = (List<User>) context.getAttribute("onlineUserList");

		// 获得当前要销毁的会话登录用户
		User user_session = (User) se.getSession().getAttribute("USER_SESSION");

		if (null != onlineUserList) 
		{
			// 从在线用户列表中移除对应的用户
			onlineUserList.remove(user_session);

		} else {
			onlineUserList = new ArrayList<User>();
		}

		// 重新设置上下文中的用户列表
		context.setAttribute("onlineUserList", onlineUserList);

		// 重新设置上下文中的用户数目
		context.setAttribute("onlineCount", onlineUserList.size());
	}


	/**
	 * 属性值修改时会触发该方法
	 */
	public void attributeReplaced(HttpSessionBindingEvent event)
	{
		// 获取Servlet上下文
		ServletContext context = event.getSession().getServletContext();

		// 首先获取当前在线用户列表
		List<User> onlineUserList = (List<User>) context.getAttribute("onlineUserList");

		// 如果当前修改的是USER_SESSION属性，则处理
		if ("USER_SESSION".equals(event.getName()))
		{
			// 获取当前登录的用户名
			User user_session = (User) event.getSession().getAttribute("USER_SESSION");

			// 如果当前在线用户中该用户不存在，则将该用户名称加入在线用户列表中
			if (!onlineUserList.contains(user_session))
			{
				onlineUserList.add(user_session);
			}
		}
		// 重新设置对应的在线用户列表
		context.setAttribute("onlineUserList", onlineUserList);

		// 重新设置对应的在线用户数
		context.setAttribute("onlineCount", onlineUserList.size());
	}

	public void attributeRemoved(HttpSessionBindingEvent arg0) {
		// TODO Auto-generated method stub

	}

	public void sessionCreated(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		
	}
}