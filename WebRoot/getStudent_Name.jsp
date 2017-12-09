<%@page import="cn.ems.dao.impl.ScoreInfoDaoImpl"%>
<%@ page language="java" import="java.util.*,cn.ems.domain.*" pageEncoding="UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	
	Student student = ScoreInfoDaoImpl.getStudent_Name(id);
	StringBuffer spBuf = new StringBuffer();
	
	
	spBuf.append("document.frm.student_name.value='"+ student.getStudent_name()+"';\n");
	
	response.setContentType("text/html;charset=utf-8");
	response.setHeader("Cache-Control", "no-store"); //HTTP1.1
	response.setHeader("Pragma", "no-cache"); //HTTP1.0
	response.setDateHeader("Expires", 0);
	
	response.getWriter().write(spBuf.toString());
%>