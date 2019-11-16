package connection;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;

import dto.FoodDTO;
import model.Food;

public class FoodDAO {
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
	public ArrayList<FoodDTO> findAll() {
		String sql = "select * from food, image where food.image_id = image.image_id";
		ArrayList<FoodDTO> results = new ArrayList<>();
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			connection = getConnection();
			statement = connection.prepareStatement(sql);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				FoodDTO food = new FoodDTO();
				food.setFoodId(resultSet.getLong("food_id"));
				food.setName(resultSet.getString("name"));
				food.setType(resultSet.getString("type"));
				food.setDescription(resultSet.getString("description"));
				food.setPrice(resultSet.getLong("price"));
				food.setImageId(resultSet.getLong("image_id"));
				food.setNote(resultSet.getString("note"));
				food.setLink(resultSet.getString("link"));
				results.add(food);
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
	
	public void update(Food food) {
		String sql = "update food set name = ?, type = ?, description = ?, price = ?, note = ? where food_id = ?";
		getConnection();
		insert(sql,food.getName(), food.getType(), food.getDescription(), food.getPrice(), food.getNote(), food.getFoodId());
	}
	public void delete(Food food) {
		String sql = "DELETE FROM food WHERE food_id = ?";
		getConnection();
		insert(sql,food.getFoodId());
	}
	public void save(Food food) {
		String sql = "Insert into food(name, type, description, price, image_id) values(?, ?, ?, ?, ?)";
		getConnection();
		insert(sql, food.getName(), food.getType(), food.getDescription(), food.getPrice(),food.getImageId());
	}
	

}

