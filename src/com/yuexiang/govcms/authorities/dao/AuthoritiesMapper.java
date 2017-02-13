package com.yuexiang.govcms.authorities.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yuexiang.govcms.authorities.model.Authorities;

/**
 * 权限管理持久层
 * 
 * @author yangtao
 * @since 2016年8月11日 下午9:25:24
 */
@Repository
public interface AuthoritiesMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Authorities record);

    Authorities selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(Authorities record);

    /**
     * 
     * @Title: grant 
     * @Description: 给角色授权
     *
     * @author yangtao
     * @since 2016年10月28日 下午1:48:27
     *
     * @param roleId
     * @param menuIdList
     * @return boolean
     */
	int grant(@Param("roleId") Integer roleId, @Param("menuIdList") List<String> menuIdList);
	
	/**
	 * 
	 * @Title: deleteByRole 
	 * @Description: 删除已有的授权
	 *
	 * @author yangtao
	 * @since 2016年10月28日 下午1:56:28
	 *
	 * @param roleId
	 * @return int
	 */
	int deleteByRole(@Param("roleId") Integer roleId);
}