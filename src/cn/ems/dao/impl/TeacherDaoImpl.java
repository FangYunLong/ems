package cn.ems.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import cn.ems.db.ControlDB;
import cn.ems.domain.Teacher;

import cn.ems.db.ConnectionFactory;
import cn.ems.db.ControlDB;
import cn.ems.db.DbClose;
import cn.ems.domain.Student;
import cn.ems.domain.StudentInfo;
import cn.ems.domain.Teacher;
import cn.ems.domain.TeacherInfo;

public class TeacherDaoImpl {
	public static List<Teacher> getPasswordById(String tid) {
		List<Teacher> list = new ArrayList<Teacher>();
		String sql = "select tname,password from teacher where tid='" + tid
				+ "'";
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			while (rs.next()) {
				Teacher teacher = new Teacher();
				teacher.setTname(rs.getString(1));
				teacher.setPassword(rs.getString(2));
				list.add(teacher);
			}
		} catch (Exception e) {
		}
		return list;
	}

	// 获取记录总数
	public static int getCount() {
		Connection conn = ConnectionFactory.getConnection();
		Statement stmt = null;
		String sql = "select * from teacherinfo";
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

	public static void deleteTeacher(String tid) {
		Connection conn = ConnectionFactory.getConnection();
		String sql = "delete from Teacher where tid= '" + tid + "' ";
		try {
			ControlDB.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbClose.close(conn);
		}
	}

	public boolean deleteTeacherById(String[] tid) {
		Connection conn = ConnectionFactory.getConnection();
		String sql = "delete from Teacher where tid= '" + tid + "' ";
		try {
			ControlDB.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbClose.close(conn);
		}
		return false;
	}

	public static List<TeacherInfo> getTeacher(int pageNo, int pageSize) {
		Connection conn = ConnectionFactory.getConnection();
		String sql = "select  * from teacherinfo order by lpad(tid,10,'0') limit " + (pageNo - 1)
				* pageSize + "," + pageSize;

		List<TeacherInfo> list = new ArrayList<TeacherInfo>();
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			while (rs.next()) {
				TeacherInfo teacher = new TeacherInfo();
				teacher.setTid(rs.getString("tid"));
				teacher.setTname(rs.getString("tname"));
				teacher.setSex(rs.getString("sex"));
				teacher.setPhone(rs.getString("phone"));
				teacher.setDept_name(rs.getString("dept_name"));
				teacher.setTitle(rs.getString("title"));
				teacher.setPassword(rs.getString("password"));
				list.add(teacher);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbClose.close(conn);
		}
		return list;

	}

	public static List<Teacher> getTeacher() {
		Connection conn = ConnectionFactory.getConnection();
		String sql = "select  * from Teacher";

		List<Teacher> list = new ArrayList<Teacher>();
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			while (rs.next()) {
				Teacher teacher = new Teacher();
				teacher.setTid(rs.getString("tid"));
				teacher.setTname(rs.getString("tname"));
				teacher.setSex(rs.getString("sex"));
				teacher.setPhone(rs.getString("phone"));
				teacher.setDepid(rs.getString("deptid"));
				teacher.setTitle(rs.getString("title"));
				list.add(teacher);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbClose.close(conn);
		}
		return list;

	}

	public static List<TeacherInfo> loadByKeyword(String tid) {

		Connection conn = ConnectionFactory.getConnection();
		String sql = "select * from TeacherInfo where tid = '" + tid + "' ";
		List<TeacherInfo> list = new ArrayList<TeacherInfo>();
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			while (rs.next()) {
				TeacherInfo teacher = new TeacherInfo();
				teacher.setTid(rs.getString("tid"));
				teacher.setTname(rs.getString("tname"));
				teacher.setSex(rs.getString("sex"));
				teacher.setPhone(rs.getString("phone"));
				teacher.setDept_name(rs.getString("dept_name"));
				teacher.setTitle(rs.getString("title"));
				list.add(teacher);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbClose.close(conn);
		}
		return list;
	}

	public static List<TeacherInfo> findTeacherBykw(String keyword) {

		Connection conn = ConnectionFactory.getConnection();
		String sql = "select * from teacherinfo where 1=1";

		if (keyword != null && !keyword.trim().equals("")) {
			sql += " and (tid like '%" + keyword + "%' or tname like '%"
					+ keyword + "%' or dept_name like '%" + keyword
					+ "%'  or sex like '%" + keyword + "%'  or phone like '%"
					+ keyword + "%' or title like '%" + keyword + "%')  ";
		}

		List<TeacherInfo> list = new ArrayList<TeacherInfo>();
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			while (rs.next()) {
				TeacherInfo teacher = new TeacherInfo();
				teacher.setTid(rs.getString("tid"));
				teacher.setTname(rs.getString("tname"));
				teacher.setSex(rs.getString("sex"));
				teacher.setPhone(rs.getString("phone"));
				teacher.setDept_name(rs.getString("dept_name"));
				teacher.setTitle(rs.getString("title"));
				teacher.setPassword(rs.getString("password"));
				list.add(teacher);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbClose.close(conn);
		}
		return list;

	}

	public static List<TeacherInfo> findTeacherByID(String keyword) {

		Connection conn = ConnectionFactory.getConnection();
		String sql = "select * from teacherinfo where tid='"+ keyword +"'";

		List<TeacherInfo> list = new ArrayList<TeacherInfo>();
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			while (rs.next()) {
				TeacherInfo teacher = new TeacherInfo();
				teacher.setTid(rs.getString("tid"));
				teacher.setTname(rs.getString("tname"));
				teacher.setSex(rs.getString("sex"));
				teacher.setPhone(rs.getString("phone"));
				teacher.setDept_name(rs.getString("dept_name"));
				teacher.setTitle(rs.getString("title"));
				teacher.setPassword(rs.getString("password"));
				list.add(teacher);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbClose.close(conn);
		}
		return list;

	}
	
	public static Teacher loadBytid(String tid) {
		Teacher Teacher = null;

		Connection conn = ConnectionFactory.getConnection();
		String sql = "select * from Teacher where tid = '" + tid + "' ";
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			if (rs.next()) {
				Teacher = new Teacher();
				Teacher.setTid(rs.getString("tid"));
				Teacher.setTname(rs.getString("tname"));
				Teacher.setSex(rs.getString("sex"));
				Teacher.setPhone(rs.getString("phone"));
				Teacher.setDepid(rs.getString("deptid"));
				Teacher.setTitle(rs.getString("title"));
				Teacher.setPassword(rs.getString("password"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbClose.close(conn);
		}

		return Teacher;
	}

	public static boolean updateTeacher(Teacher t) {
		Connection conn = ConnectionFactory.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update teacher set tid = ?,tname = ?,sex = ?,phone = ?,title = ?,deptid = ? where tid =?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t.getTid());
			pstmt.setString(2, t.getTname());
			pstmt.setString(3, t.getSex());
			pstmt.setString(4, t.getPhone());
			pstmt.setString(5, t.getTitle());
			pstmt.setString(6, t.getDepid());
			pstmt.setString(7, t.getOld_id());
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

	public static boolean updateTeacher_login(Teacher t) {
		Connection conn = ConnectionFactory.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update teacher set password = ? where tid =?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t.getPassword());
			pstmt.setString(2, t.getOld_id());
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

	public static boolean addTeacher(Teacher t) {

		Connection conn = ConnectionFactory.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into Teacher values (?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t.getTid());
			pstmt.setString(2, t.getTname());
			pstmt.setString(3, t.getSex());
			pstmt.setString(4, t.getPhone());
			pstmt.setString(5, t.getTitle());
			pstmt.setString(6, t.getDepid());
			pstmt.setString(7, t.getPassword());
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
