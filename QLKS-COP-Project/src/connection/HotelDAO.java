package connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
			System.out.println("HotelDAO - getHotelInfomation err: " + e);
		}
		return null;
	}

	private final static String SELECT_ALL = "select * from hotel";
	private final static String PRICE_PER_NIGHT = "select round(avg(price), 0) as price_per_night from chamber";

	public static Hotel getHotelInfo() {
		try {
			ResultSet rs = Connection.getPre(SELECT_ALL).executeQuery();
			Hotel hotel = null;
			while (rs.next()) {
				hotel = new Hotel(rs.getString("hotel_name"), rs.getInt("star"), rs.getString("address"),
						rs.getLong("price"));
			}
			return hotel;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	public static String getPricePerNight() {
		try {
			ResultSet rs = Connection.getPre(PRICE_PER_NIGHT).executeQuery();
			String pricePerNight = "0";
			while (rs.next()) {
				pricePerNight = rs.getString("price_per_night");
			}
			return pricePerNight;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "0";
		}
	}
	public boolean updateInfo(Hotel newInfo) {
		try {
			boolean result = false;
			String query = "UPDATE hotel SET hotel_name = ?, star = ?, address = ?";
			PreparedStatement preStmt = Connection.Connecter().prepareStatement(query);
			preStmt.setString(1, newInfo.getHotelName());
			preStmt.setInt(2, newInfo.getStar());
			preStmt.setString(3, newInfo.getAddress());
			
			result = preStmt.execute();
			return result;
		} catch (Exception e) {
			System.out.println("HotelDAO - updateInfo err: " + e);
		}
		return false;
	}
	public boolean insertInfo(Hotel newInfo) {
		try {
			boolean result = false;
			String query = "INSERT INTO hotel (hotel_name, star, address, price) VALUES(?,?,?,?)";
			PreparedStatement preStmt = Connection.Connecter().prepareStatement(query);
			preStmt.setString(1, newInfo.getHotelName());
			preStmt.setInt(2, newInfo.getStar());
			preStmt.setString(3, newInfo.getAddress());
			preStmt.setInt(4, 0);
			result = preStmt.execute();
			return result;
		} catch (Exception e) {
			System.out.println("HotelDAO - insertInfo err: " + e);
		}
		return false;

	}
}
