<%@page import="cn.ems.dao.impl.DepartmentDaoImpl"%>
<%@page import="cn.ems.domain.DeptInfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String keyword = request.getParameter("query");
	List<DeptInfo> department = DepartmentDaoImpl.findDepartmentBykw(keyword);
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
<title>查询结果</title>
</head>
<body>

	<div class="page-container">
		<script type="text/javascript">
			setTimeout("document.getElementById('msg').style.display='none'",
					2000);
		</script>
		<div class="text-c">
			<h4>查 询 结 果</h4>
		</div>
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-hover table-bg table-sort">
				<thead>
					<tr class="text-c">
						<th>系别编号</th>
						<th>系别名称</th>
						<th>系主任</th>
						<th>操作</th>
					</tr>
				</thead>
				<%
					for(Iterator<DeptInfo> iter = department.iterator();iter.hasNext();){
								DeptInfo dept = iter.next();
				%>
				<tbody>
					<tr class="text-c">
						<td><%=dept.getDeptid()%></td>
						<td><%=dept.getDept_name()%></td>
						<td><%=dept.getTname()%></td>
						<td class="td-manage"><a title="编辑"
							href="department_update.jsp?Deptid=<%=dept.getDeptid()%>
				&Dept_name=<%=dept.getDept_name()%>
				&Tname=<%=dept.getTname()%>"
							class="ml-5" style="text-decoration:none"><i
								class="Hui-iconfont">&#xe6df;</i>
						</a> <a title="删除"
							href="DepartmentDelete?Deptid=<%=dept.getDeptid()%>"
							class="ml-5" style="text-decoration:none"><i
								class="Hui-iconfont">&#xe6e2;</i> </a>
						</td>
					</tr>
				</tbody>
				<%
					}
				%>
			</table>
			<center id="page">
				<input class="btn btn-primary radius" type="button"
					value="&nbsp;&nbsp;返回&nbsp;&nbsp;"
					onclick="window.history.back(-1)">
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
