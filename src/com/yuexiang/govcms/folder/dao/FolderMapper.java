package com.yuexiang.govcms.folder.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yuexiang.govcms.folder.model.Folder;

public interface FolderMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Folder record);

	Folder selectByPrimaryKey(Integer id);

	int updateByPrimaryKey(Folder record);

	/**
	 * 分页返回栏目
	 * @param search
	 * @param column
	 * @return
	 */
	List<Folder> getPageList(@Param("search") String search, @Param("subSQL") String subSQL);

	/**
	 * 多条删除
	 * 
	 * @author yangtao
	 * @since 2016年9月25日 下午12:06:35
	 * @param idlist
	 * @return
	 */
	int deleteByPrimaryKeys(@Param("idlist") List<Integer> idlist);

	/**
	 * 
	 * @Title selectAll
	 * @Description 获取所有的栏目(树)
	 *
	 * @author yangtao
	 * @since 2016年10月16日 下午8:49:48
	 *
	 * @return String
	 */
	List<Folder> selectAll();
}