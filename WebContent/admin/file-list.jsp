<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="./comm_checkuser.jsp" %>
<!DOCTYPE HTML>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<link rel="stylesheet" type="text/css" href="../assets/static/h-ui/css/H-ui.min.css" />
		<link rel="stylesheet" type="text/css" href="../assets/static/h-ui.admin/css/H-ui.admin.css" />
		<link rel="stylesheet" type="text/css" href="../assets/lib/Hui-iconfont/1.0.7/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="../assets/static/h-ui.admin/skin/default/skin.css" id="skin" />
		<link rel="stylesheet" type="text/css" href="../assets/static/h-ui.admin/css/style.css" />
		<title>文件列表</title>
	</head>

	<body>
		<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 文件管理 <span class="c-gray en">&gt;</span> 文件列表
			<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a>
		</nav>
		<div class="page-container">
			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<div class="l">
					<a class="btn btn-primary radius" onclick="add('添加文件','file-add.jsp')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加文件</a>
				</div>
				<div class="r">
					文件类型:
					<div class="select-box" style="width: 120px;">
						<select class="select" id="fType">
							<option selected="selected" value="">请选择</option>
							<option value="0">图片</option>
							<option value="1">压缩文件</option>
							<option value="2">Word文档</option>
							<option value="3">Excel文档</option>
							<option value="4">PDF文档</option>
							<option value="5">TXT文档</option>
							<option value="6">视频</option>
							<option value="7">其它</option>
						</select>
					</div>
					日期范围:
					<input type="text" onfocus="WdatePicker({maxDate:new Date()});$('#timeMax').val('');" id="timeMin" class="input-text Wdate" style="width:120px;"> -
					<input type="text" onfocus="WdatePicker({minDate:new Date(((new Date($('#timeMin').val()))/1000+86400)*1000)})" id="timeMax" class="input-text Wdate" style="width:120px;">
					<input type="text" id="search" placeholder=" 原文件名称" style="width:250px" class="input-text">
					<button id="doSearch" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜文件</button>
				</div>
			</div>
			<div class="mt-20">
				<table class="table table-border table-bordered table-hover table-bg table-sort" width="100%">
					<thead>
						<tr class="text-c">
							<th>ID</th>
							<th>文件名</th>
							<th>存放路径</th>
							<th>文件大小(B)</th>
							<th>文件类型</th>
							<th>文件原名</th>
							<th>上传时间</th>
							<th>MD5</th>
							<th>操作</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
		<script type="text/javascript" src="../assets/lib/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript" src="../assets/lib/layer/2.1/layer.js"></script>
		<script type="text/javascript" src="../assets/lib/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="../assets/lib/icheck/icheck.min.js"></script>
		<script type="text/javascript" src="../assets/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="../assets/lib/datatables/datatables.optimize.js"></script>
		<script type="text/javascript" src="../assets/static/h-ui/js/H-ui.js"></script>
		<script type="text/javascript" src="../assets/static/h-ui.admin/js/H-ui.admin.js"></script>
		<script type="text/javascript" src="../assets/pages/commandScript.js"></script>
		<script>
			var contextPath = "${pageContext.request.contextPath}",
				IMGDOMAIN = "${sessionScope.IMGDOMAIN}";
		</script>
		<script type="text/javascript" src="../assets/pages/file_list.js"></script>
	</body>

</html>