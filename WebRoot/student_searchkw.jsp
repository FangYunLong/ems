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
						<th width="120">学号号</th>
						<th width="100">姓名</th>
						<th width="120">系别</th>
						<th width="100">专业</th>
						<th width="100">班级</th>
						<th width="50">性别</th>
						<th width="50">民族</th>
						<th width="100">出生日期</th>
						<th width="100">身份证号</th>
						<th width="100">入学日期</th>
						<th width="100">学制</th>
						<th width="100">操作</th>
					</tr>
				</thead>
				<%
					for (Iterator<StudentInfo> it = student.iterator(); it.hasNext();) {
						StudentInfo s = it.next();
				%>
				<tbody>
					<tr class="text-c">
						<td><%=s.getStudent_id()%></td>
						<td><%=s.getStudent_name()%></td>
						<td><%=s.getDept_name()%></td>
						<td><%=s.getSpec_name()%></td>
						<td><%=s.getClass_name()%></td>
						<td><%=s.getSex()%></td>
						<td><%=s.getNation()%></td>
						<td><%=s.getBirthday()%></td>
						<td><%=s.getId_card()%></td>
						<td><%=s.getAdmission_date()%></td>
						<td><%=s.getStudy_length()%></td>
						<td class="td-manage"><a title="编辑"
							href="student-update.jsp?Student_id=<%=s.getStudent_id()%>"
							class="ml-5" style="text-decoration:none"><i
								class="Hui-iconfont">&#xe6df;</i> </a> <a title="删除"
							href="studentDelete.jsp?Student_id=<%=s.getStudent_id()%>"
							class="ml-5" style="text-decoration:none"><i
								class="Hui-iconfont">&#xe6e2;</i> </a></td>
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
