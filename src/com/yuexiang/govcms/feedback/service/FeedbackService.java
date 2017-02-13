package com.yuexiang.govcms.feedback.service;

import java.util.List;
import java.util.Map;

import com.yuexiang.govcms.feedback.model.Feedback;
import com.yuexiang.govcms.system.util.DataTables;

/**
 * 反馈服务
 * @author yangtao
 * @since 2016年8月11日 下午8:57:00
 */
public interface FeedbackService {
	
	/**
	 * 
	 * @Title getPageList
	 * @Description 获取反馈列表
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
	 * @Title addFeedback
	 * @Description 添加反馈
	 *
	 * @author yangtao
	 * @since 2016年10月14日 下午8:38:21
	 *
	 * @param feedback
	 * @return Map<String,Object>
	 */
	Map<String, Object> addFeedback(Feedback feedback);
	
	/**
	 * 修改反馈
	 * @author yangtao
	 * @since 2016年8月12日 下午8:43:23
	 * @param feedback
	 * @return
	 */
	Map<String, Object> updateFeedback(Feedback feedback);

	/**
	 * 获取反馈详情
	 * @author yangtao
	 * @since 2016年9月25日 上午11:15:02
	 * @param id
	 * @return
	 */
	Feedback getFeedbackById(Integer id);

	/**
	 * 删除反馈
	 * 
	 * @author yangtao
	 * @since 2016年8月12日 下午8:42:07
	 * @param id
	 * @return
	 */
	Map<String, Object> delFeedback(List<Integer> idlist);
}
