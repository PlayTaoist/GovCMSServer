package com.yuexiang.govcms.comment.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yuexiang.govcms.comment.dao.CommentMapper;
import com.yuexiang.govcms.comment.model.Comment;
import com.yuexiang.govcms.comment.service.CommentService;
import com.yuexiang.govcms.system.base.BaseService;
import com.yuexiang.govcms.system.util.DataTables;
import com.yuexiang.govcms.system.util.RequestStatus;

/**
 * 
 * @ClassName CommentServiceImpl
 * @Description 评论服务实现类
 *
 * @author yangtao
 * @since 2016年10月13日 下午11:48:44
 *
 */
@Service
public class CommentServiceImpl extends BaseService implements CommentService {
	
	@Autowired
	CommentMapper commentMapper;

	@Override
	public DataTables getPageList(DataTables dataTables) {
		PageHelper.startPage(dataTables.getStart(), dataTables.getLength()); // 核心分页代码 
		PageHelper.orderBy("id desc");
		
		if(!StringUtils.isEmpty(dataTables.getColumn())){
			String column = propertyToColumn(CommentMapper.class, dataTables.getColumn());
			if(!StringUtils.isEmpty(column)){
				PageHelper.orderBy(column + " " + dataTables.getOrder());
			}
		}
		
		PageInfo<Comment> pageInfo = new PageInfo<Comment>(commentMapper.getPageList(dataTables.getSearch(), dataTables.getSubSQL()));
		dataTables.setRecordsTotal(pageInfo.getTotal());
		dataTables.setRecordsFiltered(pageInfo.getTotal());
		dataTables.setData(pageInfo.getList() != null ? pageInfo.getList() : new ArrayList<>());
		
		return dataTables;
	}
	
	@Override
	public Map<String, Object> addComment(Comment comment) {
		Map<String, Object> map = new HashMap<>();
		Integer id = commentMapper.insert(comment);
		if (id > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		
		return map;
	}
	
	@Override
	public Map<String, Object> updateComment(Comment comment) {
		Map<String, Object> map = new HashMap<>();
		if (commentMapper.updateByPrimaryKey(comment) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}

	@Override
	public Comment getCommentById(Integer id) {
		return commentMapper.selectByPrimaryKey(id);
	}

	@Override
	public Map<String, Object> delComment(List<Integer> idlist) {
		Map<String, Object> map = new HashMap<>();
		if (commentMapper.deleteByPrimaryKeys(idlist) > 0) {
			map.put("status", RequestStatus.SUCCESS);
		}else{
			map.put("status", RequestStatus.FAIL);
		}
		return map;
	}


}
