package com.yuexiang.govcms.system.base;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

/**
 * 
 * @ClassName BaseController
 * @Description 控制器基类
 *
 * @author yangtao
 * @since 2016年10月20日 下午10:16:02
 *
 */
public abstract class BaseController {

	/**
	 * 
	 * @Title initBinder
	 * @Description 数据绑定重载
	 *
	 * @author yangtao
	 * @since 2016年10月20日 下午10:19:07
	 *
	 * @param binder void
	 */
    @InitBinder    
    protected void initBinder(WebDataBinder binder) {
    	/**
    	 * 日期格式重载
    	 */
    	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	format.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(format, true));  
    }
}

