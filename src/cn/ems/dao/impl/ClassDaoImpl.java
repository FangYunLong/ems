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
import cn.ems.domain.Class;
import cn.ems.domain.ClassInfo;
import cn.ems.domain.Classes;
import cn.ems.domain.Department;
import cn.ems.domain.Speciality;
import cn.ems.domain.SpecialityInfo;
import cn.ems.domain.Teacher;

public class ClassDaoImpl {
	
	public static List<ClassInfo> getClass(int pageNo,int pageSize){
		String sql = "select * from classinfo order by lpad(classid,5,'0') limit "+(pageNo-1)*pageSize+"," +pageSize;
		List<ClassInfo> list = new ArrayList<ClassInfo>();
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			while(rs.next()){
				ClassInfo classInfo = new ClassInfo();
				classInfo.setClassid(rs.getString(1));
				classInfo.setClass_name(rs.getString(2));
				classInfo.setTname(rs.getString(3));
				classInfo.setSpec_name(rs.getString(4));
				classInfo.setDept_name(rs.getString(5));
				list.add(classInfo);
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
		String sql = "select * from classinfo";
		ResultSet rs = null;
		int Records = 0;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			rs.last();
			Records = rs.getRow();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Records;
	}
	
	public static List<ClassInfo> findClassBykw(String keyword , int pageNo,int pageSize) {

		String sql="select * from classinfo where 1=1";
		
		if(keyword != null && !keyword.trim().equals("")){
			sql += " and (classid like '%"+keyword+"%' or class_name like '%"+keyword+"%'  " +
					"or tname like '%"+keyword+"%' or spec_name like '%"+keyword+"%' or dept_name like '%"+keyword+"%') "
							+ "order by lpad(classid,5,'0') limit "+(pageNo-1)*pageSize+"," +pageSize;
		}
		List<ClassInfo> list= new ArrayList<ClassInfo>();
			try {
				ResultSet rs=ControlDB.executeQuery(sql);
				while (rs.next()) {
					ClassInfo classInfo = new ClassInfo();
					classInfo.setClassid(rs.getString(1));
					classInfo.setClass_name(rs.getString(2));
					classInfo.setTname(rs.getString(3));
					classInfo.setSpec_name(rs.getString(4));
					classInfo.setDept_name(rs.getString(5));
					list.add(classInfo);
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
		String sql="select * from classinfo where 1=1";
		if(keyword != null && !keyword.trim().equals("")){
			sql += " and (classid like '%"+keyword+"%' or class_name like '%"+keyword+"%'  " +
					"or tname like '%"+keyword+"%' or spec_name like '%"+keyword+"%' or dept_name like '%"+keyword+"%') ";
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
	
	public static List<Class> getClassByIdOrName(String keyword){
		List<Class> list = new ArrayList<Class>();
		
		String sql = "select classid,class_name from class where 1=1";
		if(keyword != null && !keyword.trim().equals("")){
			sql += " and (classid like '%"+keyword+"%' or class_name like '%"+keyword+"%')";
		}
		ResultSet rs = null;
		try {
			rs = ControlDB.executeQuery(sql);
			while (rs.next()) {
				Class classList = new Class();
				classList.setClassid(rs.getString(1));
				classList.setClass_name(rs.getString(2));
				list.add(classList);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static List<Classes> getClassName(String specid){
		List<Classes> list = new ArrayList<Classes>();
		
		String sql = "select classid,class_name from class where specid='"+specid+"' order by classid";
		
		ResultSet rs = null;
		try {
			rs = ControlDB.executeQuery(sql);
			while (rs.next()) {
				Classes classes = new Classes();
				classes.setClassid(rs.getString(1));
				classes.setClass_name(rs.getString(2));
				list.add(classes);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//获得教师姓名及ID
	public static List<Teacher> getTeacher(String deptid){
		String sql = "select tid,tname from teacher where deptid = '"+ deptid +"' order by tid";
		List<Teacher> list = new ArrayList<Teacher>();
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			while(rs.next()){
				Teacher teacher = new Teacher();
				teacher.setTid(rs.getString(1));
				teacher.setTname(rs.getString(2));
				list.add(teacher);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//获得专业名称及ID
	public static List<Speciality> getSpec(String deptid){
		String sql = "select specid,spec_name from speciality where deptid = '"+ deptid +"' order by specid";
		List<Speciality> list = new ArrayList<Speciality>();
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			while(rs.next()){
				Speciality spec = new Speciality();
				spec.setSpecid(rs.getString(1));
				spec.setSpec_name(rs.getString(2));
				list.add(spec);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//获得系别名及ID
	public static List<Department> getDept_Name_id(){
		String sql = "select deptid,dept_name from department";
		List<Department> list = new ArrayList<Department>();
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			while(rs.next()){
				Department dept = new Department();
				dept.setDeptid(rs.getString(1));
				dept.setDept_name(rs.getString(2));
				list.add(dept);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public static int updateClass(Class Class , String Classid){
		int result = 0;
		String sql = "update class set classid=?,class_name=?,tid=?,specid=? where classid=?";
		try {
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, Class.getClassid());
			pstmt.setString(2, Class.getClass_name());
			pstmt.setString(3, Class.getTid());
			pstmt.setString(4, Class.getSpecid());
			pstmt.setString(5, Classid);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static int deleteClass(String Classid){
		int result = 0;
		String sql = "delete from class where classid = '"+Classid+"'";
		try {
			result = ControlDB.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static int insertClass(Class c){
		int result = 0;
		String sql = "insert into class values(?,?,?,?)";
		try {
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getClassid());
			pstmt.setString(2, c.getClass_name());
			pstmt.setString(3, c.getTid());
			pstmt.setString(4, c.getSpecid());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static List<Classes> getClasses(){
		String sql = "select * from class ";
		List<Classes> list = new ArrayList<Classes>();
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			while(rs.next()){
				Classes classes = new Classes();
				classes.setClassid(rs.getString(1));
				classes.setClass_name(rs.getString(2));
				classes.setHeadteacher(rs.getString(3));
				classes.setSpecid(rs.getString(4));
				list.add(classes);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
