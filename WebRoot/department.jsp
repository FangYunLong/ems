<%@page import="cn.ems.dao.impl.DepartmentDaoImpl"%>
<%@page import="cn.ems.domain.DeptInfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<%
	int PAGE_SIZE = 10;
	int pageNo = request.getParameter("pageno") == null?1:Integer.parseInt(request.getParameter("pageno"));
	int Records = DepartmentDaoImpl.getCount();//总数据条数
	int Pagecount = Records%PAGE_SIZE==0?(Records/PAGE_SIZE):(Records/PAGE_SIZE+1);//总页码数
	List<DeptInfo> dept = DepartmentDaoImpl.getDepartment(pageNo,PAGE_SIZE);
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
<title>系别信息</title>
</head>
<body>
	<div class="page-container">
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
		<div class="text-c">
			<form action="department_search.jsp" method="post">
				<input type="text" class="input-text" style="width:250px"
					placeholder="请输入您想搜索的" id="query" name="query">
				<button type="submit" class="btn btn-success radius" id="" name=""
					onclick="return Conditional()">
					<i class="Hui-iconfont">&#xe665;</i> 查询
				</button>
			</form>
		</div>
		<script type="text/javascript">
		function Conditional(){
			if(document.getElementById("query").value == ""){
				alert("请输入要搜索的内容");
				return false;
			}
		}
	</script>
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
					for (Iterator<DeptInfo> iter = dept.iterator(); iter.hasNext();) {
						DeptInfo department = iter.next();
				%>
				<tbody>
					<tr class="text-c">
						<td><%=department.getDeptid()%></td>
						<td><%=department.getDept_name()%></td>
						<td><%=department.getTname()%></td>
						<td class="td-manage"><a title="编辑"
							href="department_update.jsp?Deptid=<%=department.getDeptid()%>
				&Dept_name=<%=department.getDept_name()%>
				&Tname=<%=department.getTname()%>"
							class="ml-5" style="text-decoration:none"><i
								class="Hui-iconfont">&#xe6df;</i> </a> <a title="删除"
							href="DepartmentDelete?Deptid=<%=department.getDeptid()%>"
							class="ml-5" style="text-decoration:none"><i
								class="Hui-iconfont">&#xe6e2;</i> </a></td>
					</tr>
				</tbody>
				<%
					}
				%>
			</table>
			<center id="page">
			第<%=pageNo %>页 &nbsp;共<%=Pagecount %>页 &nbsp;
		<%
			if(pageNo > 1){
				%>
					<a href="department.jsp?pageno=<%=pageNo - 1%>"><font color="blue">&lt;上一页</font></a>
					&nbsp;
				<%
			}
			if(Pagecount >= 5){
				if(pageNo != 1){
					%>
						<a href="department.jsp?pageno=<%=1%>"><font color="blue">&lt;首页&gt;</font></a>
						&nbsp;
					<%
				}
				if(pageNo != Pagecount){
					%>
						<a href="department.jsp?pageno=<%=Pagecount%>"><font color="blue">&lt;尾页&gt;</font></a>
						&nbsp;
					<%
				}
			}
			if(pageNo < Pagecount){
				%>
					<a href="department.jsp?pageno=<%=pageNo + 1%>"><font color="blue">下一页&gt;</font></a>
				<%
			}
		%>
			</center>

		</div>
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/layer.js"></script>
		<script type="text/javascript" src="js/laypage.js"></script>
		<script type="text/javascript" src="js/index.js"></script>
		<script type="text/javascript" src="js/index.admin.js"></script>
</body>
</html>
