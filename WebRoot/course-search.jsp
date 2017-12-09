<%@page import="cn.ems.dao.impl.CourseDaoIpml"%>
<%@page import="cn.ems.domain.CourseInfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
	String keyword = request.getParameter("query");
	if(keyword == null){
		keyword = request.getParameter("keyword");
	}
	final int PAGE_SIZE = 12;
	int pageNo = request.getParameter("pageno") == null?1:Integer.parseInt(request.getParameter("pageno"));
	int Records = CourseDaoIpml.getCountBykw(keyword);//条件查询总数据条数
	int Pagecount = Records%PAGE_SIZE==0?(Records/PAGE_SIZE):(Records/PAGE_SIZE+1);//总页码数
	List<CourseInfo> courseInfos = CourseDaoIpml.findCourseBykw(keyword, pageNo, PAGE_SIZE);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/min.css" />
<link rel="stylesheet" type="text/css" href="css/admin.css" />
<link rel="stylesheet" type="text/css" href="css/iconfont.css" />
<link rel="stylesheet" type="text/css" href="css/icheck.css" />
<link rel="stylesheet" type="text/css" href="skin/default/skin.css"
	id="skin" />
<title>课程信息</title>
</head>

<body>
	<nav class="breadcrumb">
	<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
	课程管理 <span class="c-gray en">&gt;</span> 课程信息 <a
		class="btn btn-success radius r"
		style="line-height:1.6em;margin-top:3px"
		href="javascript:location.replace(location.href);" title="刷新"><i
		class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="page-container">
		<div class="text-c">
			<h4>查 询 结 果</h4>
		</div>
		<input class="btn btn-primary radius" type="button"
			value="&nbsp;&nbsp;返回&nbsp;&nbsp;"
			onclick="window.location.href='course.jsp'">
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
						<th>操作</th>
					</tr>
				</thead>
				<%
					for(Iterator<CourseInfo> iter = courseInfos.iterator();iter.hasNext();){
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
						<td><a title="编辑"
							href="course-update.jsp?c_id=<%=courseInfo.getCid()%>
				&cour_name=<%=courseInfo.getCour_name()%>&credits=<%=courseInfo.getCredits()%>
				&tname=<%=courseInfo.getSpecname()%>&specname=<%=courseInfo.getSpecname()%>
				&schoolyear=<%=courseInfo.getSchoolyear()%>&semester=<%=courseInfo.getSemester()%>"
							class="ml-5" style="text-decoration:none"><i
								class="Hui-iconfont">&#xe6df;</i></a> <a title="删除"
							href="CourseDelete?c_id=<%=courseInfo.getCid()%>" class="ml-5"
							style="text-decoration:none" onclick="return del()"><i
								class="Hui-iconfont">&#xe6e2;</i> </a></td>
					</tr>
				</tbody>
				<%
					}
				%>
			</table>
			<script type="text/javascript" language="javaScript">
				function del() {
					if (confirm("是否确定要删除该条记录？")) {
						return true;
					}
					return false;
				}
			</script>
			<center id="page">
				<center id="page">
					第<%=pageNo%>页 &nbsp;共<%=Pagecount%>页 &nbsp;
					<%
						if (pageNo > 1) {
					%>
					<a
						href="course-search.jsp?pageno=<%=pageNo - 1%>&keyword=<%=keyword%>"><font
						color="blue">&lt;上一页</font></a> &nbsp;
					<%
						}
						if (Pagecount >= 5) {
							if (pageNo != 1) {
					%>
					<a href="course-search.jsp?pageno=<%=1%>&keyword=<%=keyword%>"><font
						color="blue">&lt;首页&gt;</font></a> &nbsp;
					<%
						}
							if (pageNo != Pagecount) {
					%>
					<a
						href="course-search.jsp?pageno=<%=Pagecount%>&keyword=<%=keyword%>"><font
						color="blue">&lt;尾页&gt;</font></a> &nbsp;
					<%
						}
						}
						if (pageNo < Pagecount) {
					%>
					<a
						href="course-search.jsp?pageno=<%=pageNo + 1%>&keyword=<%=keyword%>"><font
						color="blue">下一页&gt;</font></a>
					<%
						}
					%>
				</center>
			</center>
		</div>
	</div>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/layer.js"></script>
	<script type="text/javascript" src="js/laypage.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
	<script type="text/javascript" src="js/index.admin.js"></script>
</body>
</html>
