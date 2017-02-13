package com.yuexiang.govcms.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yuexiang.govcms.comment.model.Comment;

public interface CommentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Comment record);

    Comment selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(Comment record);
    
    /**
	 * 多条删除
	 * @author yangtao
	 * @since 2016年9月25日 下午12:06:35
	 * @param idlist
	 * @return
	 */
	int deleteByPrimaryKeys(@Param("idlist")List<Integer> idlist);
	
	List<Comment> getPageList(@Param("search") String search, @Param("subSQL") String subSQL);
}