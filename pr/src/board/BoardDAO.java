package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO {
	private Connection conn;

	private PreparedStatement pstmt;
	private ResultSet rs; 
	
	public BoardDAO() {
		
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
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //DB ���� 
	}
	
	public int getNext() {
		String SQL = "SELECT boardID FROM Board ORDER BY boardID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //DB ���� 
	}
	int boardID;
	
	public int write(String boardTitle, String userID, String boardContent, int boardCount, String biName, String biPath){
		String SQL = "INSERT INTO Board VALUES (?, ?, ?, ?, ?, ?,?)";
		String SQL1 = "INSERT INTO boardimage VALUES (?, ?, ?)"; //�̹��� ���ε�
		try {
			boardID = getNext();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			pstmt.setString(2, boardTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, boardContent);
			pstmt.setInt(6, boardCount);
			pstmt.setInt(7, 1);
			int reuslt = pstmt.executeUpdate();
			if(reuslt ==1 && biName != null && biPath != null) {  //�̹��� ���ε� ���й� ���� ��� �̹���db�� �ȿö�
			pstmt = conn.prepareStatement(SQL1);
			pstmt.setInt(1, boardID);
			pstmt.setString(2, biName);
			pstmt.setString(3, biPath);
			return pstmt.executeUpdate();
			}else {
				return 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //DB ���� 
	}
	
	
	public ArrayList<Board> getList(int pageNumber){
		String SQL = "SELECT * FROM Board WHERE boardID < ? AND boardAvailable = 1 ORDER BY boardID DESC LIMIT 10";
		ArrayList<Board> list = new ArrayList<Board>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()-(pageNumber -1)*100);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();
				board.setBoardID(rs.getInt(1));
				board.setBoardTitle(rs.getString(2));
				board.setUserID(rs.getString(3));
				board.setBoardDate(rs.getString(4));
				board.setBoardContent(rs.getString(5));
				board.setBoardCount(rs.getInt(6));
				board.setBoardAvailable(rs.getInt(7));
				list.add(board);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
	
	public ArrayList<Board> getList1(String userID, int pageNumber){//Ư���� ����Ʈ�� �޾Ƽ� ��ȯ
		String SQL="select * from board where userID =?";//������ �Խù� ��ȯ, ������ ���� ���� �۸� �����´�.
		ArrayList<Board> list = new ArrayList<Board>();
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setBoardID(rs.getInt(1));
				board.setBoardTitle(rs.getString(2));
				board.setUserID(rs.getString(3));
				board.setBoardDate(rs.getString(4));
				board.setBoardContent(rs.getString(5));
				board.setBoardCount(rs.getInt(6));
				board.setBoardAvailable(rs.getInt(7));
				list.add(board);
			}			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;//��� ����Ʈ ��ȯ
	}
	
	// �ش� �������� �Ѿ �� �ִ��� �˻� 
	public boolean nextPage(int pageNumber){
		String SQL = "SELECT * FROM Board WHERE boardID < ? AND boardAvailable = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()-(pageNumber -1)*10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false; 
	}
	
	public void Count(int boardID) {	
		int count = 0;
		int rss= 0;
		String SQL = "update board set boardCount = boardCount + 1 where boardID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			rss = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
       
	public Board getBoard(int boardID)
    {
		Count(boardID);
		String SQL = "SELECT * FROM Board WHERE boardID = ?"; 
        try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, boardID);
				rs = pstmt.executeQuery();
				if (rs.next())
				{
	                Board board = new Board();
	                board.setBoardID(rs.getInt(1));
	                board.setBoardTitle(rs.getString(2));
	                board.setUserID(rs.getString(3));
	                board.setBoardDate(rs.getString(4));
	                board.setBoardContent(rs.getString(5));
	                board.setBoardCount(rs.getInt(6));
	                board.setBoardAvailable(rs.getInt(7));
	                return board;
		        }
        } catch (Exception e) {
        	e.printStackTrace();
        }
        return null; 
    }
	
	public BoardImage getUpload(int boardID){
	      String SQL = "select * from boardimage where boardid = ?";
	      try {
	         PreparedStatement pstmt = conn.prepareStatement(SQL);
	         pstmt.setInt(1, boardID);
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
	        	 BoardImage boardimage = new BoardImage();
	        	 boardimage.setBiName(rs.getString(2));
	        	 boardimage.setBiPath(rs.getString(3));
	        	 return boardimage;
	         }
	         else {
	        	 return null;
	         }
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      return null; 
	   }
	
	public int update(int boardID, String boardTitle, String boardContent) {	
		String SQL = "UPDATE Board SET boardTitle = ?, boardContent = ? WHERE boardID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, boardTitle);
			pstmt.setString(2, boardContent);
			pstmt.setInt(3, boardID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //DB ���� 
	}

	public int delete(int boardID) {
		String SQL = "delete from Board WHERE boardID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //DB ���� 
	}
	

	public int adminDelete(String boardID) {
		String SQL = "delete from board where boardID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, boardID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //DB ���� 
	}
	
}