package database;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {

	private static Connection con;
	
	private ConnectionProvider () {}
	
	static {
		try {
			Class.forName(DBProperty.classPath);
			con = DriverManager.getConnection(DBProperty.rul, DBProperty.username, DBProperty.password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getCon() {
		return con;
	}
}
