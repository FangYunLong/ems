<%@page import="cn.ems.domain.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,  cn.ems.dao.impl.*"%>

<%
	String keyword = request.getParameter("keyword");

	List<TeacherInfo> teacher = TeacherDaoImpl.findTeacherBykw(keyword);
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
			<table
				class="table table-border table-bordered table-hover table-bg table-sort">
				<thead>
					<tr class="text-c">
						<th width="100">系别</th>
						<th width="50">姓名</th>
						<th width="50">账号</th>
						<th width="50">密码</th>
						<th width="100">操作</th>
					</tr>
				</thead>
				<%
					for (Iterator<TeacherInfo> it = teacher.iterator(); it.hasNext();) {
						TeacherInfo t = it.next();
				%>
				<tbody>
					<tr class="text-c">
						<td><%=t.getDept_name()%></td>
						<td><%=t.getTname()%></td>
						<td><%=t.getTid()%></td>
						<td><%=t.getPassword()%></td>
						<td class="td-manage"><a title="编辑"
							href="teacher-update.jsp?tid=<%=t.getTid()%>&Dept_name=<%=t.getDept_name()%>"
							class="ml-5" style="text-decoration:none"><i
								class="Hui-iconfont">&#xe6df;</i> </a> 
						</td>
					</tr>
				</tbody>

				<%
					}
				%>
			</table>
		</div>
		<center id="page">
				<input class="btn btn-primary radius" type="button"
					value="&nbsp;&nbsp;返回&nbsp;&nbsp;"
					onclick="window.history.back(-1)">
			</center>
	</div>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/layer.js"></script>
	<script type="text/javascript" src="js/laypage.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
	<script type="text/javascript" src="js/index.admin.js"></script>
</body>
</html>
