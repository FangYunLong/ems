<%@page import="cn.ems.dao.impl.ClassDaoImpl"%>
<%@ page language="java" import="java.util.*,cn.ems.domain.*" pageEncoding="UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	
	List<Speciality> sList = ClassDaoImpl.getSpec(id);
	List<Teacher> teList = ClassDaoImpl.getTeacher(id);
	
	StringBuffer spBuf = new StringBuffer();
	StringBuffer teBuf = new StringBuffer();
	
	spBuf.append("document.frm.specid.length="+ (sList.size() + 1) + ";\n");
	spBuf.append("document.frm.specid.options[0].value='-1';\n");
	
	teBuf.append("document.frm.tid.length="+ (teList.size() + 1) + ";\n");
	teBuf.append("document.frm.tid.options[0].value='-1';\n");
	
	if(id.equals("-1")){
		spBuf.append("document.frm.specid.options[0].text='"+ "-----请先选择系别-----" +"';\n");
		spBuf.append("document.frm.specid.selectedIndex = 0;\n");
		teBuf.append("document.frm.tid.options[0].text='"+ "-----请先选择系别-----" +"';\n");
		teBuf.append("document.frm.tid.selectedIndex = 0;\n");
	}else{
		spBuf.append("document.frm.specid.options[0].text='"+ "-----请选择专业-----" +"';\n");
		spBuf.append("document.frm.specid.selectedIndex = 0;\n");
		teBuf.append("document.frm.tid.options[0].text='"+ "-----请选择老师-----" +"';\n");
		teBuf.append("document.frm.tid.selectedIndex = 0;\n");
	}
	
	for(int i = 0; i < sList.size(); i++){
		Speciality spec = sList.get(i);
		spBuf.append("document.frm.specid.options[" + (i+1) + "].value='"+ spec.getSpecid() +"';\n");
		spBuf.append("document.frm.specid.options[" + (i+1) + "].text='"+ spec.getSpec_name() +"';\n");
	}
	
	for(int i = 0; i < teList.size(); i++){
		Teacher teach = teList.get(i);
		teBuf.append("document.frm.tid.options[" + (i+1) + "].value='"+ teach.getTid() +"';\n");
		teBuf.append("document.frm.tid.options[" + (i+1) + "].text='"+ teach.getTname() +"';\n");
	}
	
	response.setContentType("text/html;charset=utf-8");
	response.setHeader("Cache-Control", "no-store"); //HTTP1.1
	response.setHeader("Pragma", "no-cache"); //HTTP1.0
	response.setDateHeader("Expires", 0);
	
	response.getWriter().write(spBuf.toString());
	response.getWriter().write(teBuf.toString());
%>