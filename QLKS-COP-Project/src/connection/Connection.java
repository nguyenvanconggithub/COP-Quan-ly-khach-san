package connection;

import java.sql.*;
public class Connection {
	private static String url = "jdbc:mysql://127.0.0.1:3306/qlks";
	private static String user = "root";
	private static String password = "123456";
	
	public static java.sql.Connection Connecter() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection(url, user, password);
		return con;
	}
}
