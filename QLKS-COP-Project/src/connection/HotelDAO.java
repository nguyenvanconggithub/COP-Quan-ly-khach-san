package connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.Hotel;

public class HotelDAO {
	private static HotelDAO instance = null;
	public static HotelDAO Instance() {
		if(instance == null) {
			instance = new HotelDAO();
		}
		return instance;
	}
	public boolean alreadyHaveData() {
		try {
			String query = "SELECT * FROM hotel";
			PreparedStatement preStmt = Connection.Connecter().prepareStatement(query);
			
			ResultSet rs = preStmt.executeQuery();
			return rs.next(); //true if have record
		} catch (Exception e) {
			System.out.println("HotelDAO - alreadyHaveData err: " + e);
		}
		return false;	
	}
	public Hotel getHotelInfomation() {
		try {
			Hotel hotelInfo = new Hotel();
			String query = "SELECT * FROM hotel";
			PreparedStatement preStmt = Connection.Connecter().prepareStatement(query);
			
			ResultSet rs = preStmt.executeQuery();
			if(rs.next()) {
				hotelInfo.setHotelName(rs.getString("hotel_name"));
				hotelInfo.setStar(rs.getInt("star"));
				hotelInfo.setAddress(rs.getString("address"));
			}
			return hotelInfo;
		} catch (Exception e) {
			System.out.println("HotelDAO - alreadyHaveData err: " + e);
		}
		return null;
	}
}
