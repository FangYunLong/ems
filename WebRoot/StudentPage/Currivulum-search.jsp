<%@page import="cn.ems.dao.impl.CourseDaoIpml"%>
<%@page import="cn.ems.domain.CourseInfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>课程查询</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/admin.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/icheck.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/skin/default/skin.css" id="skin" />
</head>

<body>
	<nav class="breadcrumb"> <i class="Hui-iconfont">&#xe67f;</i> 首页
	<span class="c-gray en">&gt;</span> 信息查询 <span class="c-gray en">&gt;</span>
	课程查询 <a class="btn btn-success radius r"
		style="line-height:1.6em;margin-top:3px"
		href="javascript:location.replace(location.href);" title="刷新"><i
		class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="page-container">
		<div class="text-c">
			<h4>查 询 结 果</h4>
		</div>
		<input class="btn btn-primary radius" type="button"
			value="&nbsp;&nbsp;返回&nbsp;&nbsp;"
			onclick="window.location.href='Curriculum.jsp'">
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-hover table-bg table-sort">
				<thead>
					<tr class="text-c">
						<th>课程编号</th>
						<th>课程名称</th>
						<th>学分</th>
						<th>所属系别</th>
						<th>所属专业</th>
						<th>任课老师</th>
						<th>学年</th>
						<th>学期</th>
					</tr>
				</thead>
				<%
					String keyword = request.getParameter("query");
					List<CourseInfo> courseInfos = CourseDaoIpml
							.findCourseBykw(keyword);
					for (Iterator<CourseInfo> iter = courseInfos.iterator(); iter
							.hasNext();) {
						CourseInfo courseInfo = iter.next();
				%>
				<tbody>
					<tr class="text-c">
						<td><%=courseInfo.getCid()%></td>
						<td><%=courseInfo.getCour_name()%></td>
						<td><%=courseInfo.getCredits()%></td>
						<td><%=courseInfo.getDept_name()%></td>
						<td><%=courseInfo.getSpecname()%></td>
						<td><%=courseInfo.getTname()%></td>
						<td><%=courseInfo.getSchoolyear()%></td>
						<td><%=courseInfo.getSemester()%></td>
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
