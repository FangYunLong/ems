<%@page import="cn.ems.dao.impl.StudentDaoImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="cn.ems.domain.*"%>
<%@ page import="java.sql.*,  cn.ems.dao.impl.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	String action = request.getParameter("action");
	List<Classes> cs = ClassDaoImpl.getClasses();
	if (action != null && action.trim().equals("add")) {
		String student_id = request.getParameter("student_id");
		String student_name = request.getParameter("student_name");
		String sex = request.getParameter("sex");
		String nation = request.getParameter("nation");
		String birthday = request.getParameter("birthday");
		String id_card = request.getParameter("id_card");
		String classid = request.getParameter("classid");
		String admission_date = request.getParameter("admission_date");
		String study_length = request.getParameter("study_length");
		String grade = request.getParameter("grade");
		
		Student s = new Student();
		s.setStudent_id(student_id);
		s.setPassword(student_id);
		s.setStudent_name(student_name);
		s.setSex(sex);
		s.setBirthday(birthday);
		s.setAdmission_date(admission_date);
		s.setClassid(classid);
		s.setId_card(id_card);
		s.setNation(nation);
		s.setStudy_length(study_length);
		s.setGrade(Integer.parseInt(grade));
		StudentDaoImpl.addStudent(s);
		out.print("插入成功");
	}
%>

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
<link rel="stylesheet" type="text/css" href="skin/default/skin.css"
	id="skin" />
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/layer.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript">
	var req, flagID, flagName;
	function init() {
		if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}

	function checkNull()  
	{  
	     var num=0;  
	     var str="";  
	     $("input[type$='text']").each(function(n){  
	          if($(this).val()=="")  
	          {  
	               num++;  
	               str+=$(this).attr("msg")+"不能为空！\r\n";  
	          }  
	     });  
	     if(num>0)  
	     {  
	          alert(str);  
	          return false;  
	     }  
	     else  
	     {  
	          return true;  
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
	
	function changeChild2() {
		init();
		var url = "GetSpecialityChilds-add.jsp?id="
				+ escape(document.frm.specid.options[document.frm.specid.selectedIndex].value);
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
	
	function checkStudentId() {
		init();
		var student_id = document.getElementById("student_id").value;
		var validate = /^[0-9]{2,}$/;
		if (student_id == "") {
			document.getElementById("msgid").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入学号</font>";
			flagName = false;
		} else if (!validate.test(student_id)) {
			document.getElementById("msgid").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入正确格式</font>";
			document.getElementById("student_id").value="";
			flagName = false;
		} else {
			var url = "CheckStudentId.jsp?keyword=" + student_id;
			req.open("GET", url, true);
			req.onreadystatechange = function() {
				if(4 == req.readyState){
					if(200 == req.status){
						var msg = req.responseXML.getElementsByTagName("msg")[0].childNodes[0].nodeValue;
						if(msg == "valid"){
							document.getElementById("msgid").innerHTML = "<font color = 'green' size = 3>&nbsp;可用</font>";
							flagID = true;
						} else if(msg == "invalid"){
							document.getElementById("msgid").innerHTML = "<font color = 'red' size = 3>&nbsp;该学号已存在</font>";
							document.getElementById("student_id").value="";
							flagID = false;
						}
					}
				}
			};
			req.send(null);
		}
	}

	function checkStudentName() {
		init();
		var student_name = document.getElementById("student_name").value;
		var validate = /^[\u4e00-\u9fa5]{2,}$/;
		if (student_name == "") {
			document.getElementById("msgname").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入姓名</font>";
			flagName = false;
		} else if (!validate.test(student_name)) {
			document.getElementById("msgname").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入正确格式,两个汉字以上</font>";
			document.getElementById("student_name").value="";
			flagName = false;
		} else {
			document.getElementById("msgname").innerHTML = "";
			flagName = false;
		}
	}
	function checkSex() {
		init();
		var sex = document.getElementById("sex").value;
		var validate = /^['男'|'女']$/;
		if (sex == "") {
			document.getElementById("msgsex").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入性别</font>";
			flagName = false;
		} else if (!validate.test(sex)) {
			document.getElementById("msgsex").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入正确格式,男或女</font>";
			document.getElementById("sex").value="";
			flagName = false;
		} else {
			document.getElementById("msgsex").innerHTML = "";
			flagName = false;
		}
	}
	function checkNation() {
		init();
		var nation = document.getElementById("nation").value;
		var validate = /^[\u4E00-\u9FA5]{2,5}(?:·[\u4E00-\u9FA5]{2,5})*$/;
		if (nation == "") {
			document.getElementById("msgnation").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入民族</font>";
			flagName = false;
		} else if (!validate.test(nation)) {
			document.getElementById("msgnation").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入正确格式</font>";
			document.getElementById("nation").value="";
			flagName = false;
		} else {
			document.getElementById("msgnation").innerHTML = "";
			flagName = false;
		}
	}
	function checkBirthday() {
		init();
		var birthday = document.getElementById("birthday").value;
		var validate = /^(19|20)\d{2}-(1[0-2]|0?[1-9])-(0?[1-9]|[1-2][0-9]|3[0-1])$/;
		if (birthday == "") {
			document.getElementById("msgbirthday").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入出生日期</font>";
			flagName = false;
		} else if (!validate.test(birthday)) {
			document.getElementById("msgbirthday").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入正确格式</font>";
			document.getElementById("birthday").value="";
			flagName = false;
		} else {
			document.getElementById("msgbirthday").innerHTML = "";
			flagName = false;
		}
	}
	function checkAdmissionDate() {
		init();
		var admission_date = document.getElementById("admission_date").value;
		var validate = /^(19|20)\d{2}-(1[0-2]|0?[1-9])-(0?[1-9]|[1-2][0-9]|3[0-1])$/;
		if (admission_date == "") {
			document.getElementById("msgadmission_date").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入入学日期</font>";
			flagName = false;
		} else if (!validate.test(admission_date)) {
			document.getElementById("msgadmission_date").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入正确格式</font>";
			document.getElementById("admission_date").value="";
			flagName = false;
		} else {
			document.getElementById("msgadmission_date").innerHTML = "";
			flagName = false;
		}
	}
	function checkIdCard() {
		init();
		var idcard = document.getElementById("id_card").value;
		var validate = /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{4}$/;
		if (idcard == "") {
			document.getElementById("msgidcard").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入身份证号码</font>";
			flagName = false;
		} else if (!validate.test(idcard)) {
			document.getElementById("msgidcard").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入正确格式</font>";
			document.getElementById("id_card").value="";
			flagName = false;
		} else {
			var url = "CheckIDcard.jsp?keyword=" + idcard;
			req.open("GET", url, true);
			req.onreadystatechange = function() {
				if(4 == req.readyState){
					if(200 == req.status){
						var msg = req.responseXML.getElementsByTagName("msg")[0].childNodes[0].nodeValue;
						if(msg == "valid"){
							document.getElementById("msgidcard").innerHTML = "<font color = 'green' size = 3>&nbsp;可用</font>";
							flagID = true;
						} else if(msg == "invalid"){
							document.getElementById("msgidcard").innerHTML = "<font color = 'red' size = 3>&nbsp;该身份证号码已存在</font>";
							document.getElementById("id_card").value="";
							flagID = false;
						}
					}
				}
			};
			req.send(null);
		}
	}
	function checkStudyLength() {
		init();
		var study_length = document.getElementById("study_length").value;
		var validate = /^\d[1]*$/;
		if (study_length == "") {
			document.getElementById("msgstudy_length").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入学制</font>";
			flagName = false;
		} else if (!validate.test(study_length)) {
			document.getElementById("msgstudy_length").innerHTML = "<font color = 'red' size = 3>&nbsp;请输入正确格式</font>";
			document.getElementById("study_length").value="";
			flagName = false;
		} else {
			document.getElementById("msgstudy_length").innerHTML = "";
			flagName = false;
		}
	}
</script>
<style type="text/css">
.input-text {
	width: 400px;
}
</style>
<title>新增学生</title>
</head>
<body>
	<article class="page-container">
		<form class="form form-horizontal" id="form-good-add" method="post" name="frm"
			action="student-add.jsp">
			<input type="hidden" name="action" value="add">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red"></span>学号：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" name="student_id"
						id="student_id" placeholder="请输入学号，如201435020210"
						onblur="checkStudentId()" msg="学号"><span id="msgid"></span>
				</div>
			</div>
				<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>所属系别：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select class="select" size="1" name="deptid" id="deptid"
					style="width: 400;height: 30px" onchange="changeChild()">
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
				class="c-red"></span>所属专业：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select class="select" size="1" name="specid"
					style="width: 400;height: 30px" title="" id="specid" onchange="changeChild2()">
					<option value="-1">-----请先选择系别-----</option>
				</select>
			</div>
		</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red"></span>班级：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<select class="select" size="1" name="classid"
						style="height: 30px; width: 400" id="classid" >
						<option value="-1" selected>-----请先选择专业-----</option>				
					</select>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red"></span>姓名：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" autocomplete="off"
						id="student_name" name="student_name" onblur="checkStudentName()"  msg="姓名"><span
						id="msgname" ></span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red"></span>性别：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<select class="select" size="1" name="sex"
						style="width: 400 ;height: 30px;">
						<option value="男">男</option>
						<option value="女">女</option>
					</select>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red"></span>民族：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" autocomplete="off"
						name="nation" id="nation" onblur="checkNation()" msg="民族"><span
						id="msgnation" ></span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red"></span>出生日期：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" name="birthday"
						onfocus="WdatePicker({Date:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})"
						id="birthday" class="input-text Wdate" style="width:120px;"
						onblur="checkBirthday()" msg="出生日期"><span id="msgbirthday"></span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red"></span>身份证号：</label>
				<div class="formControls col-xs-8 col-sm-9 skin-minimal">
					<input type="text" class="input-text" name="id_card" id="id_card"
						onblur="checkIdCard()" msg="身份证号"><span id="msgidcard"></span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red"></span>入学日期：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text"
						onfocus="WdatePicker({Date:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})"
						id="admission_date" class="input-text Wdate" style="width:120px;"
						name="admission_date" onblur="checkAdmissionDate()" msg="入学日期"><span
						id="msgadmission_date" ></span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red"></span>学制：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text"  msg="学制" name="study_length"  id="study_length" onblur="checkStudyLength()"><span
						id="msgstudy_length" ></span>
				</div>
			</div>
			<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">当前所在级：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select class="select" size="1" name="grade"  style="width: 400 ;height: 30px;">
					<option>-----请选择该生当前所在级-----</option>
					<%
						for (int i = 2010; i <= 2100; i++) {
					%>
						<option value="<%=i%>"><%=i%></option>
					<%
						}
					%>
				</select>
			</div>
		</div>
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
					<input class="btn btn-primary radius" type="submit"
						value="&nbsp;&nbsp;提交&nbsp;&nbsp;"  onclick="return checkNull()">&nbsp; <input
						class="btn btn-primary radius" type="reset"
						value="&nbsp;&nbsp;重置&nbsp;&nbsp;">
				</div>
			</div>
		</form>

	</article>

</body>
</html>