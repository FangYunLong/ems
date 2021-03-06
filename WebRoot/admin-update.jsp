<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>密码修改</title>
<link rel="stylesheet" type="text/css" href="css/min.css" />
<link rel="stylesheet" type="text/css" href="css/admin.css" />
<link rel="stylesheet" type="text/css" href="css/iconfont.css" />
<link rel="stylesheet" type="text/css" href="css/icheck.css" />
<link rel="stylesheet" type="text/css" href="skin/default/skin.css"
	id="skin" />
	
	<script type="text/javascript">
		function checkFrm(){
			if(document.frm.old_pass.value == ""){
    			alert("请输入旧密码！");
    			return false;
    		}
    		if(document.frm.new_pass.value == ""){
    			alert("请输入新密码！");
    			return false;
    		}
    		if(document.frm.renew_pass.value == ""){
    			alert("请确认新密码！");
    			return false;
    		}
    		if(document.frm.new_pass.value != document.frm.renew_pass.value){
    			alert("输入的新密码与确认新密码不一致！");
    			return false;
    		}
			frm.submit();
		}
	</script>
	
</head>

<body>
    <article class="page-container">
    	<form class="form form-horizontal"  method="post"
		action="<%=request.getContextPath()%>/AdminUpdate" name="frm">
		<input type="hidden" value="<%=request.getParameter("username")%>" name="user">
			<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>用户名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="username" id="username" disabled="disabled"
					value="<%=request.getParameter("username")%>" style="width: 800">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>旧密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="password" class="input-text" autocomplete="off" id="old_pass" maxlength="16"
					name="old_pass" value="" style="width: 800">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>新密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="password" class="input-text" autocomplete="off" id="new_pass" maxlength="16"
					name="new_pass" value="" style="width: 800"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>确认新密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="password" class="input-text" autocomplete="off" id="renew_pass" maxlength="16"
					name="renew_pass" value="" style="width: 800">
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit"
					value="&nbsp;&nbsp;修改&nbsp;&nbsp;" onclick="return checkFrm()"> &nbsp;
				<input class="btn btn-primary radius" type="reset"
					value="&nbsp;&nbsp;重置&nbsp;&nbsp;">
			</div>
		</div>
		</form>
    </article>
</body>
</html>
