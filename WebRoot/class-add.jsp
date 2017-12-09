<%@page import="cn.ems.domain.Department"%>
<%@page import="cn.ems.domain.Teacher"%>
<%@page import="cn.ems.dao.impl.ClassDaoImpl"%>
<%@page import="cn.ems.domain.Speciality"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<LINK rel="Bookmark" href="/favicon.ico">
<LINK rel="Shortcut Icon" href="/favicon.ico" />
<link rel="stylesheet" type="text/css" href="css/min.css" />
<link rel="stylesheet" type="text/css" href="css/admin.css" />
<link rel="stylesheet" type="text/css" href="css/iconfont.css" />
<link rel="stylesheet" type="text/css" href="css/icheck.css" />
<link rel="stylesheet" type="text/css" href="skin/default/skin.css"
	id="skin" />
<title>新增班级</title>

<script type="text/javascript">
	var req;
	function init() {
		if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}

	function changeChild() {
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

	
	var flagID , flagName; 
	function checkFrm(){
		var deptIndex = document.frm.deptid.selectedIndex;
		var specIndex = document.frm.specid.selectedIndex;
		var teachIndex = document.frm.tid.selectedIndex;
		if(flagID && flagName){
			if(deptIndex != 0 && specIndex != 0 && teachIndex != 0){
				return true;
			} else {
				alert("请正确选择下拉框内容");
				return false;
			}
		} else if(!flagID && !flagName){
			checkClassid();
			checkClassname();
			return false;
		} else if(flagID && !flagName){
			checkClassname();
			return false;
		} else if(!flagID && flagName){
			changeChild();
			return false;
		}
	}

	function checkClassid() {
		init();
		var validate = /^[cC][0-9]+$/;
		var classid = document.getElementById("classid");
		if (classid.value == "") {
			document.getElementById("msgid").innerHTML = "<font color = 'red' size = '3'>&nbsp;请输入班级编号,例如 C1 (不区分大小写)</font>";
			flagID = false;
		} else if (!validate.test(classid.value)) {
			document.getElementById("msgid").innerHTML = "<font color = 'red' size = '3'>&nbsp;请输入正确格式,例如 C1 (不区分大小写)</font>";
			flagID = false;
		} else {
			var url = "CheckClassId.jsp?id=" + escape(classid.value);
			req.open("GET", url,true);
			req.onreadystatechange = function(){
				if(4 == req.readyState){
					if(200 == req.status){
						var msg = req.responseXML.getElementsByTagName("msg")[0];
						if(msg.childNodes[0].nodeValue == "invalid"){
							document.getElementById("msgid").innerHTML = "<font color = 'red' size = '3'>&nbsp;抱歉，班级编号已存在</font>";
							flagID = false;
						} else if(msg.childNodes[0].nodeValue == "valid"){
							document.getElementById("msgid").innerHTML = "<img src='images/Correct.png' width='30' heigt='30'>";
							flagID = true;
						}
					}
				}
			};
			req.send(null);
		}
	}

	function checkClassname() {
		init();
		var validate = /^[\u4e00-\u9fa5]{3,}\d{4}\-\d$/;
		var classname = document.getElementById("classname");
		if(classname.value == ""){
			document.getElementById("msgname").innerHTML = "<font color = 'red' size = '3'>&nbsp;请输入班级名称,例如 软工本2014-1</font>";
			flagName = false;
		} else if(!validate.test(classname.value)){
			document.getElementById("msgname").innerHTML = "<font color = 'red' size = '3'>&nbsp;请输入正确格式,例如 软工本2014-1</font>";
			flagName = false;
		} else{
			var url = "CheckClassName.jsp?name=" + encodeURI(classname.value);
			req.open("GET", url, true);
			req.onreadystatechange = function(){
				if(4 == req.readyState){
					if(200 == req.status){
						var msg = req.responseXML.getElementsByTagName("msg")[0];
						if(msg.childNodes[0].nodeValue == "invalid"){
							document.getElementById("msgname").innerHTML = "<font color = 'red' size = '3'>&nbsp;抱歉，班级名称已存在</font>";
							flagName = false;
						} else if(msg.childNodes[0].nodeValue == "valid"){
							document.getElementById("msgname").innerHTML = "<img src='images/Correct.png' width='30' heigt='30'>";
							flagName = true;
						}
					}
				}
			};
			req.send(null);
		}
	}
</script>

</head>
<body>
	<nav class="breadcrumb">
	<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
	班级管理 <span class="c-gray en">&gt;</span> 新增班级 <a
		class="btn btn-success radius r"
		style="line-height:1.6em;margin-top:3px"
		href="javascript:location.replace(location.href);" title="刷新"><i
		class="Hui-iconfont">&#xe68f;</i></a></nav>
	<article class="page-container">
	<form action="ClassAdd" method="post" class="form form-horizontal"
		id="form-member-add" name="frm">
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
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red">*</span>班级编号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder=""
					id="classid" name="classid" style="width: 800px" maxlength="5" onblur="checkClassid()">
				<span id="msgid"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red">*</span>班级名称：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<input type="text" class="input-text" value="" placeholder=""
					id="classname" name="classname" style="width: 800px" onblur="checkClassname()">
				<span id="msgname"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red">*</span>所属系别：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select class="select" size="1" name="deptid" id="deptid"
					style="width: 800;height: 30px" onchange="changeChild()">
					<option value="-1" selected>-----请选择系别-----</option>
					<%
						List<Department> deList = ClassDaoImpl.getDept_Name_id();
									for(Department dept : deList){
					%>
					<option value="<%=dept.getDeptid()%>"><%=dept.getDept_name()%></option>
					<%
						}
					%>
				</select>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red">*</span>所属专业：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select class="select" size="1" name="specid"
					style="width: 800;height: 30px" title="" id="specid">
					<option value="-1">-----请先选择系别-----</option>
				</select>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red">*</span>班主任：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select class="select" size="1" name="tid" id="tid"
					style="width: 800;height: 30px">
					<option value="-1">-----请先选择系别-----</option>
				</select>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit"
					value="&nbsp;&nbsp;提交&nbsp;&nbsp;" onclick="return checkFrm()">&nbsp; <input
					class="btn btn-primary radius" type="button"
					value="&nbsp;&nbsp;重置&nbsp;&nbsp;" onclick="resetSelect()">
			</div>
		</div>
	</form>
	</article>

	<script type="text/javascript">
		function resetSelect(){
			document.frm.deptid.selectedIndex = 0;
			document.frm.specid.length = 1;
			document.frm.specid.options[0].text = "-----请先选择系别-----";
			document.frm.tid.length = 1;
			document.frm.tid.options[0].text = "-----请先选择系别-----";
			document.frm.classid.value = "";
			document.frm.classid.focus();
			document.frm.classname.value = "";
			document.getElementById("msgid").innerHTML = "";
			document.getElementById("msgname").innerHTML = "";
		}
	</script>

	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/layer.js"></script>
	<script type="text/javascript" src="js/messages_zh.min.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
	<script type="text/javascript" src="js/index.admin.js"></script>

</body>
</html>