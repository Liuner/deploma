//鼠标移动到右图中选项时，给相应选项添加样式
$("div.focus").mouseenter(function(){
	$("div.focus").removeClass("BrainMapMainCurrent");
	$(this).addClass("BrainMapMainCurrent");
	var atype="#"+$(this).children("a").text();
	$(".astronomyType").addClass("hide");
	$(atype).removeClass("hide");
});
//左右尖括号的鼠标悬停和点击事件
$("img.prev").mouseenter(function(){
	$(this).animate({left:"60px"},"fast");
	$(this).click(function(){
        $("div.focus").removeClass("BrainMapMainCurrent");
		//TODO-修改文本框内容为上一个
	});
});
$("img.prev").mouseleave(function(){
	$(this).animate({left:"65px"},"fast");
});
$("img.next").mouseenter(function(){
	$(this).animate({right:"35px"},"fast");
	$(this).click(function(){
		$("div.focus").removeClass("BrainMapMainCurrent");
		//TODO-修改文本框内容为下一个
	});
});
$("img.next").mouseleave(function(){
	$(this).animate({right:"40px"},"fast");
});
//搜索栏上方的菜单点击事件
$("#stype").children("li").click(function(){
	$("#stype").children("li").removeClass("active");
	$(this).addClass("active");
});
//登录
$('#loginModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget) // Button that triggered the modal
    var recipient = button.data('whatever') // Extract info from data-* attributes
    var modal = $(this)
    modal.find('.modal-title').text('New message to ' + recipient)
    modal.find('.modal-body input').val(recipient)
})
//注册
$('#registerModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget) // Button that triggered the modal
    var recipient = button.data('whatever') // Extract info from data-* attributes
    var modal = $(this)
    modal.find('.modal-title').text('New message to ' + recipient)
    modal.find('.modal-body input').val(recipient)
})
//登录Ajax
$(function() {

    $("#btnLogin").click(function(){
        if($("#usname").val()==null||$("#uspassword").val()==null){
            $("#errMsg").text("用户名或密码为空！").removeClass("hide");
        }else {
        //1.取到用户名和密码
        var params = {
            "usname": $("#usname").val(),
            "uspassword": $("#uspassword").val()
        };
            //2.发送ajax请求去登录
            $.post("ajax-login.do", params, function (data) {
                //3.请求回来之后根据结果显示相应的内容
                if (data.success) {
                    $("#loginUser").text(data.user.usname);
                    var hrefff = "personal.do?usid=" + (data.user.usid);
                    $("#loginUser").attr("href", hrefff);
                    $("#logedArea").removeClass("hide");
                    $("#loginArea").remove();
                    $('#loginModal').modal('hide');
                } else {
                    $("#errMsg").text(data.msg).removeClass("hide");
                }
            }, 'json');
            //
        }//结束else
    });

});
//注册Ajax
$(function() {

    $("#btnRegister").click(function(){
        if($("#username1").val()==null){
            $("#errRMsg").text("用户名为空！").removeClass("hide");
        }else if($("#password1").val()==null){
            $("#errRMsg").text("密码为空！").removeClass("hide");
        }else if($("#tel").val()==null){
            $("#errRMsg").text("电话为空！").removeClass("hide");
        }
        else {
            //1.取到用户名,密码和电话
            var params = {
                "usname": $("#username1").val(),
                "uspassword": $("#password1").val(),
                "ustel": $("#tel").val()
            };
            //2.发送ajax请求去注册
            $.post("ajax-register.do", params, function (data) {
                //3.请求回来之后根据结果显示相应的内容
                if (data.success) {
                    $("#errRMsg").text(data.msg).removeClass("hide");
                    setTimeout(function () {
                        $('#registerModal').modal('hide');
                    }, 1500);
                } else {
                    $("#errRMsg").text(data.msg).removeClass("hide");
                }
            }, 'json');
        }
    });

});
function choosetype(ptype) {
    $("#chooseclass").val(ptype);
}