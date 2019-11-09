package connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
}
