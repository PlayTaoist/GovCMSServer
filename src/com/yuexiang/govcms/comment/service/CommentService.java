package com.yuexiang.govcms.comment.service;

import java.util.List;
import java.util.Map;

import com.yuexiang.govcms.comment.model.Comment;
import com.yuexiang.govcms.system.util.DataTables;

/**
 * 评论服务
 * @author yangtao
 * @since 2016年8月11日 下午8:57:00
 */
public interface CommentService {
	
	/**
	 * 
	 * @Title getPageList
	 * @Description 获取评论列表
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
	 * @Title addComment
	 * @Description 添加评论
	 *
	 * @author yangtao
	 * @since 2016年10月14日 下午8:38:21
	 *
	 * @param comment
	 * @return Map<String,Object>
	 */
	Map<String, Object> addComment(Comment comment);
	
	/**
	 * 修改评论
	 * @author yangtao
	 * @since 2016年8月12日 下午8:43:23
	 * @param comment
	 * @return
	 */
	Map<String, Object> updateComment(Comment comment);

	/**
	 * 获取评论详情
	 * @author yangtao
	 * @since 2016年9月25日 上午11:15:02
	 * @param id
	 * @return
	 */
	Comment getCommentById(Integer id);

	/**
	 * 删除评论
	 * 
	 * @author yangtao
	 * @since 2016年8月12日 下午8:42:07
	 * @param id
	 * @return
	 */
	Map<String, Object> delComment(List<Integer> idlist);
}
