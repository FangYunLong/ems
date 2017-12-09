<%@page import="cn.ems.dao.impl.SpecialityDaoImpl"%>
<%@page import="cn.ems.domain.Department"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<LINK rel="Bookmark" href="/favicon.ico" >
<LINK rel="Shortcut Icon" href="/favicon.ico" />
<link rel="stylesheet" type="text/css" href="css/min.css" />
<link rel="stylesheet" type="text/css" href="css/admin.css" />
<link rel="stylesheet" type="text/css" href="css/iconfont.css" />
<link rel="stylesheet" type="text/css" href="css/icheck.css" />
<link rel="stylesheet" type="text/css" href="skin/default/skin.css" id="skin" />

<script type="text/javascript">
	var req , flagID , flagName;
	function init(){
		if(window.XMLHttpRequest){
			req = new XMLHttpRequest();
		} else if(window.ActiveXObject){
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	
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
		init();
		var specid = document.getElementById("specid");
		var validate = /^[sS]\d{1,2}$/;
		if(specid.value == ""){
			document.getElementById("msgid").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入专业编号,例如 S1 (不区分大小写)</font>";
			flagID = false;
		} else if(!validate.test(specid.value)){
			document.getElementById("msgid").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入正确格式,例如 S1 (不区分大小写)</font>";
			flagID = false;
		} else {
			var url = "CheckSpecId.jsp?id=" + escape(specid.value);
			req.open("GET", url, true);
			req.onreadystatechange = function() {
				if(4 == req.readyState){
					if(200 == req.status){
						var msg = req.responseXML.getElementsByTagName("msg")[0].childNodes[0].nodeValue;
						if(msg == "valid"){
							document.getElementById("msgid").innerHTML = "<img src='images/Correct.png' width='30' heigt='30'>";
							flagID = true;
						} else if(msg == "invalid"){
							document.getElementById("msgid").innerHTML = "<font color = 'red' size = 3>&nbsp;抱歉，专业编号已存在</font>";
							flagID = false;
						}
					}
				}
			};
			req.send(null);
		}
	}
	
	function checkSpecName(){
		init();
		var specname = document.getElementById("specname").value;
		var validate = /^[\u4e00-\u9fa5]+/;
		if(specname == ""){
			document.getElementById("msgname").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入专业名称,例如 软件工程</font>";
			flagName = false;
		} else if(!validate.test(specname)){
			document.getElementById("msgname").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入正确格式,例如 软件工程</font>";
			flagName = false;
		} else {
			var url = "CheckSpecName.jsp?name=" + encodeURI(specname);
			req.open("GET",url,true);
			req.onreadystatechange = function() {
				if(4 == req.readyState){
					if(200 == req.status){
						var msg = req.responseXML.getElementsByTagName("msg")[0].childNodes[0].nodeValue;
						if(msg == "invalid"){
							document.getElementById("msgname").innerHTML = "<font color = 'red' size = 3>&nbsp;抱歉，专业名称已存在</font>";
							flagName = false;
						} else if(msg == "valid"){
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

<title>新增专业</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 专业管理 <span class="c-gray en">&gt;</span> 新增专业 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<article class="page-container">
	<div id="msg">
		<%
			if(request.getAttribute("msg") != null)
				out.print(request.getAttribute("msg"));
		%>
	</div>
	<script type="text/javascript">
		setTimeout("document.getElementById('msg').style.display='none'", 2000);
	</script>
	<form action="SpecialityAdd" method="post" class="form form-horizontal" id="form-member-add" name="frm">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>专业编号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder=""
					id="specid" name="specid" style="width: 800px" maxlength="3" onblur="checkSpecId()"> 
				<span id="msgid"></span>
			</div>
		</div>	
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>专业名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder=""
					id="specname" name="specname" style="width: 800px" onblur="checkSpecName()" maxlength="20"> 
				<span id="msgname"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>所属系别：</label>
			<div class="formControls col-xs-8 col-sm-9">
			 <span class="select-box" style="width: 800px">
				<select class="select" size="1" name="deptid" id="deptid">
					<option value="" selected>-----请选择系别-----</option>
				<%
					List<Department> list = SpecialityDaoImpl.getDepartment();
					for(Iterator<Department> iter = list.iterator();iter.hasNext();){
						Department dept = iter.next();
				%>
					<option value=<%=dept.getDeptid()%>><%=dept.getDept_name()%></option>
				<%
					}
				%>
				</select>
			 </span> </div>
			</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit"
					value="&nbsp;&nbsp;添加&nbsp;&nbsp;" onclick="return checkFrm()">&nbsp; 
				<input class="btn btn-primary radius" type="button"
					value="&nbsp;&nbsp;重置&nbsp;&nbsp;" onclick="resetForm()">
			</div>
		</div>
	</form>
</article>

<script type="text/javascript">
	function resetForm(){
		document.getElementById("specid").value = "";
		document.getElementById("specid").focus();
		document.getElementById("msgid").innerHTML = "";
		document.getElementById("specname").value = "";
		document.getElementById("msgname").innerHTML = "";
		document.frm.deptid.selectedIndex = 0;
	}
</script>

<script type="text/javascript" src="js/jquery.min.js"></script> 
<script type="text/javascript" src="js/layer.js"></script> 
<script type="text/javascript" src="js/messages_zh.min.js"></script> 
<script type="text/javascript" src="js/index.js"></script> 
<script type="text/javascript" src="js/index.admin.js"></script> 

</body>
</html>
