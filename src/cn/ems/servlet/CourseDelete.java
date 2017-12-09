package cn.ems.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ems.dao.impl.CourseDaoIpml;


public class CourseDelete extends HttpServlet {
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
		String cid = request.getParameter("c_id");
		int result = CourseDaoIpml.deleteCourse(cid);
		if(result == 1){
			request.setAttribute("msg", "删除成功");
			request.getRequestDispatcher("course.jsp").forward(request, response);
		}else{
			request.setAttribute("msg", "删除失败");
			request.getRequestDispatcher("course.jsp").forward(request, response);
		}
	}
}
