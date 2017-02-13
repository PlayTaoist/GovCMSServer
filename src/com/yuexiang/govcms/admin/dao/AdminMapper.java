package com.yuexiang.govcms.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yuexiang.govcms.admin.model.Admin;
import com.yuexiang.govcms.menu.model.Menu;

/**
 * 用户持久层
 * @author yangtao
 * @since 2016年9月25日 上午10:06:16
 */
@Repository
public interface AdminMapper {
	
    int deleteByPrimaryKey(Integer id);

    int insert(Admin user);

    Admin selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(Admin user);
    
    /**
     * 用户登录
     * @param username
     * @param password
     * @return
     * @data 2016年8月7日
     */
    Admin login(@Param("username")String username, @Param("password")String password);

    /**
     * 
     * @Title: getPageList
     * @Description: 分页获取管理员列表
     *
     * @author yangtao
     * @since 2016年10月30日 下午12:16:00
     *
     * @param search
     * @param subSQL
     * @return List<Menu>
     */
    List<Menu> getPageList(@Param("search") String search, @Param("subSQL") String subSQL);
}