package com.yuexiang.govcms.admin.controllor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.yuexiang.govcms.admin.model.Admin;
import com.yuexiang.govcms.admin.service.AdminService;
import com.yuexiang.govcms.system.base.BaseController;
import com.yuexiang.govcms.system.util.ConstantUtil;
import com.yuexiang.govcms.system.util.DataTables;
import com.yuexiang.govcms.system.util.GeneratorValidateCode;

/**
 * 用户控制
 * @author yangtao
 * @data 2016年8月11日
 */
@Controller
@RequestMapping("/admin")
public class AdminController extends BaseController {

	@Autowired
	HttpServletRequest request;  // 请求

	@Autowired
	AdminService adminService;
	
	/**
	 * 用户登录
	 * @author yangtao
	 * @since 2016年8月11日 下午8:50:44
	 * @param username
	 * @param password
	 * @param ValidateCode
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String login(String username, String password, String ValidateCode) {
		if (!(ValidateCode != null && ValidateCode.equals(request.getSession().getAttribute("ValidateCode")))) {
			return "false_ValidateCode";
		}
		Admin admin = adminService.login(username, password);
		if (admin != null) {
			request.getSession().setAttribute("admin", admin);
			request.getSession().setAttribute("IMGDOMAIN", ConstantUtil.IMGDOMAIN);
			return "success";
		}
		return "false";
	}

	/**
	 * 生成验证码图片
	 * @author yangtao
	 * @since 2016年8月11日 下午8:51:01
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/getValidateCode", method = RequestMethod.GET)
	@ResponseBody
	public String getValidateCode(HttpServletResponse response) {
		// 设置响应的类型格式为图片格式
		response.setContentType("image/jpeg");
		// 禁止图像缓存。
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		GeneratorValidateCode instance = new GeneratorValidateCode();

		// request.getSession().setAttribute("ValidateCode", instance.getCode());
		request.getSession().setAttribute("ValidateCode", "1234");

		try {
			instance.write(response.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}
	
	/**
	 * 
	 * @Title: getPageList
	 * @Description: 分页获取管理员列表
	 *
	 * @author yangtao
	 * @since 2016年10月30日 下午12:13:45
	 *
	 * @return String
	 */
	@RequestMapping(value = "/getPageList", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getPageList() {
		return JSONObject.toJSONString(adminService.getPageList(DataTables.getInstance(request, null)));
	}

}
