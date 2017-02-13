package com.yuexiang.govcms.menu.controller;

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
import com.yuexiang.govcms.menu.model.Menu;
import com.yuexiang.govcms.menu.service.MenuService;
import com.yuexiang.govcms.system.base.BaseController;
import com.yuexiang.govcms.system.util.DataTables;

/**
 * 菜单控制
 * 
 * @author yangtao
 * @since 2016年8月11日 下午8:28:40
 */
@Controller
@RequestMapping("/menu")
public class MenuController extends BaseController {

	@Autowired
	HttpServletRequest request;// 请求

	@Autowired
	MenuService menuService;

	/**
	 * 获取菜单列表
	 * 
	 * @author yangtao
	 * @since 2016年8月11日 下午9:02:02
	 * @return
	 */
	@RequestMapping(value = "/getPageList", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getPageList() {
		return JSONObject.toJSONString(menuService.getPageList(DataTables.getInstance(request, null)));
	}
	
	/**
	 * 获取菜单详情
	 * @author yangtao
	 * @since 2016年9月25日 上午11:15:13
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/getMenuById", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getMenuById(Integer id) {
		return JSONObject.toJSONString(menuService.getMenuById(id));
	}

	/**
	 * 添加菜单
	 * 
	 * @author yangtao
	 * @since 2016年8月12日 下午8:42:07
	 * @param menu
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String addMenu(@ModelAttribute Menu menu) {
		menu.setCreateId(((Admin)request.getSession().getAttribute("admin")).getId());
		menu.setCreateTime(new Date());
		menu.setUpdateTime(new Date());
		return JSONObject.toJSONString(menuService.addMenu(menu));
	}
	
	/**
	 * 更新菜单
	 * 
	 * @author yangtao
	 * @since 2016年8月12日 下午8:42:07
	 * @param menu
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String updateMenu(@ModelAttribute Menu menu) {
		return JSONObject.toJSONString(menuService.updateMenu(menu));
	}
	
	/**
	 * 删除菜单
	 * 
	 * @author yangtao
	 * @since 2016年8月12日 下午8:42:07
	 * @param idlist
	 * @return
	 */
	@RequestMapping(value = "/del", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String delMenu(@RequestParam("idlist[]") List<Integer> idlist) {
		return JSONObject.toJSONString(menuService.delMenu(idlist));
	}
	

	/**
	 * 获取所有的菜单数据
	 * 
	 * @author yangtao
	 * @since 2016年9月20日 下午9:26:32
	 * @return
	 */
	@RequestMapping(value = "/selectAll", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String selectAll() {
		return JSONObject.toJSONString(menuService.selectAll());
	}
}
