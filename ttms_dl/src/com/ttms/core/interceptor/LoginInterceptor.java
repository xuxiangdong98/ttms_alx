package com.ttms.core.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ttms.core.po.User;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO 自动生成的方法存根

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO 自动生成的方法存根

	}


		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
			//获取请求的URL
			String url = request.getRequestURI();
			//判断该请求是否包含login.action,如果包含则放行，如果不包含则全部拦截
			if(url.indexOf("/ttms/login.action")>=0) {
				return true;
			}
			//对其他的请求，进行登录判断，获取Session
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("USER_SESSION");
			//判断Session中是否有用户数据，如果有则放行
			if(user !=null) {
				return true;
			}
			//如果Session中没有用户数据，则说明不符合条件，给出提示信息并转发跳转到登录页面
			request.setAttribute("msg","亲，您还没有登录，请先登录！");
			request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
			return false;
		}
}
