<%@page import="cn.ems.domain.Department"%>
<%@page import="cn.ems.domain.Speciality"%>
<%@page import="cn.ems.dao.impl.CourseDaoIpml"%>
<%@page import="cn.ems.domain.Teacher"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
	session.setAttribute("SpecnameAjax", request.getParameter("specname"));
	session.setAttribute("TnameAjax", request.getParameter("tname"));
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
  	<script type="text/javascript">
  		var req ,flagID , flagName , flagCredits;
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
				if(deptid >= 0 && specid >= 0 && tid >= 0 && schoolyear >= 0 && semester >= 0){
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
			var cid = document.getElementById("c_id").value;
			var validate = /^[cC]\d{1,4}$/;
			if(cid == ""){
				document.getElementById("msgid").innerHTML = "<font color='red' size = 3>请输入课程编号 例如：C1 (不区分大小写)</font>";
				flagID = false;
			}else if(!validate.test(cid)){
				document.getElementById("msgid").innerHTML = "<font color='red' size = 3>请输入正确格式 例如：C1 (不区分大小写)</font>";
				flagID = false;
			} else{
				document.getElementById("msgid").innerHTML = "";
				flagID = true;
			}
		}
		
		function checkCourseName(){
			var cname = document.getElementById("cour_name").value;
			var validate = /^[a-zA-Z\u4e00-\u9fa5]+[a-zA-Z\u4e00-\u9fa5\s\d]+/;
			if(cname == ""){
				document.getElementById("msgname").innerHTML = "<font color = 'red' size = 3>请输入课程名称</font>";
				flagName = false;
			}else if(!validate.test(cname)){
				document.getElementById("msgname").innerHTML = "<font color = 'red' size = 3>请输入正确格式(需以中文或英文开头)</font>";
				flagName = false;
			}else {
				document.getElementById("msgname").innerHTML = "";
				flagName = true;
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
				document.getElementById("msgcredits").innerHTML = "";
				flagCredits = true;
			}
		}
		
		function bodyOnload() {
			changeChild();
			checkCourseID();
			checkCourseName();
			checkCredits();
		}
  	</script>
  
    <link rel="Bookmark" href="/favicon.ico">
	<link rel="Shortcut Icon" href="/favicon.ico" />
	<link rel="stylesheet" type="text/css" href="css/min.css" />
	<link rel="stylesheet" type="text/css" href="css/admin.css" />
	<title>修改信息</title>
  </head>
  <body onload="bodyOnload()">
  <article class="page-container">
	<form class="form form-horizontal"  method="post"
		action="CourseUpdate" name="frm">
		<input type="hidden" name="C_id" value="<%=request.getParameter("c_id") %>">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>课程编号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="c_id" id="c_id"
					value="<%=request.getParameter("c_id") %>" style="width: 800" onblur="checkCourseID()">
				<span id="msgid"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>课程名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" autocomplete="off" id="cour_name"
					name="cour_name" value="<%=request.getParameter("cour_name") %>" style="width: 800" onblur="checkCourseName()">
				<span id="msgname"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>学分：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" autocomplete="off" id="credits"
					name="credits" value="<%=request.getParameter("credits") %>" style="width: 800" onblur="checkCredits()">
				<span id="msgcredits"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>所属系别：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select class="select" size="1" name="deptid" id="deptid"
					style="width: 800;height: 30px" onchange="changeChild()">
					<%
						List<Department> deptList = CourseDaoIpml.getDepartment();
						for(Department dept : deptList){
					%>
					<option value=<%=dept.getDeptid()%> <%if(request.getParameter("deptname").equals(dept.getDept_name())){%>selected<%}%> ><%=dept.getDept_name()%></option>
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
				<select class="select" size="1" name="specid" style="width: 800;height: 30px" id="specid">
				</select>	
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>任课老师：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select class="select" size="1" name="tid" style="width: 800;height: 30px" id="tid">
				</select>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>学年：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select class="select" size="1" name="schoolyear" style="width: 800;height: 30px" id="schoolyear">
					<%
						for(int i = 1999;i<=2050;i++){
					%>
						<option value=<%=i+"-"+(i+1) %> <%if(request.getParameter("schoolyear").equals(String.valueOf(i+"-"+(i+1)))){%>selected<%}%>  ><%=i+"-"+(i+1)%></option>
					<%
						}
					%>
				</select>	
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>学期：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select class="select" size="1" name="semester" id="semester" style="width: 800;height: 30px">
					<option value="第一学期" <%if(request.getParameter("semester").equals("第一学期")){%>selected<%}%> >第一学期</option>
					<option value="第二学期" <%if(request.getParameter("semester").equals("第二学期")){%>selected<%}%> >第二学期</option>
				</select>	
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit"
					value="&nbsp;&nbsp;修改&nbsp;&nbsp;" onclick="return checkFrm()"> &nbsp;
				<input class="btn btn-primary radius" type="button"
					value="&nbsp;&nbsp;返回&nbsp;&nbsp;" onclick="window.location.href='course.jsp'">
			</div>
		</div>
	</form>

	</article>
  </body>
</html>
