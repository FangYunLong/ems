<%@page import="cn.ems.dao.impl.StudentDaoImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="cn.ems.domain.*"%>
<%@ page import="java.sql.*,  cn.ems.dao.impl.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	String action = request.getParameter("action");
	if (action != null && action.trim().equals("add")) {
		String tid = request.getParameter("tid").toUpperCase();
		String tname = request.getParameter("tname");
		String sex = request.getParameter("sex");
		String phone = request.getParameter("phone");
		String title = request.getParameter("title");
		String deptid = request.getParameter("deptid");

		Teacher t = new Teacher();
		t.setTid(tid);
		t.setPassword(tid);
		t.setTname(tname);
		t.setSex(sex);
		t.setPhone(phone);
		t.setTitle(title);
		t.setDepid(deptid);
		TeacherDaoImpl.addTeacher(t);
		out.print("插入成功");
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<LINK rel="Bookmark" href="/favicon.ico">
<LINK rel="Shortcut Icon" href="/favicon.ico" />
<link rel="stylesheet" type="text/css" href="css/min.css" />
<link rel="stylesheet" type="text/css" href="css/admin.css" />
<link rel="stylesheet" type="text/css" href="css/iconfont.css" />
<link rel="stylesheet" type="text/css" href="css/icheck.css" />
<link rel="stylesheet" type="text/css" href="skin/default/skin.css"
	id="skin" />
<style type="text/css">
.input-text {
	width: 450px;
}
</style>
<script type="text/javascript">
	var req, flagID, flagName;
	function init() {
		if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
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
	
	function checkTid() {
		init();
		var tid = document.getElementById("tid").value;
		var validate = /^[tT]\d{1,2}$/;
		if (tid == "") {
			document.getElementById("msgid").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入工号</font>";
			flagName = false;
		} else if (!validate.test(tid)) {
			document.getElementById("msgid").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入正确格式</font>";
			document.getElementById("tid").value="";
			flagName = false;
		} else {
			var url = "CheckTeacherId.jsp?keyword=" + tid;
			req.open("GET", url, true);
			req.onreadystatechange = function() {
				if (4 == req.readyState) {
					if (200 == req.status) {
						var msg = req.responseXML.getElementsByTagName("msg")[0].childNodes[0].nodeValue;
						if (msg == "valid") {
							document.getElementById("msgid").innerHTML = "<font color = 'green' size = 3>&nbsp;可用</font>";
							flagID = true;
						} else if (msg == "invalid") {
							document.getElementById("msgid").innerHTML = "<font color = 'red' size = 3>&nbsp;该工号已存在</font>";
							document.getElementById("tid").value="";
							flagID = false;
						}
					}
				}
			};
			req.send(null);
		}
	}

	function checkTeacherName() {
		init();
		var tname = document.getElementById("tname").value;
		var validate = /^[\u4e00-\u9fa5]{2,}$/;
		if (tname == "") {
			document.getElementById("msgname").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入姓名</font>";
			flagName = false;
		} else if (!validate.test(tname)) {
			document.getElementById("msgname").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入正确格式,两个字以上</font>";
			document.getElementById("tname").value="";
			flagName = false;
		} else {
			document.getElementById("msgname").innerHTML = "";
			flagName = false;
		}
	}
	function checkSex() {
		init();
		var sex = document.getElementById("sex").value;
		var validate =  /^['男'|'女']$/;
		if (sex == "") {
			document.getElementById("msgsex").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入性别</font>";
			flagName = false;
		} else if (!validate.test(sex)) {
			document.getElementById("msgsex").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入正确格式,男或女</font>";
			document.getElementById("sex").value="";
			flagName = false;
		} else {
			document.getElementById("msgsex").innerHTML = "";
			flagName = false;
		}
	}
	function checkPhone() {
		init();
		var phone = document.getElementById("phone").value;
		var validate = /^1[34578]\d{9}$/;
		if (phone == "") {
			document.getElementById("msgphone").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入电话</font>";
			flagName = false;
		} else if (!validate.test(phone)) {
			document.getElementById("msgphone").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入正确格式</font>";
			document.getElementById("phone").value="";
			flagName = false;
		} else {
			var url = "CheckPhone.jsp?keyword=" + phone;
			req.open("GET", url, true);
			req.onreadystatechange = function() {
				if(4 == req.readyState){
					if(200 == req.status){
						var msg = req.responseXML.getElementsByTagName("msg")[0].childNodes[0].nodeValue;
						if(msg == "valid"){
							document.getElementById("msgphone").innerHTML = "<font color = 'green' size = 3>&nbsp;可用</font>";
							flagID = true;
						} else if(msg == "invalid"){
							document.getElementById("msgphone").innerHTML = "<font color = 'red' size = 3>&nbsp;该号码已存在</font>";
							document.getElementById("phone").value="";
							flagID = false;
						}
					}
				}
			};
			req.send(null);
		}
	}
	function checkTitle() {
		init();
		var title = document.getElementById("title").value;
		var validate = /[^\x00-\xff]/;
		if (title == "") {
			document.getElementById("msgtitle").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入职称</font>";
			flagName = false;
		} else if (!validate.test(title)) {
			document.getElementById("msgtitle").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入正确格式</font>";
			document.getElementById("title").value="";
			flagName = false;
		} else {
			document.getElementById("msgtitle").innerHTML = "";
			flagName = false;
		}
	}
</script>
<title>新增老师</title>
</head>
<body>
	<article class="page-container">
	<form class="form form-horizontal" id="form-good-add" method="post"
		action="teacher-add.jsp" id="form-member-add">
		<input type="hidden" name="action" value="add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>工号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="tid" id="tid"
					onblur="checkTid()" placeholder="请输入工号，如T1" msg="工号"><span
					id="msgid"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>姓名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" autocomplete="off"
					name="tname" id="tname" onblur="checkTeacherName()" msg="姓名"><span
					id="msgname"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>性别：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select class="select" size="1" name="sex"
					style="width: 450 ;height: 30px;">
					<option value="男">男</option>
					<option value="女">女</option>
				</select>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>电话：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" autocomplete="off"
					name="phone" id="phone" onblur="checkPhone()" msg="电话"><span id="msgphone"></span>
			</div>
		</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>职称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select class="select" size="1" name="title" style="width: 450;height: 30px;">
					<option value="" selected>-----请选择教师职称-----</option>
					<option value="助教">助教</option>
					<option value="讲师">讲师</option>
					<option value="副教授">副教授</option>
					<option value="教授">教授</option>
				</select>
			</div>
		</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>所属系别：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<select class="select" size="1" name="deptid" 
					style="width: 450;height: 30px;">
					<option value="" selected>-----请选择系别-----</option>
					<%
						List<Department> list = DepartmentDaoImpl.getDepartment();
											for(Iterator<Department> iter = list.iterator();iter.hasNext();){
												Department dept = iter.next();
					%>
					<option value=<%=dept.getDeptid()%>><%=dept.getDept_name()%></option>
					<%
						}
					%>
				</select>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit"   onclick="return checkNull()" 
					value="&nbsp;&nbsp;提交&nbsp;&nbsp;">&nbsp; <input
					class="btn btn-primary radius" type="reset"
					value="&nbsp;&nbsp;重置&nbsp;&nbsp;">
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
		$(function() {
			$('.skin-minimal input').iCheck({
				checkboxClass : 'icheckbox-blue',
				radioClass : 'iradio-blue',
				increaseArea : '20%'
			});

			$("#form-member-add").validate({
				rules : {
					username : {
						required : true,
						minlength : 2,
						maxlength : 16
					},
					sex : {
						required : true,
					},
					mobile : {
						required : true,
						isMobile : true,
					},
					email : {
						required : true,
						email : true,
					},
					uploadfile : {
						required : true,
					},

				},
				onkeyup : false,
				focusCleanup : true,
				success : "valid",
				submitHandler : function(form) {
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