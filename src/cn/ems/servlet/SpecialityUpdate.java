package cn.ems.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ems.dao.impl.SpecialityDaoImpl;
import cn.ems.domain.Speciality;

public class SpecialityUpdate extends HttpServlet {
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
		spec.setSpecid(request.getParameter("spec_id"));
		spec.setSpec_name(request.getParameter("spec_name"));
		spec.setDeptid(request.getParameter("deptid"));
		String Specid = request.getParameter("Spec_id");
		int result = SpecialityDaoImpl.updateSpeciality(spec, Specid);
		if(result == 1){
			request.setAttribute("msg", "修改成功");
			request.getRequestDispatcher("speciality.jsp").forward(request, response);
		}else{
			request.setAttribute("msg", "修改失败,可能原因专业编号或专业名称重复");
			request.getRequestDispatcher("speciality.jsp").forward(request, response);
		}
	}
}
