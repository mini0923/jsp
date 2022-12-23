package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import board.Board;
import tastyboard.Tasty;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
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
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPassword))
					return 1; // 
				else
					return 0; // 
			}
			return -1; // 성공
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return -2; // DB오류
	}
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES(?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getUserDate());
			pstmt.setString(3, user.getUserID());
			pstmt.setString(4, user.getUserPassword());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate(); // 0�̻� ���� return�� ��� ����
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return -1; // DB����
	} 
	
	public int idCheck(String userID) {
		int check = -1;
		String SQL = "SELECT USERID FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){	
				check = 0;
			}else{
				check = 1;
			}
			
			System.out.println("아이디 중복체크 : "+ check);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}
	
	public List<User> userList(){
		String SQL = "select * from user"; 
		List<User> List = new Vector<User>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setUserName(rs.getString(1));
				user.setUserDate(rs.getString(2));
				user.setUserID(rs.getString(3));
				user.setUserPassword(rs.getString(4));
				user.setUserEmail(rs.getString(5));
				List.add(user);
			}
		}
	        catch (Exception e) {
	            e.printStackTrace();
	        }        
	        
	        return List;  //목록반환
	}
	
	// 비밀번호 변경
	public int pwModify(String newPassword, String userId, String oldPassword) {
		int result = -1;
		String dbpw = "";
		
		try {
			String SQL1 = "select userPassword from user where userID = ?";
			String SQL2 = "update user set userPassword = ? where userID = ?";
			
			conn.setAutoCommit(false); //자동 커밋 해제
			
			pstmt = conn.prepareStatement(SQL1);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				dbpw = rs.getString("userPassword");
				if(dbpw.equals(oldPassword)) {
					pstmt = conn.prepareStatement(SQL2);
					pstmt.setString(1, newPassword);
					pstmt.setString(2, userId);
					pstmt.executeUpdate();
					conn.commit();
					result = 1;
				}else {
						result = 0;
					}
			}
		}catch(Exception e){
			try {
			conn.rollback();
			}catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		return result;
	}
	
	//회원탈퇴
	public int userDelete(String userId, String userPassword) { 
		int result = -1;
		String dbpw = "";
		try {
			String SQL1 = "select userPassword from user where userID = ? "; //사용자의 비밀번호값 가져오는 문 
			String SQL2 = "delete from user where userID = ? "; //삭제문
			
			conn.setAutoCommit(false); //자동커밋 해제
			
			pstmt = conn.prepareStatement(SQL1);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
					
			if(rs.next()) {
				dbpw = rs.getString("userPassword"); //비밀번호 삽입
				if(dbpw.equals(userPassword)) { //비밀번호 일치여부
					pstmt = conn.prepareStatement(SQL2);
					pstmt.setString(1, userId);
					pstmt.executeUpdate();
					conn.commit();
					result = 1;
				}else {
					result = 0;
				}
			}
			
		}catch(Exception e){
			try {
			conn.rollback();
			}catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		return result;
	}
	
	public int adminDelete(String userId) {  //관리자가 회원탈퇴
		int result = -1;
		try {
			String SQL = "delete from user where userID = ? "; //삭제문
			
			conn.setAutoCommit(false); //자동커밋 해제
			
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			int check = pstmt.executeUpdate();
			
			if(check == 1) {
				conn.commit();
				result = 1;
			}else {
				conn.rollback();
				result = 0;
			}
		}catch(Exception e){
			try {
			conn.rollback();
			}catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		return result;
	}
	
	public ArrayList<User> Info(String userID, int pageNumber){//특정한 리스트를 받아서 반환
		String SQL="select * from user where userID =?";//마지막 게시물 반환, 삭제가 되지 않은 글만 가져온다.
		ArrayList<User> list = new ArrayList<User>();
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				User user = new User();
				user.setUserName(rs.getString(1));
				user.setUserDate(rs.getString(2));
				user.setUserID(rs.getString(3));
				user.setUserPassword(rs.getString(4));
				user.setUserEmail(rs.getString(5));
				list.add(user);
			}			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;//댓글 리스트 반환
	}
	
}
