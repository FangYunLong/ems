package cn.ems.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.sun.xml.internal.bind.v2.model.core.ID;

import cn.ems.db.ConnectionFactory;
import cn.ems.db.ControlDB;
import cn.ems.db.DbClose;
import cn.ems.domain.Student;
import cn.ems.domain.StudentInfo;

public class StudentDaoImpl {
	public static List<StudentInfo> getStudentInfoById(String studentid) {
		List<StudentInfo> list = new ArrayList<StudentInfo>();
		String sql = "select * from studentinfo where student_id='" + studentid
				+ "'";
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			while (rs.next()) {
				StudentInfo info = new StudentInfo();
				info.setStudent_id(rs.getString(1));
				info.setStudent_name(rs.getString(2));
				info.setSex(rs.getString(3));
				info.setNation(rs.getString(4));
				info.setBirthday(rs.getString(5));
				info.setId_card(rs.getString(6));
				info.setAdmission_date(rs.getString(7));
				info.setStudy_length(rs.getString(8));
				info.setSpec_name(rs.getString(9));
				info.setDept_name(rs.getString(10));
				info.setClass_name(rs.getString(11));
				info.setGrade(rs.getInt(12));
				list.add(info);
			}
		} catch (Exception e) {
		}
		return list;
	}

	public static List<Student> getPasswordById(String studentid) {
		List<Student> list = new ArrayList<Student>();
		String sql = "select student_name,password from student where student_id='"
				+ studentid + "'";
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			while (rs.next()) {
				Student student = new Student();
				student.setStudent_name(rs.getString(1));
				student.setPassword(rs.getString(2));
				list.add(student);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	public static int UpdatePassword(Student student) {
		int result = 0;
		String sql = "update student set password=? where student_id=?";
		try {
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, student.getPassword());
			pstmt.setString(2, student.getStudent_name());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	// 获取记录总数
	public static int getCount() {
		Connection conn = ConnectionFactory.getConnection();
		Statement stmt = null;
		String sql = "select * from studentinfo";
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

	public static void deleteStudent(String student_id) {
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

	public boolean deleteStudentById(String[] student_id) {
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
		return false;
	}

	public static List<StudentInfo> getStudent(int pageNo, int pageSize) {
		Connection conn = ConnectionFactory.getConnection();
		String sql = "select  * from studentinfo  limit " + (pageNo - 1)
				* pageSize + "," + pageSize;

		List<StudentInfo> list = new ArrayList<StudentInfo>();
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			while (rs.next()) {
				StudentInfo student = new StudentInfo();
				student.setStudent_id(rs.getString("student_id"));
				student.setStudent_name(rs.getString("student_name"));
				student.setSex(rs.getString("sex"));
				student.setBirthday(rs.getString("birthday"));
				student.setAdmission_date(rs.getString("admission_date"));
				student.setClass_name(rs.getString("class_name"));
				student.setDept_name(rs.getString("dept_name"));
				student.setSpec_name(rs.getString("spec_name"));
				student.setId_card(rs.getString("id_card"));
				student.setNation(rs.getString("nation"));
				student.setStudy_length(rs.getString("study_length"));
				student.setPassword(rs.getString("password"));
				student.setGrade(rs.getInt("grade"));
				list.add(student);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbClose.close(conn);
		}
		return list;

	}

	public static List<StudentInfo> findStudentBykw(String keyword) {

		Connection conn = ConnectionFactory.getConnection();
		String sql = "select * from studentinfo where 1=1";

		if (keyword != null && !keyword.trim().equals("")) {
			sql += " and (student_id like '%" + keyword
					+ "%' or student_name like '%" + keyword
					+ "%' or sex like '%" + keyword + "%' or dept_name like '%"
					+ keyword + "%' or spec_name like '%" + keyword
					+ "%' or id_card like '%" + keyword + "%'  "
					+ "or birthday like '%" + keyword
					+ "%' or class_name like '%" + keyword + "%')  ";
		}

		List<StudentInfo> list = new ArrayList<StudentInfo>();
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			while (rs.next()) {
				StudentInfo student = new StudentInfo();
				student.setStudent_id(rs.getString("student_id"));
				student.setStudent_name(rs.getString("student_name"));
				student.setSex(rs.getString("sex"));
				student.setBirthday(rs.getString("birthday"));
				student.setAdmission_date(rs.getString("admission_date"));
				student.setClass_name(rs.getString("class_name"));
				student.setDept_name(rs.getString("dept_name"));
				student.setSpec_name(rs.getString("spec_name"));
				student.setId_card(rs.getString("id_card"));
				student.setNation(rs.getString("nation"));
				student.setStudy_length(rs.getString("study_length"));
				student.setPassword(rs.getString("password"));
				list.add(student);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbClose.close(conn);
		}
		return list;

	}

	public static List<StudentInfo> loadByKeyword(String student_id) {

		Connection conn = ConnectionFactory.getConnection();
		String sql = "select * from StudentInfo where student_id = '"
				+ student_id + "' ";
		List<StudentInfo> list = new ArrayList<StudentInfo>();
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			while (rs.next()) {
				StudentInfo student = new StudentInfo();
				student.setStudent_id(rs.getString("student_id"));
				student.setStudent_name(rs.getString("student_name"));
				student.setSex(rs.getString("sex"));
				student.setBirthday(rs.getString("birthday"));
				student.setAdmission_date(rs.getString("admission_date"));
				student.setClass_name(rs.getString("class_name"));
				student.setDept_name(rs.getString("dept_name"));
				student.setSpec_name(rs.getString("spec_name"));
				student.setId_card(rs.getString("id_card"));
				student.setNation(rs.getString("nation"));
				student.setStudy_length(rs.getString("study_length"));
				list.add(student);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbClose.close(conn);
		}
		return list;
	}

	public static Student loadBystudent_id(String student_id) {
		Student student = null;

		Connection conn = ConnectionFactory.getConnection();
		String sql = "select * from student where student_id = '" + student_id
				+ "' ";
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			if (rs.next()) {
				student = new Student();
				student.setStudent_id(rs.getString("student_id"));
				student.setStudent_name(rs.getString("student_name"));
				student.setSex(rs.getString("sex"));
				student.setBirthday(rs.getString("birthday"));
				student.setAdmission_date(rs.getString("admission_date"));
				student.setClassid(rs.getString("classid"));
				student.setId_card(rs.getString("id_card"));
				student.setNation(rs.getString("nation"));
				student.setStudy_length(rs.getString("study_length"));
				student.setPassword(rs.getString("password"));
				student.setGrade(rs.getInt("grade"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbClose.close(conn);
		}

		return student;
	}

	public static boolean updateStudent(Student s) {
		Connection conn = ConnectionFactory.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update student set student_id = ?,student_name = ?,sex = ?,nation = ?,study_length = ?,birthday = ?,admission_date = ?,classid = ?,id_card = ?,grade=? where student_id =?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s.getStudent_id());
			pstmt.setString(2, s.getStudent_name());
			pstmt.setString(3, s.getSex());
			pstmt.setString(4, s.getNation());
			pstmt.setString(5, s.getStudy_length());
			pstmt.setString(6, s.getBirthday());
			pstmt.setString(7, s.getAdmission_date());
			pstmt.setString(8, s.getClassid());
			pstmt.setString(9, s.getId_card());
			pstmt.setInt(10, s.getGrade());
			pstmt.setString(11, s.getOld_id());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			DbClose.close(conn);
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return true;
	}

	public static boolean updateStudent_login(Student s) {
		Connection conn = ConnectionFactory.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update student set password = ? where student_id =?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s.getPassword());
			pstmt.setString(2, s.getOld_id());
			System.out.println(pstmt);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			DbClose.close(conn);
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return true;
	}

	public static boolean addStudent(Student s) {

		Connection conn = ConnectionFactory.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into student values (?,?,?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s.getStudent_id());
			pstmt.setString(2, s.getStudent_name());
			pstmt.setString(3, s.getSex());
			pstmt.setString(4, s.getNation());
			pstmt.setString(5, s.getBirthday());
			pstmt.setString(6, s.getId_card());
			pstmt.setString(7, s.getClassid());
			pstmt.setString(8, s.getAdmission_date());
			pstmt.setString(9, s.getStudy_length());
			pstmt.setString(10, s.getPassword());
			pstmt.setInt(11, s.getGrade());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			DbClose.close(conn);
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return true;

	}
}
