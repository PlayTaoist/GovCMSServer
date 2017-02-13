package com.yuexiang.govcms.system.util;

import java.util.UUID;

/**
 * 生成UUIDkey
 * 
 * @author yangtao
 *
 * @since 2016年8月13日 上午11:07:51
 */
public class GUID {
	public static String getGuid(){
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
