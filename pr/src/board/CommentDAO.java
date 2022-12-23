package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import board.Board;

public class CommentDAO {
	
	private Connection conn;//�����ͺ��̽��� �����ϰ� ���ִ� �ϳ��� ��ü
	private ResultSet rs;//������ ���� �� �ִ� ��ü
	
	public CommentDAO() {//mysql�� ������ �ϰ� ����,�ڵ����� �����ͺ��̽� Ŀ�ؼ��� �Ͼ
		try {//����ó��
			String dbURL="jdbc:mysql://localhost:3309/project?useSSL=false&useUnicode=true&serverTimezone=Asia/Seoul"; 
			String dbID="root";
			String dbPassword="1234";
			Class.forName("com.mysql.jdbc.Driver");//mysql����̹��� ã�´�.
			//����̹��� mysql�� ������ �� �ֵ��� �Ű�ü ������ �ϴ� �ϳ��� ���̺귯��
			conn=DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {//���� ���� �ð� ��������
		String SQL="select now()";//���� �ð��� �������� mysql����
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);//sql������ ���� �غ� �ܰ��
			rs=pstmt.executeQuery();//������ ��������
			if(rs.next()) {
				return rs.getString(1);//���� ��¥ ��ȯ
			}
			
		} catch(Exception e) {
			e.printStackTrace();//���� �߻�
		}
		return "";//�����ͺ��̽� ����
	}
	
	public int getNext() {
		String SQL="SELECT commentID from COMMENT order by commentID DESC";//������ �Խù� ��ȯ
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // ù ��° �Խù��� ���
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//�����ͺ��̽� ����
	}
	
	public int write(String commentContent, String userID, int boardID) {
		String SQL="insert into COMMENT VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, commentContent);
			pstmt.setInt(2, getNext());
			pstmt.setString(3, userID);
			pstmt.setInt(4, 1);
			pstmt.setString(5, getDate());
			pstmt.setInt(6, boardID);
			return pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//�����ͺ��̽� ����
	}

	public ArrayList<Comment> getList(int boardID){//Ư���� ����Ʈ�� �޾Ƽ� ��ȯ
		String SQL="SELECT * from comment where boardID = ? AND commentAvailable = 1 order by boardID desc limit 10";//������ �Խù� ��ȯ, ������ ���� ���� �۸� �����´�.
		ArrayList<Comment> list = new ArrayList<Comment>();
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Comment comment = new Comment();
				comment.setCommentContent(rs.getString(1));
				comment.setCommentID(rs.getInt(2));
				comment.setUserID(rs.getString(3));
				comment.setCommentAvailable(rs.getInt(4));
				comment.setCommentDate(rs.getString(5));
				comment.setBoardID(rs.getInt(6));
				list.add(comment);
			}			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;//��� ����Ʈ ��ȯ
	}
	
	public ArrayList<Comment> getList1(String userID, int pageNumber){//Ư���� ����Ʈ�� �޾Ƽ� ��ȯ
		String SQL="select * from comment where userID =?";//������ �Խù� ��ȯ, ������ ���� ���� �۸� �����´�.
		ArrayList<Comment> list = new ArrayList<Comment>();
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Comment comment = new Comment();
				comment.setCommentContent(rs.getString(1));
				comment.setCommentID(rs.getInt(2));
				comment.setUserID(rs.getString(3));
				comment.setCommentAvailable(rs.getInt(4));
				comment.setCommentDate(rs.getString(5));
				comment.setBoardID(rs.getInt(6));
				list.add(comment);
			}			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;//��� ����Ʈ ��ȯ
	}
	
	public Comment getComment(int commentID) {//�ϳ��� ��� ������ �ҷ����� �Լ�
		String SQL="SELECT * from comment where commentID = ?";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, commentID);
			rs=pstmt.executeQuery();//select
			if(rs.next()) {//����� �ִٸ�
				Comment comment = new Comment();
				comment.setCommentContent(rs.getString(1));
				comment.setCommentID(rs.getInt(2));
				comment.setUserID(rs.getString(3));
				comment.setCommentAvailable(rs.getInt(4));
				comment.setCommentDate(rs.getString(5));
				comment.setBoardID(rs.getInt(6));
				return comment;
			}			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int boardID, int commentID,String commentContent ) {
		String SQL="update comment set commentContent = ? where boardID = ? and commentID = ?";//Ư���� ���̵� �ش��ϴ� ����� ������ �ٲ��ش�. 
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, commentContent);//����ǥ�� ����
			pstmt.setInt(2, boardID);
			pstmt.setInt(3, commentID);
			return pstmt.executeUpdate();//insert,delete,update			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//�����ͺ��̽� ����
	}
	
	public int delete(int commentID) {
		String SQL = "delete from COMMENT where commentID = ?";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, commentID);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//�����ͺ��̽� ����
	}
	
	public int adminDelete(String commentID) {
		String SQL = "delete from Comment WHERE commentID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, commentID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //DB ���� 
	}
	
}

