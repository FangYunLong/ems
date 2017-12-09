package cn.ems.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ems.dao.impl.SpecialityDaoImpl;

public class specialityDelete extends HttpServlet {
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
		String Specid = request.getParameter("Spec_id");
		int result = SpecialityDaoImpl.deleteSpeciality(Specid);
		if(result == 1){
			request.setAttribute("msg", "删除成功");
			request.getRequestDispatcher("speciality.jsp").forward(request, response);
		}else{
			request.setAttribute("msg", "删除失败");
			request.getRequestDispatcher("speciality.jsp").forward(request, response);
		}
	}
}
