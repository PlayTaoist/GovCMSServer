package com.yuexiang.govcms.file.service;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import com.yuexiang.govcms.system.util.DataTables;

/**
 * 文件服务
 * @author yangtao
 * @since 2016年8月12日 下午8:32:38
 */
public interface FileService {
	
	/**
	 * 方法名：fileDownload
	 * 功能描述: 下载文件
	 * 
	 * @author yangtao
	 * @since 2016年8月12日 下午8:30:18
	 * @param guid
	 * @param response
	 * @return
	 */
	String fileDownload(String guid, HttpServletResponse response);

	/**
	 * 方法名：getPageList
	 * 功能描述: 获取文件列表
	 * 
	 * @author yangtao
	 * @since 2016年8月29日 下午10:19:32
	 * @param dataTables
	 * @return
	 */
	DataTables getPageList(DataTables dataTables);

	/**
	 * @Title check
	 * @Description 检测文件是否上传过
	 *
	 * @author yangtao
	 * @since 2016年10月11日 下午9:36:28
	 *
	 * @param hash
	 * @param userId 
	 * @param fileName 
	 * @return Map<String,Object>
	 */
	Map<String, Object> check(String hash, Integer userId, String fileName);
	
	/**
	 * @Title fileUpload
	 * @Description web-uploader上传文件
	 *
	 * @author yangtao
	 * @since 2016年10月12日 下午5:38:04
	 *
	 * @param files
	 * @param hash
	 * @param userId
	 * @param ok
	 * @return Map<String,Object>
	 */
	Map<String, Object> fileUpload(MultipartFile files, String hash, Integer userId, String ok);
	
	/**
	 * 
	 * @Title simpleupload
	 * @Description Ueditor图片上传
	 *
	 * @author yangtao
	 * @since 2016年10月22日 下午3:37:58
	 *
	 * @param file
	 * @param userId
	 * @return Map<String, Object>
	 */
	Map<String, Object> simpleupload(MultipartFile file, Integer userId);
}