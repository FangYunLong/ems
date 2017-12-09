package cn.ems.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ems.dao.impl.AdminDaoIpml;
import cn.ems.domain.Admin;

public class AdminUpdate extends HttpServlet {

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
		String old_pass = request.getParameter("old_pass");
		String new_pass = request.getParameter("new_pass");
		List<Admin> oldpass = AdminDaoIpml.getAdminByUsername(username);
		if(old_pass.equals(oldpass.get(0).getPassword())){
			Admin admin = new Admin();
			admin.setUsername(username);
			admin.setPassword(new_pass);
			int result = AdminDaoIpml.UpdatePassword(admin);
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
