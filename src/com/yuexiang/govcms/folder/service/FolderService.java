package com.yuexiang.govcms.folder.service;

import java.util.List;
import java.util.Map;

import com.yuexiang.govcms.folder.model.Folder;
import com.yuexiang.govcms.system.util.DataTables;

/**
 * 栏目服务
 * @author yangtao
 * @since 2016年8月11日 下午8:57:00
 */
public interface FolderService {
	
	/**
	 * 
	 * @Title getPageList
	 * @Description 获取栏目列表
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
	 * @Title addFolder
	 * @Description 添加栏目
	 *
	 * @author yangtao
	 * @since 2016年10月14日 下午8:38:21
	 *
	 * @param folder
	 * @return Map<String,Object>
	 */
	Map<String, Object> addFolder(Folder folder);
	
	/**
	 * 修改栏目
	 * @author yangtao
	 * @since 2016年8月12日 下午8:43:23
	 * @param folder
	 * @return
	 */
	Map<String, Object> updateFolder(Folder folder);

	/**
	 * 获取栏目详情
	 * @author yangtao
	 * @since 2016年9月25日 上午11:15:02
	 * @param id
	 * @return
	 */
	Folder getFolderById(Integer id);

	/**
	 * 删除栏目
	 * 
	 * @author yangtao
	 * @since 2016年8月12日 下午8:42:07
	 * @param id
	 * @return
	 */
	Map<String, Object> delFolder(List<Integer> idlist);

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
