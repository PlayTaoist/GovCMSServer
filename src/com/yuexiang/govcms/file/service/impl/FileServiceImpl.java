package com.yuexiang.govcms.file.service.impl;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yuexiang.govcms.file.dao.SysFileMapper;
import com.yuexiang.govcms.file.model.SysFile;
import com.yuexiang.govcms.file.service.FileService;
import com.yuexiang.govcms.system.base.BaseService;
import com.yuexiang.govcms.system.util.ConstantUtil;
import com.yuexiang.govcms.system.util.DataTables;
import com.yuexiang.govcms.system.util.GUID;

/**
 * 文件服务实现
 * 
 * @author yangtao
 * @since 2016年8月12日 下午8:33:00
 */
@Service
public class FileServiceImpl extends BaseService implements FileService {

	@Autowired
	SysFileMapper sysFileMapper;

	@Override
	public String fileDownload(String guid, HttpServletResponse response) {
		try {
			response.reset();
			response.setContentType("application/octet-stream; charset=utf-8");
			response.getOutputStream().flush();
		} catch (FileNotFoundException e) {
			System.err.println("文件没有找到");
		} catch (IOException e) {
			System.err.println("磁盘不能读");
		}
		return null;
	}

	@Override
	public Map<String, Object> check(String hash, Integer userId, String fileName) {
		Map<String, Object> map = new HashMap<>();
		SysFile file = sysFileMapper.check(hash);
		if (file != null) {
			map.put("ok", "ok");
			map.put("url", file.getfName());
		} else {
			String filePath = ConstantUtil.FILEUPLOADSAVEPATH + "f_" + hash + fileName.substring(fileName.lastIndexOf("."));
			File _file = new File(filePath);
			if (_file.exists()) {
				map.put("start", _file.length());
			} else {
				map.put("start", 0);
			}
		}
		return map;
	}

	@Override
	public Map<String, Object> fileUpload(MultipartFile files, String hash, Integer userId, String ok) {
		Map<String, Object> map = new HashMap<>();
		
		String multname = files.getOriginalFilename();
		String filename = "f_" + hash + multname.substring(multname.lastIndexOf("."));

		copyWithStreams(files, (ConstantUtil.FILEUPLOADSAVEPATH + filename), true);
		if ("1".equals(ok)) {
			Integer fType = ConstantUtil.FTYPEMAP.get(multname.substring(multname.lastIndexOf(".")));
			fType = StringUtils.isEmpty(fType) ? 7 : fType;
			SysFile sysFile = new SysFile();
			sysFile.setfPath(ConstantUtil.FILEUPLOADSAVEPATH);
			sysFile.setfName(filename);
			sysFile.setfNameOld(multname);
			sysFile.setfTime(new Date());
			sysFile.setMd5(hash);
			sysFile.setUserId(userId);
			sysFile.setfType(fType);
			sysFile.setfSize(String.valueOf(new File(ConstantUtil.FILEUPLOADSAVEPATH + filename).length()));
			if (sysFileMapper.insert(sysFile) > 0) {
				map.put("url", filename);
			}
		}
		map.put("ret", "1");
		return map;
	}

	/**
	 * @Title copyWithStreams
	 * @Description 追加写入合并文件
	 *
	 * @author yangtao
	 * @since 2016年10月12日 下午5:47:25
	 *
	 * @param files
	 * @param targetFilePath
	 * @param append
	 * @return void
	 */
	private void copyWithStreams(MultipartFile files, String targetFilePath, boolean append) {
		InputStream inStream = null;
		OutputStream outStream = null;
		try {
			try {
				byte[] bucket = new byte[32 * 1024];
				inStream = new BufferedInputStream(files.getInputStream());
				outStream = new BufferedOutputStream(new FileOutputStream(targetFilePath, append));
				int bytesRead = 0;
				while (bytesRead != -1) {
					bytesRead = inStream.read(bucket); // -1, 0, or more
					if (bytesRead > 0) {
						outStream.write(bucket, 0, bytesRead);
					}
				}
			} finally {
				if (inStream != null)
					inStream.close();
				if (outStream != null)
					outStream.close();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	@Override
	public DataTables getPageList(DataTables dataTables) {
		PageHelper.startPage(dataTables.getStart(), dataTables.getLength()); // 核心分页代码 
		PageHelper.orderBy("id desc");
		
		if(!StringUtils.isEmpty(dataTables.getColumn())){
			String column = propertyToColumn(SysFileMapper.class, dataTables.getColumn());
			if(!StringUtils.isEmpty(column)){
				PageHelper.orderBy(column + " " + dataTables.getOrder());
			}
		}
		
		PageInfo<SysFile> pageInfo = new PageInfo<SysFile>(sysFileMapper.getPageList(dataTables.getSearch(), dataTables.getSubSQL()));
		dataTables.setRecordsTotal(pageInfo.getTotal());
		dataTables.setRecordsFiltered(pageInfo.getTotal());
		dataTables.setData(pageInfo.getList() != null ? pageInfo.getList() : new ArrayList<>());
		
		return dataTables;
	}

	@Override
	public Map<String, Object> simpleupload(MultipartFile file, Integer userId) {
		Map<String, Object> map = new HashMap<>();
		map.put("state", "FAIL");
		String hash = GUID.getGuid();
		String multname = file.getOriginalFilename();
		String prefix = multname.substring(multname.lastIndexOf(".")).toLowerCase();
		String filename = "f_" + hash + prefix;
		
		copyWithStreams(file, (ConstantUtil.FILEUPLOADSAVEPATH + filename), true);
		
		Integer fType = ConstantUtil.FTYPEMAP.get(prefix);
		fType = fType == null ? 7 : fType;
		
		SysFile sysFile = new SysFile();
		sysFile.setfPath(ConstantUtil.FILEUPLOADSAVEPATH);
		sysFile.setfName(filename);
		sysFile.setfNameOld(multname);
		sysFile.setfTime(new Date());
		sysFile.setMd5(hash);
		sysFile.setUserId(userId);
		sysFile.setfType(fType);
		sysFile.setfSize(String.valueOf(new File(ConstantUtil.FILEUPLOADSAVEPATH + filename).length()));
		if (sysFileMapper.insert(sysFile) > 0) {
			map.put("state", "SUCCESS");
			map.put("url", ConstantUtil.IMGDOMAIN + filename);
		}
		return map;
	}
}