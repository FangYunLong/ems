<%@page import="cn.ems.domain.Teacher"%>
<%@page import="cn.ems.dao.impl.TeacherDaoImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<LINK rel="Bookmark" href="/favicon.ico" >
<LINK rel="Shortcut Icon" href="/favicon.ico" />
<link rel="stylesheet" type="text/css" href="css/min.css" />
<link rel="stylesheet" type="text/css" href="css/admin.css" />
<link rel="stylesheet" type="text/css" href="css/iconfont.css" />
<link rel="stylesheet" type="text/css" href="css/icheck.css" />
<link rel="stylesheet" type="text/css" href="skin/default/skin.css" id="skin" />
<style type="text/css">
.input-text {
	width: 400px;
}
</style>
<script type="text/javascript">
	var req , flagID , flagName;
	function init(){
		if(window.XMLHttpRequest){
			req = new XMLHttpRequest();
		} else if(window.ActiveXObject){
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	
	function checkNull()  
	{  
	     var num=0;  
	     var str="";  
	     $("input[type$='text']").each(function(n){  
	          if($(this).val()=="")  
	          {  
	               num++;  
	               str+=$(this).attr("msg")+"不能为空！\r\n";  
	          }  
	     });  
	     if(num>0)  
	     {  
	          alert(str);  
	          return false;  
	     }  
	     else  
	     {  
	          return true;  
	     }  
	}  	
	
	function checkDeptID(){
		init();
		var deptid = document.getElementById("deptid");
		var validate = /^[dD]\d{1,2}$/;
		if(deptid.value == ""){
			document.getElementById("msgid").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入系别编号 </font>";
			flagID = false;
		} else if(!validate.test(deptid.value)){
			document.getElementById("msgid").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入正确格式,如 D1</font>";
			document.getElementById("deptid").value="";
			flagID = false;
		} else {
			var url = "CheckDeptId.jsp?keyword=" +escape(deptid.value);
			req.open("GET", url, true);
			req.onreadystatechange = function() {
				if(4 == req.readyState){
					if(200 == req.status){
						var msg = req.responseXML.getElementsByTagName("msg")[0].childNodes[0].nodeValue;
						if(msg == "valid"){
							document.getElementById("msgid").innerHTML = "<font color = 'green' size = 3>&nbsp;可用</font>";
							flagID = true;
						} else if(msg == "invalid"){
							document.getElementById("msgid").innerHTML = "<font color = 'red' size = 3>&nbsp;该系别编号已存在</font>";
							document.getElementById("deptid").value="";
							flagID = false;
							
						}
					}
				}
			};
			req.send(null);
		}
	}
	
	function checkDeptName(){
		init();
		var deptname = document.getElementById("dept_name").value;
		var validate = /^[\u4e00-\u9fa5]+$/;
		if(deptname == ""){
			document.getElementById("msgname").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入系别名称(仅支持中文)</font>";
			flagName = false;
		} else if(!validate.test(deptname)){
			document.getElementById("msgname").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入正确格式,仅支持中文)</font>";
			document.getElementById("dept_name").value="";
			flagName = false;
		} else {
			var url = "CheckDeptName.jsp?keyword=" +deptname;
			req.open("GET",url,true);
			req.onreadystatechange = function() {
				if(4 == req.readyState){
					if(200 == req.status){
						var msg = req.responseXML.getElementsByTagName("msg")[0].childNodes[0].nodeValue;
						if(msg == "invalid"){
							document.getElementById("msgname").innerHTML = "<font color = 'red' size = 3>&nbsp;该系别已存在</font>";
							document.getElementById("dept_name").value="";
							flagName = false;
						} else if(msg == "valid"){
							document.getElementById("msgname").innerHTML = "<font color = 'green' size = 3>&nbsp;可用</font>";
							flagName = true;
						}
					}
				}
			};
			req.send(null);
		}
	}
</script>
<title>新增系部</title>
</head>
<body>
<article class="page-container">
	<div id="msg">
		<%
			if(request.getAttribute("msg") != null)
				out.print(request.getAttribute("msg"));
		%>
	</div>
	<script type="text/javascript">
		setTimeout("document.getElementById('msg').style.display='none'", 2000);
	</script>
	<form action="DepartmentAdd" method="post" class="form form-horizontal" id="form-member-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>系别编号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" msg="系别编号"
					placeholder="请输入系别编号，如D1" id="deptid" name="deptid"
					style="width: 450px" onblur="checkDeptID()">
					<span id="msgid"></span>
			</div>
		</div>	
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>系别名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"  onblur="checkDeptName()" msg="系别名称" value="" placeholder="" id="dept_name" name="dept_name" style="width: 450px">
				<span id="msgname"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>系主任：</label>
			<div class="formControls col-xs-8 col-sm-9">
			 <span class="select-box" style="width: 450px">
				<select class="select" size="1" name="tid" >
					<option value="" selected>-----请选择系主任-----</option>
				<%
					List<Teacher> teacher = TeacherDaoImpl.getTeacher();
						for (Iterator<Teacher> iter = teacher.iterator(); iter.hasNext();) {
						Teacher t = iter.next();
				%>
					<option value=<%=t.getTid()%>><%=t.getTname()%></option>
				<%
					}
				%>
				</select>
			 </span> </div>
			</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit" onclick="return checkNull()" value="&nbsp;&nbsp;添加&nbsp;&nbsp;">&nbsp;
				<input class="btn btn-primary radius" type="reset" value="&nbsp;&nbsp;重置&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</article>

<script type="text/javascript" src="js/jquery.min.js"></script> 
<script type="text/javascript" src="js/layer.js"></script> 
<script type="text/javascript" src="js/messages_zh.min.js"></script> 
<script type="text/javascript" src="js/index.js"></script> 
<script type="text/javascript" src="js/index.admin.js"></script> 

<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#form-member-add").validate({
		rules:{
			username:{
				required:true,
				minlength:2,
				maxlength:16
			},
			sex:{
				required:true,
			},
			mobile:{
				required:true,
				isMobile:true,
			},
			email:{
				required:true,
				email:true,
			},
			uploadfile:{
				required:true,
			},
			
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			//$(form).ajaxSubmit();
			var index = parent.layer.getFrameIndex(window.name);
			//parent.$('.btn-refresh').click();
			parent.layer.close(index);
		}
	});
});
</script> 
</body>
</html>
