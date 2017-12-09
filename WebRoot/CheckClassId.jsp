<%@page import="cn.ems.dao.impl.ClassDaoImpl"%>
<%@page import="cn.ems.domain.Class"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	response.setContentType("text/xml;");
	response.setHeader("Cache-Control", "no-store"); //HTTP1.1
	response.setHeader("Pragma", "no-cache"); //HTTP1.0
	response.setDateHeader("Expires", 0);
	
	String id = request.getParameter("id");
	if(id != null){
		id.toUpperCase();
	}
	List<Class> classeId = ClassDaoImpl.getClassByIdOrName(id);
	if(classeId.size() == 0){
		response.getWriter().write("<msg>valid</msg>");
	} else if(classeId.size() > 0){
		response.getWriter().write("<msg>invalid</msg>");
	}
%>

