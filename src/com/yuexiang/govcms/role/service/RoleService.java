package com.yuexiang.govcms.role.service;

import java.util.List;
import java.util.Map;

import com.yuexiang.govcms.role.model.Role;
import com.yuexiang.govcms.system.util.DataTables;

/**
 * 角色服务
 * @author yangtao
 * @since 2016年8月11日 下午8:59:05
 */
public interface RoleService {
	
	/**
	 * 获取分页角色列表
	 * @author yangtao
	 * @since 2016年8月11日 下午8:58:30
	 * @param dataTables
	 * @return
	 */
	DataTables getPageList(DataTables dataTables);

	/**
	 * 添加角色
	 * @author yangtao
	 * @since 2016年8月12日 下午8:43:23
	 * @param role
	 * @param menuIds 
	 * @return
	 */
	Map<String, Object> addRole(Role role, String menuIds);

	/**
	 * 修改角色
	 * @author yangtao
	 * @since 2016年8月12日 下午8:43:23
	 * @param role
	 * @param menuIds 
	 * @return
	 */
	Map<String, Object> updateRole(Role role, String menuIds);

	/**
	 * 获取角色详情
	 * @author yangtao
	 * @since 2016年9月25日 上午11:15:02
	 * @param id
	 * @return
	 */
	Role getRoleById(Integer id);

	/**
	 * 删除角色
	 * 
	 * @author yangtao
	 * @since 2016年8月12日 下午8:42:07
	 * @param id
	 * @return
	 */
	Map<String, Object> delRole(List<Integer> idlist);

	/**
	 * 查询出所有的角色
	 * 
	 * @author yangtao
	 * @since 2016年8月12日 下午8:42:07
	 * @param idlist
	 * @return
	 */
	List<Role> selectAll();
}
