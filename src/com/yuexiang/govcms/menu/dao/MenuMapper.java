package com.yuexiang.govcms.menu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yuexiang.govcms.menu.model.Menu;

/**
 * 菜单持久层
 * 
 * @author yangtao
 * @since 2016年8月11日 下午9:25:24
 */
@Repository
public interface MenuMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Menu menu);

	Menu selectByPrimaryKey(Integer id);

	/**
	 * 分页查询菜单
	 * 
	 * @author yangtao
	 * @since 2016年8月11日 下午9:26:39
	 * @param start
	 * @param length
	 * @param search
	 * @param order
	 * @return
	 */
	List<Menu> selectAll();

	int updateByPrimaryKey(Menu menu);

	/**
	 * 分页菜单列表
	 * 
	 * @author yangtao
	 * @since 2016年8月11日 下午9:28:54
	 * @param search
	 * @param column
	 * @return
	 */
	List<Menu> getPageList(@Param("search") String search, @Param("subSQL") String subSQL);

	/**
	 * 多条删除
	 * @author yangtao
	 * @since 2016年9月25日 下午12:06:35
	 * @param idlist
	 * @return
	 */
	int deleteByPrimaryKeys(@Param("idlist")List<Integer> idlist);
}