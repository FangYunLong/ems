<%@page import="cn.ems.dao.impl.CourseDaoIpml"%>
<%@page import="cn.ems.domain.Course"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%

String name = request.getParameter("name");
List<Course> list = CourseDaoIpml.getCourseByIDorName(name);
if(list.size() == 0){
	response.getWriter().write("<msg>valid</msg>");
}else if(list.size() > 0){
	response.getWriter().write("<msg>invalid</msg>");
}

response.setContentType("text/xml;");
response.setHeader("Cache-Control", "no-store"); //HTTP1.1
response.setHeader("Pragma", "no-cache"); //HTTP1.0
response.setDateHeader("Expires", 0);
%>
