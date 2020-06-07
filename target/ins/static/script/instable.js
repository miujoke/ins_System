$(document).ready(function () {
    //初始化待审核
    $.ajax({
        dataType : 'json',
        type : 'POST',
        url : '/admin/selectByBooking',
        data : {'id': 1},
        success : function (data) {
            for(var i = 0;i<data.data.length;i++){
                var _html = '<tr><td>'+data.data[i].bookingPerson+'</td><td>'+data.data[i].insName+'</td><td>'+data.data[i].statTime+'--'+data.data[i].endTime+'</td><td><a href="/index/insorder?id='+data.data[i].id+'">详情</a></td></tr>';
                $('#insTable').append(_html);
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
            //待审核
            if(bIndex == 0){
                $('#first').nextAll().remove();//清空除#first以外的同级元素
                $.ajax({
                    dataType : 'json',
                    type : 'POST',
                    url : '/admin/selectByBooking',
                    data : {'id': 1},
                    success : function (data) {
                        for(var i = 0;i<data.data.length;i++){
                            var _html = '<tr><td>'+data.data[i].bookingPerson+'</td><td>'+data.data[i].insName+'</td><td>'+data.data[i].statTime+'--'+data.data[i].endTime+'</td><td><a href="/index/insorder?id='+data.data[i].id+'">详情</a></td></tr>';
                            $('#insTable').append(_html);
                        }
                    }
                });
            } else {//审核通过
                $('#first').nextAll().remove();
                $.ajax({
                    dataType : 'json',
                    type : 'POST',
                    url : '/admin/selectByBooking',
                    data : {'id': 2},
                    success : function (data) {
                        for(var i = 0;i<data.data.length;i++){
                            var _html = '<tr><td>'+data.data[i].bookingPerson+'</td><td>'+data.data[i].insName+'</td><td>'+data.data[i].statTime+'--'+data.data[i].endTime+'</td><td><a href="/index/approved?id='+data.data[i].id+'">详情</a></td></tr>';
                            $('#insTable').append(_html);
                        }
                    }
                });
            }
        }
    };
});