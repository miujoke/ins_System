$(document).ready(function () {
	//登录
    $(".login-btn").click(function () {
        var uid = $("#login_num").val();
        var pwd = $("#login_pwd").val();
        $.ajax({
            type:"POST",
            url:"/login/entry",
            data:{"uid":uid,"pwd":pwd},
            success:function (data) {
                console.log(data);
                data = eval("("+data+")");//将string格式转化为json格式
                if(data.id == 3){
                    window.location.href = "/index";
                }else if(data.id == 2){
                    window.location.href = "/index/ins_admin";
                }else if(data.id == 1){
                    window.location.href = "/admin";//超级管理员
                }else{
                    alert('账号密码错误！');
                }
            }
        });
    });

    //注销
    $("#logout").click(function () {
        $.ajax({
            type:"POST",
            url:"/admin/cancel",
            data:{},
            success:function (data) {

            }
        });
    });
});



