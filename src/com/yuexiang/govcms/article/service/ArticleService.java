package com.yuexiang.govcms.article.service;

import java.util.List;
import java.util.Map;

import com.yuexiang.govcms.article.model.Article;
import com.yuexiang.govcms.system.util.DataTables;

/**
 * 文章服务
 * @author yangtao
 * @since 2016年8月11日 下午8:57:00
 */
public interface ArticleService {
	
	/**
	 * 
	 * @Title getPageList
	 * @Description 获取文章列表
	 *
	 * @author yangtao
	 * @since 2016年10月13日 下午11:46:52
	 *
	 * @param dataTables
	 * @return DataTables
	 */
	DataTables getPageList(DataTables dataTables);
	
	/**
	 * 
	 * @Title addArticle
	 * @Description 添加文章
	 *
	 * @author yangtao
	 * @since 2016年10月14日 下午8:38:21
	 *
	 * @param article
	 * @return Map<String,Object>
	 */
	Map<String, Object> addArticle(Article article);
	
	/**
	 * 修改文章
	 * @author yangtao
	 * @since 2016年8月12日 下午8:43:23
	 * @param article
	 * @return
	 */
	Map<String, Object> updateArticle(Article article);

	/**
	 * 获取文章详情
	 * @author yangtao
	 * @since 2016年9月25日 上午11:15:02
	 * @param id
	 * @return
	 */
	Article getArticleById(Integer id);

	/**
	 * 删除文章
	 * 
	 * @author yangtao
	 * @since 2016年8月12日 下午8:42:07
	 * @param id
	 * @return
	 */
	Map<String, Object> delArticle(List<Integer> idlist);

	/**
	 * 获取文章
	 * @Title: getArticle 
	 * @Description: 
	 *
	 * @author yangtao
	 * @since 2016年12月8日 下午12:30:47
	 *
	 * @param id
	 * @return Article
	 */
	Article getArticle(int id);
}
