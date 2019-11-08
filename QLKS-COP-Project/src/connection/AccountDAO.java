package connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class AccountDAO {
	private static AccountDAO instance = null;
	public static AccountDAO Instance() {
		if(instance == null) {
			instance = new AccountDAO();
		}
		return instance;
	}
	public boolean isExists(String username, String pass) {
		try {
			String query = "SELECT * FROM account WHERE username = ? AND password = ?";
			PreparedStatement preStmt = Connection.Connecter().prepareStatement(query);
			preStmt.setString(1, username);
			preStmt.setString(2, pass);
			
			ResultSet rs = preStmt.executeQuery();
			return rs.next(); //true if have record
		} catch (Exception e) {
			System.out.println("AccountDAO - isExists err: " + e);
		}
		return false;	
	}
	
	public int getAccountRole(String username) {
		try {
			String query = "SELECT * FROM account WHERE username = ?";
			PreparedStatement preStmt = Connection.Connecter().prepareStatement(query);
			preStmt.setString(1, username);
			
			ResultSet rs = preStmt.executeQuery();
			if(rs.next()) {
				return rs.getInt("role");
			}
		} catch (Exception e) {
			System.out.println("AccountDAO - getAccountRole err: " + e);
		}
		return -1;
	}
}
