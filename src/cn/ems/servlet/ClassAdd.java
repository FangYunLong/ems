package cn.ems.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ems.dao.impl.ClassDaoImpl;
import cn.ems.domain.Class;


public class ClassAdd extends HttpServlet {
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
		Class c = new Class();
		c.setClassid(request.getParameter("classid").toUpperCase());
		c.setClass_name(request.getParameter("classname"));
		c.setTid(request.getParameter("tid"));
		c.setSpecid(request.getParameter("specid"));
		int result = ClassDaoImpl.insertClass(c);
		if(result == 1){
			request.setAttribute("msg", "添加成功");
			request.getRequestDispatcher("class-add.jsp").forward(request, response);
		}else{
			request.setAttribute("msg", "添加失败");
			request.getRequestDispatcher("class-add.jsp").forward(request, response);
		}
	}
}
