<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<head>
<title>登录页面</title>
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<LINK rel="Bookmark" href="/favicon.ico">
<LINK rel="Shortcut Icon" href="/favicon.ico" />
<link rel="stylesheet" type="text/css" href="css/min.css" />
<link rel="stylesheet" type="text/css" href="css/admin.css" />
<link rel="stylesheet" type="text/css" href="css/iconfont.css" />
<link rel="stylesheet" type="text/css" href="css/icheck.css" />
<link rel="stylesheet" type="text/css" href="skin/default/skin.css"
	id="skin" />
<style>
body {
	background: #ebebeb;
	font-family: "Helvetica Neue", "Hiragino Sans GB", "Microsoft YaHei",
		"\9ED1\4F53", Arial, sans-serif;
	color: #222;
	font-size: 12px;
}

* {
	padding: 0px;
	margin: 0px;
}

.top_div {
	background: #008ead;
	width: 100%;
	height: 400px;
}

.ipt {
	border: 1px solid #d3d3d3;
	padding: 10px 10px;
	width: 290px;
	border-radius: 4px;
	padding-left: 35px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s
}

.ipt:focus {
	border-color: #66afe9;
	outline: 0;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgba(102, 175, 233, .6);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgba(102, 175, 233, .6)
}

.u_logo {
	background: url("images/username.png") no-repeat;
	padding: 10px 10px;
	position: absolute;
	top: 13px;
	left: 65px;
}

.p_logo {
	background: url("images/password.png") no-repeat;
	padding: 10px 10px;
	position: absolute;
	top: 12px;
	left: 65px;
}

a {
	text-decoration: none;
}

.tou {
	background: url("images/tou.png") no-repeat;
	width: 97px;
	height: 92px;
	position: absolute;
	top: -87px;
	left: 140px;
}

.left_hand {
	background: url("images/left_hand.png") no-repeat;
	width: 32px;
	height: 37px;
	position: absolute;
	top: -38px;
	left: 150px;
}

.right_hand {
	background: url("images/right_hand.png") no-repeat;
	width: 32px;
	height: 37px;
	position: absolute;
	top: -38px;
	right: -64px;
}

.initial_left_hand {
	background: url("images/hand.png") no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -12px;
	left: 100px;
}

.initial_right_hand {
	background: url("images/hand.png") no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -12px;
	right: -112px;
}

.left_handing {
	background: url("images/left-handing.png") no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -24px;
	left: 139px;
}

.right_handinging {
	background: url("images/right_handing.png") no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -21px;
	left: 210px;
}
</style>

<script type="text/javascript">
	$(function() {
		//得到焦点
		$("#password").focus(function() {
			$("#left_hand").animate({
				left : "150",
				top : " -38"
			}, {
				step : function() {
					if (parseInt($("#left_hand").css("left")) > 140) {
						$("#left_hand").attr("class", "left_hand");
					}
				}
			}, 2000);
			$("#right_hand").animate({
				right : "-64",
				top : "-38px"
			}, {
				step : function() {
					if (parseInt($("#right_hand").css("right")) > -70) {
						$("#right_hand").attr("class", "right_hand");
					}
				}
			}, 2000);
		});
		//失去焦点
		$("#password").blur(function() {
			$("#left_hand").attr("class", "initial_left_hand");
			$("#left_hand").attr("style", "left:100px;top:-12px;");
			$("#right_hand").attr("class", "initial_right_hand");
			$("#right_hand").attr("style", "right:-112px;top:-12px");
		});
	});
</script>

<script type="text/javascript">
	function checkFrm() {
		if(frm.user.value == "访客") {
			frm.submit();
			return;
		}
		if (frm.username.value == "") {
			alert("请输入用户名！");
			return;
		}
		if (frm.password.value == "") {
			alert("请输入密码！");
			return;
		}
		frm.submit();
	}
</script>
</head>
<body onkeydown="if(event.keyCode==13){checkFrm();}">
	<div class="top_div"></div>
	<div
		style="background: rgb(255, 255, 255); margin: -100px auto auto; border: 1px solid rgb(231, 231, 231); border-image: none; width: 400px; height: 300px; text-align: center;">
		<DIV style="width: 165px; height: 96px; position: absolute;">
			<DIV class="tou"></DIV>
			<DIV class="initial_left_hand" id="left_hand"></DIV>
			<DIV class="initial_right_hand" id="right_hand"></DIV>
		</DIV>
		<p style="font-size:37px; padding:20px;">教务管理系统(简易版)</p>
		<form class="form form-horizontal" action="LoginServlet" method="post"
			name="frm">
			<p style="padding: 30px -10px 10px; position: relative;">
				<span class="u_logo"></span> <input class="ipt" type="text"
					id="username" name="username" placeholder="请输入用户名" value="">
			</p>
			<P style="position: relative;">
				<SPAN class="p_logo"></SPAN> <INPUT class="ipt" id="password" maxlength="16"
					type="password" name="password" placeholder="请输入密码" value="">
			</P>
			<p style="margin:10px 10px">
				<input type="radio" value="管理员" name="user" id="admin">&nbsp;<label
					for="admin">管理员</label> &nbsp;&nbsp;<input type="radio" value="学生"
					checked="checked" name="user" id="student">&nbsp;<label
					for="student">学生</label> &nbsp;&nbsp;<input type="radio" value="教师"
					name="user" id="teacher">&nbsp;<label for="teacher">教师</label>
				&nbsp;&nbsp;<input type="radio" value="访客" name="user" id="visitor">&nbsp;<label
					for="visitor">访客</label>
			</p>
			<div
				style="height: 50px; line-height: 20px; margin-top: 15px; border-top-color: rgb(231, 231, 231); border-top-width: 1px; border-top-style: solid;">
				<div class="row cl">
					<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
						<span style="float: right;margin-right: 10px"> <input
							class="btn btn-primary radius" type="button"
							value="&nbsp;&nbsp;登&nbsp;&nbsp;录&nbsp;&nbsp;"
							onclick="checkFrm()">&nbsp; <input
							class="btn btn-primary radius" type="reset"
							value="&nbsp;&nbsp;重&nbsp;&nbsp;置&nbsp;&nbsp;">
						</span>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div style="text-align:center;"></div>
</body>
</html>
