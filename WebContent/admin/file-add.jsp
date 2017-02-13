<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="./comm_checkuser.jsp" %>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<LINK rel="Bookmark" href="/favicon.ico">
		<LINK rel="Shortcut Icon" href="/favicon.ico" />
		<link rel="stylesheet" type="text/css" href="../assets/static/h-ui/css/H-ui.min.css" />
		<link rel="stylesheet" type="text/css" href="../assets/static/h-ui.admin/css/H-ui.admin.css" />
		<link rel="stylesheet" type="text/css" href="../assets/lib/Hui-iconfont/1.0.7/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="../assets/lib/icheck/skins/minimal/minimal.css" />
		<link rel="stylesheet" type="text/css" href="../assets/static/h-ui.admin/skin/default/skin.css" id="skin" />
		<link rel="stylesheet" type="text/css" href="../assets/static/h-ui.admin/css/style.css" />
		<link rel="stylesheet" type="text/css" href="../assets/lib/web-uploader/css/uploader.css" />
		<link rel="stylesheet" type="text/css" href="../assets/lib/web-uploader/css/uploader-image.css" />
		<!--/meta 作为公共模版分离出去-->

		<title>新增文件</title>

	</head>

	<body>
		<div class="page-container">
			<form class="form form-horizontal" id="form-article-add">
				<div class="content">
					<div>
						<a id="upload-target" class="x-button">选择文件</a>
						<span style="display: inline-block;margin-top: 20px;">&nbsp;&nbsp;或拖放文件到下方的方框中&nbsp;&nbsp;</span>
						<a id="upload-submit" class="x-button" style="float: right;">确认上传</a>
					</div>
					<div id="upload-preview" class="clearfix"></div>
				</div>
			</form>
		</div>
		</div>

		<!--_footer 作为公共模版分离出去-->
		<script type="text/javascript" src="../assets/lib/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript" src="../assets/lib/layer/2.1/layer.js"></script>
		<script type="text/javascript" src="../assets/lib/icheck/icheck.min.js"></script>
		<script type="text/javascript" src="../assets/static/h-ui/js/H-ui.js"></script>
		<script type="text/javascript" src="../assets/static/h-ui.admin/js/H-ui.admin.js"></script>
		<script type="text/javascript" src="../assets/lib/web-uploader/dist/js/Q.js"></script>
		<script type="text/javascript" src="../assets/lib/web-uploader/dist/js/spark-md5.js"></script>
		<script type="text/javascript" src="../assets/lib/web-uploader/dist/js/Q.md5File.js"></script>
		<script type="text/javascript" src="../assets/lib/web-uploader/dist/js/Q.Uploader.js"></script>
		<script type="text/javascript" src="../assets/lib/web-uploader/dist/js/Q.Uploader.slice.js"></script>
		<script type="text/javascript" src="../assets/lib/web-uploader/dist/js/Q.Uploader.UI.js"></script>
		<script type="text/javascript" src="../assets/lib/web-uploader/dist/js/Q.Uploader.Image.js"></script>
		<!--/_footer /作为公共模版分离出去-->

		<!--请在下方写此页面业务相关的脚本-->
		<script type="text/javascript">
			var contextPath = "${pageContext.request.contextPath}";
		</script>
		<script type="text/javascript" src="../assets/pages/file_upload.js"></script>
	</body>

</html>