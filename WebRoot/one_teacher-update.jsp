<%@page import="cn.ems.domain.Department"%>
<%@page import="cn.ems.domain.Teacher"%>
<%@page import="cn.ems.domain.Student"%>
<%@page import="cn.ems.dao.impl.StudentDaoImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*,cn.ems.dao.impl.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String tid = request.getParameter("tid");
	Teacher t = TeacherDaoImpl.loadBytid(tid);
	List<Department> dept = DepartmentDaoImpl.getDepartment();

	String action = request.getParameter("action");
	if (action != null && action.trim().equals("update")) {
		String Tid = request.getParameter("tid");
		String tname = request.getParameter("tname");
		String sex = request.getParameter("sex");
		String phone = request.getParameter("phone");
		String title = request.getParameter("title");
		String depid = request.getParameter("deptid");
		String old_id = request.getParameter("old_id");

		t = new Teacher();
		t.setOld_id(old_id);
		t.setTname(tname);
		t.setTid(Tid);
		t.setSex(sex);
		t.setPhone(phone);
		t.setTitle(title);
		t.setDepid(depid);
		boolean result = TeacherDaoImpl.updateTeacher(t);
		if(result){
			request.setAttribute("msg", "修改成功");
			request.getRequestDispatcher("one_teacher.jsp").forward(request, response);
		}else{
			request.setAttribute("msg", "修改失败");
			request.getRequestDispatcher("one_teacher.jsp").forward(request, response);
		}
		out.print("修改成功");
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
<style type="text/css">
.input-text {
	width: 450px;
}
</style>
<title>修改信息</title>
</head>
<body>
	<article class="page-container">
	<form class="form form-horizontal" method="post"
		action="one_teacher-update.jsp?old_id=<%=t.getTid()%>">
		<input type="hidden" name="action" value="update">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>职工号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="tid"
					value="<%=t.getTid()%>">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>姓名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" autocomplete="off"
					name="tname" value="<%=t.getTname()%>">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>性别：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" autocomplete="off" name="sex"
					value="<%=t.getSex()%>">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>电话：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<input type="text" class="input-text" name="phone"
					value="<%=t.getPhone()%>">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>职称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="title"
					value="<%=t.getTitle()%>">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>所属系别：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select class="select" size="1" name="deptid" style="width: 450; height: 30px;" >
					<%
						for (Iterator<Department> iter = dept.iterator(); iter.hasNext();) {
							Department spec = iter.next();
					%>
					<option value=<%=spec.getDeptid()%>
						<%if (spec.getDept_name().equals(
						request.getParameter("Dept_name"))) {%>
						selected <%}%>>
						<%=spec.getDept_name()%>
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