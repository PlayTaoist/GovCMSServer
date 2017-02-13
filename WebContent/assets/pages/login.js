/**
 * login.jsp JS代码
 */
//按下回车键时的响应
document.onkeydown=function(event){
    var e = event || window.event || arguments.callee.caller.arguments[0];     
     if(e && e.keyCode==13){ // enter 键
         $("#login_btn").click();
    }
}; 
$('#login_btn').on('click', function() {
	var num = 0;
	var str = "";
	$("input[type='text']").each(function(n) {
		if($(this).val() == "") {
			$('.social-login').html("用户名和密码不能为空！").css({color:"red"});
			num++;
			return false;
		}
	});
	if(num > 0) {
		return false;
	} else {
		$.ajax({
            type: "post",
            url: contextPath + "/admin/login",
            data:{username:$('input[name="username"]').val(),password:hex_md5($('input[name="password"]').val()),ValidateCode:$('input[name=ValidateCode]').val()},
            dataType: "text",
            success: function (data) {
                if (data == "false") {
                    $('.social-login').html("用户名或密码错误！").css({color:"red"});
                    return false;
                } else if(data == "false_ValidateCode"){
                	$('.social-login').html("验证码错误!").css({color:"red"});
                    return false;
                }else {
                    $('.social-login').html("登陆成功！").css({color:"green"});
                	setTimeout(function () {
                		 location.href = "index.jsp";
                	}, 1000); //页面刷新
                	return false;
                }
            },
            error: function (XMLHttpRequest, textStatus,errorThrown) {
                alert(errorThrown);
                return false;
            }
        });
	}
});
