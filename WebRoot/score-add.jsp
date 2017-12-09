<%@page import="cn.ems.dao.impl.StudentDaoImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="cn.ems.domain.*"%>
<%@ page import="java.sql.*,  cn.ems.dao.impl.*"%>

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
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/layer.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript">
	var req, flagID, flagName;
	function init() {
		if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}

	function getStudent_id() {
		init();
		var url = "getStudent_id.jsp?id="
				+ escape(document.frm.cid.options[document.frm.cid.selectedIndex].value);
		req.open("GET", url, true);
		req.onreadystatechange = callback;
		req.send(null);
	}

	function callback() {
		if (4 == req.readyState) {
			if (200 == req.status) {
				//alert(req.responseText);
				eval(req.responseText);
			}
		}
	}

	function getStudentName() {
		init();
		var url = "getStudent_Name.jsp?id="
				+ escape(document.frm.student_id.options[document.frm.student_id.selectedIndex].value);
		req.open("GET", url, true);
		req.onreadystatechange = callback;
		req.send(null);
	}

	function checkScore() {
		init();
		var score = document.getElementById("score").value;
		var validate = /^(?:0|[1-9][0-9]?|100)$/;
		if (score == "") {
			document.getElementById("msgscore").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入成绩</font>";
			flagName = false;
		} else if (!validate.test(score)) {
			document.getElementById("msgscore").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入正确格式（0-100）</font>";
			document.getElementById("score").value = "";
			flagName = false;
		} else {
			document.getElementById("msgscore").innerHTML = "";
			flagName = false;
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
</script>
<style type="text/css">
.input-text {
	width: 400px;
}
</style>
<title>新增成绩</title>
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
			setTimeout("document.getElementById('msg').style.display='none'",
					2000);
		</script>
		<form class="form form-horizontal" id="form-good-add" method="post"
			action="ScoreAdd" name="frm">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red"></span>所选课程：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<select class="select" size="1" name="cid" id="cid"
						onchange="getStudent_id()" style="height: 30px; width: 400">
						<option value="" selected>-----请选择课程-----</option>
						<%
							List<Course> course = CourseDaoIpml.findCidBykw(session.getAttribute("te_username").toString());
							for (Course c : course) {
						%>
						<option value=<%=c.getCid()%>><%=c.getCour_name()%></option>
						<%
							}
						%>
					</select>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red"></span>学号：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<select class="select" size="1" name="student_id" id="student_id"
						onchange="getStudentName()" style="width: 400;height: 30px">
						<option value="" selected>-----请先选择课程-----</option>
					</select>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red"></span>姓名：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" autocomplete="off"
						disabled="disabled" id="student_name" name="student_name" msg="姓名"><span
						id="msgname"></span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red"></span>成绩：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" autocomplete="off"
						name="score" id="score" placeholder="" onblur="checkScore()"
						msg="成绩"> <span id="msgscore"></span>
				</div>
			</div>
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
					<input class="btn btn-primary radius" type="submit"
						value="&nbsp;&nbsp;提交&nbsp;&nbsp;" onclick="checkNull()">&nbsp; <input
						class="btn btn-primary radius" type="reset"
						value="&nbsp;&nbsp;重置&nbsp;&nbsp;">
				</div>
			</div>
		</form>

	</article>

</body>
</html>