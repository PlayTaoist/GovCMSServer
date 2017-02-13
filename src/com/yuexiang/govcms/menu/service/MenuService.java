package com.yuexiang.govcms.menu.service;

import java.util.List;
import java.util.Map;

import com.yuexiang.govcms.menu.model.Menu;
import com.yuexiang.govcms.system.util.DataTables;

/**
 * 菜单服务
 * @author yangtao
 * @since 2016年8月11日 下午8:59:05
 */
public interface MenuService {
	
	/**
	 * 获取分页菜单列表
	 * @author yangtao
	 * @since 2016年8月11日 下午8:58:30
	 * @param dataTables
	 * @return
	 */
	DataTables getPageList(DataTables dataTables);

	/**
	 * 添加菜单
	 * @author yangtao
	 * @since 2016年8月12日 下午8:43:23
	 * @param menu
	 * @return
	 */
	Map<String, Object> addMenu(Menu menu);
	
	/**
	 * 获取所有菜单数据
	 * @author yangtao
	 * @since 2016年9月20日 下午9:23:59
	 * @return
	 */
	List<Menu> selectAll();

	/**
	 * 修改菜单
	 * @author yangtao
	 * @since 2016年8月12日 下午8:43:23
	 * @param menu
	 * @return
	 */
	Map<String, Object> updateMenu(Menu menu);

	/**
	 * 获取菜单详情
	 * @author yangtao
	 * @since 2016年9月25日 上午11:15:02
	 * @param id
	 * @return
	 */
	Menu getMenuById(Integer id);

	/**
	 * 删除菜单
	 * 
	 * @author yangtao
	 * @since 2016年8月12日 下午8:42:07
	 * @param id
	 * @return
	 */
	Map<String, Object> delMenu(List<Integer> idlist);
}
