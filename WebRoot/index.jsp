<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<LINK rel="Bookmark" href="/favicon.ico">
<LINK rel="Shortcut Icon" href="/favicon.ico" />
<link rel="stylesheet" type="text/css" href="css/min.css" />
<link rel="stylesheet" type="text/css" href="css/admin.css" />
<link rel="stylesheet" type="text/css" href="css/iconfont.css" />
<link rel="stylesheet" type="text/css" href="css/icheck.css" />
<link rel="stylesheet" type="text/css" href="skin/default/skin.css" id="skin" />
<title>教务管理系统（管理员端）</title>
</head>
<body>
	<%
		if(session.getAttribute("admin_username") == null){
			response.sendRedirect("login.jsp");
		}
	%>
	<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl">
			<a class="logo navbar-logo f-l mr-10 hidden-xs"
				href="/aboutHui.shtml">欢迎使用教务管理系统（简易版）—— 管理员端</a> <a
				class="logo navbar-logo-m f-l mr-10 visible-xs"
				href="/aboutHui.shtml"></a> <span
				class="logo navbar-slogan f-l mr-10 hidden-xs"></span> <a
				aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs"
				href="javascript:;"></a> <nav id="Hui-userbar"
				class="nav navbar-nav navbar-userbar hidden-xs">
			<ul class="cl">
				<li>管理员</li>
				<li class="dropDown dropDown_hover"><a href="#"
					class="dropDown_A"><%=session.getAttribute("admin_username") %><i class="Hui-iconfont">&#xe6d5;</i> </a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="#">个人信息</a>
						</li>
						<li><a href="login.jsp">切换账户</a>
						</li>
						<li><a href="login.jsp">退出</a>
						</li>
					</ul></li>
				<li id="Hui-skin" class="dropDown right dropDown_hover"><a
					href="javascript:;" class="dropDown_A" title="换肤"><i
						class="Hui-iconfont" style="font-size:18px">&#xe62a;</i> </a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a>
						</li>
						<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a>
						</li>
						<li><a href="javascript:;" data-val="green" title="绿色">绿色</a>
						</li>
						<li><a href="javascript:;" data-val="red" title="红色">红色</a>
						</li>
						<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a>
						</li>
						<li><a href="javascript:;" data-val="orange" title="绿色">橙色</a>
						</li>
					</ul></li>
			</ul>
			</nav>
		</div>
	</div>
	</header>
	<aside class="Hui-aside">
	<input runat="server" id="divScrollValue" type="hidden" value="" />
	<div class="menu_dropdown bk_2">
		
		<dl id="menu-product">
			<dt><i class="Hui-iconfont">&#xe616;</i>系部管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="department.jsp" data-title="系部信息" href="javascript:void(0)">系部信息</a></li>
					<li><a _href="department_add.jsp" data-title="新增系部" href="javascript:void(0)">新增系部</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-comments">
			<dt><i class="Hui-iconfont">&#xe616;</i>专业管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="speciality.jsp" data-title="专业信息" href="javascript:;">专业信息</a></li>
					<li><a _href="speciality-add.jsp" data-title="新增专业" href="javascript:void(0)">新增专业</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-member">
			<dt><i class="Hui-iconfont">&#xe616;</i>班级管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="class.jsp" data-title="班級信息" href="javascript:;">班级信息</a></li>
					<li><a _href="class-add.jsp" data-title="新增班級" href="javascript:void(0)">新增班级</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-tongji">
			<dt><i class="Hui-iconfont">&#xe616;</i>课程管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="course.jsp" data-title="课程信息" href="javascript:void(0)">课程信息</a></li>
					<li><a _href="course-add.jsp" data-title="新增课程" href="javascript:void(0)">新增课程</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe62d;</i>学生管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="student.jsp" data-title="学生信息" href="javascript:void(0)">学生信息</a></li>
					<li><a _href="student-add.jsp" data-title="新增学生" href="javascript:void(0)">新增学生</a></li>					
					<li><a _href="scoreinfo.jsp" data-title="学生成绩" href="javascript:void(0)">学生成绩</a></li>	
				</ul>
			</dd>
		</dl>
			<dl id="menu-comments">
			<dt><i class="Hui-iconfont">&#xe62d;</i>教师管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="teacher.jsp" data-title="教师信息" href="javascript:;">教师信息</a></li>
					<li><a _href="teacher-add.jsp" data-title="新增教师" href="javascript:void(0)">新增教师</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-admin">
			<dt><i class="Hui-iconfont">&#xe62d;</i>账号管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="AdminInfo.jsp" data-title="管理员账号信息" href="javascript:void(0)">管理员账号信息</a></li>
					<li><a _href="student_login.jsp" data-title="学生账号信息" href="javascript:void(0)">学生账号信息</a></li>
					<li><a _href="teacher_login.jsp" data-title="教师账号信息" href="javascript:void(0)">教师账号信息</a></li>
				</ul>
			</dd>
		</dl>	
	</div>
</aside>
	<div class="dislpayArrow hidden-xs">
		<a class="pngfix" href="javascript:void(0);"
			onClick="displaynavbar(this)"></a>
	</div>
	<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active"><span title="我的桌面" data-href="welcome.jsp">我的桌面</span><em></em>
				</li>
			</ul>
		</div>
		<div class="Hui-tabNav-more btn-group">
			<a id="js-tabNav-prev" class="btn radius btn-default size-S"
				href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i> </a><a
				id="js-tabNav-next" class="btn radius btn-default size-S"
				href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i> </a>
		</div>
	</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display:none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src="welcome.jsp"></iframe>
		</div>
	</div>
	</section>
	<script type="text/javascript" src="js/min.js"></script>
	<script type="text/javascript" src="js/layer.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
	<script type="text/javascript" src="js/index.admin.js"></script>
</body>
</html>
