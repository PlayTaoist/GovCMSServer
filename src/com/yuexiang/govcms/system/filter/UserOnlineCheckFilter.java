package com.yuexiang.govcms.system.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;

import com.yuexiang.govcms.admin.model.Admin;


/**
 * 用户是否在线的过滤器
 * @author yangtao
 *
 */
public class UserOnlineCheckFilter extends OncePerRequestFilter{

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)throws ServletException, IOException {
		String uri = request.getRequestURI();
		System.out.println(uri);
		Admin user = (Admin) request.getSession().getAttribute("user");
		if (uri.indexOf("admin") > 0 && uri.indexOf("login") == -1 && user == null) {
			String path = request.getContextPath();
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/admin/login.jsp";
			response.sendRedirect(basePath);
		} else {
			// 活动有效,继续
			chain.doFilter(request, response);
		}
	}
}
