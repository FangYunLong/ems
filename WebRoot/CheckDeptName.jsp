<%@page import="cn.ems.dao.impl.DepartmentDaoImpl"%>
<%@page import="cn.ems.domain.DeptInfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String keyword = request.getParameter("keyword");
	if (keyword != null) {
		keyword.toUpperCase();
	}
	System.out.print(keyword);
	List<DeptInfo> d = DepartmentDaoImpl.findDepartmentBykw(keyword);
	if (d.size() == 0) {
		response.getWriter().write("<msg>valid</msg>");
	} else if (d.size() > 0) {
		response.getWriter().write("<msg>invalid</msg>");
	}

	response.setContentType("text/xml;");
	response.setHeader("Cache-Control", "no-store"); //HTTP1.1
	response.setHeader("Pragma", "no-cache"); //HTTP1.0
	response.setDateHeader("Expires", 0);
%>
