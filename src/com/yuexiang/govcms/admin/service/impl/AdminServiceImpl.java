package com.yuexiang.govcms.admin.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yuexiang.govcms.admin.dao.AdminMapper;
import com.yuexiang.govcms.admin.model.Admin;
import com.yuexiang.govcms.admin.service.AdminService;
import com.yuexiang.govcms.article.dao.ArticleMapper;
import com.yuexiang.govcms.menu.model.Menu;
import com.yuexiang.govcms.system.base.BaseService;
import com.yuexiang.govcms.system.util.DataTables;

/**
 * 用户服务实现
 * @author yangtao
 * @since 2016年8月11日 下午9:01:25
 */
@Service
public class AdminServiceImpl extends BaseService implements AdminService {
	
	@Autowired
	AdminMapper adminMapper; 

	@Override
	public Admin login(String username, String password) {
		return adminMapper.login(username, password);
	}

	@Override
	public DataTables getPageList(DataTables dataTables) {
		PageHelper.startPage(dataTables.getStart(), dataTables.getLength()); // 核心分页代码 
		PageHelper.orderBy("id desc");
		
		if(!StringUtils.isEmpty(dataTables.getColumn())){
			String column = propertyToColumn(ArticleMapper.class, dataTables.getColumn());
			if(!StringUtils.isEmpty(column)){
				PageHelper.orderBy(column + " " + dataTables.getOrder());
			}
		}
		
		PageInfo<Menu> pageInfo = new PageInfo<Menu>(adminMapper.getPageList(dataTables.getSearch(), dataTables.getSubSQL()));
		dataTables.setRecordsTotal(pageInfo.getTotal());
		dataTables.setRecordsFiltered(pageInfo.getTotal());
		dataTables.setData(pageInfo.getList() != null ? pageInfo.getList() : new ArrayList<>());
		
		return dataTables;
	}

}
