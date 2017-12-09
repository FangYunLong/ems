package cn.ems.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.awt.RepaintArea;

import cn.ems.dao.impl.ScoreInfoDaoImpl;

public class ScoreUpdate extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int result = 0;
		String score = request.getParameter("score");
		String retestscore = request.getParameter("retestscore");
		String repeatscore = request.getParameter("repeatscore");
		String student_id = request.getParameter("student_id");
		String cid = request.getParameter("cid");
		System.out.println(student_id+cid+score);
		System.out.println(retestscore+repeatscore);
		if (retestscore.equals("null") && repeatscore.equals("null")) {
			result = ScoreInfoDaoImpl.updateScore(student_id, cid, score);
		}
		else if (repeatscore.equals("null")) {
			result = ScoreInfoDaoImpl.updateRetestScore(student_id, cid, score,retestscore);
		}
		else if (retestscore.equals("null")) {
			result = ScoreInfoDaoImpl.updateRepeatScore(student_id, cid, score,repeatscore);
		}
		else {
			result = ScoreInfoDaoImpl.updateAllScore(student_id, cid, score,retestscore,repeatscore);
		}	
		if(result == 1){
			request.setAttribute("msg", "修改成功");
			request.getRequestDispatcher("scoreinfo.jsp").forward(request, response);
		}else{
			request.setAttribute("msg", "修改失败");
			request.getRequestDispatcher("scoreinfo.jsp").forward(request, response);
		}
	}

}
