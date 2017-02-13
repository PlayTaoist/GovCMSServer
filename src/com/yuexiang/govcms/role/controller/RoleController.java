package com.yuexiang.govcms.role.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.yuexiang.govcms.admin.model.Admin;
import com.yuexiang.govcms.role.model.Role;
import com.yuexiang.govcms.role.service.RoleService;
import com.yuexiang.govcms.system.util.DataTables;

/**
 * 
 * @ClassName RoleController
 * @Description 角色控制器
 *
 * @author yangtao
 * @since 2016年10月26日 下午8:43:37
 *
 */
@Controller
@RequestMapping("/role")
public class RoleController {
	@Autowired
	HttpServletRequest request;// 请求

	@Autowired
	RoleService roleService;

	/**
	 * 获取角色列表
	 * 
	 * @author yangtao
	 * @since 2016年8月11日 下午9:02:02
	 * @return
	 */
	@RequestMapping(value = "/getPageList", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getPageList() {
		return JSONObject.toJSONString(roleService.getPageList(DataTables.getInstance(request, null)));
	}
	
	/**
	 * 获取角色详情
	 * @author yangtao
	 * @since 2016年9月25日 上午11:15:13
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/getRoleById", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getRoleById(Integer id) {
		return JSONObject.toJSONString(roleService.getRoleById(id));
	}
	

	/**
	 * 添加角色
	 * 
	 * @author yangtao
	 * @since 2016年8月12日 下午8:42:07
	 * @param role
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String addRole(@ModelAttribute Role role, @RequestParam("menuIds") String menuIds) {
		role.setCreateId(((Admin)request.getSession().getAttribute("admin")).getId());
		role.setCreateTime(new Date());
		role.setUpdateTime(new Date());
		return JSONObject.toJSONString(roleService.addRole(role, menuIds));
	}
	
	/**
	 * 更新角色
	 * 
	 * @author yangtao
	 * @since 2016年8月12日 下午8:42:07
	 * @param role
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String updateRole(@ModelAttribute Role role, @RequestParam("menuIds") String menuIds) {
		return JSONObject.toJSONString(roleService.updateRole(role, menuIds));
	}
	
	/**
	 * 删除角色
	 * 
	 * @author yangtao
	 * @since 2016年8月12日 下午8:42:07
	 * @param idlist
	 * @return
	 */
	@RequestMapping(value = "/del", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String delRole(@RequestParam("idlist[]") List<Integer> idlist) {
		return JSONObject.toJSONString(roleService.delRole(idlist));
	}
	
	/**
	 * 查询出所有的角色
	 * 
	 * @author yangtao
	 * @since 2016年8月12日 下午8:42:07
	 * @param idlist
	 * @return
	 */
	@RequestMapping(value = "/selectAll", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String selectAll() {
		return JSONObject.toJSONString(roleService.selectAll());
	}
}
