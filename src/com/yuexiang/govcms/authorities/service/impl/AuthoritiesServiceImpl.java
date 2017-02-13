package com.yuexiang.govcms.authorities.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yuexiang.govcms.authorities.dao.AuthoritiesMapper;
import com.yuexiang.govcms.authorities.service.AuthoritiesService;
import com.yuexiang.govcms.system.util.RequestStatus;
import com.yuexiang.govcms.system.util.StringUtil;

/**
 * 
 * @ClassName: AuthoritiesServiceImpl
 * @Description: 授权服务层实现类
 *
 * @author yangtao
 * @since 2016年10月28日 下午1:25:55
 *
 */
@Service
public class AuthoritiesServiceImpl implements AuthoritiesService {

	@Autowired
	AuthoritiesMapper authoritiesMapper;

	@Override
	public Map<String, Object> grant(Integer roleId, String menuIds) {
		Map<String, Object> map = new HashMap<>();
		List<String> menuIdList = StringUtil.StringToList(menuIds, ",");
		authoritiesMapper.deleteByRole(roleId);
		if ((menuIdList != null && menuIdList.size() > 0) && authoritiesMapper.grant(roleId, menuIdList) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		} else {
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}
}
