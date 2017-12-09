package cn.ems.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sound.midi.MidiDevice.Info;

import com.sun.org.apache.regexp.internal.recompile;
import com.sun.xml.internal.bind.v2.model.core.ID;

import cn.ems.db.ConnectionFactory;
import cn.ems.db.ControlDB;
import cn.ems.db.DbClose;
import cn.ems.domain.Classes;
import cn.ems.domain.Course;
import cn.ems.domain.Score;
import cn.ems.domain.ScoreInfo;
import cn.ems.domain.Student;
import cn.ems.domain.StudentInfo;

public class ScoreInfoDaoImpl {

	// 获取记录总数
	public static int getCount() {
		Connection conn = ConnectionFactory.getConnection();
		Statement stmt = null;
		String sql = "select * from scoreinfo";
		ResultSet rs = null;
		int Records = 0;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			rs.last();
			Records = rs.getRow();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Records;
	}

	public static void deleteInfo(String student_id) {
		Connection conn = ConnectionFactory.getConnection();
		String sql = "delete from student where student_id= '" + student_id
				+ "' ";
		try {
			ControlDB.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbClose.close(conn);
		}
	}

	public static List<ScoreInfo> getScoreInfo(int pageNo, int pageSize) {
		Connection conn = ConnectionFactory.getConnection();
		String sql = "select  * from scoreinfo  limit " + (pageNo - 1)
				* pageSize + "," + pageSize;

		List<ScoreInfo> list = new ArrayList<ScoreInfo>();
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			while (rs.next()) {
				ScoreInfo info = new ScoreInfo();
				info.setStudent_id(rs.getString("student_id"));
				info.setStudent_name(rs.getString("student_name"));
				info.setCour_name(rs.getString("cour_name"));
				info.setCid(rs.getString("cid"));
				info.setCredits(rs.getFloat("credits"));
				info.setScore(rs.getString("score"));
				info.setClass_name(rs.getString("class_name"));
				info.setSchoolyear(rs.getString("schoolyear"));
				info.setSemester(rs.getString("semester"));
				info.setRepeatScore(rs.getString("repeatScore"));
				info.setRetestScore(rs.getString("retestScore"));
				info.setDept_name(rs.getString("dept_name"));
				info.setSpec_name(rs.getString("spec_name"));
				list.add(info);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbClose.close(conn);
		}
		return list;

	}
	
	public static List<ScoreInfo> getScoreInfo(String id) {
		Connection conn = ConnectionFactory.getConnection();
		String sql = "select  cid,cour_name from scoreinfo  where student_id= '"+id+"' order by cid " ;

		List<ScoreInfo> list = new ArrayList<ScoreInfo>();
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			while (rs.next()) {
				ScoreInfo info = new ScoreInfo();
				info.setCour_name(rs.getString("cour_name"));
				info.setCid(rs.getString("cid"));
				list.add(info);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbClose.close(conn);
		}
		return list;

	}
	
	public static ScoreInfo getScoreInfo(String student_id,String cid) {
		Connection conn = ConnectionFactory.getConnection();
		String sql = "select  * from scoreinfo  where student_id= '"+student_id+"' and cid='"+cid+"' " ;
		ScoreInfo info =null;
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			if (rs.next()) {
				info = new ScoreInfo();
				info.setStudent_id(rs.getString("student_id"));
				info.setStudent_name(rs.getString("student_name"));
				info.setCour_name(rs.getString("cour_name"));
				info.setCid(rs.getString("cid"));
				info.setCredits(rs.getFloat("credits"));
				info.setScore(rs.getString("score"));
				info.setClass_name(rs.getString("class_name"));
				info.setSchoolyear(rs.getString("schoolyear"));
				info.setSemester(rs.getString("semester"));
				info.setRepeatScore(rs.getString("repeatScore"));
				info.setRetestScore(rs.getString("retestScore"));
				info.setDept_name(rs.getString("dept_name"));
				info.setSpec_name(rs.getString("spec_name"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbClose.close(conn);
		}
		return info;

	}


	public static List<ScoreInfo> findScoreInfoBykw(String keyword) {

		Connection conn = ConnectionFactory.getConnection();
		String sql = "select * from scoreinfo where 1=1";

		if (keyword != null && !keyword.trim().equals("")) {
			sql += " and (student_id like '%" + keyword
					+ "%' or student_name like '%" + keyword
					+ "%' or cour_name like '%" + keyword
					+ "%' or credits like '%" + keyword
					+ "%' or score like '%" + keyword
					+ "%' or class_name like '%" + keyword
					+ "%' or retestScore like '%" + keyword
					+ "%' or repeatScore like '%" + keyword
					+ "%' or dept_name like '%" + keyword
					+ "%' or semester like '%" + keyword
					+ "%' or cid like '%" + keyword 
					+ "%' or tid like '%" + keyword 
					+ "%' or spec_name like '%" + keyword
					+ "%' or schoolyear like '%" + keyword + "%')  ";
		}

		List<ScoreInfo> list = new ArrayList<ScoreInfo>();
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			while (rs.next()) {
				ScoreInfo info = new ScoreInfo();
				info.setStudent_id(rs.getString("student_id"));
				info.setStudent_name(rs.getString("student_name"));
				info.setCour_name(rs.getString("cour_name"));
				info.setCid(rs.getString("cid"));
				info.setCredits(rs.getFloat("credits"));
				info.setScore(rs.getString("score"));
				info.setClass_name(rs.getString("class_name"));
				info.setSchoolyear(rs.getString("schoolyear"));
				info.setSemester(rs.getString("semester"));
				info.setRepeatScore(rs.getString("repeatScore"));
				info.setRetestScore(rs.getString("retestScore"));
				info.setDept_name(rs.getString("dept_name"));
				info.setSpec_name(rs.getString("spec_name"));
				list.add(info);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbClose.close(conn);
		}
		return list;

	}
	
	public static List<ScoreInfo> findScoreInfo(String keyword,String Tid) {

		Connection conn = ConnectionFactory.getConnection();
		String sql = "select * from scoreinfo where 1=1 and tid ='"+Tid+"' ";

		if (keyword != null && !keyword.trim().equals("")) {
			sql += " and (student_id like '%" + keyword
					+ "%' or student_name like '%" + keyword
					+ "%' or cour_name like '%" + keyword
					+ "%' or credits like '%" + keyword
					+ "%' or score like '%" + keyword
					+ "%' or class_name like '%" + keyword
					+ "%' or retestScore like '%" + keyword
					+ "%' or repeatScore like '%" + keyword
					+ "%' or dept_name like '%" + keyword
					+ "%' or semester like '%" + keyword
					+ "%' or cid like '%" + keyword 
					+ "%' or spec_name like '%" + keyword
					+ "%' or schoolyear like '%" + keyword + "%')  ";
		}

		List<ScoreInfo> list = new ArrayList<ScoreInfo>();
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			while (rs.next()) {
				ScoreInfo info = new ScoreInfo();
				info.setStudent_id(rs.getString("student_id"));
				info.setStudent_name(rs.getString("student_name"));
				info.setCour_name(rs.getString("cour_name"));
				info.setCid(rs.getString("cid"));
				info.setCredits(rs.getFloat("credits"));
				info.setScore(rs.getString("score"));
				info.setClass_name(rs.getString("class_name"));
				info.setSchoolyear(rs.getString("schoolyear"));
				info.setSemester(rs.getString("semester"));
				info.setRepeatScore(rs.getString("repeatScore"));
				info.setRetestScore(rs.getString("retestScore"));
				info.setDept_name(rs.getString("dept_name"));
				info.setSpec_name(rs.getString("spec_name"));
				list.add(info);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbClose.close(conn);
		}
		return list;

	}

	public static Course getspecid(String cid) {
		
		Connection conn = ConnectionFactory.getConnection();
		String sql = "select * from course where  cid = '"+cid+"' ";
		Course list = new Course();
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			if (rs.next()) {
				list.setSpecid(rs.getString("specid"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbClose.close(conn);
		}
		return list;
	}
	
	public static List<Classes> getClassid(String specid) {
		
		Connection conn = ConnectionFactory.getConnection();
		String sql = "select * from class where  specid = '"+specid+"' ";
		List<Classes> list = new ArrayList<Classes>();
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			while (rs.next()) {
				Classes classes = new Classes();
				classes.setClassid(rs.getString("classid"));
				list.add(classes);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbClose.close(conn);
		}
		return list;
	}
	
	public static List<Student> getStudent_id(String cid) {
		
		Connection conn = ConnectionFactory.getConnection();
		String sql = "select * from student where  classid = '"+cid+"' ";
		List<Student> list = new ArrayList<Student>();
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			while (rs.next()) {
				Student student = new Student();
				student.setStudent_id(rs.getString("student_id"));
				list.add(student);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbClose.close(conn);
		}
		return list;
	}

	public static Student getStudent_Name(String id) {
		
		Connection conn = ConnectionFactory.getConnection();
		String sql = "select * from student where  student_id = '"+id+"' ";
		Student student =null;
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			if (rs.next()) {
				student = new Student();
				student.setStudent_name(rs.getString("student_name"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbClose.close(conn);
		}
		return student;
	}
	
	public static int updateScore(String student_id , String cid , String score){
		int result = 0;
		String sql = "update score set score=? where student_id=? and cid=?";
		try {
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, score);
			pstmt.setString(2, student_id);
			pstmt.setString(3, cid);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static int updateRetestScore(String student_id , String cid , String score,String retestscore){
		int result = 0;
		String sql = "update score set score=? , retestscore=? where student_id=? and cid=?";
		try {
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, score);
			pstmt.setString(2, retestscore);
			pstmt.setString(3, student_id);
			pstmt.setString(4, cid);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static int updateRepeatScore(String student_id , String cid , String score, String repeatscore){
		int result = 0;
		String sql = "update score set score=? , repeatscore=? where student_id=? and cid=?";
		try {
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, score);
			pstmt.setString(2, repeatscore);
			pstmt.setString(3, student_id);
			pstmt.setString(4, cid);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static int updateAllScore(String student_id , String cid ,String score, String retestscore, String repeatscore){
		int result = 0;
		String sql = "update score set score=?, retestscore=?, repeatscore=? where student_id=? and cid=?";
		try {
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, score);
			pstmt.setString(2, retestscore);
			pstmt.setString(3, repeatscore);
			pstmt.setString(4, student_id);
			pstmt.setString(5, cid);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static int insertScore(Score score){
		int result = 0;
		String sql = "insert into score (student_id,cid,score) values(?,?,?)";
		try {
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, score.getStudent_id());
			pstmt.setString(2, score.getCid());
			pstmt.setString(3, score.getScore());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
