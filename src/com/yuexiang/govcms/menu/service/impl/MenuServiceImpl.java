package com.yuexiang.govcms.menu.service.impl;

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
import com.yuexiang.govcms.menu.dao.MenuMapper;
import com.yuexiang.govcms.menu.model.Menu;
import com.yuexiang.govcms.menu.service.MenuService;
import com.yuexiang.govcms.system.base.BaseService;
import com.yuexiang.govcms.system.util.DataTables;
import com.yuexiang.govcms.system.util.RequestStatus;

/**
 * 用户服务实现
 * @author yangtao
 * @since 2016年8月11日 下午9:01:25
 */
@Service
public class MenuServiceImpl extends BaseService implements MenuService {
	
	@Autowired
	MenuMapper menuMapper; 

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
		
		PageInfo<Menu> pageInfo = new PageInfo<Menu>(menuMapper.getPageList(dataTables.getSearch(), dataTables.getSubSQL()));
		dataTables.setRecordsTotal(pageInfo.getTotal());
		dataTables.setRecordsFiltered(pageInfo.getTotal());
		dataTables.setData(pageInfo.getList() != null ? pageInfo.getList() : new ArrayList<>());
		
		return dataTables;
	}

	@Override
	public Map<String, Object> addMenu(Menu menu) {
		Map<String, Object> map = new HashMap<>();
		Integer id = menuMapper.insert(menu);
		if (id > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		
		return map;
	}

	@Override
	public List<Menu> selectAll() {
		List<Menu> menus = menuMapper.selectAll();
		for (Menu menu : menus) {
			menu.setIcon(null);
		}
		return menus;
	}

	@Override
	public Map<String, Object> updateMenu(Menu menu) {
		Map<String, Object> map = new HashMap<>();
		if (menuMapper.updateByPrimaryKey(menu) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}

	@Override
	public Menu getMenuById(Integer id) {
		return menuMapper.selectByPrimaryKey(id);
	}

	@Override
	public Map<String, Object> delMenu(List<Integer> idlist) {
		Map<String, Object> map = new HashMap<>();
		if (menuMapper.deleteByPrimaryKeys(idlist) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}

}
