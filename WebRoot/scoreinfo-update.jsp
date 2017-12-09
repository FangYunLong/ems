<%@page import="cn.ems.domain.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,  cn.ems.dao.impl.*"%>

<%
	ScoreInfo info = ScoreInfoDaoImpl.getScoreInfo(
			request.getParameter("student_id"),
			request.getParameter("cid"));
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
<link rel="stylesheet" type="text/css" href="css/min.css" />
<link rel="stylesheet" type="text/css" href="css/admin.css" />
<link rel="stylesheet" type="text/css" href="css/iconfont.css" />
<link rel="stylesheet" type="text/css" href="css/icheck.css" />
<link rel="stylesheet" type="text/css" href="skin/default/skin.css"
	id="skin" />
<title>学生成绩</title>
	<script type="text/javascript">
	var req, flagID, flagName;
	function init() {
		if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}

	function checkRetestScore() {
		init();
		var retestscore = document.getElementById("retestscore").value;
		var validate = /^$|^(?:0|[1-9][0-9]?|100)$ /;
		if (!validate.test(retestscore)) {
			document.getElementById("msgretestscore").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入正确格式（0-100 或不输入）</font>";
			document.getElementById("retestscore").value = "";
			flagName = false;
		} else {
			document.getElementById("msgretestscore").innerHTML = "";
			flagName = false;
		}
	}
	function checkRepeatScore() {
		init();
		var repeatscore = document.getElementById("repeatscore").value;
		var validate = /^$|^(?:0|[1-9][0-9]?|100)$/;
		if (!validate.test(repeatscore)) {
			document.getElementById("msgrepeatscore").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入正确格式（0-100 或不输入）</font>";
			document.getElementById("repeatscore").value = "";
			flagName = false;
		} else {
			document.getElementById("msgrepeatscore").innerHTML = "";
			flagName = false;
		}
	}
	</script>
</head>
<body>
	<article class="page-container">
	<form class="form form-horizontal" method="post"
		action="ScoreUpdate">
		<input type="hidden" name="student_id"
			value="<%=request.getParameter("student_id")%>">
			<input type="hidden" name="cid"
			value="<%=request.getParameter("cid")%>">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>学号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="student_id"
					value="<%=info.getStudent_id()%>" style="width: 450" disabled> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>姓名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" autocomplete="off"
					name="student_name" value="<%=info.getStudent_name()%>" style="width: 450" disabled>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>所属系别：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<input type="text" class="input-text" name="sex"
					value="<%=info.getDept_name()%>" style="width: 450" disabled>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>专业名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="nation"
					value="<%=info.getSpec_name()%>" style="width: 450" disabled>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">班级名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder="" name="id_card"
					value="<%=info.getClass_name()%>" style="width: 450" disabled>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">课程编号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder=""
					name="study_length" value="<%=info.getCid()%>" style="width: 450" disabled>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">课程名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder=""
					name="study_length" value="<%=info.getCour_name()%>" style="width: 450" disabled>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">学期：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder=""
					name="study_length" value="<%=info.getSemester()%>" style="width: 450" disabled>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">学分：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder=""
					name="study_length" value="<%=info.getCredits()%>" style="width: 450" disabled>
			</div>
		</div>
				<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">成绩：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder=""
					name="score" value="<%=info.getScore()%>" style="width: 450" >
			</div>
		</div>
				<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">补考成绩：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder=""
					name="retestscore" value="<%=info.getRetestScore()%>" style="width: 450" id="retestscore" onblur="checkRetestScore()"><span
						id="msgretestscore"></span>
			</div>
		</div>
				<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">重修成绩：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder=""
					name="repeatscore" value="<%=info.getRepeatScore()%>" style="width: 450" id="repeatscore" onblur="checkRepeatScore()"><span
						id="msgrepeatscore"></span>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit"
					value="&nbsp;&nbsp;修改&nbsp;&nbsp;"> &nbsp; <input
					class="btn btn-primary radius" type="button"
					value="&nbsp;&nbsp;返回&nbsp;&nbsp;"
					onclick="window.history.back(-1)">
			</div>
		</div>
	</form>

	</article>

	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/layer.js"></script>
	<script type="text/javascript" src="js/laypage.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
	<script type="text/javascript" src="js/index.admin.js"></script>
</body>
</html>
