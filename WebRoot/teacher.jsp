<%@page import="cn.ems.domain.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,  cn.ems.dao.impl.*"%>

<%
	int PAGE_SIZE = 10;
	int pageNo = request.getParameter("pageno") == null?1:Integer.parseInt(request.getParameter("pageno"));
	int Records = TeacherDaoImpl.getCount();//总数据条数
	int Pagecount = Records%PAGE_SIZE==0?(Records/PAGE_SIZE):(Records/PAGE_SIZE+1);//总页码数
	List<TeacherInfo> teacher =TeacherDaoImpl.getTeacher(pageNo, PAGE_SIZE);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" type="text/css" href="css/min.css" />
<link rel="stylesheet" type="text/css" href="css/admin.css" />
<link rel="stylesheet" type="text/css" href="css/iconfont.css" />
<link rel="stylesheet" type="text/css" href="css/icheck.css" />
<link rel="stylesheet" type="text/css" href="skin/default/skin.css"
	id="skin" />
<title>教师信息</title>
</head>
<body>
	<div id="msg">
		<%
			if(request.getAttribute("msg") != null){
				out.print(request.getAttribute("msg"));
			}
		%>
	</div>
	<script type="text/javascript">
		setTimeout("document.getElementById('msg').style.display='none'", 2000);
	</script>
	<script type="text/javascript">
		function Conditional(){
			if(document.getElementById("query").value == ""){
				alert("请输入要搜索的内容");
				return false;
			}
		}
	</script>
	<div class="page-container">
		<div class="text-c">
			<form class="form form-horizontal" id="form-good-add" method="post"
				action="teacher_searchkw.jsp">
				<input type="hidden" name="action" value="search"> <input
					type="text" class="input-text" style="width:300px"
					placeholder="输入您想搜索的" id="query" name="keyword">
				<button type="submit" class="btn btn-success radius" id="query"
					name="" onclick="return Conditional()">
					<i class="Hui-iconfont">&#xe665;</i> 查询
				</button>
			</form>
		</div>
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-hover table-bg table-sort">
				<thead>
					<tr class="text-c">
						<th>职工号</th>
						<th>姓名</th>
						<th>性别</th>
						<th>电话</th>
						<th>职称</th>
						<th>系别</th>
						<th>操作</th>
					</tr>
				</thead>
				<%
					for (Iterator<TeacherInfo> it = teacher.iterator(); it.hasNext();) {
						TeacherInfo t = it.next();
				%>
				<tbody>
					<tr class="text-c">
						<td><%=t.getTid()%></td>
						<td><%=t.getTname()%></td>
						<td><%=t.getSex()%></td>
						<td><%=t.getPhone()%></td>
						<td><%=t.getTitle()%></td>
						<td><%=t.getDept_name()%></td>
						<td class="td-manage"><a title="编辑"
							href="teacher-update.jsp?tid=<%=t.getTid()%>&Dept_name=<%=t.getDept_name()%>"
							class="ml-5" style="text-decoration:none"><i
								class="Hui-iconfont">&#xe6df;</i> </a> <a title="删除"
							href="teacherDelete.jsp?tid=<%=t.getTid()%>" class="ml-5"
							style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i>
						</a>
						</td>
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
				<a href="teacher.jsp?pageno=<%=pageNo - 1%>"><font color="blue">&lt;上一页</font>
				</a> &nbsp;
				<%
					}
					if (Pagecount >= 5) {
						if (pageNo != 1) {
				%>
				<a href="teacher.jsp?pageno=<%=1%>"><font color="blue">&lt;首页&gt;</font>
				</a> &nbsp;
				<%
					}
						if (pageNo != Pagecount) {
				%>
				<a href="teacher.jsp?pageno=<%=Pagecount%>"><font color="blue">&lt;尾页&gt;</font>
				</a> &nbsp;
				<%
					}
					}
					if (pageNo < Pagecount) {
				%>
				<a href="teacher.jsp?pageno=<%=pageNo + 1%>"><font color="blue">下一页&gt;</font>
				</a>
				<%
					}
				%>
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
