package com.yuexiang.govcms.feedback.controller;

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
import com.yuexiang.govcms.feedback.model.Feedback;
import com.yuexiang.govcms.feedback.service.FeedbackService;
import com.yuexiang.govcms.system.base.BaseController;
import com.yuexiang.govcms.system.util.DataTables;

/**
 * 反馈控制
 * @author yangtao
 * @since 2016年8月11日 下午8:28:40
 */
@Controller
@RequestMapping("/feedback")
public class FeedbackController extends BaseController {

	@Autowired
	HttpServletRequest request;// 请求

	@Autowired
	FeedbackService feedbackService;

	/**
	 * 
	 * @Title getPageList
	 * @Description 获取反馈列表
	 *
	 * @author yangtao
	 * @since 2016年10月13日 下午11:47:09
	 *
	 * @return String
	 */
	@RequestMapping(value = "/getPageList", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getPageList(){
		return JSON.toJSONString(feedbackService.getPageList(DataTables.getInstance(request, null)));
	}
	
	/**
	 * 获取反馈详情
	 * @Title: getFeedbackById
	 * @Description: 
	 *
	 * @author yangtao
	 * @since 2016年11月28日 下午8:35:03
	 *
	 * @param id
	 * @return String
	 */
	@RequestMapping(value = "/getFeedbackById", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getFeedbackById(Integer id) {
		return JSONObject.toJSONString(feedbackService.getFeedbackById(id));
	}
	
	/**
	 * 
	 * @Title save
	 * @Description 新增反馈
	 *
	 * @author yangtao
	 * @since 2016年10月14日 下午8:19:08
	 *
	 * @param feedback
	 * @return String
	 */
	@RequestMapping(value = "/add", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String addFeedback(@ModelAttribute Feedback feedback) {
		feedback.setCreateId(((Admin)request.getSession().getAttribute("admin")).getId());
		feedback.setCreateTime(new Date());
		feedback.setUpdateTime(new Date());
		feedback.setStatus(0);
		return JSON.toJSONString(feedbackService.addFeedback(feedback));
	}
	
	/**
	 * 更新反馈
	 * 
	 * @author yangtao
	 * @since 2016年8月12日 下午8:42:07
	 * @param feedback
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String updateFeedback(@ModelAttribute Feedback feedback) {
		return JSONObject.toJSONString(feedbackService.updateFeedback(feedback));
	}
	
	/**
	 * 删除反馈
	 * 
	 * @author yangtao
	 * @since 2016年8月12日 下午8:42:07
	 * @param idlist
	 * @return
	 */
	@RequestMapping(value = "/del", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String delFeedback(@RequestParam("idlist[]") List<Integer> idlist) {
		return JSONObject.toJSONString(feedbackService.delFeedback(idlist));
	}
}
