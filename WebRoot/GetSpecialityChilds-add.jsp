<%@page import="cn.ems.dao.impl.ClassDaoImpl"%>
<%@ page language="java" import="java.util.*,cn.ems.domain.*" pageEncoding="UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	List<Classes> cs = ClassDaoImpl.getClassName(id);
	
	StringBuffer spBuf = new StringBuffer();
	
	spBuf.append("document.frm.classid.length="+ (cs.size() + 1) + ";\n");
	spBuf.append("document.frm.classid.options[0].value='-1';\n");
	
	
	if(id.equals("-1")){
		spBuf.append("document.frm.classid.options[0].text='"+ "-----请先选择专业-----" +"';\n");
		spBuf.append("document.frm.classid.selectedIndex = 0;\n");
	}else{
		spBuf.append("document.frm.classid.options[0].text='"+ "-----请选择班级-----" +"';\n");
		spBuf.append("document.frm.classid.selectedIndex = 0;\n");
	}
	
	for(int i = 0; i < cs.size(); i++){
		Classes classes = cs.get(i);
		spBuf.append("document.frm.classid.options[" + (i+1) + "].value='"+ classes.getClassid() +"';\n");
		spBuf.append("document.frm.classid.options[" + (i+1) + "].text='"+ classes.getClass_name() +"';\n");
	}
	
	
	response.setContentType("text/html;charset=utf-8");
	response.setHeader("Cache-Control", "no-store"); //HTTP1.1
	response.setHeader("Pragma", "no-cache"); //HTTP1.0
	response.setDateHeader("Expires", 0);
	
	response.getWriter().write(spBuf.toString());
%>