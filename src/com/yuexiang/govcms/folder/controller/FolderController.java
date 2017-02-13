package com.yuexiang.govcms.folder.controller;

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

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.yuexiang.govcms.admin.model.Admin;
import com.yuexiang.govcms.folder.model.Folder;
import com.yuexiang.govcms.folder.service.FolderService;
import com.yuexiang.govcms.system.base.BaseController;
import com.yuexiang.govcms.system.util.DataTables;

/**
 * 栏目控制
 * @author yangtao
 * @since 2016年8月11日 下午8:28:40
 */
@Controller
@RequestMapping("/folder")
public class FolderController extends BaseController {

	@Autowired
	HttpServletRequest request;// 请求

	@Autowired
	FolderService folderService;

	/**
	 * 
	 * @Title getPageList
	 * @Description 获取栏目列表
	 *
	 * @author yangtao
	 * @since 2016年10月13日 下午11:47:09
	 *
	 * @return String
	 */
	@RequestMapping(value = "/getPageList", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getPageList(){
		return JSON.toJSONString(folderService.getPageList(DataTables.getInstance(request, null)));
	}
	
	/**
	 * 
	 * @Title save
	 * @Description 新增栏目
	 *
	 * @author yangtao
	 * @since 2016年10月14日 下午8:19:08
	 *
	 * @param folder
	 * @return String
	 */
	@RequestMapping(value = "/addFolder", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String save(@ModelAttribute Folder folder) {
		folder.setCreateId(((Admin)request.getSession().getAttribute("admin")).getId());
		folder.setCreateTime(new Date());
		folder.setUpdateTime(new Date());
		return JSON.toJSONString(folderService.addFolder(folder));
	}
	
	/**
	 * 更新栏目
	 * 
	 * @author yangtao
	 * @since 2016年8月12日 下午8:42:07
	 * @param folder
	 * @return
	 */
	@RequestMapping(value = "/updateFolder", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String updateFolder(@ModelAttribute Folder folder) {
		return JSONObject.toJSONString(folderService.updateFolder(folder));
	}
	
	/**
	 * 删除栏目
	 * 
	 * @author yangtao
	 * @since 2016年8月12日 下午8:42:07
	 * @param idlist
	 * @return
	 */
	@RequestMapping(value = "/del", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String delFolder(@RequestParam("idlist[]") List<Integer> idlist) {
		return JSONObject.toJSONString(folderService.delFolder(idlist));
	}
	
	/**
	 * 
	 * @Title getAll
	 * @Description 获取所有的栏目(树)
	 *
	 * @author yangtao
	 * @since 2016年10月16日 下午8:49:48
	 *
	 * @return String
	 */
	@RequestMapping(value = "/selectAll", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String selectAll() {
		return JSON.toJSONString(folderService.selectAll());
	}
}
