<%@page import="cn.ems.domain.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,  cn.ems.dao.impl.*"%>

<%
	String keyword = request.getParameter("keyword");
	List<ScoreInfo> scoreInfo = ScoreInfoDaoImpl.findScoreInfo(keyword,"T1");
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
<title>查询结果</title>
</head>
<body>
	<div class="page-container">
		<div class="mt-20">
			<div class="text-c">
				<h4>查 询 结 果</h4>
			</div>
			<table
				class="table table-border table-bordered table-hover table-bg table-sort">
				<thead>
					<tr class="text-c">
						<th width="60">课程编号</th>
						<th width="80">课程名</th>
						<th width="110">学号</th>
						<th width="70">姓名</th>
						<th width="120">系别名称</th>
						<th width="70">专业名称</th>
						<th width="100">班级名</th>
						<th width="90">学年</th>
						<th width="60">学期</th>
						<th width="50">学分</th>
						<th width="50">成绩</th>
						<th width="60">补考成绩</th>
						<th width="60">重修成绩</th>
					</tr>
				</thead>
				<%
					for (Iterator<ScoreInfo> it = scoreInfo.iterator(); it.hasNext();) {
						ScoreInfo s = it.next();
				%>
				<tbody>
					<tr class="text-c">
						<td><%=s.getCid()%></td>
						<td><%=s.getCour_name()%></td>
						<td><%=s.getStudent_id()%></td>
						<td><%=s.getStudent_name()%></td>
						<td><%=s.getDept_name()%></td>
						<td><%=s.getSpec_name()%></td>
						<td><%=s.getClass_name()%></td>
						<td><%=s.getSchoolyear()%></td>
						<td><%=s.getSemester()%></td>
						<td><%=s.getCredits()%></td>
						<td><%=s.getScore()%></td>
						<td><%=s.getRetestScore()%></td>
						<td><%=s.getRepeatScore()%></td>
					</tr>
				</tbody>

				<%
					}
				%>
			</table>
			<center id="page">
				<input class="btn btn-primary radius" type="button"
					value="&nbsp;&nbsp;返回&nbsp;&nbsp;"
					onclick="window.history.back(-1)">
			</center>
		</div>
	</div>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/layer.js"></script>
	<script type="text/javascript" src="js/laypage.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
	<script type="text/javascript" src="js/index.admin.js"></script>
</body>
</html>
