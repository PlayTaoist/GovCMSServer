package com.yuexiang.govcms.authorities.service;

import java.util.Map;

/**
 * 
 * @ClassName: AuthoritiesService
 * @Description: 授权服务层
 *
 * @author yangtao
 * @since 2016年10月28日 下午1:24:50
 *
 */
public interface AuthoritiesService {

	/**
	 * 
	 * @Title: grant 
	 * @Description: 给角色授权
	 *
	 * @author yangtao
	 * @since 2016年10月28日 下午1:42:10
	 *
	 * @param id
	 * @param menuIds
	 * @return String
	 */
	Map<String, Object> grant(Integer id, String menuIds);

}
