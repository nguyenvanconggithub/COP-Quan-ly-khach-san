package connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


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
}
