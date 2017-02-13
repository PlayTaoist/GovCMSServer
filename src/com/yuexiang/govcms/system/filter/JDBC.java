package com.yuexiang.govcms.system.filter;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 数据库操作类
 * @author yangtao 130016126
 *
 */
public class JDBC {
	// 创建静态全局变量
	private Connection conn=null;// 生成连接对象
	private Statement st=null;// 生成执行SQL语言的对象
	private ResultSet rs=null;// 结果集

	/**
	 * 获取数据库连接的函数
	 * 
	 * @return
	 */
	public Connection getConnection(String driver, String url, String user, String password) {
		try {
			Class.forName(driver);// 加载Mysql数据驱动
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn; // 返回所建立的数据库连接
	}

	/**
	 * select方法
	 * 
	 * @param condition
	 * @return
	 */
	public ResultSet Select(Connection conn,String sql) {
		try {
			st = (Statement) conn.createStatement(); // 创建用于执行静态sql语句的Statement对象，st属局部变量
			rs = st.executeQuery(sql); // 执行sql查询语句，返回查询数据的结果集
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	/**
	 * 更新符合要求的记录，并返回更新的记录数目
	 * 
	 * @return
	 */
	public int Update(Connection conn, String table, int id, int state) {
		int count = 0;
		try {
			String sql = "update " + table + " set state=" + state + " where id=" + id + ";";// 更新数据的sql语句
			st = (Statement) conn.createStatement(); // 创建用于执行静态sql语句的Statement对象，st属局部变量
			count = st.executeUpdate(sql);// 执行更新操作的sql语句，返回更新数据的个数
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	/**
	 * 关闭数据库连接
	 */
	public void Close() {
		try {
			if (rs != null) {// 如果rs不为空关闭，直接关闭可能导致空指针
				rs.close();
			}
			if (st != null) {// 如果st不为空关闭，直接关闭可能导致空指针
				st.close();
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}