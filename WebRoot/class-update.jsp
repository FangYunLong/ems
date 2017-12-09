<%@page import="cn.ems.domain.Department"%>
<%@page import="cn.ems.domain.Speciality"%>
<%@page import="cn.ems.dao.impl.ClassDaoImpl"%>
<%@page import="cn.ems.domain.Teacher"%>
<%@page import="cn.ems.domain.ClassInfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<%
	session.setAttribute("SpecnameAjax", request.getParameter("Spec_name"));
	session.setAttribute("TnameAjax", request.getParameter("Tname"));
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<link rel="Bookmark" href="/favicon.ico">
	<link rel="Shortcut Icon" href="/favicon.ico" />
	<link rel="stylesheet" type="text/css" href="css/min.css" />
	<link rel="stylesheet" type="text/css" href="css/admin.css" />
	<title>修改信息</title>
	
	<script type="text/javascript">
		var req;
		function init(){
			if(window.XMLHttpRequest){
				req = new XMLHttpRequest();
			} else if(window.ActiveXObject){
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}
		}
		
		function changeChild(){
			
			init();
			var url = "GetDepartmentChilds.jsp?id="
					+ escape(document.frm.deptid.options[document.frm.deptid.selectedIndex].value);
			req.open("GET", url, true);
			req.onreadystatechange = callback;
			req.send(null);
		}

		function callback() {
			if (4 == req.readyState) {
				if (200 == req.status) {
					//alert(req.responseText);
					eval(req.responseText);
				}
			}
		}
		
		var flagID , flagName; 
		function checkFrm(){
			if(flagID && flagName){
				return true;
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
			var validate = /^[cC][0-9]+$/;
			var classid = document.getElementById("class_id");
			if (classid.value == "") {
				document.getElementById("msgid").innerHTML = "<font color = 'red' size = '3'>&nbsp;请输入班级编号,例如 C1</font>";
				flagID = false;
			} else if (!validate.test(classid.value)) {
				document.getElementById("msgid").innerHTML = "<font color = 'red' size = '3'>&nbsp;请输入正确格式,例如 C1</font>";
				flagID = false;
			} else{
				document.getElementById("msgid").innerHTML = "";
				flagID = true;
			}
		}

		function checkClassname() {
			var validate = /^[\u4e00-\u9fa5]{3,}\d{4}\-\d$/;
			var classname = document.getElementById("class_name");
			if(classname.value == ""){
				document.getElementById("msgname").innerHTML = "<font color = 'red' size = '3'>&nbsp;请输入班级名称,例如 软工本2014-1</font>";
				flagName = false;
			} else if(!validate.test(classname.value)){
				document.getElementById("msgname").innerHTML = "<font color = 'red' size = '3'>&nbsp;请输入正确格式,例如 软工本2014-1</font>";
				flagName = false;
			} else{
				document.getElementById("msgname").innerHTML = "";
				flagName = true;
			}
		}
		
		function bodyOnload() {
			changeChild();
			checkClassid();
			checkClassname();
		}
	</script>
	
  </head>
  
  <body onload="bodyOnload()">
  <article class="page-container">
	<form class="form form-horizontal"  method="post"
		action="ClassUpdate" name="frm">
		<input type="hidden" name="Class_id" value="<%=request.getParameter("Classid") %>">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>班级编号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="class_id" id="class_id"
					value="<%=request.getParameter("Classid") %>" style="width: 800" onblur="checkClassid()">
				<span id="msgid"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>班级名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" autocomplete="off" id="class_name"
					name="class_name" value="<%=request.getParameter("Class_name")%>" style="width: 800" onblur="checkClassname()">
				<span id="msgname"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>所属系别：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select class="select" size="1" name="deptid" style="width: 800;height: 30px" onchange="changeChild()">
					<%
						List<Department> deptList = ClassDaoImpl.getDept_Name_id();
						for(Department dept : deptList){
					%>
						<option value="<%=dept.getDeptid()%>" <%if(dept.getDept_name().equals(request.getParameter("Dept_name"))){%>selected<%}%>><%=dept.getDept_name()%></option>
					<%
						}
					%>
				</select>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>所属专业：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select class="select" size="1" name="specid" style="width: 800;height: 30px">
				</select>
			</div>
		</div>
		<div class="row cl" id="childTeach">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>班主任：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select class="select" size="1" name="tid" style="width: 800;height: 30px">
				</select>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit"
					value="&nbsp;&nbsp;修改&nbsp;&nbsp;" onclick="return checkFrm()"> &nbsp;
				<input class="btn btn-primary radius" type="button"
					value="&nbsp;&nbsp;返回&nbsp;&nbsp;" onclick="window.location.href='class.jsp'">
			</div>
		</div>
	</form>
	</article>
  </body>
</html>
