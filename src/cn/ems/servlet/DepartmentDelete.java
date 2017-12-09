package cn.ems.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ems.dao.impl.DepartmentDaoImpl;

public class DepartmentDelete extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String deptid = request.getParameter("Deptid");
		int result = DepartmentDaoImpl.deleteDepartment(deptid);
		if(result == 1){
			request.setAttribute("msg", "删除成功");
			request.getRequestDispatcher("department.jsp").forward(request, response);
		}else{
			request.setAttribute("msg", "删除失败");
			request.getRequestDispatcher("department.jsp").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doGet(request, response);
	}

}
