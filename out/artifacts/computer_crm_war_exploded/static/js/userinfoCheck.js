	
	/**
	 * 登录信息验证
	 * 
	 * 验证用户名错误信息:$("#form-login label[for='name']")
	 * 验证密码错误信息:$("#form-login label[for='pass']")
	 */
	/**
	 * 验证登录用户名
	 */
	function checkLoginName(){
		var name = $("#loginInputName").val();
		if(name == ""){
			$("form label[for='loginName']").text("请输入用户名!");
			$("form label[for='loginName']").show();
			return false;
		}
		$("form label[for='loginName']").hide();
		return true;
	}
	/**
	 * 验证登录密码
	 */
	function checkLoginPass(){
		var password = $("#loginInputPassword").val();
		if(password == ""){
			$("form label[for='loginPass']").text("请输入密码!");
			$("form label[for='loginPass']").show();
			return false;
		}
		$("form label[for='loginPass']").hide();
		return true;
	}
	
	
	
	/**
	 * 注册信息验证
	 * 
	 * 验证用户名错误信息:$("form label[for='name']")
	 * 验证电话错误信息:$("form label[for='tel']")
	 * 验证地址错误信息:$("form label[for='address']")
	 * 验证密码错误信息:$("form label[for='pass']")
	 * 验证确认密码错误信息:$("form label[for='isPass']")
	 * 验证复选框是否选中错误信息:$("form label[for='checkbox']")
	 */
	/**
	 * 验证注册用户名
	 */ 
	function checkRegisterName(){
		var name = $("#inputRegisterName").val();
		if(name == ""){
			$("form label[for='name']").text("请输入用户名!");
			$("form label[for='name']").show();
			return false;
		}
		//正则表达式
		//限制用户名规则：用户名由1~8位中英文数字以及下划线组成
		var pattern = /^[\da-zA-Z\u4E00-\u9FA5_]{1,8}$/;
		if(!pattern.test(name)){
			$("form label[for='name']").text("用户名只能是中文或者英文加数字!");
			$("form label[for='name']").show();
			return false;
		}
		if(isUserNameExist(name)){
			$("form label[for='name']").text("此用户名已经存在!");
			$("form label[for='name']").show();
			return false;
		}
		$("form label[for='name']").hide();
		return true;
	}
	/**
	 * 验证修改用户名
	 */
	function ckeckAlterName(){
		var name = $("#inputAlterName").val();
		if(name == ""){
			$("form label[for='name']").text("请输入用户名!");
			$("form label[for='name']").show();
			return false;
		}
		//正则表达式
		//限制用户名规则：用户名由1~8位中英文数字以及下划线组成
		var pattern = /^[\da-zA-Z\u4E00-\u9FA5_]{1,8}$/;
		if(!pattern.test(name)){
			$("form label[for='name']").text("用户名只能是中文或者英文加数字!");
			$("form label[for='name']").show();
			return false;
		}
		if(isAlterUserNameExist(name)){
			$("form label[for='name']").text("此用户名已经存在!");
			$("form label[for='name']").show();
			return false;
		}
		$("form label[for='name']").hide();
		return true;
	}
	/**
	 * 验证电话号码
	 */ 
	function checkTel(){
		var tel = $("#inputTel").val();
		if(tel == ""){
			$("form label[for='tel']").text("请输入电话号码!");
			$("form label[for='tel']").show();
			return false;
		}
		//效验电话号码
		var partern = /^1[34578]\d{9}$/;
		if(!partern.test(tel)){
			$("form label[for='tel']").text("电话为1 3/4/5/7/8 开头的11位数字!");
			$("form label[for='tel']").show();
			return false;
		}
		$("form label[for='tel']").hide();
		return true;
	}
	/**
	 * 验证地址
	 */
	function checkAddress(){
		var address = $("#inputAddress").val();
		if(address == ""){
			$("form label[for='address']").text("请输入收货地址!");
			$("form label[for='address']").show();
			return false;
		}
		//限制地址规则：地址由2~20位中英文数字组成
		var pattern = /^[A-z0-9\u4e00-\u9fa5]{2,20}$/;
		if(!pattern.test(address)){
			$("form label[for='address']").text("请填写正确收货地址(2~20个字符)!");
			$("form label[for='address']").show();
			return false;
		}
		$("form label[for='address']").hide();
		return true;
	}
	/**
	 * 验证原密码正确性
	 */
	function checkOldPass(){
		var pass = $("#inputPass").val();
		if(pass == ""){
			$("form label[for='oldPass']").text("请输入原密码!");
			$("form label[for='oldPass']").show();
			return false;
		}
		if (!isAlterOldPassExist(pass)) {
			$("form label[for='oldPass']").text("原密码错误");
			$("form label[for='oldPass']").show();
			return false;
		}
		$("form label[for='oldPass']").hide();
		return true;
	}
	/**
	 * 验证密码
	 */ 
	function checkPass(){
		var pass = $("#inputPass1").val();
		if(pass == ""){
			$("form label[for='pass']").text("请输入密码!");
			$("form label[for='pass']").show();
			return false;
		}
		//校验密码规则：6-20位字母、数字、下划线
		var partern = /^(\w){6,20}$/;
		if (!partern.test(pass)) {
			$("form label[for='pass']").text("请输入6-20位字母、数字、下划线");
			$("form label[for='pass']").show();
			return false;
		}
		$("form label[for='pass']").hide();
		return true;
	}
	/**
	 * 验证再次输入密码是否正确
	 */
	function checkBothPassRight(){
		var pass = $("#inputPass1").val();
		var isPass = $("#inputPass2").val();
		if(isPass == ""){
			$("form label[for='isPass']").text("请确认密码!");
			$("form label[for='isPass']").show();
			return false;
		}
		if(pass != isPass){
			$("form label[for='isPass']").text("两次输入密码不相同!");
			$("form label[for='isPass']").show();
			return false;
		}
		$("form label[for='isPass']").hide();
		return true;
	}
	
	/**
	 * 验证复选框是否勾选
	 */ 
	function checkbox(){
		var isChecked = $("form .check").is(":checked");
		if(!isChecked){
			$("form label[for='checkbox']").show();
			return false;
		}
		$("form label[for='checkbox']").hide();
		return true;
	}
	

/**
 *  验证用户名是否存在，存在相同的则返回true
 */
function isUserNameExist(userName)
{
	var isExist = false;
	//同步请求验证用户姓名
	$.ajax({
		type : "POST",
		async : false, //此处设置为同步，防止ajax还未执行完毕，就已经返回
		dataType : "json",
		url : "userApi/checkUserName",
		data : {
			userName : userName
		},
		success : function(data) {
			//获取数据库验证结果
			isExist = data["isExist"];
		}
	});
	return isExist;
}
	

/**
 *  验证除自身以外，是否有相同用户名，存在相同的则返回true
 *  
 * @param alterName
 * @returns
 */
function isAlterUserNameExist(alterName)
{
	//同步请求验证用户姓名
	$.ajax({
		type : "POST",
		async : false, //此处设置为同步，防止ajax还未执行完毕，就已经返回
		dataType : "json",
		data : {
			alterName : alterName
		},
		url : "userApi/checkAlterUserName",
		success : function(data) {
			//获取数据库验证结果
			isExist = data["isExist"];
		}
	});
	return isExist;
}


/**
 * 判断用户密码是否正确
 * 
 * @param oldPass
 * @returns
 */
function isAlterOldPassExist(oldPass)
{
	//同步请求验证用户密码
	$.ajax({
		type : "POST",
		async : false, //此处设置为同步，防止ajax还未执行完毕，就已经返回
		dataType : "json",
		data : {
			oldPass : oldPass
		},
		url : "userApi/checkAlterOldPass",
		success : function(data) {
			//获取数据库验证结果
			isExist = data["isExist"];
		}
	});
	return isExist;
}