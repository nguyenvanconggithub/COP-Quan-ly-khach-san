package connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;
import java.util.List;

import model.Service;


public class ServiceDAO {
	private static ServiceDAO instance = null;
	public static ServiceDAO Instance() {
		if(instance == null) {
			instance = new ServiceDAO();
		}
		return instance;
	}
	public ArrayList<String> getAllServiceName() {
		try {
			ArrayList<String> serviceNames = new ArrayList<String>();
			String query = "SELECT name FROM service";
			PreparedStatement preStmt = Connection.Connecter().prepareStatement(query);
			
			ResultSet rs = preStmt.executeQuery();
			while(rs.next()) {
				serviceNames.add(rs.getString("name"));
			}
			return serviceNames;
		} catch (Exception e) {
			System.out.println("ServiceDAO - getAllServiceName err: " + e);
		}
		return null;
	}
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
