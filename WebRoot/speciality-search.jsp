<%@page import="cn.ems.dao.impl.SpecialityDaoImpl"%>
<%@page import="cn.ems.domain.SpecialityInfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
	String keyword = request.getParameter("query");
	if(keyword == null){
		keyword = request.getParameter("keyword");
	}
	final int PAGE_SIZE = 12;
	int pageNo = request.getParameter("pageno") == null?1:Integer.parseInt(request.getParameter("pageno"));
	int Records = SpecialityDaoImpl.getCountBykw(keyword);//条件查询总数据条数
	int Pagecount = Records%PAGE_SIZE==0?(Records/PAGE_SIZE):(Records/PAGE_SIZE+1);//总页码数
	List<SpecialityInfo> speciality = SpecialityDaoImpl.findSpecialityBykw(keyword,pageNo,PAGE_SIZE);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/min.css" />
	<link rel="stylesheet" type="text/css" href="css/admin.css" />
	<link rel="stylesheet" type="text/css" href="css/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="css/icheck.css" />
	<link rel="stylesheet" type="text/css" href="skin/default/skin.css" id="skin" />
	<title>专业信息</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 专业管理 <span class="c-gray en">&gt;</span> 专业信息 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c">
		<h4>查 询 结 果</h4>
	</div>
	<input class="btn btn-primary radius" type="button" 
			value="&nbsp;&nbsp;返回&nbsp;&nbsp;" onclick="window.location.href='speciality.jsp'">
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th>专业编号</th>
				<th>专业名称</th>
				<th>所属系别</th>
				<th>操作</th>
			</tr>
		</thead>
		<%	
			for(Iterator<SpecialityInfo> iter = speciality.iterator();iter.hasNext();){
				SpecialityInfo spec = iter.next();
		%>
		<tbody>
			<tr class="text-c">
				<td><%=spec.getSpecid()%></td>
				<td><%=spec.getSpec_name()%></td>
				<td><%=spec.getDept_name()%></td>
				<td class="td-manage">
				<a title="编辑" href="speciality-update.jsp?Spec_id=<%=spec.getSpecid()%>&Spec_name=<%=spec.getSpec_name()%>&Dept_name=<%=spec.getDept_name()%>" class="ml-5"
				style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>  
				<a title="删除" href="specialityDelete?Spec_id=<%=spec.getSpecid()%>"
				class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i> </a></td>
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
					<a href="speciality-search.jsp?pageno=<%=pageNo - 1%>&keyword=<%=keyword%>"><font color="blue">&lt;上一页</font></a>
					&nbsp;
				<%
			}
			if(Pagecount >= 5){
				if(pageNo != 1){
					%>
						<a href="speciality-search.jsp?pageno=<%=1%>&keyword=<%=keyword%>"><font color="blue">&lt;首页&gt;</font></a>
						&nbsp;
					<%
				}
				if(pageNo != Pagecount){
					%>
						<a href="speciality-search.jsp?pageno=<%=Pagecount%>&keyword=<%=keyword%>"><font color="blue">&lt;尾页&gt;</font></a>
						&nbsp;
					<%
				}
			}
			if(pageNo < Pagecount){
				%>
					<a href="speciality-search.jsp?pageno=<%=pageNo + 1%>&keyword=<%=keyword%>"><font color="blue">下一页&gt;</font></a>
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
