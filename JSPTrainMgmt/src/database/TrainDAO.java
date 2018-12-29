package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import beans.Train;

public class TrainDAO {

	static Connection con = ConnectionProvider.getCon();;
	
	public static boolean addTrain(Train t) {
		
		try {
			
			PreparedStatement ps = con.prepareStatement("INSERT INTO TRAIN11 VALUES(?,?,?,?,?)");
			ps.setInt(1, t.gettNo());
			ps.setString(2, t.gettName());
			ps.setString(3, t.getsFrom());
			ps.setString(4, t.getsTo());
			ps.setString(5, t.getAvailable());
			
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
	
	public static ArrayList<Train> getTrain(String sFrom, String sTo) {

		ArrayList<Train> tList = new ArrayList<Train>();
		try {
			PreparedStatement ps = con.prepareStatement("SELECT * FROM TRAIN11 WHERE SFROM=? AND STO=?");
			ps.setString(1, sFrom);
			ps.setString(2, sTo);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Train t = new Train(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
				tList.add(t);
			}
			return tList;
		} catch (Exception e) {
			e.printStackTrace();
			return tList;
		}
	}
	
	public static ArrayList<Train> getAllTrain() {

		ArrayList<Train> tList = new ArrayList<Train>();
		try {
			PreparedStatement ps = con.prepareStatement("SELECT * FROM TRAIN11");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Train t = new Train(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
				tList.add(t);
			}
			return tList;
		} catch (Exception e) {
			e.printStackTrace();
			return tList;
		}
	}
}
