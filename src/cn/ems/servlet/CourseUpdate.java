package cn.ems.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ems.dao.impl.CourseDaoIpml;
import cn.ems.domain.Course;

public class CourseUpdate extends HttpServlet {
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
		String cid = request.getParameter("C_id");
		Course course = new Course();
		course.setCid(request.getParameter("c_id"));
		course.setCour_name(request.getParameter("cour_name"));
		course.setCredits(Float.parseFloat(request.getParameter("credits")));
		course.setTid(request.getParameter("tid"));
		course.setSpecid(request.getParameter("specid"));
		course.setSchoolyear(request.getParameter("schoolyear"));
		course.setSemester(request.getParameter("semester"));
		int result = CourseDaoIpml.updateCourse(course, cid);
		if(result == 1){
			request.setAttribute("msg", "修改成功");
			request.getRequestDispatcher("course.jsp").forward(request, response);
		}else{
			request.setAttribute("msg", "修改失败");
			request.getRequestDispatcher("course.jsp").forward(request, response);
		}
	}
}
