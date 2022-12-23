package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class LikeListDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	public LikeListDAO() {
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
	
	public ArrayList<Board> getList(String userID, int pageNumber){
		String SQL = "SELECT * FROM board WHERE boardID in(select boardID from likeList where userID = ?) ORDER BY boardID DESC LIMIT 10"; 
		ArrayList<Board> list = new ArrayList<Board>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();
				board.setBoardID(rs.getInt(1));
				board.setBoardTitle(rs.getString(2));
				board.setUserID(rs.getString(3));
				board.setBoardDate(rs.getString(4));
				board.setBoardContent(rs.getString(5));
				board.setBoardAvailable(rs.getInt(6));
				list.add(board);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; //데이터베이스 오류
	}
		public int write(String userID, int boardID) {
			String SQL = "INSERT INTO likeList VALUES(?, ?)";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, boardID);
				pstmt.setString(2, userID);
				pstmt.executeUpdate();
				return 1;
			}catch(Exception e) {
				e.printStackTrace();
			}
			return -1; //데이터베이스 오류
		}
		
		public ArrayList<LikeList> getlikeList(String userID, int boardID) {
			String SQL = "SELECT * FROM likeList WHERE userID = ? AND boardID = ?";
			ArrayList<LikeList> list = new ArrayList<LikeList>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1,  userID);
				pstmt.setInt(2,  boardID);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					LikeList likelist = new LikeList();
					likelist.setBoardID(rs.getInt(1));
					likelist.setUserID(rs.getString(2));
					list.add(likelist);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return list;
		}
	
	public int delete(String userID,int boardID) {
		String SQL = "DELETE FROM likeList WHERE boardID = ? AND userID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			pstmt.setString(2, userID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
}
	

