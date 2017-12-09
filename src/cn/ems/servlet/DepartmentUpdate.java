package cn.ems.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ems.dao.impl.DepartmentDaoImpl;
import cn.ems.domain.Department;

public class DepartmentUpdate extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Department dept = new Department();
		dept.setDeptid(request.getParameter("Dept_id"));
		dept.setDept_name(request.getParameter("Dept_name"));
		dept.setDean(request.getParameter("Tname"));
		dept.setOld_id(request.getParameter("Deptid"));
		boolean result = DepartmentDaoImpl.updateDepartment(dept);
		if(result){
			request.setAttribute("msg", "修改成功");
			request.getRequestDispatcher("department.jsp").forward(request, response);
		}else{
			request.setAttribute("msg", "修改失败");
			request.getRequestDispatcher("department.jsp").forward(request, response);
		}
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
