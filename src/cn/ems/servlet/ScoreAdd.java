package cn.ems.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ems.dao.impl.ScoreInfoDaoImpl;
import cn.ems.domain.Score;

public class ScoreAdd extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Score score = new Score();
		score.setCid(request.getParameter("cid"));
		score.setStudent_id(request.getParameter("student_id"));
		score.setScore(request.getParameter("score"));
		System.err.println(score.getStudent_id());
		int result = ScoreInfoDaoImpl.insertScore(score);
		if(result == 1){
			request.setAttribute("msg", "添加成功");
			request.getRequestDispatcher("score-add.jsp").forward(request, response);
		}else{
			request.setAttribute("msg", "已存在成绩");
			request.getRequestDispatcher("score-add.jsp").forward(request, response);
		}
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
