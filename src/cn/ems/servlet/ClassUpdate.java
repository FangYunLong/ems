package cn.ems.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ems.dao.impl.ClassDaoImpl;
import cn.ems.domain.Class;

public class ClassUpdate extends HttpServlet {

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
		String Classid = request.getParameter("Class_id");
		Class Class = new Class();
		Class.setClassid(request.getParameter("class_id"));
		Class.setClass_name(request.getParameter("class_name"));
		Class.setTid(request.getParameter("tid"));
		Class.setSpecid(request.getParameter("specid"));
		int result = ClassDaoImpl.updateClass(Class, Classid);
		if(result == 1){
			request.setAttribute("msg", "修改成功");
			request.getRequestDispatcher("class.jsp").forward(request, response);
		}else{
			request.setAttribute("msg", "修改失败,可能原因班级编号或班级名称重复");
			request.getRequestDispatcher("class.jsp").forward(request, response);
		}
	}
}
