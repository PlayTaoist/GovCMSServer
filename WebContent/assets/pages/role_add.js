/**
 * 菜单添加
 */
$(function($) {
	var entityID = getQueryString('id');
	if(entityID) {
		$.post(contextPath + "/role/getRoleById", {"id": entityID}, function(result) {
			$("#form-add").JsonToForm(result);
		});
	}

	var setting = {
		async: {
			autoParam: ["parentid=parentid"],
			contentType: "application/x-www-form-urlencoded",
			enable: true,
			type: "post",
			url: contextPath + "/menu/selectAll"
		},
		view: {
			selectedMulti: false
		},
		check: {
			enable: true,
			chkboxType: {
				"Y": "p",
				"N": "s"
			}
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
				pIdKey: "parentid",
				rootPId: null
			}
		}
	};

	var treeObj = $.fn.zTree.init($("#tree"), setting);
	
	$("#form-add").validate({
		rules: {
			name: {
				required: true,
				minlength: 2,
				maxlength: 10
			}
		},
		submitHandler: function(form) {
			var nodes = treeObj.getCheckedNodes(true);
			var menuIds = new Array();
			if(nodes.length > 0) {
				for(var i = 0; i < nodes.length; i++) {
					menuIds.push(nodes[i].id)
				}
			}
			$.ajax({
				type: "post",
				url: contextPath + "/role/" + (entityID ? "update" : "add"),
				data: $(form).serialize() + "&menuIds=" + menuIds.join(","),
				dataType: "json",
				success: function(data) {
					if(data.status == 200) {
						var message = entityID ? '更新成功!' : '添加成功!';
						var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引,隐藏layer层和shade
						parent.$('#layui-layer' + index).css({'display': 'none'});
						parent.$('#layui-layer-shade' + index).css({'display': 'none'});
						parent.reloadTable(); //再刷新DT
						parent.showSuccessMessage(message, null, function() {
							parent.layer.close(index); //然后执行关闭     
						});
					} else {
						var message = entityID ? '添加成功!' : '添加失败!';
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
});