<%@page import="cn.ems.dao.impl.CourseDaoIpml"%>
<%@page import="cn.ems.domain.CourseInfo"%>
<%@page import="cn.ems.dao.impl.StudentDaoImpl"%>
<%@page import="cn.ems.domain.StudentInfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	List<StudentInfo> list = StudentDaoImpl.getStudentInfoById(session.getAttribute("stu_username").toString());
	StudentInfo student = list.get(0);
	int PAGE_SIZE = 10;
	int pageNo = request.getParameter("pageno") == null?1:Integer.parseInt(request.getParameter("pageno"));
	int Records = CourseDaoIpml.getCount(student.getSpec_name());//总数据条数
	int Pagecount = Records%PAGE_SIZE==0?(Records/PAGE_SIZE):(Records/PAGE_SIZE+1);//总页码数
%>
<html>
  <head>
    <title>课程表</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/min.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/admin.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/icheck.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/skin/default/skin.css" id="skin" />
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
			<form action="Currivulum-search.jsp" method="post">
				<input type="text" class="input-text" style="width:250px"
					placeholder="输入要搜索的内容" id="" name="query">
				<button type="submit" class="btn btn-success radius" id="" name="">
					<i class="Hui-iconfont">&#xe665;</i> 搜课程
				</button>
			</form>
		</div>
		<div class="mt-20">
			<table class="table table-border table-bordered table-bg"
				style="margin-top: 10px">
				<thead>
					<tr class="text-c">
						<th style="font-size: 13px" colspan="8">学号：<%=student.getStudent_id()%>&nbsp;&nbsp;&nbsp;&nbsp;姓名：<%=student.getStudent_name()%>
							&nbsp;&nbsp;&nbsp;学院：<%=student.getDept_name()%>&nbsp;&nbsp;&nbsp;专业：<%=student.getSpec_name()%>&nbsp;&nbsp;&nbsp;行政班：<%=student.getClass_name()%></th>
					</tr>
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
					List<CourseInfo> info = CourseDaoIpml.getCourseInfoBySpecName(
							student.getSpec_name(), pageNo, PAGE_SIZE);
					for (Iterator<CourseInfo> iter = info.iterator(); iter.hasNext();) {
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
			<center id="page">
				第<%=pageNo%>页 &nbsp;共<%=Pagecount%>页 &nbsp;
				<%
					if (pageNo > 1) {
				%>
				<a href="Curriculum.jsp?pageno=<%=pageNo - 1%>"><font color="blue">&lt;上一页</font></a>
				&nbsp;
				<%
					}
					if (Pagecount >= 5) {
						if (pageNo != 1) {
				%>
				<a href="Curriculum.jsp?pageno=<%=1%>"><font color="blue">&lt;首页&gt;</font></a>
				&nbsp;
				<%
					}
						if (pageNo != Pagecount) {
				%>
				<a href="Curriculum.jsp?pageno=<%=Pagecount%>"><font color="blue">&lt;尾页&gt;</font></a>
				&nbsp;
				<%
					}
					}
					if (pageNo < Pagecount) {
				%>
				<a href="Curriculum.jsp?pageno=<%=pageNo + 1%>"><font color="blue">下一页&gt;</font></a>
				<%
					}
				%>
			</center>
		</div>
	</div>
</body>
</html>
