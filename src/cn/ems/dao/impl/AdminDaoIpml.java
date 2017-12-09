package cn.ems.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.ems.db.ConnectionFactory;
import cn.ems.db.ControlDB;
import cn.ems.domain.Admin;

public class AdminDaoIpml {
	public static List<Admin> getAdminByUsername(String username){
		List<Admin> list = new ArrayList<Admin>();
		String sql = "select * from admin where username='"+ username +"'";
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			while(rs.next()){
				Admin admin = new Admin();
				admin.setUsername(rs.getString(1));
				admin.setPassword(rs.getString(2));
				list.add(admin);
			}
		} catch (Exception e) {
		}
		return list;
	}
	
	public static int UpdatePassword(Admin admin){
		int result = 0;
		String sql = "update admin set password=? where username=?";
		try {
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, admin.getPassword());
			pstmt.setString(2, admin.getUsername());
			result = pstmt.executeUpdate();
			System.out.println(pstmt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
