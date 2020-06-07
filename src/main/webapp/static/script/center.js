$(document).ready(function () {
    //预约成功
    $.ajax({
        dataType : 'json',
        type : 'POST',
        url : '/booking/myBooking',
        data : {'id': 2},
        success : function (data) {
            for(var i = 0;i<data.data.length;i++){
                var _html = '<tr><td>'+data.data[i].insName+'</td><td>'+data.data[i].statTime+'--'+data.data[i].endTime+'</td><td><a href="/index/download?id='+data.data[i].id+'">详情</a></td></tr>'
                $('#thead').append(_html);
            }
        }
    });

    var oLi = document.querySelectorAll(".container .row ul li");
    var length = oLi.length;
    var bIndex = 0;//这个变量用来表示处于第几个li
    for (var i =0;i<length;i++){
        oLi[i].i = i;
        oLi[i].onclick = function () {
            oLi[bIndex].className = '';//此处当鼠标移入其他选项卡时候刚开始的第一个li名字要为空，
            bIndex = this.i;//此处的i为当前的li，将当前的i给 bIndex 表示目前处于第i个
            this.className = "active";//给当前的选项卡加上名字
            //预约成功
            if(bIndex == 0){
                $('#first').nextAll().remove();
                $.ajax({
                    dataType : 'json',
                    type : 'POST',
                    url : '/booking/myBooking',
                    data : {'id': 2},
                    success : function (data) {
                        for(var i = 0;i<data.data.length;i++){
                            var _html = '<tr><td>'+data.data[i].insName+'</td><td>'+data.data[i].statTime+'--'+data.data[i].endTime+'</td><td><a href="/index/download?id='+data.data[i].id+'">详情</a></td></tr>';
                            $('#thead').append(_html);
                        }
                    }
                });
            }else if(bIndex == 1){//预约退回
                $('#first').nextAll().remove();
                $.ajax({
                    dataType : 'json',
                    type : 'POST',
                    url : '/booking/myBooking',
                    data : {'id': 0},
                    success : function (data) {
                        for(var i = 0;i<data.data.length;i++){
                            var _html = '<tr><td>'+data.data[i].insName+'</td><td>'+data.data[i].statTime+'--'+data.data[i].endTime+'</td><td>'+data.data[i].modify+'</td></tr>';
                            $('#thead').append(_html);
                        }
                    }
                });
            }else {//正在申请
                $('#first').nextAll().remove();
                $.ajax({
                    dataType : 'json',
                    type : 'POST',
                    url : '/booking/myBooking',
                    data : {'id': 1},
                    success : function (data) {
                        console.log(data);
                        for(var i = 0;i<data.data.length;i++){
                            var _html = '<tr><td>'+data.data[i].insName+'</td><td>'+data.data[i].statTime+'--'+data.data[i].endTime+'</td><td><a href="/index/applyfor?id='+data.data[i].id+'">详情</a></td></tr>';
                            $('#thead').append(_html);
                        }
                    }
                });
            }
        }
    };
});