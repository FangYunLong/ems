/**
 * 
 */
package cn.ems.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @author SunLw
 *
 */
public class ControlDB {
	/**
	 * 执行select语句
	 * 
	 * @param sql
	 * @return
	 * @throws Exception
	 */
	static int i;
	public static ResultSet executeQuery(String sql) throws Exception {
		ResultSet rs = null;
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = ConnectionFactory.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

		} catch (SQLException e) {
			throw e;
		}
		return rs;
	}

	/**
	 * 执行Insert、Update、Delete语句
	 * 
	 * @param sql
	 * @throws Exception
	 */
	public static int executeUpdate(String sql) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = ConnectionFactory.getConnection();
			stmt = conn.createStatement();
			i=stmt.executeUpdate(sql);
		} catch (SQLException ex) {
			ex.printStackTrace();
			System.err.println("执行SQL语句出错: " + ex.getMessage());
		} finally {
			DbClose.close(stmt, conn);
		}
		return i;
	}

}
