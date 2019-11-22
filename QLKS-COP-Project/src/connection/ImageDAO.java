package connection;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import model.Image;


public class ImageDAO {
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
	
	public Image findOneById(Long imageId) {
		String sql = "select * from image where image_id = ?";
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			connection = getConnection();
			statement = connection.prepareStatement(sql);
			// set parameter
			statement.setLong(1, imageId);
			Image image = new Image();
			resultSet = statement.executeQuery();
				while(resultSet.next()) {
					image.setImageId(resultSet.getLong("image_id"));
					image.setType(resultSet.getBoolean("type"));
					image.setLink(resultSet.getString("link"));
				}
				return image;
		} catch (SQLException e) {
			e.printStackTrace();
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
		return null;
		
	}
	public Image findOneByLink(String link) {
		String sql = "select * from image where link = ?";
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			connection = getConnection();
			statement = connection.prepareStatement(sql);
			// set parameter
			statement.setString(1, link);
			resultSet = statement.executeQuery();
				Image image = new Image();
				while(resultSet.next()) {
					image.setImageId(resultSet.getLong("image_id"));
					image.setType(resultSet.getBoolean("type"));
					image.setLink(resultSet.getString("link"));
				}
			return image;
		} catch (SQLException e) {
			e.printStackTrace();
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
		return null;
	}
	public void save(String link) {
		String sql = "INSERT INTO image (type, link) values(?, ?)";
		getConnection();
		Image img = new Image();
		img = findOneByLink(link);
		if(img.getLink()==null) {
			insert(sql, true, link);
		}
	}
}
