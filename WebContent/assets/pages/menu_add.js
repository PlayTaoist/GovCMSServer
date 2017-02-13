/**
 * 菜单添加
 */
$(function($) {
	var entityID = getQueryString('id');
	if(entityID) {
		$.post(contextPath + "/menu/getMenuById", {"id": entityID}, function(result) {
			$("#form-add").JsonToForm(result);
		});
	}

	$('input[type=radio]').iCheck({
		checkboxClass: 'icheckbox_minimal',
		radioClass: 'iradio_minimal',
		increaseArea: '20%'
	});

	$("#form-add").validate({
		rules: {
			name: {
				required: true,
				minlength: 2,
				maxlength: 10
			},
			type: "required",
			status: "required",
			url: {
				maxlength: 1000
			},
			sort: {
				digits: true
			}
		},
		submitHandler: function(form) {
			$.ajax({
				type: "post",
				url: contextPath + "/menu/"+(entityID?"update":"add"),
				data: $(form).serialize(),
				dataType: "json",
				success: function(data) {
					if(data.status == 200) {
						var message = entityID?'更新成功!':'添加成功!';
						var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引,隐藏layer层和shade
						parent.$('#layui-layer'+index).css({'display':'none'});
	                    parent.$('#layui-layer-shade'+index).css({'display':'none'});
	                    parent.reloadTable(); //再刷新DT
						parent.showSuccessMessage(message, null, function() {
							parent.layer.close(index); //然后执行关闭     
						});
					} else {
						var message = entityID?'添加成功!':'添加失败!';
						parent.showFailMessage(message);
					}
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					alert(errorThrown);
					return false;
				}
			});
			return false;
		}
	});

	$.Huitab("#tab-category .tabBar span", "#tab-category .tabCon", "current", "click", "0");

	var setting = {
		async: {
			autoParam: ["parentId=parentId"],
			contentType: "application/x-www-form-urlencoded",
			enable: true,
			type: "post",
			url: contextPath + "/menu/selectAll"
		},
		view: {
			selectedMulti: false
		},
		check: {
			enable: false
		},
		edit: {
			drag: {
				isCopy: false,
				isMove: false
			},
			enable: false,
			removeTitle: "删除",
			renameTitle: "编辑"
		},
		data: {
			key: {
				name: "name",
				title: "name",
				url: "undefined"
			},
			simpleData: {
				enable: true,
				idKey: "id",
				pIdKey: "parentId",
				rootPId: null
			}
		},
		callback: {
			onClick: zTreeOnClick
		}
	};

	$.fn.zTree.init($("#tree"), setting);

	$('#parentName').on('focus', function() {
		var cityObj = $("#parentName");
		var cityOffset = $("#parentName").offset();
		$("#menuContent").css({
			left: cityOffset.left + "px",
			top: (cityOffset.top + cityObj.outerHeight()) + "px",
			display: "block",
			width: (cityObj.outerWidth() - 3) + "px"
		}).slideDown("fast");

		$("body").bind("mousedown", function() {
			if(!(event.target.id == "menuContent" || $(event.target).parents("#menuContent").length > 0)) {
				$("#menuContent").css({
					left: 0,
					top: 0,
					display: "none",
					width: 0
				}).fadeOut("fast");
			}
		});
	});

	$('#iconSelect').on('focus', function() {
		var cityObj = $("#iconSelect");
		var cityOffset = $("#iconSelect").offset();
		$("#iconContent").css({
			left: cityOffset.left + "px",
			top: (cityOffset.top + cityObj.outerHeight()) + "px",
			display: "block",
			width: (cityObj.outerWidth() - 3) + "px"
		}).slideDown("fast");

		$("body").bind("mousedown", function() {
			if(!(event.target.id == "iconContent" || $(event.target).parents("#iconContent").length > 0)) {
				$("#iconContent").css({
					left: 0,
					top: 0,
					display: "none",
					width: 0
				}).fadeOut("fast");
			}
		});
	});

	$("#iconContent").on('click', 'i', function() {
		$("#iconSelect").val($(this).attr('title'));
		$("#iconContent").css({
			left: 0,
			top: 0,
			display: "none",
			width: 0
		}).fadeOut("fast");
	});
});

/**
 * 节点点击回调
 * 
 * @param event
 * @param treeId
 * @param treeNode
 * @returns
 */
function zTreeOnClick(event, treeId, treeNode) {
	$('#parentName').val(treeNode.name);
	$('#parentId').val(treeNode.id);
	$("#menuContent").css({
		left: 0,
		top: 0,
		display: "none",
		width: 0
	}).fadeOut("fast");
	return false;
};