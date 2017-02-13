package com.yuexiang.govcms.file.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.yuexiang.govcms.admin.model.Admin;
import com.yuexiang.govcms.file.service.FileService;
import com.yuexiang.govcms.system.base.BaseController;
import com.yuexiang.govcms.system.util.DataTables;

/**
 * 文件控制层
 * 
 * @author yangtao
 * @since 2016年8月12日 下午8:03:41
 */
@Controller
@RequestMapping("/file")
public class SysFileController extends BaseController {

	@Autowired
	FileService fileService;

	@Autowired
	HttpServletRequest request;

	/**
	 * @Title fileUpload
	 * @Description web-uploader文件上传后台接收端
	 *
	 * @author yangtao
	 * @since 2016年10月11日 下午9:32:18
	 *
	 * @param files
	 * @return Map<String,Object>
	 */
	@RequestMapping(value = "/fileUpload", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String fileUpload(@RequestParam("upfile") MultipartFile files) {
		String hash = request.getParameter("hash");
		String ok = request.getParameter("ok");
		Integer adminId = ((Admin) request.getSession().getAttribute("admin")).getId();
		return JSON.toJSONString(fileService.fileUpload(files, hash, adminId, ok));
	}

	/**
	 * @Title getfilebymd5
	 * @Description 检测文件是否上传过
	 *
	 * @author yangtao
	 * @since 2016年10月12日 下午5:15:52
	 *
	 * @return Map<String,Object>
	 */
	@RequestMapping(value = "/fileUpload/check", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String checkFileIsUploaded() {
		String hash = request.getParameter("hash");
		String fileName = request.getParameter("fileName");
		return JSON.toJSONString(fileService.check(hash, ((Admin) request.getSession().getAttribute("admin")).getId(), fileName));
	}

	/**
	 * 
	 * @Title fileDownload
	 * @Description 下载
	 *
	 * @author yangtao
	 * @since 2016年10月13日 下午7:30:05
	 *
	 * @param fileGuid
	 * @param response
	 * @return String
	 */
	@RequestMapping("/download")
	@ResponseBody
	public String fileDownload(@RequestParam String fileGuid, HttpServletResponse response) {
		return fileService.fileDownload(fileGuid, response);
	}
	
	/**
	 * 
	 * @Title getPageList
	 * @Description 分页获取文件列表
	 *
	 * @author yangtao
	 * @since 2016年10月13日 下午7:29:48
	 *
	 * @return String
	 */
	@RequestMapping(value = "/getPageList", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getPageList() {
		String subSQL = null;
		if (!StringUtils.isEmpty(request.getParameter("fType"))) {
			subSQL = "f_type = " + request.getParameter("fType");
		}
		if (!StringUtils.isEmpty(request.getParameter("timeMax"))) {
			subSQL = StringUtils.isEmpty(subSQL) ? "" : subSQL + " and ";
			subSQL += "f_time > '" + request.getParameter("timeMin") + "' and f_time < '" + request.getParameter("timeMax") + "'";
		}
		
		return JSON.toJSONString(fileService.getPageList(DataTables.getInstance(request, subSQL)));
	}
}
