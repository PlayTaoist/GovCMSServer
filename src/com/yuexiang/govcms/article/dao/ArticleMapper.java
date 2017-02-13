package com.yuexiang.govcms.article.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yuexiang.govcms.article.model.Article;

/**
 * 
 * @ClassName ArticleMapper
 * @Description 文章持久层
 *
 * @author yangtao
 * @since 2016年10月13日 下午11:52:17
 *
 */
@Repository
public interface ArticleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Article record);

    Article selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(Article record);

	Integer recordsTotal();
	
	Integer recordsFiltered(@Param("search") String search);
	
	/**
	 * 多条删除
	 * @author yangtao
	 * @since 2016年9月25日 下午12:06:35
	 * @param idlist
	 * @return
	 */
	int deleteByPrimaryKeys(@Param("idlist")List<Integer> idlist);
	
	List<Article> getPageList(@Param("search") String search, @Param("subSQL") String subSQL);
}