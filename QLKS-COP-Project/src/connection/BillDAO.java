package connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import dto.CheckOutDTO;

public class BillDAO {

	private final static String INSERT_BILL = "insert into bill(check_in_date,is_paid,note,guest_id) value(?,0,?,?)";

	private final static String INSERT_BILL_CHAMBER = "insert into bill_chamber(bill_id,chamber_id) value (?,?)";

	private final static String SELECT_BILL_ID = "select max(bill_id) from bill";

	private final static String SELECT_LIST_CHAMBER_CHECK_OUT = "select c.number from chamber c join bill_chamber bc on c.chamber_id = bc.chamber_id join bill b on b.bill_id = bc.bill_id join guest g on g.guest_id = b.guest_id where b.is_paid = 0";

	private final static String SELECT_CHECK_OUT_INFO = "select c.chamber_id,b.bill_id,c.type,c.price,c.is_vip,b.check_in_date,datediff(now(),b.check_in_date) as stay_days,datediff(now(),b.check_in_date)*c.price as rent_money,b.note,g.full_name,g.birth,g.gender,g.address,g.id_no,g.passport,g.phone,g.email from chamber c join bill_chamber bc on c.chamber_id = bc.chamber_id join bill b on b.bill_id = bc.bill_id join guest g on g.guest_id = b.guest_id where b.is_paid = 0 and c.number = ?";

	private final static String UPDATE_BILL = "update bill set check_out_date = ?,total_payment = ?,is_paid = 1 where bill_id = ?;";

	public static boolean updateBill(long billId, long total) {
		java.sql.Date today = new java.sql.Date(Calendar.getInstance().getTime().getTime());
		PreparedStatement pre = Connection.getPre(UPDATE_BILL);
		try {
			pre.setDate(1, today);
			pre.setLong(2, total);
			pre.setLong(3, billId);
			return !pre.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public static List<String> getListChamberCheckOut() {
		try {
			ResultSet rs = Connection.getPre(SELECT_LIST_CHAMBER_CHECK_OUT).executeQuery();
			List<String> listChamber = new ArrayList<String>();
			while (rs.next()) {
				listChamber.add(rs.getString("number"));
			}
			return listChamber;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static CheckOutDTO getCheckOutInfo(String chamberNumber) {
		PreparedStatement pre = Connection.getPre(SELECT_CHECK_OUT_INFO);
		try {
			pre.setString(1, chamberNumber);
			ResultSet rs = pre.executeQuery();
			CheckOutDTO checkOutDTO = null;
			if (rs.next()) {
				checkOutDTO = new CheckOutDTO(rs.getLong("chamber_id"), rs.getLong("bill_id"), rs.getInt("type"),
						rs.getLong("price"), rs.getBoolean("is_vip"), rs.getDate("check_in_date"),
						rs.getInt("stay_days"), rs.getLong("rent_money"), rs.getString("note"),
						rs.getString("full_name"), rs.getDate("birth"), rs.getBoolean("gender"),
						rs.getString("address"), rs.getString("id_no"), rs.getString("passport"), rs.getString("phone"),
						rs.getString("email"));
			}
			return checkOutDTO;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static boolean createBill(String note, long guestId) {
		try {
			java.sql.Date today = new java.sql.Date(Calendar.getInstance().getTime().getTime());
			PreparedStatement pre = Connection.getPre(INSERT_BILL);
			pre.setDate(1, today);
			pre.setString(2, note);
			pre.setLong(3, guestId);
			return !pre.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	private static long getBillId() {
		try {
			ResultSet rs = Connection.getPre(SELECT_BILL_ID).executeQuery();
			if (rs.next()) {
				return rs.getLong(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public static boolean createBillChamber(long chamberId) {
		try {
			PreparedStatement pre = Connection.getPre(INSERT_BILL_CHAMBER);
			pre.setLong(1, getBillId());
			pre.setLong(2, chamberId);
			return !pre.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}
