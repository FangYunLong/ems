package cn.ems.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import cn.ems.db.ConnectionFactory;
import cn.ems.db.ControlDB;
import cn.ems.db.DbClose;
import cn.ems.domain.Department;
import cn.ems.domain.DeptInfo;

public class DepartmentDaoImpl {

	// 获取记录总数
	public static int getCount() {
		Connection conn = ConnectionFactory.getConnection();
		Statement stmt = null;
		String sql = "select * from deptinfo";
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

	public static List<DeptInfo> getDepartment(int pageNo, int pageSize) {
		String sql = "select * from DeptInfo order by lpad(deptid,5,'0') limit " + (pageNo - 1) * pageSize
				+ "," + pageSize;
		List<DeptInfo> list = new ArrayList<DeptInfo>();
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			while (rs.next()) {
				DeptInfo dept = new DeptInfo();
				dept.setDeptid(rs.getString(1));
				dept.setDept_name(rs.getString(2));
				dept.setTname(rs.getString(3));
				list.add(dept);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static List<Department> getDepartment() {
		List<Department> list = new ArrayList<Department>();
		String sql = "select * from department";
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			while (rs.next()) {
				Department dept = new Department();
				dept.setDeptid(rs.getString(1));
				dept.setDept_name(rs.getString(2));
				dept.setDean(rs.getString(3));
				list.add(dept);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static boolean updateDepartment(Department d) {
		Connection conn = ConnectionFactory.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update department set deptid = ?,dept_name = ?,tid = ? where deptid =?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, d.getDeptid());
			pstmt.setString(2, d.getDept_name());
			pstmt.setString(3, d.getDean());
			pstmt.setString(4, d.getOld_id());
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

	public static int addDepartment(Department d) {
		int result = 0;
		String sql = "insert into department values(?,?,?)";
		try {
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, d.getDeptid());
			pstmt.setString(2, d.getDept_name());
			pstmt.setString(3, d.getDean());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public static int deleteDepartment(String deptid) {
		int result = 0;
		String sql = "delete from department where deptid = '" + deptid + "'";
		try {
			result = ControlDB.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public static List<DeptInfo> findDepartmentBykw(String keyword) {

		String sql = "select * from deptinfo where 1=1";

		if (keyword != null && !keyword.trim().equals("")) {
			sql += " and (deptid like '%" + keyword + "%' or dept_name like '%"
					+ keyword + "%'  " + "or tname like '%" + keyword + "%')  ";
		}

		List<DeptInfo> list = new ArrayList<DeptInfo>();
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			while (rs.next()) {
				DeptInfo department = new DeptInfo();
				department.setDeptid(rs.getString(1));
				department.setDept_name(rs.getString(2));
				department.setTname(rs.getString(3));
				list.add(department);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
