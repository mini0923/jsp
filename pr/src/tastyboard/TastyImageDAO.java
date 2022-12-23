package tastyboard;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import tastyboard.TastyImage;

public class TastyImageDAO {
	private Connection conn;
	private ResultSet rs; 
	
public TastyImageDAO() {
		
		try {
			String dbURL="jdbc:mysql://localhost:3309/project?useSSL=false&useUnicode=true&serverTimezone=Asia/Seoul"; 
			String dbID="root";
			String dbPassword="1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int upload(int tastyID, String tiName, String tiPath ) {
		String SQL = "INSERT INTO bbs_file VALUES (?,?,?)";
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, tastyID);
			pstmt.setString(2, tiName);
			pstmt.setString(3, tiPath);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			
		}
		return -1;
	}
}
