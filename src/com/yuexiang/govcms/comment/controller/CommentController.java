package com.yuexiang.govcms.comment.controller;

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
import com.yuexiang.govcms.comment.model.Comment;
import com.yuexiang.govcms.comment.service.CommentService;
import com.yuexiang.govcms.system.base.BaseController;
import com.yuexiang.govcms.system.util.DataTables;

/**
 * 评论控制
 * @author yangtao
 * @since 2016年8月11日 下午8:28:40
 */
@Controller
@RequestMapping("/comment")
public class CommentController extends BaseController {

	@Autowired
	HttpServletRequest request;// 请求

	@Autowired
	CommentService commentService;

	/**
	 * 
	 * @Title getPageList
	 * @Description 获取评论列表
	 *
	 * @author yangtao
	 * @since 2016年10月13日 下午11:47:09
	 *
	 * @return String
	 */
	@RequestMapping(value = "/getPageList", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getPageList(){
		return JSON.toJSONString(commentService.getPageList(DataTables.getInstance(request, null)));
	}
	
	/**
	 * 
	 * @Title save
	 * @Description 新增评论
	 *
	 * @author yangtao
	 * @since 2016年10月14日 下午8:19:08
	 *
	 * @param comment
	 * @return String
	 */
	@RequestMapping(value = "/add", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String addComment(@ModelAttribute Comment comment) {
		comment.setCreateId(((Admin)request.getSession().getAttribute("admin")).getId());
		comment.setCreateTime(new Date());
		comment.setUpdateTime(new Date());
		comment.setStatus(0);
		return JSON.toJSONString(commentService.addComment(comment));
	}
	
	/**
	 * 更新评论
	 * 
	 * @author yangtao
	 * @since 2016年8月12日 下午8:42:07
	 * @param comment
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String updateComment(@ModelAttribute Comment comment) {
		return JSONObject.toJSONString(commentService.updateComment(comment));
	}
	
	/**
	 * 删除评论
	 * 
	 * @author yangtao
	 * @since 2016年8月12日 下午8:42:07
	 * @param idlist
	 * @return
	 */
	@RequestMapping(value = "/del", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String delComment(@RequestParam("idlist[]") List<Integer> idlist) {
		return JSONObject.toJSONString(commentService.delComment(idlist));
	}
}
