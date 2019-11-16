package connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;
import java.util.List;

import model.Image;


public class ImageDAO {
	private static ImageDAO instance = null;
	public static ImageDAO Instance() {
		if(instance == null) {
			instance = new ImageDAO();
		}
		return instance;
	}
	public ArrayList<Image> getAllHotelImage() {
		try {
			ArrayList<Image> hotelImage = new ArrayList<Image>();
			String query = "SELECT * FROM image WHERE type = 0";
			PreparedStatement preStmt = Connection.Connecter().prepareStatement(query);
			
			ResultSet rs = preStmt.executeQuery();
			while(rs.next()) {
				Image img = new Image();
				img.setImageId(rs.getLong("image_id"));
				img.setLink(rs.getString("link"));
				
				hotelImage.add(img);
			}
			return hotelImage;
		} catch (Exception e) {
			System.out.println("ImageDAO - getAllHotelImageLink err: " + e);
		}
		return null;
	}

	private final static String SELECT_ALL = "select * from image where type = 0";

	public static List<Image> getImageHotel() {
		try {
			ResultSet rs = Connection.getPre(SELECT_ALL).executeQuery();
			List<Image> listImageHotel = new ArrayList<Image>();
			while (rs.next()) {
				listImageHotel.add(new Image(rs.getLong("image_id"), rs.getBoolean("type"), rs.getString("link")));
			}
			return listImageHotel;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	public String getImageLinkByID(String ID) {
		try {
			String query = "SELECT link FROM image WHERE image_id = ?";
			PreparedStatement preStmt = Connection.Connecter().prepareStatement(query);
			preStmt.setString(1, ID);
			ResultSet rs = preStmt.executeQuery();
			if(rs.next()) {
				return rs.getString("link");
			}
		} catch (Exception e) {
			System.out.println("HotelDAO - getImageLinkByID err: " + e);
		}
		return null;
	}
	public boolean removeImageByID(String ID) {
		try {
			boolean result = false;
			String query = "DELETE FROM image WHERE image_id = ?";
			PreparedStatement preStmt = Connection.Connecter().prepareStatement(query);
			preStmt.setString(1, ID);
			result = preStmt.execute();
			return result;
		} catch (Exception e) {
			System.out.println("HotelDAO - removeImageByID err: " + e);
		}
		return false;
	}
	public boolean setNewHotelImage(String path) {
		try {
			boolean result = false;
			String query = "INSERT INTO image (type, link) VALUES(0,?)";
			PreparedStatement preStmt = Connection.Connecter().prepareStatement(query);
			preStmt.setString(1, path);
			result = preStmt.execute();
			return result;
		} catch (Exception e) {
			System.out.println("HotelDAO - setNewHotelImage err: " + e);
		}
		return false;

	}
}
