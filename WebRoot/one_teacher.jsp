<%@page import="javax.swing.text.TabableView"%>
<%@page import="cn.ems.domain.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,  cn.ems.dao.impl.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	List<TeacherInfo> list = TeacherDaoImpl.findTeacherByID(session.getAttribute("te_username").toString());
	TeacherInfo teacher = list.get(0);
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
	<div class="page-container">
	
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
					<tr class="text-c">
						<th style="width: 200px">职工号：</th>
						<th style="width: 400px"><%=teacher.getTid()%></th>
						<th style="width: 200px">教师证号：</th>
						<th style="width: 400px"></th>
						<th style="width: 200px">手机类型：</th>
						<th style="width: 400px"><input type="text"
							class="input-text" style="height: 22px;width: 200px;"></th>
						<th rowspan="6" style="width:800px;text-align: left;"><img
							alt="照片" src="1.jpg" style="width: 96px;height: 128px;">
							<p style="color: red">建议文件大小：9-18K，分辨率：96*128，文件类型：jpg、jpeg</p></th>
					</tr>
					<tr class="text-c">
						<th style="width: 200px">姓名：</th>
						<th style="width: 400px"><%=teacher.getTname()%></th>
						<th style="width: 200px">职称：</th>
						<th style="width: 400px"><input type="text"
							class="input-text" style="height: 22px;width: 200px;" value="<%=teacher.getTitle()%>"></th>
						<th style="width: 200px">手机号码：</th>
						<th style="width: 400px"><input type="text"
							class="input-text" style="height: 22px;width: 200px;" value="<%=teacher.getPhone()%>"></th>
					</tr>
					<tr class="text-c">
						<th style="width: 200px">曾用名：</th>
						<th style="width: 400px"><input type="text"
							class="input-text" style="height: 22px;width: 200px;"></th>
						<th style="width: 200px">所属专业：</th>
						<th style="width: 400px"><input type="text"
							class="input-text" style="height: 22px;width: 200px;" value="<%=teacher.getDept_name()%>"></th>
						<th style="width: 200px">家庭邮编：</th>
						<th style="width: 400px"><input type="text"
							class="input-text" style="height: 22px;width: 200px;"></th>
					</tr>
					<tr class="text-c">
						<th style="width: 200px">性别：</th>
						<th style="width: 400px"><%=teacher.getSex()%></th>
						<th style="width: 200px">入职日期：</th>
						<th style="width: 400px"></th>
						<th style="width: 200px">家庭电话：</th>
						<th style="width: 400px"><input type="text"
							class="input-text" style="height: 22px;width: 200px;"></th>
					</tr>
					<tr class="text-c">
						<th style="width: 200px">出生日期：</th>
						<th style="width: 400px"></th>
						<th style="width: 200px">毕业院校：</th>
						<th style="width: 400px"><input type="text"
							class="input-text" style="height: 22px;width: 200px;"></th>
						<th style="width: 200px">父亲姓名：</th>
						<th style="width: 400px"><input type="text"
							class="input-text" style="height: 22px;width: 200px;"></th>
					</tr>
					<tr class="text-c">
						<th style="width: 200px">民族：</th>
						<th style="width: 400px"></th>
						<th style="width: 200px">宿舍号：</th>
						<th style="width: 400px"><input type="text"
							class="input-text" style="height: 22px;width: 200px;"></th>
						<th style="width: 200px">父亲单位：</th>
						<th style="width: 400px"><input type="text"
							class="input-text" style="height: 22px;width: 200px;"></th>
					</tr>
					<tr class="text-c">
						<th style="width: 200px">籍贯：</th>
						<th style="width: 400px"><input type="text"
							class="input-text" style="height: 22px;width: 200px;"></th>
						<th style="width: 200px">电子邮箱：</th>
						<th style="width: 400px"><input type="text"
							class="input-text" style="height: 22px;width: 200px;"></th>
						<th style="width: 200px">父亲单位邮编：</th>
						<th style="width: 400px"><input type="text"
							class="input-text" style="height: 22px;width: 200px;"></th>
						<th style="text-align: left;"><input type="file" name="img"></th>
					</tr>
					<tr class="text-c">
						<th style="width: 200px">政治面貌：</th>
						<th style="width: 400px"><select class="input-text"
							style="height: 27px;width: 200px;">
								<option></option>
								<option>中共党员</option>
								<option>中共预备党员</option>
								<option selected="selected">共青团员</option>
								<option>民革党员</option>
								<option>民盟盟员</option>
								<option>民建会员</option>
								<option>民进会员</option>
								<option>农工党党员</option>
								<option>致公党党员</option>
								<option>九三学社社员</option>
								<option>台盟盟员</option>
								<option>无党派人士</option>
								<option>群众</option>
						</select></th>
						<th style="width: 200px">联系电话：</th>
						<th style="width: 400px"><input type="text"
							class="input-text" style="height: 22px;width: 200px;"></th>
						<th style="width: 200px">母亲姓名：</th>
						<th style="width: 400px"><input type="text"
							class="input-text" style="height: 22px;width: 200px;"></th>
						<th><input type="button" class="btn btn-primary radius"
							value="上传照片"></th>
					</tr>
					<tr class="text-c">
						<th style="width: 200px">所在地区：</th>
						<th style="width: 400px"><input type="text"
							class="input-text" style="height: 22px;width: 200px;"></th>
						<th style="width: 200px">邮政编码：</th>
						<th style="width: 400px"><input type="text"
							class="input-text" style="height: 22px;width: 200px;"></th>
						<th style="width: 200px">母亲单位：</th>
						<th style="width: 400px"><input type="text"
							class="input-text" style="height: 22px;width: 200px;"></th>
						<th><input type="button" class="btn btn-primary radius"
							value="清除照片"></th>
					</tr>
					<tr class="text-c">
						<th style="width: 200px">现住省：</th>
						<th style="width: 400px"><input type="text"
							class="input-text" style="height: 22px;width: 200px;"></th>
						<th style="width: 200px"></th>
						<th style="width: 400px"></th>
						<th style="width: 200px">母亲单位邮编：</th>
						<th style="width: 400px"><input type="text"
							class="input-text" style="height: 22px;width: 200px;"></th>
						<th></th>
					</tr>
					<tr class="text-c">
						<th style="width: 200px">出生地：</th>
						<th style="width: 400px"><input type="text"
							class="input-text" style="height: 22px;width: 200px;"></th>
						<th style="width: 200px">身份证号：</th>
						<th style="width: 400px"></th>
						<th style="width: 200px;text-align: left;" colspan="2">父亲单位电话或手机：</th>
						<th style="width: 400px"><input type="text"
							class="input-text" style="height: 22px;width: 200px;"></th>
					</tr>
					<tr class="text-c">
						<th style="width: 200px">健康状况：</th>
						<th style="width: 400px"><input type="text"
							class="input-text" style="height: 22px;width: 200px;"></th>
						<th style="width: 200px">学历层次：</th>
						<th style="width: 400px">研究生</th>
						<th style="width: 200px;text-align: left;" colspan="2">母亲单位电话或手机：</th>
						<th style="width: 400px"><input type="text"
							class="input-text" style="height: 22px;width: 200px;"></th>
					</tr>
					<tr class="text-c">
						<th style="width: 200px">学院：</th>
						<th style="width: 400px"></th>
						<th style="width: 200px">系：</th>
						<th style="width: 400px"></th>
						<th style="width: 200px;text-align: left;" colspan="2">家庭地址：</th>
						<th style="width: 400px"><input type="text"
							class="input-text" style="height: 22px;width: 200px;"></th>
					</tr>
					<tr class="text-c">
						<th style="width: 200px"></th>
						<th style="width: 400px"></th>
						<th style="width: 200px"></th>
						<th style="width: 400px"><input type="text"
							class="input-text" style="height: 22px;width: 200px;"></th>
						<th style="width: 200px;text-align: left;" colspan="2">家庭所在地（/省/县）：</th>
						<th style="width: 400px"><input type="text"
							class="input-text" style="height: 22px;width: 200px;"></th>
					</tr>
					<tr class="text-c">
						<th style="width: 200px">行政班：</th>
						<th style="width: 400px"></th>
						<th style="width: 200px;text-align: left;" colspan="2">是否高水平运动员：</th>
						<th rowspan="4"><span>备注：</span></th>
						<th rowspan="4" colspan="2" style="text-align: left;"><textarea
								rows="8" cols="30"></textarea></th>
					</tr>
					<tr class="text-c">
						<th style="width: 200px"></th>
						<th style="width: 400px"></th>
						<th style="width: 200px"></th>
						<th style="width: 400px"></th>
					</tr>
					<tr class="text-c">
						<th style="width: 200px"></th>
						<th style="width: 400px"></th>
						<th style="width: 200px"></th>
						<th style="width: 400px"></th>
					</tr>
					<tr class="text-c">
						<th style="width: 200px">当前所在级：</th>
						<th style="width: 400px"></th>
						<th style="width: 200px">在职状态：</th>
						<th style="width: 400px">有</th>
					</tr>
				</thead>
				
			</table>
			
		</div>
	</div>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/layer.js"></script>
	<script type="text/javascript" src="js/laypage.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
	<script type="text/javascript" src="js/index.admin.js"></script>
</body>
</html>
