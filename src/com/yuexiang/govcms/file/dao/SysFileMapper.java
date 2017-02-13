package com.yuexiang.govcms.file.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yuexiang.govcms.file.model.SysFile;

public interface SysFileMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SysFile file);

    SysFile selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(SysFile file);

    /**
     * @Title check
     * @Description 检测文件是否已经存在
     *
     * @author yangtao
     * @since 2016年10月11日 下午10:16:28
     *
     * @param hash
     * @return SysFile
     */
	SysFile check(@Param("hash") String hash);

	/**
	 * 
	 * @Title getPageList
	 * @Description 分页返回文件记录
	 *
	 * @author yangtao
	 * @since 2016年10月13日 下午9:03:06
	 *
	 * @param search
	 * @param column
	 * @return List<SysFile>
	 */
	List<SysFile> getPageList(@Param("search") String search, @Param("subSQL") String subSQL);
}