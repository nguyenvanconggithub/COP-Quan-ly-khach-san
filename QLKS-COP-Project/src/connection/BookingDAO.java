package connection;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;

import model.Booking;

public class BookingDAO{
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/qlks";
			String user = "root";
			String password = "tuananh";
			return DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException | SQLException e) {
			return null;
		}
	}
	public ArrayList<Booking> query(String sql, Object... parameters) {
		ArrayList<Booking> results = new ArrayList<>();
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			connection = getConnection();
			statement = connection.prepareStatement(sql);
			// set parameter
			setParameter(statement, parameters);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				Booking booking = new Booking();
				booking.setGuestName(resultSet.getString("guest_name"));
				booking.setPhone(resultSet.getString("phone"));
				booking.setEmail(resultSet.getString("email"));
				booking.setColRequire(resultSet.getString("col_require"));
				booking.setCheckInDate(resultSet.getDate("check_in_date"));
				booking.setCheckOutDate(resultSet.getDate("check_out_date"));
				booking.setChamberType(resultSet.getString("chamber_type"));
				booking.setChamberQuantity(resultSet.getInt("chamber_quantity"));
				booking.setCheckIn(resultSet.getBoolean("is_check_in"));
				booking.setNote(resultSet.getString("note"));
				results.add(booking);
			}
			return results;
		} catch (SQLException e) {
			return null;
		}finally {
			try {
				if (connection != null) {
					connection.close();
				}
				if (statement != null) {
					statement.close();
				}
				if (resultSet != null) {
					resultSet.close();
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		
	}

	private void setParameter(PreparedStatement statement, Object... parameters) {
		try {
			for(int i = 0; i< parameters.length; i++) {
				Object parameter = parameters[i];
				int index = i+1;
				if (parameter instanceof Long) {
					statement.setLong(index, (Long)parameter);
				}else if (parameter instanceof String) {
					statement.setString(index, (String)parameter);
				}else if (parameter instanceof Integer) {
					statement.setInt(index, (Integer)parameter);
				}else if (parameter instanceof Date) {
					statement.setDate(index, (Date)parameter);
				}else if (parameter instanceof Boolean) {
					statement.setBoolean(index, (Boolean)parameter);
				}else if (parameter == null) {
					statement.setNull(index, Types.NULL);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void update(Booking booking) {
		String sql = "UPDATE booking set guest_name = ?, phone = ?, email = ?, col_require = ?, check_in_date = ?, check_out_date = ?, chamber_type = ?, chamber_quantity = ?, is_check_in = ?, note = ? where booking_id = ?";
		getConnection();
		insert(sql, booking.getGuestName(), booking.getPhone(), booking.getEmail(), booking.getColRequire(), booking.getCheckInDate(), booking.getCheckOutDate(), booking.getChamberType(),booking.getChamberQuantity(), booking.getIsCheckIn(), booking.getNote(), booking.getBookingId());
		
	}

	public void insert(String sql, Object... parameters) {
		Connection connection = null;
		PreparedStatement statement = null;
		try {
			connection = getConnection();
			connection.setAutoCommit(false);
			statement = connection.prepareStatement(sql);
			setParameter(statement, parameters);
			statement.executeUpdate();
			connection.commit();
		}catch(SQLException e) {
			e.printStackTrace();
			if (connection != null) {
				try {
					connection.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		}finally {
			try {
				if (connection != null) {
					connection.close();
				}
				if (statement != null) {
					statement.close();
				}
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
	}
	public void save(Booking booking) {
		String sql = "INSERT INTO booking (guest_name, phone, email, col_require, check_in_date, check_out_date, chamber_type, chamber_quantity, is_check_in,note) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
		getConnection();
		insert(sql, booking.getGuestName(),booking.getPhone(),booking.getEmail(),booking.getColRequire(),booking.getCheckInDate(),booking.getCheckOutDate(),booking.getChamberType(),booking.getChamberQuantity(),booking.getIsCheckIn(),booking.getNote());
	}
	
	public void delete(Booking booking) {
		String sql = "DELETE FROM booking WHERE booking_id = ?";
		getConnection();
		insert(sql, booking.getBookingId());
	}
}

