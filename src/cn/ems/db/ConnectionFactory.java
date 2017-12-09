package cn.ems.db;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 * @author SunLw
 * 数据库连接对象(Connection)工厂类
 */
public class ConnectionFactory {

	/** database driver class name */
	private static String DB_DRIVER;
	/** database URL associated with the URL */
	private static String DB_URL;
	/** user name of the database */
	private static String DB_USERNAME;
	/** password for the current user */
	private static String DB_PASSWORD ;

	private ConnectionFactory() {
	}
	/**
	 * 在静态代码块中，获得属性文件中的driver,url,username,password
	 */
	static{
		//step1:创建一个Properties对象
		Properties p=new Properties();
		//step2:以流的形式读取属性文件中的内容
		InputStream is=Thread.currentThread().getContextClassLoader().getResourceAsStream("jdbc.properties");
		try {
			//step3:加载流is到p对象中
			p.load(is);
			//step4:获取指定键的值
			DB_DRIVER=p.getProperty("driver");
			DB_URL=p.getProperty("url");
			DB_USERNAME=p.getProperty("username");
			DB_PASSWORD=p.getProperty("password");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 该方法用来加载驱动，并获得数据库的连接对象
	 * 
	 * @return 数据库连接对象conn
	 */	
	public static Connection getConnection() {
		Connection conn = null;
		try {
			// 加载驱动
			Class.forName(DB_DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			// 获得数据库连接的对象
			conn = DriverManager.getConnection(DB_URL, DB_USERNAME,
					DB_PASSWORD);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}


	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// 测试有没有获得Connection对象
		Connection conn=getConnection();
		if(conn==null){
			System.out.println("未获取数据库连接对象");
		}else{
			System.out.println("已获取数据库连接对象");
		}
		
	}

}
