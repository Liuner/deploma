/**
 * 验证登陆
 */
function btnlogin(){
	var username=document.getElementById("usname").value;
	var password=document.getElementById("uspwd").value;
	if(username.length==0){
		alert("用户名不能为空");
		document.form[0].user.focus();
		return false;
	}
	if(password==""){
		alert("密码为空");
		//将密码框聚焦
		document.forms[1].pwd.focus();
		return false;
	}
	return true;
}