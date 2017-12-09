<%@page import="cn.ems.dao.impl.StudentDaoImpl"%>
<%@page import="cn.ems.domain.StudentInfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="cn.ems.domain.*"%>
<%@ page import="java.sql.*,  cn.ems.dao.impl.*"%>

<%
	String keyword = request.getParameter("keyword");

	List<StudentInfo> student = StudentDaoImpl.findStudentBykw(keyword);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/admin.css" />
<link rel="stylesheet" type="text/css" href="css/iconfont.css" />
<link rel="stylesheet" type="text/css" href="css/min.css" />

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
						<th width="100">班级</th>
						<th width="100">姓名</th>
						<th width="110">账号</th>
						<th width="120">密码</th>
						<th width="100">操作</th>
					</tr>
				</thead>
				<%
					for (Iterator<StudentInfo> it = student.iterator(); it.hasNext();) {
						StudentInfo s = it.next();
				%>
				<tbody>
					<tr class="text-c">
						<td><%=s.getClass_name()%></td>
						<td><%=s.getStudent_name()%></td>
						<td><%=s.getStudent_id()%></td>
						<td><%=s.getPassword()%></td>
						<td class="td-manage"><a title="编辑"
							href="student_login-update.jsp?Student_id=<%=s.getStudent_id()%>"
							class="ml-5" style="text-decoration:none"><i
								class="Hui-iconfont">&#xe6df;</i> </a> </td>
					</tr>
				</tbody>

				<%
					}
				%>
			</table>
		</div>
		<center id="page">
			<input class="btn btn-primary radius" type="button"
				value="&nbsp;&nbsp;返回&nbsp;&nbsp;" onclick="window.history.back(-1)">
		</center>
	</div>
</body>

</html>
