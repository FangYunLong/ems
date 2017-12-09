package cn.ems.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ems.dao.impl.CourseDaoIpml;
import cn.ems.domain.Course;

public class CourseAdd extends HttpServlet {

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
		Course course = new Course();
		course.setCid(request.getParameter("cid").toUpperCase());
		course.setCour_name(request.getParameter("cname"));
		course.setCredits(Float.parseFloat(request.getParameter("credits")));
		course.setSpecid(request.getParameter("specid"));
		course.setTid(request.getParameter("tid"));
		course.setSchoolyear(request.getParameter("schoolyear"));
		course.setSemester(request.getParameter("semester"));
		int result = CourseDaoIpml.insertCourse(course);
		if(result == 1){
			request.setAttribute("msg", "添加成功");
			request.getRequestDispatcher("course-add.jsp").forward(request, response);
		}else{
			request.setAttribute("msg", "添加失败");
			request.getRequestDispatcher("course-add.jsp").forward(request, response);
		}
	}
}
