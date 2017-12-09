<%@page import="cn.ems.dao.impl.ScoreDaoImpl"%>
<%@page import="cn.ems.domain.ScoreInfo"%>
<%@page import="cn.ems.dao.impl.StudentDaoImpl"%>
<%@page import="cn.ems.domain.StudentInfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	List<StudentInfo> list = StudentDaoImpl.getStudentInfoById(session.getAttribute("stu_username").toString());
	StudentInfo student = list.get(0);
%>
<html>
  <head>
    <title>成绩查询</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/min.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/admin.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/icheck.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/skin/default/skin.css" id="skin" />
  </head>
  
  <body>
    <nav class="breadcrumb"> <i class="Hui-iconfont">&#xe67f;</i> 首页
	<span class="c-gray en">&gt;</span> 信息查询 <span class="c-gray en">&gt;</span>
	成绩查询 <a class="btn btn-success radius r"
		style="line-height:1.6em;margin-top:3px"
		href="javascript:location.replace(location.href);" title="刷新"><i
		class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="page-container">
		<div class="text-c">
			<h4>查 询 结 果</h4>
		</div>
		<input class="btn btn-primary radius" type="button"
			value="&nbsp;&nbsp;返回&nbsp;&nbsp;"
			onclick="window.location.href='results.jsp'">
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-hover table-bg table-sort">
				<thead>
					<tr class="text-c">
						<th style="font-size: 13px" colspan="10">学号：<%=student.getStudent_id()%>&nbsp;&nbsp;&nbsp;&nbsp;姓名：<%=student.getStudent_name()%>
							&nbsp;&nbsp;&nbsp;学院：<%=student.getDept_name()%>&nbsp;&nbsp;&nbsp;专业：<%=student.getSpec_name()%>&nbsp;&nbsp;&nbsp;行政班：<%=student.getClass_name()%></th>
					</tr>
					<tr class="text-c">
						<th>学年</th>
						<th>学期</th>
						<th>课程编号</th>
						<th>课程名称</th>
						<th>学分</th>
						<th>成绩</th>
						<th>补考成绩</th>
						<th>重修成绩</th>
						<th>所属专业</th>
						<th>所属系别</th>
					</tr>
				</thead>
				<%
					String keyword = request.getParameter("query");
					List<ScoreInfo> scoreInfos = ScoreDaoImpl.findScoreBykw(keyword , student.getStudent_id());
					for (Iterator<ScoreInfo> iter = scoreInfos.iterator(); iter.hasNext();) {
						ScoreInfo score = iter.next();
				%>
				<tbody>
					<tr class="text-c">
						<td><%=score.getSchoolyear()%></td>
						<td><%=score.getSemester()%></td>
						<td><%=score.getCid()%></td>
						<td><%=score.getCour_name()%></td>
						<td><%=score.getCredits()%></td>
						<td><%=score.getScore()%></td>
						<%
							if (score.getRetestScore() == null) {
						%>
						<td></td>
						<%
							} else {
						%>
						<td><%=score.getRetestScore()%></td>
						<%
							}
						%>
						<%
							if (score.getRepeatScore() == null) {
						%>
						<td></td>
						<%
							} else {
						%>
						<td><%=score.getRepeatScore()%></td>
						<%
							}
						%>
						<td><%=score.getSpec_name()%></td>
						<td><%=score.getDept_name()%></td>
					</tr>
				</tbody>
				<%
					}
				%>
			</table>
		</div>
	</div>
  </body>
</html>
