package connection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Chamber;

public class ChamberDAO {

	private final static String SELECT_ALL_EMPTY = "select * from chamber where is_emty = 0";

	public static List<Chamber> getChamberWS() {
		try {
			ResultSet rs = Connection.getPre(SELECT_ALL_EMPTY).executeQuery();
			List<Chamber> listChamberEmpty = new ArrayList<Chamber>();
			while (rs.next()) {
				listChamberEmpty.add(new Chamber(rs.getLong("chamber_id"), rs.getString("number"), rs.getInt("type"),
						rs.getInt("capacity"), rs.getFloat("area"), rs.getLong("price"), rs.getInt("floor"),
						rs.getBoolean("is_vip"), rs.getBoolean("is_emty"), rs.getString("note")));
			}
			return listChamberEmpty;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
}
