package com.yuexiang.govcms.authorities.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yuexiang.govcms.authorities.service.AuthoritiesService;

/**
 * 
 * @ClassName: AuthoritiesController
 * @Description: 权限控制层
 *
 * @author yangtao
 * @since 2016年10月28日 下午1:23:08
 *
 */
@Controller
@RequestMapping("/auth")
public class AuthoritiesController {
	
	@Autowired
	AuthoritiesService authoritiesService;
}
