package cn.ems.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ems.dao.impl.StudentDaoImpl;
import cn.ems.domain.Student;

public class NewPasswordServlet extends HttpServlet {

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
		PrintWriter out = response.getWriter();
		String username = request.getParameter("user");
		String old_password = request.getParameter("old_pass");
		String new_password = request.getParameter("new_pass");
		List<Student> list = StudentDaoImpl.getPasswordById(username);
		if(old_password.equals(list.get(0).getPassword())){
			Student student = new Student();
			student.setStudent_name(username);
			student.setPassword(new_password);
			int result = StudentDaoImpl.UpdatePassword(student);
			if(result == 1){
				out.print("<script>");
				out.print("alert('密码修改成功！');");
				out.print("window.history.back(-1);");
				out.print("</script>");
			}
		}else {
			out.print("<script>");
			out.print("alert('旧密码不正确？！');");
			out.print("window.history.back(-1);");
			out.print("</script>");
		}
	}
}
