package cn.ems.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.ems.dao.impl.AdminDaoIpml;
import cn.ems.dao.impl.StudentDaoImpl;
import cn.ems.dao.impl.TeacherDaoImpl;
import cn.ems.domain.Admin;
import cn.ems.domain.Student;
import cn.ems.domain.StudentInfo;
import cn.ems.domain.Teacher;

public class LoginServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String power = request.getParameter("user");
		String admin_username = null;
		String stu_username = null;
		String te_username = null;
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		if(power.equals("管理员")){
			admin_username = request.getParameter("username");
			List<Admin> list = AdminDaoIpml.getAdminByUsername(admin_username);
			if(!list.isEmpty()){
				for(Admin admin : list){
					if(admin.getPassword().equals(password)){
						session.setAttribute("admin_username", admin_username);
						response.sendRedirect("index.jsp");
					}else {
						out.print("<script>");
						out.print("alert('用户名或密码错误！');");
						out.print("window.history.back(-1);");
						out.print("</script>");
					}
				}
			}else {
				out.print("<script>");
				out.print("alert('用户名不存在！');");
				out.print("window.history.back(-1);");
				out.print("</script>");
			}
		}
		else if(power.equals("学生")){
			stu_username = request.getParameter("username");
			List<Student> list = StudentDaoImpl.getPasswordById(stu_username);
			if(!list.isEmpty()){
				for(Student student : list){
					if(student.getPassword().equals(password)){
						session.setAttribute("stu_username", stu_username);
						session.setAttribute("studentname", student.getStudent_name());
						response.sendRedirect("StudentPage/index.jsp");
					}else {
						out.print("<script>");
						out.print("alert('用户名或密码错误！');");
						out.print("window.history.back(-1);");
						out.print("</script>");
					}
				}
			}else {
				out.print("<script>");
				out.print("alert('用户名不存在！');");
				out.print("window.history.back(-1);");
				out.print("</script>");
			}
		}else if(power.equals("教师")){
			te_username = request.getParameter("username");
			List<Teacher> list = TeacherDaoImpl.getPasswordById(te_username);
			if(!list.isEmpty()){
				for(Teacher teacher : list){
					if(teacher.getPassword().equals(password)){
						session.setAttribute("te_username", te_username);
						session.setAttribute("te_name", teacher.getTname());
						session.setMaxInactiveInterval(10 * 60);
						response.sendRedirect("teacher_index.jsp");
					}else {
						out.print("<script>");
						out.print("alert('用户名或密码错误！');");
						out.print("window.history.back(-1);");
						out.print("</script>");
					}
				}
			}else {
				out.print("<script>");
				out.print("alert('用户名不存在！');");
				out.print("window.history.back(-1);");
				out.print("</script>");
			}
		}else {
			out.print("<script>");
			out.print("alert('访客功能暂未实现！');");
			out.print("window.history.back(-1);");
			out.print("</script>");
		}
	}
}
