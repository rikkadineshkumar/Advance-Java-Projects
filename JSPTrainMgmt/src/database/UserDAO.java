package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import beans.User;

public class UserDAO {

	private static Connection con = ConnectionProvider.getCon();

	public static boolean verifyAdmin(String uName, String pWord) {
		try {
			
			PreparedStatement ps = con.prepareStatement("SELECT * FROM ADMINREG WHERE UNAME=? AND PWORD=?");
			ps.setString(1, uName);
			ps.setString(2, pWord);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				return true;
			}else {
				return false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public static boolean verifyUser(String uName, String pWord) {
		try {
			
			PreparedStatement ps = con.prepareStatement("SELECT * FROM USERREG WHERE UNAME=? AND PWORD=?");
			ps.setString(1, uName);
			ps.setString(2, pWord);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				return true;
			}else {
				return false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public static boolean addUser(User u) {

		try {
			PreparedStatement ps = con.prepareStatement("INSERT INTO USERREG VALUES(?,?,?,?,?,?,?)");
			ps.setString(1, u.getuName());
			ps.setString(2, u.getpWord());
			ps.setString(3, u.getfName());
			ps.setString(4, u.getlName());
			ps.setString(5, u.getAddr());
			ps.setLong(6, u.getPhno());
			ps.setString(7, u.getMid());
			
			if(ps.executeUpdate()>=0) {
				return true;
			}else {
				return false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
