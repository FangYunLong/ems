<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="cn.ems.dao.impl.*" %>
<%
	String tid = request.getParameter("tid");
	TeacherDaoImpl.deleteTeacher(tid);
    response.setHeader("Refresh","3;URL=/ems/teacher.jsp");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>删除老师</title>
    	
  </head>
  
  <body>
	删除成功！3秒后自动返回<br>
    若未跳转，请点击<a href="teacher.jsp">这里！</a>
  </body>
  
</html>
