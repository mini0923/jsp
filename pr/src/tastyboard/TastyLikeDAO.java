package tastyboard;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import tastyboard.Tasty;
import tastyboard.TastyLike;;

public class TastyLikeDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	public TastyLikeDAO() {
		try {
			String dbURL="jdbc:mysql://localhost:3309/project?useSSL=false&useUnicode=true&serverTimezone=Asia/Seoul"; 
			String dbID="root";
			String dbPassword="1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<Tasty> getList(String userID, int pageNumber){
		String SQL = "SELECT * FROM tasty WHERE tastyID in(select tastyID from tastylike where userID = ?) ORDER BY tastyID DESC LIMIT 10"; 
		ArrayList<Tasty> list = new ArrayList<Tasty>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Tasty tasty = new Tasty();
				tasty.setTastyID(rs.getInt(1));
				tasty.setTastyTitle(rs.getString(2));
				tasty.setTastyDate(rs.getString(3));
				tasty.setTastyLocation(rs.getString(4));
				tasty.setTastyTel(rs.getString(5));
				tasty.setTastyCategory(rs.getString(6));
				tasty.setUserID(rs.getString(7));
				tasty.setTastyContent(rs.getString(8));
				tasty.setTastyAvailable(rs.getInt(9));
				list.add(tasty);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; //데이터베이스 오류
	}
	public int write(String userID, int tastyID) {
        int count;
        String SQL = "INSERT INTO tastylike VALUES(?, ?)";
        String SQL1 = "select count(tastyid) from tastylike where tastyid = ?";
        String SQL2 = "update tasty set tastylikecount = ? where tastyid = ?";
        try {
           PreparedStatement pstmt = conn.prepareStatement(SQL);
           pstmt.setInt(1, tastyID);
           pstmt.setString(2, userID);
           pstmt.executeUpdate();
           pstmt = conn.prepareStatement(SQL1);
           pstmt.setInt(1, tastyID);
           rs = pstmt.executeQuery();
           while(rs.next()) {
              count = rs.getInt(1);
              pstmt = conn.prepareStatement(SQL2);
              pstmt.setInt(1, count);
              pstmt.setInt(2, tastyID);
              pstmt.executeUpdate();

              return 1;
           }
        }catch(Exception e) {
           e.printStackTrace();
        }
        return -1; //     ͺ  ̽      
     }
		
		public ArrayList<TastyLike> gettastyLike(String userID, int tastyID) {
			String SQL = "SELECT * FROM tastylike WHERE userID = ? AND tastyID = ?";
			ArrayList<TastyLike> list = new ArrayList<TastyLike>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1,  userID);
				pstmt.setInt(2,  tastyID);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					TastyLike tastylike = new TastyLike();
					tastylike.setTastyID(rs.getInt(1));
					tastylike.setUserID(rs.getString(2));
					list.add(tastylike);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return list;
		}
	
		public int delete(String userID,int tastyID) {
		      int count;
		      String SQL = "DELETE FROM tastylike WHERE tastyID = ? AND userID = ?";
		      String SQL1 = "select count(tastyid) from tastylike where tastyid = ?";
		      String SQL2 = "update tasty set tastylikecount = ? where tastyid = ?";
		      try {
		         PreparedStatement pstmt = conn.prepareStatement(SQL);
		         pstmt.setInt(1, tastyID);
		         pstmt.setString(2, userID);
		         pstmt.executeUpdate();
		         pstmt = conn.prepareStatement(SQL1);
		         pstmt.setInt(1, tastyID);
		         rs = pstmt.executeQuery();
		         while(rs.next()) {
		            count = rs.getInt(1);
		            pstmt = conn.prepareStatement(SQL2);
		            pstmt.setInt(1, count);
		            pstmt.setInt(2, tastyID);
		            pstmt.executeUpdate();
		            return 1;
		         }
		      } catch (Exception e) {
		         e.printStackTrace();
		      }
		      return -1; //      ͺ  ̽      
		   }

	
}
	

