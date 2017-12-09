package cn.ems.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ems.dao.impl.DepartmentDaoImpl;
import cn.ems.domain.Department;

public class DepartmentAdd extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Department department = new Department();
		department.setDeptid(request.getParameter("deptid"));
		department.setDept_name(request.getParameter("dept_name"));
		department.setDean(request.getParameter("tid"));
		
		int result = DepartmentDaoImpl.addDepartment(department);
		if(result == 1){
			request.setAttribute("msg", "添加成功");
			request.getRequestDispatcher("department_add.jsp").forward(request, response);
		}else{
			request.setAttribute("msg", "添加失败");
			request.getRequestDispatcher("department_add.jsp").forward(request, response);
		}

		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
