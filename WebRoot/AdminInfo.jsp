<%@page import="cn.ems.dao.impl.AdminDaoIpml"%>
<%@page import="cn.ems.domain.Admin"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>管理员账号信息</title>
<link rel="stylesheet" type="text/css" href="css/min.css" />
<link rel="stylesheet" type="text/css" href="css/admin.css" />
<link rel="stylesheet" type="text/css" href="css/iconfont.css" />
<link rel="stylesheet" type="text/css" href="css/icheck.css" />
<link rel="stylesheet" type="text/css" href="skin/default/skin.css"
	id="skin" />
</head>

<body>
	<nav class="breadcrumb">
	<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
	账号管理 <span class="c-gray en">&gt;</span> 管理员账号信息 <a
		class="btn btn-success radius r"
		style="line-height:1.6em;margin-top:3px"
		href="javascript:location.replace(location.href);" title="刷新"><i
		class="Hui-iconfont">&#xe68f;</i></a></nav>
	<table class="table table-border table-bordered table-hover table-bg table-sort"  
		style="width: 800;margin-top: 10px" align="center">
		<thead>
			<tr class="text-c">
				<th>用户名</th>
				<th>密码</th>
				<th>操作</th>
			</tr>
		</thead>
		<%
			List<Admin> list = AdminDaoIpml.getAdminByUsername(session.getAttribute("admin_username").toString());
			Admin admin = list.get(0);
		%>
		<tbody>
			<tr class="text-c">
				<td><%=admin.getUsername()%></td>
				<td><%=admin.getPassword()%></td>
				<td><a title="编辑" href="admin-update.jsp?username=<%=admin.getUsername()%>&password=<%=admin.getPassword()%>" class="ml-5"
				style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> </td>
			</tr>
		</tbody>
		<%
		%>
	</table>
</body>
</html>
