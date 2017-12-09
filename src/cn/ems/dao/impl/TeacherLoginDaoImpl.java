package cn.ems.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cn.ems.db.ConnectionFactory;
import cn.ems.db.ControlDB;
import cn.ems.db.DbClose;
import cn.ems.domain.Teacher;

public class TeacherLoginDaoImpl {
	public static Teacher loadBytid(String tid){
		Teacher Teacher = null;
		
		Connection conn = ConnectionFactory.getConnection();
		String sql = "select * from Teacher where tid = '"+tid+"' ";
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			if (rs.next()) {
				Teacher = new Teacher();
				Teacher.setTid(rs.getString("tid"));
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
		String sql = "update teacher set tid = ?,password = ? where tid =?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t.getTid());
			pstmt.setString(2, t.getPassword());
			pstmt.setString(3, t.getOld_id());
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
}
