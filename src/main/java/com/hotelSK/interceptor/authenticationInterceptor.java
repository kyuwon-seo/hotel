package com.hotelSK.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class authenticationInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
				try {
					if(request.getSession().getAttribute("user") == null) { //로그인 상태가 아니면 false
						response.setContentType("text/html; charset=UTF-8");
						PrintWriter out = response.getWriter();
						out.println("<script>alert('로그인 후 이용해주세요.'); location.href='login';</script>"); 
						out.flush();
						return false;
					}else {
						return true;
					}
				}catch (Exception e){
					e.printStackTrace();
				}
				return super.preHandle(request, response, handler);
	}
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler, ModelAndView modelAndView) throws Exception {
				super.postHandle(request, response, handler, modelAndView);
	}
	
}
