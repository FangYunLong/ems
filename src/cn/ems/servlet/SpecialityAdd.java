package cn.ems.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ems.dao.impl.SpecialityDaoImpl;
import cn.ems.domain.Speciality;

public class SpecialityAdd extends HttpServlet {

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
		Speciality spec = new Speciality();
		spec.setSpecid(request.getParameter("specid").toUpperCase());
		spec.setSpec_name(request.getParameter("specname"));
		spec.setDeptid(request.getParameter("deptid"));
		int result = SpecialityDaoImpl.insertSpeciality(spec);
		if(result == 1){
			request.setAttribute("msg", "添加成功");
			request.getRequestDispatcher("speciality-add.jsp").forward(request, response);
		}else{
			request.setAttribute("msg", "添加失败");
			request.getRequestDispatcher("speciality-add.jsp").forward(request, response);
		}
	}
}
