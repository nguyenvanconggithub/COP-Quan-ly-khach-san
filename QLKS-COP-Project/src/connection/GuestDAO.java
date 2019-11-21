package connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.Guest;

public class GuestDAO {
	private final static String INSERT_GUEST = "insert into guest(full_name,birth,gender,address,id_no,passport,phone,email,note) \r\n"
			+ "values (?, ?, ?, ?, ?, ?, ?, ?, ?);";

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
			pre.setString(9, guest.getNote());
			return !pre.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return true;
		}
	}

}
