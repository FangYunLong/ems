package cn.ems.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cn.ems.db.ControlDB;
import cn.ems.domain.ScoreInfo;

public class ScoreDaoImpl {
	public static List<ScoreInfo> getScoreByStuId(String id){
		List<ScoreInfo> list = new ArrayList<ScoreInfo>();
		String sql = "select * from scoreinfo where student_id='"+ id +"' order by lpad(schoolyear,10,'0')";
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			while(rs.next()){
				ScoreInfo scoreInfo = new ScoreInfo();
				scoreInfo.setStudent_id(rs.getString(1));
				scoreInfo.setStudent_name(rs.getString(2));
				scoreInfo.setClass_name(rs.getString(3));
				scoreInfo.setSchoolyear(rs.getString(4));
				scoreInfo.setSemester(rs.getString(5));
				scoreInfo.setCid(rs.getString(6));
				scoreInfo.setTid(rs.getString(7));
				scoreInfo.setCour_name(rs.getString(8));
				scoreInfo.setCredits(rs.getFloat(9));
				scoreInfo.setScore(rs.getString(10));
				scoreInfo.setRetestScore(rs.getString(11));
				scoreInfo.setRepeatScore(rs.getString(12));
				scoreInfo.setSpec_name(rs.getString(13));
				scoreInfo.setDept_name(rs.getString(14));
				list.add(scoreInfo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	
	public static List<ScoreInfo> findScoreBykw(String keyword , String id){
		List<ScoreInfo> list = new ArrayList<ScoreInfo>();
		String sql = "select * from scoreinfo where student_id='"+ id +"'";
		if(keyword != null && !keyword.trim().equals("")){
			sql += " and (class_name like '%" + keyword + "%' or schoolyear like '%"
					+ keyword + "%' or semester like '%" + keyword + "%'"
					+ "or cid like '%" + keyword + "%' or cour_name like '%"
					+ keyword + "%' or credits like '%" + keyword
					+ "%' or score like '%" + keyword
					+ "%' or retestScore like '%" + keyword
					+ "%' or repeatScore like '%" + keyword
					+ "%' or spec_name like '%" + keyword
					+ "%' or dept_name like '%" + keyword + "%') "
					+ "order by lpad(cid,5,'0')";
		}
		try {
			ResultSet rs = ControlDB.executeQuery(sql);
			while(rs.next()){
				ScoreInfo scoreInfo = new ScoreInfo();
				scoreInfo.setStudent_id(rs.getString(1));
				scoreInfo.setStudent_name(rs.getString(2));
				scoreInfo.setClass_name(rs.getString(3));
				scoreInfo.setSchoolyear(rs.getString(4));
				scoreInfo.setSemester(rs.getString(5));
				scoreInfo.setCid(rs.getString(6));
				scoreInfo.setCour_name(rs.getString(7));
				scoreInfo.setCredits(rs.getFloat(8));
				scoreInfo.setScore(rs.getString(9));
				scoreInfo.setRetestScore(rs.getString(10));
				scoreInfo.setRepeatScore(rs.getString(11));
				scoreInfo.setSpec_name(rs.getString(12));
				scoreInfo.setDept_name(rs.getString(13));
				list.add(scoreInfo);
			}
		} catch (Exception e) {
		}
		return list;
	}
}
