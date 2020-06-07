$(document).ready(function () {
    var url = window.location.search;//获取href ？后面的值
    var uid = url.slice(4);//从第四位开始截取

    $('#form').attr('action','/file/down?id='+uid+'');//下载
    
    //初始化
    $.ajax({
        dataType : 'json',
        type : 'POST',
        url : '/booking/selectById',
        data : {'id': uid},
        success : function (data) {
            console.log(data);
            $('#proName').html(data.data.proName);//课题/项目名称
            $('#proSource').html(data.data.proSource);//任务来源
            $('#proNum').html(data.data.proNumber);//项目基金号/合同号
            $('#proPer').html(data.data.proPerson);//项目负责人及单位
            $('#proMobile').html(data.data.proPersonMobile);//联系电话
            $('#bookingPer').html(data.data.bookingPerson);//预约人
            $('#bookingMobile').html(data.data.bookingPersonMobile);//联系电话
            $('#insName').html(data.data.insName);//预约仪器
            $('#sample').html(data.data.sample);//样品信息及数量
            $('#bookingEvent').html(data.data.bookingEvent);//预约其他事项
            $('#bookingNum').html(data.data.bookingPersonNumber);//送样检测人
            var temp = data.data.bookingOperationSkill;
            if (temp == 1) {
                $('#bookingSkill').html("是");//是否具备独立上机操作技能
            } else {
                $('#bookingSkill').html("否");//是否具备独立上机操作技能
            }

            $('#bookingTime').html(data.data.statTime+'--'+data.data.endTime);//与仪器专管员约定测试日期
            $('#feesource').html(data.data.feeSource);//费用出处
            if(data.data.modify){
                $('#modify').html(data.data.modify);
            }else {
                $('#modify').html();
            }
        }
    });

    //同意申请
    $("#true").click(function () {
        var input1= $("#input1").val();
        if (input1.length == 0){
            alert("请填写意见！")
            $("#input1").focus();
        }else{
            $.ajax({
                type : 'POST',
                url : '/admin/updateByPrimaryKeySelective',
                data : {'tid':uid,"id":2,"modify":input1},
                success:function (data) {
                    data = eval("("+data+")");//将string格式转化为json格式
                    if (data.message == "操作成功"){
                        window.location.href = "/index/ins_admin";
                    }
                }
            })
        }
    });

    //拒绝申请
    $("#false").click(function () {
        var input1= $("#input1").val();
        if (input1.length == 0){
            alert("请填写意见！")
            $("#input1").focus();
        }else{
            $.ajax({
                type : 'POST',
                url : '/admin/updateByPrimaryKeySelective',
                data : {'tid':uid,"id":0,"modify":input1},
                success:function (data) {
                    data = eval("("+data+")");//将string格式转化为json格式
                    if (data.message == "操作成功"){
                        window.location.href = "/index/ins_admin";
                    }
                }
            })
        }
    })

    //下载
    // $("#down").click(function () {
    //     console.log(1);
    //     $.ajax({
    //         type:"get",
    //         url:"/file/down",
    //         data:{"id":uid},
    //         success:function (data) {
    //             console.log(data);
    //         }
    //     })
    // })
});


