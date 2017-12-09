package cn.ems.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ems.dao.impl.ClassDaoImpl;
import cn.ems.dao.impl.SpecialityDaoImpl;

public class ClassDelete extends HttpServlet {
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
		String class_id = request.getParameter("class_id");
		int result = ClassDaoImpl.deleteClass(class_id);
		if(result == 1){
			request.setAttribute("msg", "删除成功");
			request.getRequestDispatcher("class.jsp").forward(request, response);
		}else{
			request.setAttribute("msg", "删除失败");
			request.getRequestDispatcher("class.jsp").forward(request, response);
		}
	}
}
