<%@page import="cn.ems.dao.impl.ClassDaoImpl"%>
<%@ page language="java" import="java.util.* , cn.ems.domain.*" pageEncoding="UTF-8" %>
<%
	String id = request.getParameter("id").toUpperCase();
	String specname = session.getAttribute("SpecnameAjax").toString();
	List<Speciality> specinfos = ClassDaoImpl.getSpec(id);
	StringBuffer specBuf = new StringBuffer();
	specBuf.append("document.frm.specid.length = " + (specinfos.size())
			+ ";\n");
	for (int i = 0; i < specinfos.size(); i++) {
		Speciality spec = specinfos.get(i);
		if (spec.getSpec_name().equals(specname)) {
			specBuf.append("document.frm.specid.options[" + i
					+ "].value = '" + spec.getSpecid() + "';\n");
			specBuf.append("document.frm.specid.options[" + i
					+ "].text = '" + spec.getSpec_name() + "';\n");
			specBuf.append("document.frm.specid.options[" + i
					+ "].selected = true;\n");
		} else {
			specBuf.append("document.frm.specid.options[" + i
					+ "].value = '" + spec.getSpecid() + "';\n");
			specBuf.append("document.frm.specid.options[" + i
					+ "].text = '" + spec.getSpec_name() + "';\n");
		}
	}

	String tname = session.getAttribute("TnameAjax").toString();
	List<Teacher> teList = ClassDaoImpl.getTeacher(id);
	StringBuffer teBuf = new StringBuffer();
	teBuf.append("document.frm.tid.length = " + (teList.size())
			+ ";\n");
	for (int i = 0; i < teList.size(); i++) {
		Teacher teach = teList.get(i);
		if (teach.getTname().equals(tname)) {
			teBuf.append("document.frm.tid.options[" + i
					+ "].value = '" + teach.getTid() + "';\n");
			teBuf.append("document.frm.tid.options[" + i
					+ "].text = '" + teach.getTname() + "';\n");
			teBuf.append("document.frm.tid.options[" + i
					+ "].selected = true;\n");
		} else {
			teBuf.append("document.frm.tid.options[" + i
					+ "].value = '" + teach.getTid() + "';\n");
			teBuf.append("document.frm.tid.options[" + i
					+ "].text = '" + teach.getTname() + "';\n");
		}
	}
	
	response.setContentType("text/html;charset=utf-8");
	response.setHeader("Cache-Control", "no-store"); //HTTP1.1
	response.setHeader("Pragma", "no-cache"); //HTTP1.0
	response.setDateHeader("Expires", 0);
	
	response.getWriter().write(specBuf.toString());
	response.getWriter().write(teBuf.toString());
%>
