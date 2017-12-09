<%@page import="cn.ems.dao.impl.TeacherDaoImpl"%>
<%@page import="cn.ems.domain.TeacherInfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String keyword = request.getParameter("keyword");
	if(keyword != null){
		keyword.toUpperCase();
	}
	List<TeacherInfo> t = TeacherDaoImpl.findTeacherBykw(keyword);
	if(t.size() == 0){
		response.getWriter().write("<msg>valid</msg>");
	} else if(t.size() > 0){
		response.getWriter().write("<msg>invalid</msg>");
	}

	response.setContentType("text/xml;");
	response.setHeader("Cache-Control", "no-store"); //HTTP1.1
	response.setHeader("Pragma", "no-cache"); //HTTP1.0
	response.setDateHeader("Expires", 0);
%>
