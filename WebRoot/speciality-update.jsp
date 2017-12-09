<%@page import="cn.ems.dao.impl.SpecialityDaoImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="cn.ems.domain.Department"%>

<%
	List<Department> dept = SpecialityDaoImpl.getDepartment();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
  	<script type="text/javascript">
  	var flagID , flagName;
  	function checkFrm(){
		if(flagID && flagName){
			if(document.frm.deptid.selectedIndex != 0){
				return true;
			} else {
				alert("请选择系别");
				return false;
			}
		} else if(!flagID && !flagName){
			checkSpecId();
			checkSpecName();
			return false;
		} else if(flagID && !flagName){
			checkSpecName();
			return false;
		} else if(!flagID && flagName){
			checkSpecId();
			return false;
		}
	}
	
	function checkSpecId(){
		var specid = document.getElementById("spec_id");
		var validate = /^[sS]\d{1,2}$/;
		if(specid.value == ""){
			document.getElementById("msgid").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入专业编号,例如 S1</font>";
			flagID = false;
		} else if(!validate.test(specid.value)){
			document.getElementById("msgid").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入正确格式,例如 S1</font>";
			flagID = false;
		} else {
			flagID = true;
		}
	}
	
	function checkSpecName(){
		var specname = document.getElementById("spec_name").value;
		var validate = /^[\u4e00-\u9fa5]+/;
		if(specname == ""){
			document.getElementById("msgname").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入专业名称,例如 软件工程</font>";
			flagName = false;
		} else if(!validate.test(specname)){
			document.getElementById("msgname").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入正确格式,例如 软件工程</font>";
			flagName = false;
		} else {
			flagName = true;
		}
	}
	
	function bodyOnload() {
		checkSpecId();
		checkSpecName();
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
		action="SpecialityUpdate">
		<input type="hidden" name="Spec_id" value="<%=request.getParameter("Spec_id") %>">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>专业编号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="spec_id" id="spec_id"
					value="<%=request.getParameter("Spec_id") %>" style="width: 800" onblur="checkSpecId()">
				<span id="msgid"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>专业名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" autocomplete="off" id="spec_name"
					name="spec_name" value="<%=request.getParameter("Spec_name") %>" style="width: 800" onblur="checkSpecName()">
				<span id="msgname"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>所属系别：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select class="select" size="1" name="deptid" style="width: 800;height: 30px">
				<%
					for(Iterator<Department> iter = dept.iterator();iter.hasNext();){
						Department spec = iter.next();
				%>
					<option value=<%=spec.getDeptid()%> <%if(spec.getDept_name().equals(request.getParameter("Dept_name"))){%>selected<%}%> >
						<%=spec.getDept_name()%>
					</option>
				<%
					}
				%>
				</select>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit"
					value="&nbsp;&nbsp;修改&nbsp;&nbsp;" onclick="return checkFrm()"> &nbsp;
				<input class="btn btn-primary radius" type="button"
					value="&nbsp;&nbsp;返回&nbsp;&nbsp;" onclick="window.location.href='speciality.jsp'">
			</div>
		</div>
	</form>

	</article>
  </body>
</html>
