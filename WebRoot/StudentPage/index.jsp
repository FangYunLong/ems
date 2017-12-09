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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/min.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/admin.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/iconfont.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/icheck.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/skin/default/skin.css" id="skin" />
<title>教务管理系统（学生端）</title>
</head>
<body>
	<%
		if(session.getAttribute("stu_username") == null){
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		}
	%>
	<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl">
			<a class="logo navbar-logo f-l mr-10 hidden-xs"
				href="/aboutHui.shtml">教务管理系统（简易版）—— 学生端</a> <a
				class="logo navbar-logo-m f-l mr-10 visible-xs"
				href="/aboutHui.shtml"></a> <span
				class="logo navbar-slogan f-l mr-10 hidden-xs"></span> <a
				aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs"
				href="javascript:;"></a> <nav id="Hui-userbar"
				class="nav navbar-nav navbar-userbar hidden-xs">
			<ul class="cl">
				<li>欢迎您：</li>
				<li class="dropDown dropDown_hover"><a href="#"
					class="dropDown_A"><%=session.getAttribute("stu_username")%>&nbsp;<%=session.getAttribute("studentname")%>同学<i class="Hui-iconfont">&#xe6d5;</i> </a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="<%=request.getContextPath()%>/login.jsp">安全退出</a>
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
			<dt><i class="Hui-iconfont">&#xe616;</i>信息维护<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="StudentInfo.jsp" data-title="个人信息" href="javascript:void(0)">个人信息</a></li>
					<li><a _href="ModifyPassword.jsp" data-title="密码修改" href="javascript:void(0)">密码修改</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-comments">
			<dt><i class="Hui-iconfont">&#xe616;</i>信息查询<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="Curriculum.jsp" data-title="课程查询" href="javascript:;">课程查询</a></li>
					<li><a _href="results.jsp" data-title="成绩查询" href="javascript:;">成绩查询</a></li>
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
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/layer.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/index.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/index.admin.js"></script>
</body>
</html>
