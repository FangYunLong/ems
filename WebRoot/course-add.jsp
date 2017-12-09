<%@page import="cn.ems.dao.impl.CourseDaoIpml"%>
<%@page import="cn.ems.domain.Department"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<script type="text/javascript">
	var flagID , flagName , flagCredits , req;
	function init(){
		if(window.XMLHttpRequest){
			req = new XMLHttpRequest();
		} else if(window.ActiveXObject){
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	
	function changeChild(){
		init();
		var url = "GetDepartmentChilds-add.jsp?id="
				+ escape(document.frm.deptid.options[document.frm.deptid.selectedIndex].value);
		req.open("GET", url,true);
		req.onreadystatechange = callback;
		req.send(null);
	}
	
	function callback(){
		if(4 == req.readyState){
			if(200 == req.status){
				//alert(req.responseText);
				eval(req.responseText);
			}
		}
	}
	

	function checkFrm(){
		var deptid = document.frm.deptid.selectedIndex;
		var specid = document.frm.specid.selectedIndex;
		var tid = document.frm.tid.selectedIndex;
		var schoolyear = document.frm.schoolyear.selectedIndex;
		var semester = document.frm.semester.selectedIndex;
		if(flagID && flagName && flagCredits){
			if(deptid != 0 && specid != 0 && tid != 0 && schoolyear != 0 && semester != 0){
				return true;
			}else{
				alert("请正确选择下拉框内容");
				return false;
			}
		}else{
			if(!flagID){
				checkCourseID();
			}if(!flagName){
				checkCourseName();
			}if(!flagCredits){
				checkCredits();
			}
			return false;
		}
	}
	
	function checkCourseID(){
		init();
		var cid = document.getElementById("cid").value;
		var validate = /^[cC]\d{1,4}$/;
		if(cid == ""){
			document.getElementById("msgid").innerHTML = "<font color='red' size = 3>请输入课程编号 例如：C1 (不区分大小写)</font>";
			flagID = false;
		}else if(!validate.test(cid)){
			document.getElementById("msgid").innerHTML = "<font color='red' size = 3>请输入正确格式 例如：C1 (不区分大小写)</font>";
			flagID = false;
		} else{
			var url = "CheckCourseID.jsp?id="+escape(cid);
			req.open("GET", url, true);
			req.onreadystatechange = function(){
				if(4 == req.readyState){
					if(200 == req.status){
						var msg = req.responseXML.getElementsByTagName("msg")[0].childNodes[0].nodeValue;
						if(msg == "invalid"){
							document.getElementById("msgid").innerHTML = "<font color = 'red' size = 3>抱歉，课程编号已存在</font>";
							flagID = false;
						}else if(msg == "valid"){
							document.getElementById("msgid").innerHTML = "<img src='images/Correct.png' width='30' heigt='30'>";
							flagID = true;
						}
					}
				}
			};
			req.send(null);
		}
	}
	
	function checkCourseName(){
		init();
		var cname = document.getElementById("cname").value;
		var validate = /^[a-zA-Z\u4e00-\u9fa5]+[a-zA-Z\u4e00-\u9fa5\s\d]+/;
		if(cname == ""){
			document.getElementById("msgname").innerHTML = "<font color = 'red' size = 3>请输入课程名称</font>";
			flagName = false;
		}else if(!validate.test(cname)){
			document.getElementById("msgname").innerHTML = "<font color = 'red' size = 3>请输入正确格式(需以中文或英文开头)</font>";
			flagName = false;
		}else {
			var url = "CheckCourseName.jsp?name="+encodeURI(cname);
			req.open("GET", url, true);
			req.onreadystatechange = function(){
				if(4 == req.readyState){
					if(200 == req.status){
						var msg = req.responseXML.getElementsByTagName("msg")[0].childNodes[0].nodeValue;
						if(msg == "invalid"){
							document.getElementById("msgname").innerHTML = "<font color = 'red' size = 3>抱歉，课程名称已存在</font>";
							flagName = false;
						}else if(msg == "valid"){
							document.getElementById("msgname").innerHTML = "<img src='images/Correct.png' width='30' heigt='30'>";
							flagName = true;
						}
					}
				}
			};
			req.send(null);
		}
	}
	
	function checkCredits(){
		var credits = document.getElementById("credits").value;
		var validate = /\d+/;
		if(credits == ""){
			document.getElementById("msgcredits").innerHTML = "<font color='red' size = 3>请输入学分(需要输入数字) </font>";
			flagCredits = false;
		}else if(!validate.test(credits)){
			document.getElementById("msgcredits").innerHTML = "<font color='red' size = 3>请输入正确格式(需要输入数字) </font>";
			flagCredits = false;
		}else{
			document.getElementById("msgcredits").innerHTML = "<img src='images/Correct.png' width='30' heigt='30'>";
			flagCredits = true;
		}
	}
	
</script>

<LINK rel="Bookmark" href="/favicon.ico" >
<LINK rel="Shortcut Icon" href="/favicon.ico" />
<link rel="stylesheet" type="text/css" href="css/min.css" />
<link rel="stylesheet" type="text/css" href="css/admin.css" />
<link rel="stylesheet" type="text/css" href="css/iconfont.css" />
<link rel="stylesheet" type="text/css" href="css/icheck.css" />
<link rel="stylesheet" type="text/css" href="skin/default/skin.css" id="skin" />

<title>新增课程</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 课程管理 <span class="c-gray en">&gt;</span> 新增课程 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<article class="page-container">
	<form action="CourseAdd" method="post" class="form form-horizontal" id="form-member-add" name="frm">
		<div id="msg">
			<%
				if(request.getAttribute("msg") != null){
						out.print(request.getAttribute("msg"));
					}
			%>
		</div>
		<script type="text/javascript">
			setTimeout("document.getElementById('msg').style.display='none'",
					2000);
		</script>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3" for="cid"><span class="c-red">*</span>课程编号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value=""
					placeholder="" id="cid" name="cid"
					style="width: 800px" onblur="checkCourseID()" maxlength="5">
				<span id="msgid"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>课程名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder=""
					id="cname" name="cname" style="width: 800px" onblur="checkCourseName()">
				<span id="msgname"></span>	
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>学分：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder=""
					id="credits" name="credits" style="width: 800px" onblur="checkCredits()" maxlength="3">
				<span id="msgcredits"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>所属系别：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select class="select" size="1" name="deptid" id="deptid"
					style="width: 800;height: 30px" onchange="changeChild()">
					<option value="-1" selected>-----请选择系别-----</option>
					<%
						List<Department> deptList = CourseDaoIpml.getDepartment();
						for(Department dept : deptList){
					%>
					<option value=<%=dept.getDeptid()%>><%=dept.getDept_name()%></option>
					<%
						}
					%>
				</select>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>所属专业：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select class="select" size="1" name="specid" id="specid"
					style="width: 800;height: 30px">
					<option value="" selected>-----请先选择系别-----</option>
				</select>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>任课老师：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select class="select" size="1" name="tid" id="tid"
					style="width: 800px;height: 30px">
					<option value="" selected>-----请先选择系别-----</option>
				</select>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red">*</span>学年：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select class="select" size="1" name="schoolyear" style="width: 800;height: 30px" id="schoolyear">
					<option value="" >-----请选择学年-----</option>
					<%
						for(int i = 1999;i<=2050;i++){
					%>
						<option value=<%=i+"-"+(i+1) %> ><%=i+"-"+(i+1)%></option>
					<%
						}
					%>
				</select>	
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red">*</span>学期：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select class="select" size="1" name="semester" style="width: 800;height: 30px" id="semester">
					<option value="" >-----请选择学期-----</option>
					<option value="第一学期" >第一学期</option>
					<option value="第二学期" >第二学期</option>
				</select>	
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit"
					value="&nbsp;&nbsp;提交&nbsp;&nbsp;" onclick="return checkFrm()"> <input
					class="btn btn-primary radius" type="button"
					value="&nbsp;&nbsp;重置&nbsp;&nbsp;" onclick="resetSelect()">
			</div>
		</div>
	</form>
</article>

<script type="text/javascript">
	function resetSelect(){
		document.frm.cid.value = "";
		document.frm.cid.focus();
		document.getElementById("msgid").innerHTML = "";
		
		document.frm.cname.value = "";
		document.getElementById("msgname").innerHTML = "";
		
		document.frm.credits.value = "";
		document.getElementById("msgcredits").innerHTML = "";
		
		document.frm.deptid.selectedIndex = 0;
		
		document.frm.specid.length = 1;
		document.frm.specid.options[0].text = "-----请先选择系别-----";
		
		document.frm.tid.length = 1;
		document.frm.tid.options[0].text = "-----请先选择系别-----";
		
		document.frm.schoolyear.selectedIndex = 0;
		document.frm.semester.selectedIndex = 0;
	}
</script>

<script type="text/javascript" src="js/jquery.min.js"></script> 
<script type="text/javascript" src="js/layer.js"></script> 
<script type="text/javascript" src="js/messages_zh.min.js"></script> 
<script type="text/javascript" src="js/index.js"></script> 
<script type="text/javascript" src="js/index.admin.js"></script> 
</body>
</html>