<%@page import="cn.ems.dao.impl.ScoreInfoDaoImpl"%>
<%@ page language="java" import="java.util.*,cn.ems.domain.*"
	pageEncoding="UTF-8"%>
	<%!int count = 0;  %>
	<%!List<String> list = null; %>
	
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	Course course = ScoreInfoDaoImpl.getspecid(id);

	List<Classes> classes = ScoreInfoDaoImpl.getClassid(course.getSpecid());
	list = new ArrayList<String>();
	for (int i = 0; i < classes.size(); i++) {
		Classes c1 = classes.get(i);
		List<Student> student1 = ScoreInfoDaoImpl.getStudent_id(c1.getClassid());
		
		for (int j = 0; j < student1.size(); j++) {
			Student s =  student1.get(j);
			list.add(j, s.getStudent_id());
			count++;
		}
	}
	
	StringBuffer spBuf = new StringBuffer();

	spBuf.append("document.frm.student_id.length="
			+ (list.size()+1) + ";\n");
	spBuf.append("document.frm.student_id.options[0].value='-1';\n");

	if (id.equals("-1")) {
		spBuf.append("document.frm.student_id.options[0].text='"
				+ "-----请先选择课程-----" + "';\n");
		spBuf.append("document.frm.student_id.selectedIndex = 0;\n");
	} else {
		spBuf.append("document.frm.student_id.options[0].text='"
				+ "-----请选择学号-----" + "';\n");
		spBuf.append("document.frm.student_id.selectedIndex = 0;\n");
	}
	for(int i = 0; i < list.size();i++){
		
		spBuf.append("document.frm.student_id.options[" + (i+ 1)
				+ "].value='" + list.get(i) + "';\n");
		spBuf.append("document.frm.student_id.options[" + (i+ 1)
				+ "].text='" + list.get(i) + "';\n");
	}
	
	response.setContentType("text/html;charset=utf-8");
	response.setHeader("Cache-Control", "no-store"); //HTTP1.1
	response.setHeader("Pragma", "no-cache"); //HTTP1.0
	response.setDateHeader("Expires", 0);

	response.getWriter().write(spBuf.toString());
%>