package connection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Image;

public class ImageDAO {

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

}
