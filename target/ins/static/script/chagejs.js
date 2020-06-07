$(document).ready(function () {
    $.ajax({
        type:"POST",
        url:"/admin/first",
        data:{},
        success:function (data) {
            data = eval("("+data+")");//将string格式转化为json格式
            if (data.data == 0){
                if (confirm("请前往修改密码！")){
                    window.location.href ="/index/changepassword";
                }else {
                    window.location.href ="/index/changepassword";
                }
            }
        }
    });
});