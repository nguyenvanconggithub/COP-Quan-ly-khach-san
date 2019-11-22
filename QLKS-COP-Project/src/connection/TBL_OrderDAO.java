package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.OrderDTO;

public class TBL_OrderDAO {
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
	public ArrayList<OrderDTO> findAll() {
		String sql = "select tbl_order.order_id, order_quantity, people,time, tbl_order.is_paid,full_name,phone, food.name, food.price,food.note,chamber.number from tbl_order,bill,guest,order_food, food, bill_chamber, chamber where tbl_order.bill_id = bill.bill_id and bill.guest_id = guest.guest_id and order_food.order_id = tbl_order.order_id and order_food.food_id = food.food_id and bill.bill_id = bill_chamber.bill_id and bill.bill_id = bill_chamber.bill_id and bill_chamber.chamber_id = chamber.chamber_id";
		ArrayList<OrderDTO> results = new ArrayList<>();
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			connection = getConnection();
			statement = connection.prepareStatement(sql);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				OrderDTO orderDTO = new OrderDTO();
				orderDTO.setOrderId(resultSet.getLong("order_id"));
				orderDTO.setPeople(resultSet.getInt("people"));
				orderDTO.setTime(resultSet.getDate("time"));
				orderDTO.setPaid(resultSet.getBoolean("is_paid"));
				orderDTO.setFullName(resultSet.getString("full_name"));
				orderDTO.setPhone(resultSet.getString("phone"));
				orderDTO.setNumber(resultSet.getString("number"));
				orderDTO.setName(resultSet.getString("name"));
				orderDTO.setPrice(resultSet.getLong("price"));
				orderDTO.setNote(resultSet.getString("note"));
				orderDTO.setOrderQuantity(resultSet.getInt("order_quantity"));
				results.add(orderDTO);
			}
			System.out.println(results.size());
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
}
