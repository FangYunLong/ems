<%@page import="cn.ems.dao.impl.StudentDaoImpl"%>
<%@page import="cn.ems.domain.StudentInfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String keyword = request.getParameter("keyword");
	if(keyword != null){
		keyword.toUpperCase();
	}
	List<StudentInfo> student = StudentDaoImpl.findStudentBykw(keyword);
	
	if(student.size() == 0){
		response.getWriter().write("<msg>valid</msg>");
	} else if(student.size() > 0){
		response.getWriter().write("<msg>invalid</msg>");
	}

	response.setContentType("text/xml;");
	response.setHeader("Cache-Control", "no-store"); //HTTP1.1
	response.setHeader("Pragma", "no-cache"); //HTTP1.0
	response.setDateHeader("Expires", 0);
%>
