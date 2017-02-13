package com.yuexiang.govcms.article.controller;

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
import com.yuexiang.govcms.article.model.Article;
import com.yuexiang.govcms.article.service.ArticleService;
import com.yuexiang.govcms.system.base.BaseController;
import com.yuexiang.govcms.system.util.DataTables;

/**
 * 文章控制
 * @author yangtao
 * @since 2016年8月11日 下午8:28:40
 */
@Controller
@RequestMapping("/article")
public class ArticleController extends BaseController {

	@Autowired
	HttpServletRequest request;// 请求

	@Autowired
	ArticleService articleService;

	/**
	 * 
	 * @Title getPageList
	 * @Description 获取文章列表
	 *
	 * @author yangtao
	 * @since 2016年10月13日 下午11:47:09
	 *
	 * @return String
	 */
	@RequestMapping(value = "/getPageList", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getPageList(){
		return JSON.toJSONString(articleService.getPageList(DataTables.getInstance(request, null)));
	}
	
	/**
	 * 
	 * @Title getArticle
	 * @Description 获取文章
	 *
	 * @author yangtao
	 * @since 2016年10月13日 下午11:47:09
	 *
	 * @return String
	 */
	@RequestMapping(value = "/getArticle", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getArticle(int id){
		return JSON.toJSONString(articleService.getArticle(id));
	}
	
	/**
	 * 
	 * @Title save
	 * @Description 新增文章
	 *
	 * @author yangtao
	 * @since 2016年10月14日 下午8:19:08
	 *
	 * @param article
	 * @return String
	 */
	@RequestMapping(value = "/add", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String addArticle(@ModelAttribute Article article) {
		article.setCreateId(((Admin)request.getSession().getAttribute("admin")).getId());
		article.setCreateTime(new Date());
		article.setUpdateTime(new Date());
		article.setStatus(0);
		return JSON.toJSONString(articleService.addArticle(article));
	}
	
	/**
	 * 更新文章
	 * 
	 * @author yangtao
	 * @since 2016年8月12日 下午8:42:07
	 * @param article
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String updateArticle(@ModelAttribute Article article) {
		return JSONObject.toJSONString(articleService.updateArticle(article));
	}
	
	/**
	 * 删除文章
	 * 
	 * @author yangtao
	 * @since 2016年8月12日 下午8:42:07
	 * @param idlist
	 * @return
	 */
	@RequestMapping(value = "/del", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String delArticle(@RequestParam("idlist[]") List<Integer> idlist) {
		return JSONObject.toJSONString(articleService.delArticle(idlist));
	}
}
