package com.yuexiang.govcms.role.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yuexiang.govcms.article.dao.ArticleMapper;
import com.yuexiang.govcms.authorities.service.AuthoritiesService;
import com.yuexiang.govcms.role.dao.RoleMapper;
import com.yuexiang.govcms.role.model.Role;
import com.yuexiang.govcms.role.service.RoleService;
import com.yuexiang.govcms.system.base.BaseService;
import com.yuexiang.govcms.system.util.DataTables;
import com.yuexiang.govcms.system.util.RequestStatus;

/**
 * 用户服务实现
 * @author yangtao
 * @since 2016年8月11日 下午9:01:25
 */
@Service
public class RoleServiceImpl extends BaseService implements RoleService {
	
	@Autowired
	RoleMapper roleMapper; 
	
	@Autowired
	AuthoritiesService authoritiesService;

	@Override
	public DataTables getPageList(DataTables dataTables) {
		PageHelper.startPage(dataTables.getStart(), dataTables.getLength()); // 核心分页代码 
		PageHelper.orderBy("sort asc");
		
		if(!StringUtils.isEmpty(dataTables.getColumn())){
			String column = propertyToColumn(ArticleMapper.class, dataTables.getColumn());
			if(!StringUtils.isEmpty(column)){
				PageHelper.orderBy(column + " " + dataTables.getOrder());
			}
		}
		
		PageInfo<Role> pageInfo = new PageInfo<Role>(roleMapper.getPageList(dataTables.getSearch(), dataTables.getSubSQL()));
		dataTables.setRecordsTotal(pageInfo.getTotal());
		dataTables.setRecordsFiltered(pageInfo.getTotal());
		dataTables.setData(pageInfo.getList() != null ? pageInfo.getList() : new ArrayList<>());
		
		return dataTables;
	}

	@Override
	public Map<String, Object> addRole(Role role, String menuIds) {
		Map<String, Object> map = new HashMap<>();
		Integer id = roleMapper.insert(role);
		if (id > 0) {
			authoritiesService.grant(id, menuIds);
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		
		return map;
	}

	@Override
	public Map<String, Object> updateRole(Role role, String menuIds) {
		Map<String, Object> map = new HashMap<>();
		if (roleMapper.updateByPrimaryKey(role) > 0) {
			authoritiesService.grant(role.getId(), menuIds);
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}

	@Override
	public Role getRoleById(Integer id) {
		return roleMapper.selectByPrimaryKey(id);
	}

	@Override
	public Map<String, Object> delRole(List<Integer> idlist) {
		Map<String, Object> map = new HashMap<>();
		if (roleMapper.deleteByPrimaryKeys(idlist) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}

	@Override
	public List<Role> selectAll() {
		return roleMapper.selectAll();
	}
}
