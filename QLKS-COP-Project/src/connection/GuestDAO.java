package connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Guest;

public class GuestDAO {
	private final static String INSERT_GUEST = "insert into guest(full_name,birth,gender,address,id_no,passport,phone,email) \r\n"
			+ "values (?, ?, ?, ?, ?, ?, ?, ?);";

	private final static String SELECT_GUEST_ID = "select max(guest_id) from guest";

	private final static String SELECT_GUEST = "select * from guest where id_no like ? or full_name like ? or passport like ? limit ?,?";

	private final static String COUNT_TOTAL_GUEST = "select count(*) from guest where id_no like ? or full_name like ? or passport like ?";

	private final static String SELECT_GUEST_BY_ID = "select * from guest where guest_id = ?";
	
	private final static String UPDATE_GUEST = "update guest set full_name = ?,birth = ?,gender=?,address=?,id_no=?,passport=?,phone=?,email=? where guest_id = ?;";

	public static boolean updateGuest(Guest guest) {
		PreparedStatement pre = Connection.getPre(UPDATE_GUEST);
		try {
			java.util.Date utilBirth = guest.getBirth();
			java.sql.Date sqlBirth = new java.sql.Date(utilBirth.getTime());
			pre.setString(1, guest.getFullName());
			pre.setDate(2, sqlBirth);
			pre.setBoolean(3, guest.isGender());
			pre.setString(4, guest.getAddress());
			pre.setString(5, guest.getIdNo());
			pre.setString(6, guest.getPassport());
			pre.setString(7, guest.getPhone());
			pre.setString(8, guest.getEmail());
			pre.setLong(9, guest.getGuestId());
			return !pre.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public static Guest findGuest(long guestId) {
		PreparedStatement pre = Connection.getPre(SELECT_GUEST_BY_ID);
		try {
			pre.setLong(1, guestId);
			ResultSet rs = pre.executeQuery();
			if (rs.next()) {
				return new Guest(rs.getLong("guest_id"), rs.getString("full_name"), rs.getDate("birth"),
						rs.getBoolean("gender"), rs.getString("address"), rs.getString("id_no"),
						rs.getString("passport"), rs.getString("phone"), rs.getString("email"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static int countTotalGuest(String textSearch) {
		PreparedStatement pre = Connection.getPre(COUNT_TOTAL_GUEST);
		String text = "%" + textSearch + "%";
		try {
			pre.setString(1, text);
			pre.setString(2, text);
			pre.setString(3, text);
			ResultSet rs = pre.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public static List<Guest> getListGuest(String textSearch, int page) {
		PreparedStatement pre = Connection.getPre(SELECT_GUEST);
		int items = 10; // 10 record per page
		String text = "%" + textSearch + "%";
		try {
			pre.setString(1, text);
			pre.setString(2, text);
			pre.setString(3, text);
			pre.setInt(4, (page - 1));
			pre.setInt(5, items);
			ResultSet rs = pre.executeQuery();
			List<Guest> listGuest = new ArrayList<Guest>();
			while (rs.next()) {
				listGuest.add(new Guest(rs.getLong("guest_id"), rs.getString("full_name"), rs.getDate("birth"),
						rs.getBoolean("gender"), rs.getString("address"), rs.getString("id_no"),
						rs.getString("passport"), rs.getString("phone"), rs.getString("email")));
			}
			return listGuest;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static long getGuestId() {
		try {
			ResultSet rs = Connection.getPre(SELECT_GUEST_ID).executeQuery();
			if (rs.next()) {
				return rs.getLong(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public static boolean checkIn(Guest guest) {
		try {
			java.util.Date utilBirth = guest.getBirth();
			java.sql.Date sqlBirth = new java.sql.Date(utilBirth.getTime());
			PreparedStatement pre = Connection.getPre(INSERT_GUEST);
			pre.setString(1, guest.getFullName());
			pre.setDate(2, sqlBirth);
			pre.setBoolean(3, guest.isGender());
			pre.setString(4, guest.getAddress());
			pre.setString(5, guest.getIdNo());
			pre.setString(6, guest.getPassport());
			pre.setString(7, guest.getPhone());
			pre.setString(8, guest.getEmail());
			return !pre.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

}
