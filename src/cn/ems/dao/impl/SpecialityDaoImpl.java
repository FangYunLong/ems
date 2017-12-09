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
import cn.ems.domain.Speciality;
import cn.ems.domain.SpecialityInfo;
import cn.ems.domain.Student;

public class SpecialityDaoImpl {
	
	public static List<SpecialityInfo> getSpeciality(int pageNo,int pageSize){
		String sql = "select * from specinfo order by lpad(specid,3,'0') limit "+(pageNo-1)*pageSize+"," +pageSize;
		List<SpecialityInfo> list = new ArrayList<SpecialityInfo>();
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			while(rs.next()){
				SpecialityInfo speciality = new SpecialityInfo();
				speciality.setSpecid(rs.getString(1));
				speciality.setSpec_name(rs.getString(2));
				speciality.setDept_name(rs.getString(3));
				list.add(speciality);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//获取记录总数
	public static int getCount(){
		Connection conn = ConnectionFactory.getConnection();
		Statement stmt = null;
		String sql = "select * from specinfo";
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
	
		
	public static List<SpecialityInfo> findSpecialityBykw(String keyword , int pageNo,int pageSize) {

		String sql="select * from specinfo where 1=1";
		
		if(keyword != null && !keyword.trim().equals("")){
			sql += " and (specid like '%"+keyword+"%' or spec_name like '%"+keyword+"%'  " +
					"or dept_name like '%"+keyword+"%') order by specid limit "+(pageNo-1)*pageSize+"," +pageSize;
		}
		List<SpecialityInfo> list= new ArrayList<SpecialityInfo>();
			try {
				ResultSet rs=ControlDB.executeQuery(sql);
				while (rs.next()) {
					SpecialityInfo speciality = new SpecialityInfo();
					speciality.setSpecid(rs.getString(1));
					speciality.setSpec_name(rs.getString(2));
					speciality.setDept_name(rs.getString(3));
					list.add(speciality);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		return list;
	}
	
	//获取条件查询记录总数
	public static int getCountBykw(String keyword){
		Connection conn = ConnectionFactory.getConnection();
		Statement stmt = null;
		String sql = "select * from specinfo where 1=1";
		if(keyword != null && !keyword.trim().equals("")){
			sql += " and (specid like '%"+keyword+"%' or spec_name like '%"+keyword+"%'  " +
					"or dept_name like '%"+keyword+"%') order by specid";
		}
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
		
	public static int getSpecialityBykwCount(String keyword) {
		int Records = 0;
		String sql="select * from specinfo where 1=1";
		if(keyword != null && !keyword.trim().equals("")){
			sql += " and (specid like '%"+keyword+"%' or spec_name like '%"+keyword+"%'  " +
					"or dept_name like '%"+keyword+"%')  ";
		}
		
		List<SpecialityInfo> list= new ArrayList<SpecialityInfo>();
			try {
				ResultSet rs=ControlDB.executeQuery(sql);
				rs.last();
				Records = rs.getRow();
			} catch (Exception e) {
				e.printStackTrace();
			}
		return Records;
	}
	
	public static int updateSpeciality(Speciality spec , String Specid){
		int result = 0;
		String sql = "update speciality set specid=?,spec_name=?,deptid=? where specid=?";
		try {
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, spec.getSpecid());
			pstmt.setString(2, spec.getSpec_name());
			pstmt.setString(3, spec.getDeptid());
			pstmt.setString(4, Specid);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static int deleteSpeciality(String Specid){
		int result = 0;
		String sql = "delete from speciality where specid = '"+Specid+"'";
		try {
			result = ControlDB.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static int insertSpeciality(Speciality spec){
		int result = 0;
		String sql = "insert into speciality values(?,?,?)";
		try {
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, spec.getSpecid());
			pstmt.setString(2, spec.getSpec_name());
			pstmt.setString(3, spec.getDeptid());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static List<Department> getDepartment(){
		List<Department> list = new ArrayList<Department>();
		String sql = "select * from department";
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			while(rs.next()){
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
	
	public static List<Speciality> getSpecByIDorName(String keyword){
		List<Speciality> list = new ArrayList<Speciality>();
		String sql = "select specid,spec_name from speciality where 1 = 1";
		if(keyword != null && !keyword.trim().equals("")){
			sql += " and (specid like '"+ keyword +"' or spec_name like '"+ keyword +"' )";
		}
		ResultSet rs = null;
		try {
			rs = ControlDB.executeQuery(sql);
			while(rs.next()){
				Speciality spec = new Speciality();
				spec.setSpecid(rs.getString(1));
				spec.setSpec_name(rs.getString(2));
				list.add(spec);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null){
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}
}
