<%@page import="cn.ems.domain.Classes"%>
<%@page import="cn.ems.domain.Student"%>
<%@page import="cn.ems.dao.impl.StudentDaoImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*,cn.ems.dao.impl.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String Student_id = request.getParameter("Student_id");
	Student s = StudentDaoImpl.loadBystudent_id(Student_id);
	List<Classes> cs = ClassDaoImpl.getClasses();
	
	String action = request.getParameter("action");
	if (action != null && action.trim().equals("update")) {
		String student_id = request.getParameter("student_id");
		String student_name = request.getParameter("student_name");
		String sex = request.getParameter("sex");
		String nation = request.getParameter("nation");
		String birthday = request.getParameter("birthday");
		String id_card = request.getParameter("id_card");
		String classid = request.getParameter("classid");
		String admission_date = request.getParameter("admission_date");
		String study_length = request.getParameter("study_length");
		String old_id = request.getParameter("old_id");
		String grade = request.getParameter("grade");
			
		s = new Student();
		s.setOld_id(old_id);
		s.setStudent_id(student_id);
		s.setStudent_name(student_name);
		s.setSex(sex);
		s.setBirthday(birthday);
		s.setAdmission_date(admission_date);
		s.setClassid(classid);
		s.setId_card(id_card);
		s.setNation(nation);
		s.setStudy_length(study_length);
		s.setGrade(Integer.parseInt(grade));
		boolean result = StudentDaoImpl.updateStudent(s);
		if(result){
			request.setAttribute("msg", "修改成功");
			request.getRequestDispatcher("student.jsp").forward(request, response);
		}else{
			request.setAttribute("msg", "修改失败");
			request.getRequestDispatcher("student.jsp").forward(request, response);
		}
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
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
	<style type="text/css">
			.input-text{width: 400px;}
	</style>
<title>修改信息</title>
</head>
<body>
	<article class="page-container">
	<form class="form form-horizontal"  method="post"
		action="student-update.jsp?old_id=<%=s.getStudent_id()%>">
		<input type="hidden" name="action" value="update">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>学号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="student_id" 
					value="<%=s.getStudent_id()%>">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>班级：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select class="select" size="1" name="classid"  style="width: 400 ;height: 30px;">
					<%
					for (Iterator<Classes> it = cs.iterator(); it.hasNext();) {
						Classes classes = it.next();
					%>
					<option value=<%=classes.getClassid()%>
						<%if (classes.getClass_name().equals(request.getParameter("Class_name"))) {%>selected <%}%>>
						<%=classes.getClass_name()%>
					</option>
					<%
						}
					%>
				</select>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>姓名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" autocomplete="off"
					name="student_name" value="<%=s.getStudent_name()%>">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>性别：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<select class="select" size="1" name="sex"  style="width: 400 ;height: 30px;">
					<option value="男" <%if(s.getSex().equals("男")){%>selected<%}%> >男</option>
					<option value="女" <%if(s.getSex().equals("女")){%>selected<%}%> >女</option>
				</select>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>民族：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="nation"
					value="<%=s.getNation()%>">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>出生日期：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" name="birthday"
						onfocus="WdatePicker({Date:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})"
						id="birthday" class="input-text Wdate" style="width:120px;"
						onblur="checkBirthday()" value="<%=s.getBirthday()%>">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">身份证号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder=""
					name="id_card" value="<%=s.getId_card()%>">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">入学日期：</label>
			<div class="formControls col-xs-8 col-sm-9">
					<input type="text"
						onfocus="WdatePicker({Date:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})"
						id="admission_date" class="input-text Wdate" style="width:120px;"
						name="admission_date" onblur="checkAdmissionDate()" value="<%=s.getAdmission_date()%>">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">学制：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder=""
					name="study_length" value="<%=s.getStudy_length()%>">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">当前所在级：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select class="select" size="1" name="grade"  style="width: 400 ;height: 30px;">
					<%
						for (int i = 2010; i <= 2100; i++) {
					%>
						<option value="<%=i%>" <%if(s.getGrade() == i){%>selected<%}%>><%=i%></option>
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