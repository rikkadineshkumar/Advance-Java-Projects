package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import beans.Product;

public class ProductDAO {

static Connection con = ConnectionProvider.getCon();;
	
	public static boolean addProduct(Product p) {
		
		try {
			
			PreparedStatement ps = con.prepareStatement("INSERT INTO PRODUCTS11 VALUES(?,?,?,?)");
			ps.setString(1, p.getpName());
			ps.setFloat(2, p.getpPrice());
			ps.setInt(3, p.getpQty());
			ps.setString(4, p.getpId());
			
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
	
	public static Product getProductsById(String pId) {

		Product p = null;
		try {
			PreparedStatement ps = con.prepareStatement("SELECT * FROM PRODUCTS11 WHERE PID=?");
			ps.setString(1, pId);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				p = new Product(rs.getString(4),rs.getString(1),rs.getFloat(2),rs.getInt(3));
			}
			return p;
		} catch (Exception e) {
			e.printStackTrace();
			return p;
		}
	}

	public static boolean updateProductQty(String pId,int pQty) {
		
		try {
			
			PreparedStatement ps = con.prepareStatement("UPDATE PRODUCTS11 SET PQTY=? WHERE PID=?");
			ps.setInt(1, pQty);
			ps.setString(2, pId);
			
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
	
	public static ArrayList<Product> getProducts(String keyWord) {

		ArrayList<Product> pList = new ArrayList<Product>();
		try {
			PreparedStatement ps = con.prepareStatement("SELECT * FROM PRODUCTS11 WHERE PNAME LIKE '%"+keyWord+"%'");
			//ps.setString(1, keyWord);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Product p = new Product(rs.getString(4),rs.getString(1),rs.getFloat(2),rs.getInt(3));
				pList.add(p);
			}
			return pList;
		} catch (Exception e) {
			e.printStackTrace();
			return pList;
		}
	}
	
	public static ArrayList<Product> getAllProducts() {

		ArrayList<Product> pList = new ArrayList<Product>();
		try {
			PreparedStatement ps = con.prepareStatement("SELECT * FROM PRODUCTS11");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Product p = new Product(rs.getString(4),rs.getString(1),rs.getFloat(2),rs.getInt(3));
				pList.add(p);
			}
			return pList;
		} catch (Exception e) {
			e.printStackTrace();
			return pList;
		}
	}
}
