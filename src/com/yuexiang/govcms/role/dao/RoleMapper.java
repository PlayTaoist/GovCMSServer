package com.yuexiang.govcms.role.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yuexiang.govcms.role.model.Role;

/**
 * 
 * @ClassName: RoleMapper
 * @Description: 角色持久层
 *
 * @author yangtao
 * @since 2016年10月28日 上午8:44:44
 *
 */
@Repository
public interface RoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Role role);

    Role selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(Role role);
    
	List<Role> getPageList(@Param("search") String search, @Param("subSQL") String subSQL);

	int deleteByPrimaryKeys(@Param("idlist")List<Integer> idlist);

	List<Role> selectAll();
}