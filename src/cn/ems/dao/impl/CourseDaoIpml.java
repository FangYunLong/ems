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
import cn.ems.domain.Course;
import cn.ems.domain.CourseInfo;
import cn.ems.domain.Department;
import cn.ems.domain.Speciality;
import cn.ems.domain.SpecialityInfo;
import cn.ems.domain.Teacher;

public class CourseDaoIpml {

	public static List<CourseInfo> getCourse(int pageNo,int pageSize){
		String sql = "select * from courseinfo order by lpad(cid,5,'0') limit "+(pageNo-1)*pageSize+"," +pageSize;
		List<CourseInfo> list = new ArrayList<CourseInfo>();
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			while(rs.next()){
				CourseInfo courseInfo = new CourseInfo();
				courseInfo.setCid(rs.getString(1));
				courseInfo.setCour_name(rs.getString(2));
				courseInfo.setCredits(rs.getFloat(3));
				courseInfo.setTname(rs.getString(4));
				courseInfo.setDept_name(rs.getString(5));
				courseInfo.setSpecname(rs.getString(6));
				courseInfo.setSchoolyear(rs.getString(7));
				courseInfo.setSemester(rs.getString(8));
				list.add(courseInfo);
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
		String sql = "select * from courseinfo";
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
	
	public static int getCount(String specname){
		Connection conn = ConnectionFactory.getConnection();
		Statement stmt = null;
		String sql = "select * from courseinfo where spec_name='"+ specname +"'";
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
	
	public static List<CourseInfo> findCourseBykw(String keyword , int pageNo,int pageSize) {

		String sql="select * from courseinfo where 1=1";
		
		if(keyword != null && !keyword.trim().equals("")){
			sql += " and (cid like '%"+keyword+"%' or cour_name like '%"+keyword+"%'  " +
					"or credits like '%"+keyword+"%' or tname like '%"+keyword+"%' or spec_name like '%"+keyword+"%'"
							+ "or schoolyear like '%"+keyword+"%' or semester like '%"+keyword+"%' or dept_name like '%"+keyword+"%') "
									+ "order by lpad(cid,5,'0') limit "+(pageNo-1)*pageSize+"," +pageSize;
		}
		List<CourseInfo> list= new ArrayList<CourseInfo>();
			try {
				ResultSet rs=ControlDB.executeQuery(sql);
				while (rs.next()) {
					CourseInfo courseInfo = new CourseInfo();
					courseInfo.setCid(rs.getString(1));
					courseInfo.setCour_name(rs.getString(2));
					courseInfo.setCredits(rs.getFloat(3));
					courseInfo.setTname(rs.getString(4));
					courseInfo.setDept_name(rs.getString(5));
					courseInfo.setSpecname(rs.getString(6));
					courseInfo.setSchoolyear(rs.getString(7));
					courseInfo.setSemester(rs.getString(8));
					list.add(courseInfo);
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
		String sql="select * from courseinfo where 1=1";
		
		if(keyword != null && !keyword.trim().equals("")){
			sql += " and (cid like '%"+keyword+"%' or cour_name like '%"+keyword+"%'  " +
					"or credits like '%"+keyword+"%' or tname like '%"+keyword+"%' or spec_name like '%"+keyword+"%'"
							+ "or schoolyear like '"+keyword+"' or semester like '%"+keyword+"%' or dept_name like '%"+keyword+"%') ";
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
	
	//获得系部名称及ID
	public static List<Department> getDepartment(){
		List<Department> list = new ArrayList<Department>();
		String sql = "select deptid,dept_name from department";
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			while(rs.next()){
				Department dept = new Department();
				dept.setDeptid(rs.getString(1));
				dept.setDept_name(rs.getString(2));
				list.add(dept);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	
	//获得教师姓名及ID
	public static List<Teacher> getTeachByDeptId(String id){
		String sql = "select tid,tname from teacher where deptid = '"+ id +"'";
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
	public static List<Speciality> getSpecByDeptId(String id){
		String sql = "select specid,spec_name from speciality where deptid = '"+ id +"'";
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
	
	public static int updateCourse(Course course , String cid){
		int result = 0;
		String sql = "update course set cid=?,cour_name=?,credits=?,tid=?,specid=?,schoolyear=?,semester=? where cid=?";
		try {
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, course.getCid());
			pstmt.setString(2, course.getCour_name());
			pstmt.setFloat(3, course.getCredits());
			pstmt.setString(4,course.getTid());
			pstmt.setString(5, course.getSpecid());
			pstmt.setString(6, course.getSchoolyear());
			pstmt.setString(7, course.getSemester());
			pstmt.setString(8, cid);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static int deleteCourse(String Cid){
		int result = 0;
		String sql = "delete from course where cid = '"+Cid+"'";
		try {
			result = ControlDB.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static List<Course> getCourseByIDorName(String keyword){
		List<Course> list = new ArrayList<Course>();
		String sql = "select cid,cour_name from course where 1=1";
		if(keyword != null && !keyword.trim().equals("")){
			sql += " and (cid like '%"+keyword+"%' or cour_name like '%"+keyword+"%')";
		}
		ResultSet rs = null;
		try {
			rs = ControlDB.executeQuery(sql);
			while (rs.next()) {
				Course course = new Course();
				course.setCid(rs.getString(1));
				course.setCour_name(rs.getString(2));
				list.add(course);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static int insertCourse(Course course){
		int result = 0;
		String sql = "insert into course values(?,?,?,?,?,?,?)";
		try {
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, course.getCid());
			pstmt.setString(2, course.getCour_name());
			pstmt.setFloat(3, course.getCredits());
			pstmt.setString(4, course.getTid());
			pstmt.setString(5,course.getSpecid());
			pstmt.setString(6,course.getSchoolyear());
			pstmt.setString(7,course.getSemester());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static List<CourseInfo> getCourseInfoBySpecName(String SpecName,int pageNo,int pageSize){
		List<CourseInfo> list = new ArrayList<CourseInfo>();
		String sql = "select * from courseinfo where spec_name='" + SpecName
				+ "' order by lpad(cid,5,'0') limit " + (pageNo - 1) * pageSize
				+ "," + pageSize;
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			while(rs.next()){
				CourseInfo courseInfo = new CourseInfo();
				courseInfo.setCid(rs.getString(1));
				courseInfo.setCour_name(rs.getString(2));
				courseInfo.setCredits(rs.getFloat(3));
				courseInfo.setDept_name(rs.getString(5));
				courseInfo.setSpecname(rs.getString(6));
				courseInfo.setTname(rs.getString(4));
				courseInfo.setSchoolyear(rs.getString(7));
				courseInfo.setSemester(rs.getString(8));
				list.add(courseInfo);
			}
		} catch (Exception e) {
		}
		return list;
	}
	
	public static List<CourseInfo> findCourseBykw(String keyword) {

		String sql="select * from courseinfo where 1=1";
		
		if(keyword != null && !keyword.trim().equals("")){
			sql += " and (cid like '%"+keyword+"%' or cour_name like '%"+keyword+"%'  " +
					"or credits like '%"+keyword+"%' or tname like '%"+keyword+"%' or spec_name like '%"+keyword+"%'"
							+ "or schoolyear like '%"+keyword+"%' or semester like '%"+keyword+"%' or dept_name like '%"+keyword+"%') "
									+ "order by lpad(cid,5,'0')";
		}
		List<CourseInfo> list= new ArrayList<CourseInfo>();
			try {
				ResultSet rs=ControlDB.executeQuery(sql);
				while (rs.next()) {
					CourseInfo courseInfo = new CourseInfo();
					courseInfo.setCid(rs.getString(1));
					courseInfo.setCour_name(rs.getString(2));
					courseInfo.setCredits(rs.getFloat(3));
					courseInfo.setTname(rs.getString(4));
					courseInfo.setDept_name(rs.getString(5));
					courseInfo.setSpecname(rs.getString(6));
					courseInfo.setSchoolyear(rs.getString(7));
					courseInfo.setSemester(rs.getString(8));
					list.add(courseInfo);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		return list;
	}
	
	public static List<Course> findCidBykw(String keyword) {

		String sql="select * from course where tid = '"+keyword+"' ";
		
		List<Course> list = new ArrayList<Course>();
			try {
				ResultSet rs=ControlDB.executeQuery(sql);
				while (rs.next()) {
					Course course= new Course();
					course.setCid(rs.getString("cid"));
					course.setCour_name(rs.getString("cour_name"));
					list.add(course);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		return list;
	}
}
