package com.yuexiang.govcms.admin.service;

import com.yuexiang.govcms.admin.model.Admin;
import com.yuexiang.govcms.system.util.DataTables;

/**
 * 用户服务
 * @author yangtao
 * @data 2016年8月7日
 */
public interface AdminService {
	
	/**
	 * 用户登录
	 * @param username
	 * @param password
	 * @return
	 * @data 2016年8月7日
	 */
	Admin login(String username, String password);

	/**
	 * 
	 * @Title: getPageList
	 * @Description:  
	 *
	 * @author yangtao
	 * @since 2016年10月30日 下午12:14:18
	 *
	 * @param dataTables
	 * @return DataTables
	 */
	DataTables getPageList(DataTables dataTables);

}
