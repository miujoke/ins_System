$(document).ready(function(){

    //查询仪器已被预约时间
    $('#searchBtn').click(function () {
        var ins_name = $("#ins_name").find("option:selected").text();
        if(ins_name){
            $.ajax({
                type:'POST',
                url:'/booking/selectforTime',
                data:{'ins_name':ins_name},
                success:function (data) {
                    localStorage.setItem('date',data);
                    window.location.href = '/index/thinktime';
                }
            });
        }else {
            alert('请选择仪器');
        }

    });

    //登录界面
    $.ajax({
        dateType:"json",
        type:"POST",
        url:"/login/username",
        data:{},
        success:function (data) {
            data = eval("("+data+")");//将string格式转化为json格式
            if (data.message == "操作成功"){
                $("#lg").attr("href","#");
                $("#lg .username").html(data.data);
                $("#log .username").html(data.data);
                //跳转到个人中心
                var username = $(".username").val();
                $("#lg").click(function () {
                    if(username !== '登录'){
                        $.ajax({
                            dateType:"json",
                            type:"POST",
                            url:"/admin/real",
                            data:{},
                            success:function(data){
                                data = eval("("+data+")");//将string格式转化为json格式
                                if (data.data ==2){//仪器管理员
                                    window.location.href = "/index/ins_admin";
                                }else if (data.data ==3){//普通用户
                                    window.location.href = "/index/center";
                                }else  if (data.data == 1){
                                    window.location.href = "/admin";//超级管理员
                                }else {
                                    alert("服务器异常");
                                }
                            }
                        });

                    }
                });
            }
        }
    });

    //立即预约
    $("#butt").click(function () {
            var pro_name =$("#pro_name").val();//项目名称
            var pro_source = $("#pro_source").val();//来源
            var pro_number =$("#pro_number").val();//合同号
            var pro_person = $("#pro_person").val();//项目负责任人
            var pro_person_mobile = $("#pro_person_mobile").val();//项目负责人电话
            var booking_person = $("#booking_person").val();//预约人
            var booking_person_mobile =$("#booking_person_mobile").val();//预约人电话
            var ins_name = $("#ins_name").find("option:selected").text();//预约仪器
            var sample = $("#sample").val();//检测样品信息
            var booking_event = $("#booking_event").val();//预约其他事项
            var booking_person_number = $("#booking_person_number").val();//预约上机人
            var booking_operation_skill = $("#booking_operation_skill").find("option:selected").text();//是否具备独立上机操作技能
            var booking_start_time =$("#booking_start_time").val();//与仪器专管员约定测试日期开始时间
            var booking_stop_time = $("#booking_stop_time").val();//与仪器专管员约定测试日期结束时间
            var fee_source = $("#fee_source").val();//费用出处zz
            console.log(booking_person_mobile);
            var pdata ={
                "pro_name":pro_name,
                "pro_source":pro_source,
                "pro_number":pro_number,
                "pro_person":pro_person,
                "pro_person_mobile":pro_person_mobile,
                "booking_person":booking_person,
                "booking_person_mobile":booking_person_mobile,
                "ins_name":ins_name,
                "sample":sample,
                "booking_event":booking_event,
                "booking_person_number":booking_person_number,
                "booking_operation_skill":booking_operation_skill,
                "booking_start_time":booking_start_time,
                "booking_stop_time":booking_stop_time,
                "fee_source":fee_source,
            };
            if (pro_name.length == 0 || pro_source.length == 0 ||  pro_number.length ==0 || pro_person.length == 0 || pro_person_mobile.length == 0 || booking_person.length == 0 || booking_person_mobile.length == 0 || ins_name.length == 0 || sample.length == 0 || booking_person_number.length == 0 || booking_operation_skill.length == 0 || booking_start_time.length == 0 || booking_stop_time.length == 0 || fee_source.length == 0){
                alert("所有必填项必须填");
            }else {
                $.ajax({
                    dataType:"JSON",
                    type:"POST",
                    url:"/booking/bookin",
                    data:pdata,
                    success:function (data) {
                        if(data.message == '操作成功'){
                            window.location.href = "/index";
                        }else {
                            alert(data.message);
                        }
                    }
                })
            }
    });
    //跳转到修改密码
    $("#pwd").click(function () {
        $.ajax({
            type:"POST",
            url:"/index/changepassword",
            data:{},
            success:function () {
                window.location.href ="/index/changepassword";
            }
        })
    })
    //修改密码
    $("#sub").click(function () {
        var oldPwd = $("#oldpwd").val();
        var password = $("#newpwd").val();
        var cfpwd  = $("#cfpwd").val();
        if (password != cfpwd){
            alert("再次输入密码不匹配,请重新输入");
        }else {
            $.ajax({
                type:"POST",
                url:"/admin/modify",
                data:{"oldPwd":oldPwd,"password":password},
                success:function (data) {
                    data = eval("("+data+")");//将string格式转化为json格式
                    if (data.message == "操作成功"){
                        alert("修改成功");
                        window.location.href = "/index";
                    }else {
                        alert("原密码输入错误！")
                    }
                }
            });
        }
    });

});