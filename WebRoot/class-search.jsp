<%@page import="cn.ems.domain.ClassInfo"%>
<%@page import="cn.ems.dao.impl.ClassDaoImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
	String keyword = request.getParameter("query");
	if(keyword == null){
		keyword = request.getParameter("keyword");
	}
	final int PAGE_SIZE = 12;
	int pageNo = request.getParameter("pageno") == null?1:Integer.parseInt(request.getParameter("pageno"));
	int Records = ClassDaoImpl.getCountBykw(keyword);//条件查询总数据条数
	int Pagecount = Records%PAGE_SIZE==0?(Records/PAGE_SIZE):(Records/PAGE_SIZE+1);//总页码数
	List<ClassInfo> classInfos =ClassDaoImpl.findClassBykw(keyword, pageNo, PAGE_SIZE);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="css/min.css" />
<link rel="stylesheet" type="text/css" href="css/admin.css" />
<link rel="stylesheet" type="text/css" href="css/iconfont.css" />
<link rel="stylesheet" type="text/css" href="css/icheck.css" />
<link rel="stylesheet" type="text/css" href="skin/default/skin.css" id="skin" />
<title>班级信息</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 班级管理 <span class="c-gray en">&gt;</span> 班级信息 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c">
		<h4>查 询 结 果</h4>
	</div>
	<input class="btn btn-primary radius" type="button" 
			value="&nbsp;&nbsp;返回&nbsp;&nbsp;" onclick="window.location.href='class.jsp'">
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="80">班级编号</th>
				<th width="100">班级名称</th>
				<th width="150">所属系别</th>
				<th width="90">所属专业</th>
				<th width="40">班主任</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<%
			for(Iterator<ClassInfo> iter = classInfos.iterator();iter.hasNext();){
				ClassInfo classInfo = iter.next();
		%>
		<tbody>
			<tr class="text-c">
				<td><%=classInfo.getClassid()%></td>
				<td><%=classInfo.getClass_name()%></td>
				<td><%=classInfo.getDept_name()%></td>
				<td><%=classInfo.getSpec_name()%></td>
				<td><%=classInfo.getTname()%></td>
				<td class="td-manage">
				<a title="编辑" href="class-update.jsp?Classid=<%=classInfo.getClassid()%>&Class_name=<%=classInfo.getClass_name()%>&Tname=<%=classInfo.getTname()%>&Spec_name=<%=classInfo.getSpec_name()%>&Dept_name=<%=classInfo.getDept_name()%>" class="ml-5"
				style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>  
				<a title="删除" href="ClassDelete?class_id=<%=classInfo.getClassid()%>"
				class="ml-5" style="text-decoration:none" onclick="return del()"><i class="Hui-iconfont">&#xe6e2;</i> </a></td>
			</tr>
		</tbody>
		<%
			}
		%>
	</table>
	<script type="text/javascript" language="javaScript">
		function del(){
			 if(confirm("是否确定要删除该条记录？")){
				 return true;
			 } 
			 return false;
		}
	</script>
	<center id="page">
		第<%=pageNo %>页 &nbsp;共<%=Pagecount %>页 &nbsp;
		<%
			if(pageNo > 1){
				%>
					<a href="class-search.jsp?pageno=<%=pageNo - 1%>&keyword=<%=keyword%>"><font color="blue">&lt;上一页</font></a>
					&nbsp;
				<%
			}
			if(Pagecount >= 5){
				if(pageNo != 1){
					%>
						<a href="class-search.jsp?pageno=<%=1%>&keyword=<%=keyword%>"><font color="blue">&lt;首页&gt;</font></a>
						&nbsp;
					<%
				}
				if(pageNo != Pagecount){
					%>
						<a href="class-search.jsp?pageno=<%=Pagecount%>&keyword=<%=keyword%>"><font color="blue">&lt;尾页&gt;</font></a>
						&nbsp;
					<%
				}
			}
			if(pageNo < Pagecount){
				%>
					<a href="class-search.jsp?pageno=<%=pageNo + 1%>&keyword=<%=keyword%>"><font color="blue">下一页&gt;</font></a>
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
