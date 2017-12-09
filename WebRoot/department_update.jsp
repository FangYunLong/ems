<%@page import="cn.ems.dao.impl.TeacherDaoImpl"%>
<%@page import="cn.ems.domain.Teacher"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	List<Teacher> teacher = TeacherDaoImpl.getTeacher();
	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="Bookmark" href="/favicon.ico">
<link rel="Shortcut Icon" href="/favicon.ico" />
<link rel="stylesheet" type="text/css" href="css/min.css" />
<link rel="stylesheet" type="text/css" href="css/admin.css" />
<title>修改信息</title>
</head>

<body>
	<article class="page-container">
	<form class="form form-horizontal" method="post"
		action="DepartmentUpdate">
		<input type="hidden" name="Deptid"
			value="<%=request.getParameter("Deptid")%>">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>系别编号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="Dept_id"
					value="<%=request.getParameter("Deptid")%>" style="width: 450">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>专业名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" autocomplete="off"
					name="Dept_name" value="<%=request.getParameter("Dept_name")%>"
					style="width: 450">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>系主任：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select class="select" size="1" name="Tname"
					style="width: 450;height: 30px">
					<%
						for (Iterator<Teacher> iter = teacher.iterator(); iter.hasNext();) {
							Teacher t = iter.next();
					%>
					<option value=<%=t.getTid()%>
						<%if (t.getTname().equals(
						request.getParameter("Tname"))) {%>
						selected <%}%>>
						<%=t.getTname()%>
					</option>
					<%
						}
					%>
				</select>
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
</body>
</html>
