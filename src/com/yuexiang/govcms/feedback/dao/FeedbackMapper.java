package com.yuexiang.govcms.feedback.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.yuexiang.govcms.feedback.model.Feedback;

public interface FeedbackMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Feedback feedback);

    Feedback selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(Feedback feedback);
    
    /**
	 * 分页反馈列表
	 * 
	 * @author yangtao
	 * @since 2016年8月11日 下午9:28:54
	 * @param search
	 * @param column
	 * @return
	 */
	List<Feedback> getPageList(@Param("search") String search, @Param("subSQL") String subSQL);
	
	/**
	 * 多条删除
	 * @author yangtao
	 * @since 2016年9月25日 下午12:06:35
	 * @param idlist
	 * @return
	 */
	int deleteByPrimaryKeys(@Param("idlist")List<Integer> idlist);
}