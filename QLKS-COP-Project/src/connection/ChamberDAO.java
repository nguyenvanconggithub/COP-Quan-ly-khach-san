package connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import model.Chamber;

public class ChamberDAO {
	private static ChamberDAO instance = null;
	public static ChamberDAO Instance() {
		if(instance == null) {
			instance = new ChamberDAO();
		}
		return instance;
	}
	private final static String SELECT_ALL_EMPTY = "select * from chamber where is_emty = 0";

	public static List<Chamber> getChamberWS() {
		try {
			ResultSet rs = Connection.getPre(SELECT_ALL_EMPTY).executeQuery();
			List<Chamber> listChamberEmpty = new ArrayList<Chamber>();
			while (rs.next()) {
				listChamberEmpty.add(new Chamber(rs.getLong("chamber_id"), rs.getString("number"), rs.getInt("type"),
						rs.getInt("capacity"), rs.getFloat("area"), rs.getLong("price"), rs.getInt("floor"),
						rs.getBoolean("is_vip"), rs.getBoolean("is_emty"), rs.getString("note")));
			}
			return listChamberEmpty;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public int numberOfChamber() {
		try {
			String query = "SELECT COUNT(*) FROM chamber";
			PreparedStatement preStmt = Connection.Connecter().prepareStatement(query);
			ResultSet rs = preStmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("ChamberDAO - numberOfChamber err: " + e);
		}
		return -1;
	}
	
	public ArrayList<Chamber> getChamberInfoByPage(int page, int itemsPerPage) {
		ArrayList<Chamber> listChamber = new ArrayList<Chamber>();
		try {
			String query = "SELECT * FROM chamber LIMIT ?,?";
			PreparedStatement preStmt = Connection.Connecter().prepareStatement(query);
			preStmt.setInt(1, (page - 1) * itemsPerPage);
			preStmt.setInt(2, itemsPerPage);
			ResultSet rs = preStmt.executeQuery();
			while(rs.next()) {
				Chamber oneChamber = new Chamber();
				oneChamber.setChamber_id(rs.getLong("chamber_id"));
				oneChamber.setNumber(rs.getString("number"));
				oneChamber.setType(rs.getInt("type"));
				oneChamber.setCapacity(rs.getInt("capacity"));
				oneChamber.setArea(rs.getFloat("area"));
				oneChamber.setPrice(rs.getLong("price"));
				oneChamber.setFloor(rs.getInt("floor"));
				oneChamber.setVip(rs.getBoolean("is_vip"));
				oneChamber.setEmpty(rs.getBoolean("is_emty"));
				oneChamber.setNote(rs.getString("note"));;
				
				listChamber.add(oneChamber);
			}
		} catch (Exception e) {
			System.out.println("ChamberDAO - getChamberInfoByPage err: " + e);
		}
		return listChamber;
	}
	public boolean insertNewChamber(Chamber newChamber) {
		try {
			boolean result = false;
			String query = "INSERT INTO chamber (number, type, capacity, area, price, floor, is_vip, is_emty, note) "
					+ "VALUES(?,?,?,?,?,?,?,?,?)";
			PreparedStatement preStmt = Connection.Connecter().prepareStatement(query);
			preStmt.setString(1,newChamber.getNumber());
			preStmt.setInt(2, newChamber.getType());
			preStmt.setInt(3, newChamber.getCapacity());
			preStmt.setFloat(4, newChamber.getArea());
			preStmt.setLong(5, newChamber.getPrice());
			preStmt.setInt(6, newChamber.getFloor());
			preStmt.setBoolean(7, newChamber.isVip());
			preStmt.setBoolean(8, true); // is_empty
			preStmt.setString(9, newChamber.getNote());
			
			result = preStmt.execute();
			return !result;
		} catch (Exception e) {
			System.out.println("ChamberDAO - insertNewChamber err: " + e);
		}
		return false;
	}
	public boolean updateChamberInfo(Chamber newChamber, int chamber_id) {
		try {
			boolean result = false;
			String query = "UPDATE chamber SET number=?, type=?, capacity=?, area=?, price=?, floor=?, is_vip=?, is_emty=?, note=? "
					+ "WHERE chamber_id=?";
			PreparedStatement preStmt = Connection.Connecter().prepareStatement(query);
			preStmt.setString(1,newChamber.getNumber());
			preStmt.setInt(2, newChamber.getType());
			preStmt.setInt(3, newChamber.getCapacity());
			preStmt.setFloat(4, newChamber.getArea());
			preStmt.setLong(5, newChamber.getPrice());
			preStmt.setInt(6, newChamber.getFloor());
			preStmt.setBoolean(7, newChamber.isVip());
			preStmt.setBoolean(8, true); // is_empty
			preStmt.setString(9, newChamber.getNote());
			preStmt.setLong(10, chamber_id);
			result = preStmt.execute();
			return !result;
		} catch (Exception e) {
			System.out.println("ChamberDAO - updateChamberInfo err: " + e);
		}
		return false;
	}
	public boolean alreadyHaveRoom(String number) {
		try {
			String query = "SELECT * FROM chamber WHERE number =?";
			PreparedStatement preStmt = Connection.Connecter().prepareStatement(query);
			preStmt.setString(1, number);
			ResultSet rs = preStmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			System.out.println("ChamberDAO - alreadyHaveRoom err: " + e);
		}
		return false;
	}
	
	public boolean removeChamberByID(String ID) {
		try {
			boolean result = false;
			String query = "DELETE FROM chamber WHERE chamber_id = ?";
			PreparedStatement preStmt = Connection.Connecter().prepareStatement(query);
			preStmt.setString(1, ID);
			result = preStmt.execute();
			System.out.println("rs t: " + result);
			return !result;
		} catch (Exception e) {
			System.out.println("ChamberDAO - removeChamberByID err: " + e);
		}
		return false;
	}
}
