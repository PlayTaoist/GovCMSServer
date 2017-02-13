package com.yuexiang.govcms.system.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;

import com.yuexiang.govcms.admin.model.Admin;


/**
 * 过滤器 
 * 后台管理用户是否在线
 * 
 * @author yangtao
 *
 */
public class MyFilter extends OncePerRequestFilter {
	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
		Admin user = (Admin) request.getSession().getAttribute("user");
		String uri = request.getRequestURI();
		System.out.println(uri);
		
		if (uri.indexOf("resources") > 0 || uri.indexOf("resources") > 0 || uri.equals(request.getServletContext()+"/index.jsp") || uri.indexOf("jsp") > 0) {
			filterChain.doFilter(request, response);
		}else if (user == null) {
			if (request.getServerName().equals("localhost")) {
				response.sendRedirect("http://localhost:8080/DGDRAdmin/index.jsp");
			}else{
				response.sendRedirect("http://admin.liangzemu.com/login.jsp");
			}
		}
	}
}
