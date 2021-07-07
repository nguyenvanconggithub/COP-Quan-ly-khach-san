package connection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Service;

public class ServiceDAO {

	private final static String SELECT_ALL = "select * from service";

	public static List<Service> getHotelService() {
		try {
			ResultSet rs = Connection.getPre(SELECT_ALL).executeQuery();
			List<Service> listHotelService = new ArrayList<Service>();
			while (rs.next()) {
				listHotelService.add(new Service(rs.getLong("service_id"), rs.getString("name")));
			}
			return listHotelService;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
}
