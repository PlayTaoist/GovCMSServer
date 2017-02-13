package com.yuexiang.govcms.ueditor.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import com.yuexiang.govcms.file.model.SysFile;
import com.yuexiang.govcms.file.service.FileService;
import com.yuexiang.govcms.system.base.BaseController;
import com.yuexiang.govcms.system.util.DataTables;

/**
 * UE富文本编辑器控制
 * @author yangtao
 * @since 2016年8月11日 下午8:28:40
 */
@Controller
@RequestMapping("/ueditor")
public class UEditorController extends BaseController {
	
	@Autowired
	FileService fileService;
	
	@Autowired
	HttpServletRequest request;
	
	/**
	 * 
	 * @Title getInitConfig
	 * @Description 获取后端配置初始化参数
	 *
	 * @author yangtao
	 * @since 2016年10月20日 下午9:09:32
	 *
	 * @return String
	 */
	@RequestMapping(params="action=config", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getInitConfig(){
		return "{}";
	}
	
	/**
	 * 
	 * @Title getServerFileList
	 * @Description 获取服务器上的文件列表
	 *
	 * @author yangtao
	 * @since 2016年10月20日 下午9:09:32
	 *
	 * @return String
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(params="action=fileList", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getServerFileList(){
		String subSQL = null;
		if (!StringUtils.isEmpty(request.getParameter("fType"))) {
			subSQL = "f_type = " + request.getParameter("fType");
		}
		if (!StringUtils.isEmpty(request.getParameter("timeMax"))) {
			subSQL = StringUtils.isEmpty(subSQL) ? "" : subSQL + " and ";
			subSQL += "f_time > '" + request.getParameter("timeMin") + "' and f_time < '" + request.getParameter("timeMax") + "'";
		}
		DataTables dataTables = fileService.getPageList(DataTables.getInstance(request, subSQL));
		List<SysFile> files = (List<SysFile>) dataTables.getData();
		List<Map<String, String>> urls = new ArrayList<>();
		for (SysFile sysFile : files) {
			Map<String, String> map = new HashMap<>();
			map.put("url", sysFile.getfName());
			map.put("fileName", sysFile.getfNameOld());
			urls.add(map);
		}
		dataTables.setData(urls);
		return JSON.toJSONString(dataTables);
	}
	
	/**
	 * 
	 * @Title simpleupload
	 * @Description UEidtor文件上传(simpleUpload,insrtImage、insertVideo即webuploader都通用)
	 *
	 * @author yangtao
	 * @since 2016年10月20日 下午9:09:32
	 *
	 * @return String
	 */
	@RequestMapping(params="action=simpleupload", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String simpleupload(@RequestParam("simpleupload") MultipartFile file) {
		return JSON.toJSONString(fileService.simpleupload(file, ((Admin) request.getSession().getAttribute("admin")).getId()));
	}
}
