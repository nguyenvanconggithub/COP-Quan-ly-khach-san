package connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Chamber;

public class ChamberDAO {

	private final static String SELECT_ALL_EMPTY = "select * from chamber where is_emty = 0";

	private final static String SELECT_ALL_PRICE_0 = "select * from chamber where type = ? and price < 500000 and is_emty = 0 limit ?,?";

	private final static String SELECT_ALL_PRICE_1 = "select * from chamber where type = ? and price between 500000 and 1000000 and is_emty = 0 limit ?,?";

	private final static String SELECT_ALL_PRICE_2 = "select * from chamber where type = ? and price > 1000000 and is_emty = 0 limit ?,?";

	private final static String COUNT_TOTAL_CHAMBERS_0 = "select count(*) from chamber where type = ? and price < 500000 and is_emty = 0";

	private final static String COUNT_TOTAL_CHAMBERS_1 = "select count(*) from chamber where type = ? and price between 500000 and 1000000 and is_emty = 0";

	private final static String COUNT_TOTAL_CHAMBERS_2 = "select count(*) from chamber where type = ? and price > 1000000 and is_emty = 0";

	private final static String SELECT_ONE_CHAMBER = "select * from chamber where chamber_id = ?";

	private final static String UPDATE_CHAMBER_STATUS = "update chamber set is_emty = ? where chamber_id = ?";

	public static boolean updateChamberStatus(long chamberId,boolean status) {
		try {
			PreparedStatement pre = Connection.getPre(UPDATE_CHAMBER_STATUS);
			pre.setBoolean(1, status);
			pre.setLong(2, chamberId);
			return !pre.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

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

	public static Chamber findChamberById(long chamberId) {
		PreparedStatement pre = Connection.getPre(SELECT_ONE_CHAMBER);
		Chamber chamber = null;
		try {
			pre.setLong(1, chamberId);
			ResultSet rs = pre.executeQuery();
			if (rs.next()) {
				chamber = new Chamber(rs.getLong("chamber_id"), rs.getString("number"), rs.getInt("type"),
						rs.getInt("capacity"), rs.getFloat("area"), rs.getLong("price"), rs.getInt("floor"),
						rs.getBoolean("is_vip"), rs.getBoolean("is_emty"), rs.getString("note"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return chamber;
	}

	public static int totalChambers(int chamberType, int priceType) {
		try {
			String sql = "";
			switch (priceType) {
			case 0:
				sql = COUNT_TOTAL_CHAMBERS_0;
				break;
			case 1:
				sql = COUNT_TOTAL_CHAMBERS_1;
				break;
			default:
				sql = COUNT_TOTAL_CHAMBERS_2;
			}
			PreparedStatement pre = Connection.getPre(sql);
			pre.setInt(1, chamberType);
			ResultSet rs = pre.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public static List<Chamber> getChamberCheckIn(int chamberType, int priceType, int page, int items) {
		try {
			String sql = "";
			switch (priceType) {
			case 0:
				sql = SELECT_ALL_PRICE_0;
				break;
			case 1:
				sql = SELECT_ALL_PRICE_1;
				break;
			default:
				sql = SELECT_ALL_PRICE_2;
			}
			PreparedStatement pre = Connection.getPre(sql);
			pre.setInt(1, chamberType);
			pre.setInt(2, (page - 1));
			pre.setInt(3, items);
			ResultSet rs = pre.executeQuery();
			List<Chamber> listChamberCheckIn = new ArrayList<Chamber>();
			while (rs.next()) {
				listChamberCheckIn.add(new Chamber(rs.getLong("chamber_id"), rs.getString("number"), rs.getInt("type"),
						rs.getInt("capacity"), rs.getFloat("area"), rs.getLong("price"), rs.getInt("floor"),
						rs.getBoolean("is_vip"), rs.getBoolean("is_emty"), rs.getString("note")));
			}
			return listChamberCheckIn;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
}
