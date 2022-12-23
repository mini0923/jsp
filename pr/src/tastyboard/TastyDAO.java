package tastyboard;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import tastyboard.Tasty;
import tastyboard.TastyImage;
import tastyboard.TastyUpload;

public class TastyDAO {
	private Connection conn;

	private PreparedStatement pstmt;
	private ResultSet rs; 
	
   
   public TastyDAO() {
      
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
   
   //        ѱ  
   public int getNext() {
      String SQL = "SELECT tastyID FROM tasty ORDER BY tastyID DESC";
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
      return -1; //DB      
   }
   
   int tastyid;
   //    ۼ 
   public int write(String tastyTitle, String tastyLocation, String tastyCategory, String userID, String tastyTel, String tastyContent, int tastyCount, int tastyLikeCount, String tastyHour, String tastyDate,
		   String tiname, String tipath, String tuname, String tupath, String tuname1, String tupath1, String tuname2, String tupath2){
      String SQL = "INSERT INTO tasty VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
      String SQL1 = "INSERT INTO tastyImage VALUES (?, ?, ?)";
      String SQL2 = "INSERT INTO tastyUpload VALUES (?, ?, ?, ?, ?, ?, ?)";
      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         //pstmt.setInt(1, getNext());
         tastyid = getNext();
         pstmt.setInt(1, tastyid);
         pstmt.setString(2, tastyTitle);
         pstmt.setString(3, getDate());
         pstmt.setString(4, tastyLocation);
         pstmt.setString(5, tastyCategory);
         pstmt.setString(6, userID);   
         pstmt.setString(7, tastyTel);
         pstmt.setString(8, tastyContent);
         pstmt.setInt(9, tastyCount);
         pstmt.setInt(10, tastyLikeCount);
         pstmt.setString(11, tastyHour);
         pstmt.setInt(12, 1);
         int result = pstmt.executeUpdate();
         if(result == 1) {
            pstmt = conn.prepareStatement(SQL1);
            pstmt.setInt(1, tastyid);
            pstmt.setString(2, tiname);
            pstmt.setString(3, tipath);
            pstmt.executeUpdate();
            pstmt = conn.prepareStatement(SQL2);
            pstmt.setInt(1, tastyid);
            pstmt.setString(2, tuname);
            pstmt.setString(3, tuname1);
            pstmt.setString(4, tuname2);
            pstmt.setString(5, tupath);
            pstmt.setString(6, tupath1);
            pstmt.setString(7, tupath2);
            return pstmt.executeUpdate();
         }
      }catch(Exception e) {
         e.printStackTrace();
      }
      return -1; //DB      
   }
   
   public void tastyCount(int tastyID) {	
		int count = 0;
		int rss = 0;
		String SQL = "update tasty set tastyCount = tastyCount+1 where tastyID = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, tastyID);
			rss = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
   
   public void likeCount(int tastyID) {
	   int rss = 0; 
 		String SQL = "update from tasty set tastylike = count where tastyID=?";
 		try {
 			
 			pstmt = conn.prepareStatement(SQL);
 			pstmt.setInt(1, tastyID);
 			rs= pstmt.executeQuery();
 			int count = rs.getInt(1);
 			
 		String SQL1 = "select Count(tastyID) from tastylike where tastyID=?";
 			pstmt = conn.prepareStatement(SQL1);
 			pstmt.setInt(1, tastyID);
 			rss = pstmt.executeUpdate();
		}catch(Exception e) {
 			e.printStackTrace();
 			
 		}
 		
 	}
   
   
   public ArrayList<Tasty> getList(String tastyCategory, int pageNumber){
	      String SQL = "SELECT * FROM Tasty WHERE tastyCategory =? and tastyID < ? AND tastyAvailable = 1 ORDER BY tastyID DESC LIMIT 50";
	      ArrayList<Tasty> list = new ArrayList<Tasty>();
	      try {
	             PreparedStatement pstmt = conn.prepareStatement(SQL);
	             pstmt.setString(1, tastyCategory);
	             pstmt.setInt(2, getNext()-(pageNumber -1)*50);
	             rs = pstmt.executeQuery();
	             while (rs.next()) {
	                Tasty tasty = new Tasty();
	                tasty.setTastyID(rs.getInt(1));
	                tasty.setTastyTitle(rs.getString(2));
	                tasty.setTastyDate(rs.getString(3));
	                tasty.setTastyLocation(rs.getString(4));
	                tasty.setTastyCategory(rs.getString(5));
	                tasty.setUserID(rs.getString(6));
	                tasty.setTastyTel(rs.getString(7));
	                tasty.setTastyContent(rs.getString(8));
	                tasty.setTastyAvailable(rs.getInt(9));
	                list.add(tasty);
	             }
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      return list; 
	   }
   
   public ArrayList<TastyImage> getList1(String tastyCategory, int pageNumber){
	      String SQL = "select * from tastyimage where tastyid in (select tastyid from tasty where tastyCategory = ?) and tastyid < ? ORDER BY tastyID DESC LIMIT 50";
	      ArrayList<TastyImage> list1 = new ArrayList<TastyImage>();
	      try {
	          PreparedStatement pstmt = conn.prepareStatement(SQL);
	             pstmt.setString(1, tastyCategory);
	             pstmt.setInt(2, getNext()-(pageNumber -1)*50);
	             rs = pstmt.executeQuery();
	             while(rs.next()) {
	                TastyImage tastyimage = new TastyImage();
	                tastyimage.setTiName(rs.getString(2));
	                tastyimage.setTiPath(rs.getString(3));
	                list1.add(tastyimage);
	             }
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      return list1; 
	   }

   public ArrayList<Tasty> getList2(int pageNumber){
	      String SQL = "SELECT * FROM Tasty WHERE tastyID < ? AND tastyAvailable = 1 ORDER BY tastyID DESC LIMIT 50";
	      ArrayList<Tasty> list = new ArrayList<Tasty>();
	      try {
	         PreparedStatement pstmt = conn.prepareStatement(SQL);
	         pstmt.setInt(1, getNext()-(pageNumber -1)*50);
	         rs = pstmt.executeQuery();
	         while (rs.next()) {
	            Tasty tasty = new Tasty();
	            tasty.setTastyID(rs.getInt(1));
	            tasty.setTastyTitle(rs.getString(2));
	            tasty.setTastyDate(rs.getString(3));
	            tasty.setTastyLocation(rs.getString(4));
	            tasty.setTastyCategory(rs.getString(5));
	            tasty.setUserID(rs.getString(6));
	            tasty.setTastyTel(rs.getString(7));
	            tasty.setTastyContent(rs.getString(8));
	            tasty.setTastyAvailable(rs.getInt(9));
	            list.add(tasty);
	         }
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      return list; 
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
      return ""; //DB      
   }
   
   public boolean nextPage(int pageNumber){
      String SQL = "SELECT * FROM tasty WHERE tastyID < ? AND tastyAvailable = 1";
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
   public Tasty getTasty(int tastyID)
    {
      String SQL = "SELECT * FROM Tasty WHERE tastyID = ?"; 
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, tastyID);
            rs = pstmt.executeQuery();
            if (rs.next())
            {
                   Tasty tasty = new Tasty();
                   tasty.setTastyID(rs.getInt(1));
               tasty.setTastyTitle(rs.getString(2));
               tasty.setTastyDate(rs.getString(3));
               tasty.setTastyLocation(rs.getString(4));
               tasty.setTastyCategory(rs.getString(5));
               tasty.setUserID(rs.getString(6));
               tasty.setTastyTel(rs.getString(7));
               tasty.setTastyContent(rs.getString(8));
               tasty.setTastyCount(rs.getInt(9));
               tasty.setTastyLikeCount(rs.getInt(10));
               tasty.setTastyHour(rs.getString(11));
               tasty.setTastyAvailable(rs.getInt(12));
                   return tasty;
              }
        } catch (Exception e) {
           e.printStackTrace();
        }
        return null; 
    }
   
   
   	public TastyUpload getUpload(int tastyID){
	      String SQL = "select * from tastyupload where tastyid = ?";
	      try {
	         PreparedStatement pstmt = conn.prepareStatement(SQL);
	         pstmt.setInt(1, tastyID);
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
	        	 TastyUpload tastyupload = new TastyUpload();
	        	 tastyupload.setTuName(rs.getString(2));
	        	 tastyupload.setTuName1(rs.getString(3));
	        	 tastyupload.setTuName2(rs.getString(4));
	        	 tastyupload.setTuPath(rs.getString(5));
	        	 tastyupload.setTuPath1(rs.getString(6));
	        	 tastyupload.setTuPath2(rs.getString(7));
	        	 return tastyupload;
	         }
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      return null; 
	   }

    
      public int update(int tastyID, String tastyTitle, String tastyContent) {   
         String SQL = "UPDATE Tasty SET tastyName = ?, tastyContent = ? WHERE tastyID = ? ";
         try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, tastyTitle);
            pstmt.setString(2, tastyContent);
            pstmt.setInt(3, tastyID);
            return pstmt.executeUpdate();
         }catch(Exception e) {
            e.printStackTrace();
         }
         return -1; //DB      
      }
   
      public int delete(int tastyID) {
         String SQL = "delete from Tasty WHERE tastyID = ?";
         try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, tastyID);
            return pstmt.executeUpdate();
         }catch(Exception e) {
            e.printStackTrace();
         }
         return -1; //DB      
   }
      public int adminDelete(String tastyID) {
  		String SQL = "delete from tasty where tastyID = ?";
  		try {
  			PreparedStatement pstmt = conn.prepareStatement(SQL);
  			pstmt.setString(1, tastyID);
  			return pstmt.executeUpdate();
  		}catch(Exception e) {
  			e.printStackTrace();
  		}
  		return -1; //DB 오류 
  	}

      public Tasty best1() //레스토랑 베스트 게시글
      {
        String SQL = "SELECT * FROM Tasty WHERE tastyCategory = 'Restaurant' ORDER BY tastyLikeCount DESC LIMIT 1"; 
          try {
              PreparedStatement pstmt = conn.prepareStatement(SQL);
              rs = pstmt.executeQuery();
              if (rs.next())
              {
                     Tasty tasty = new Tasty();
                     tasty.setTastyID(rs.getInt(1));
                 tasty.setTastyTitle(rs.getString(2));
                 tasty.setTastyDate(rs.getString(3));
                 tasty.setTastyLocation(rs.getString(4));
                 tasty.setTastyCategory(rs.getString(5));
                 tasty.setUserID(rs.getString(6));
                 tasty.setTastyTel(rs.getString(7));
                 tasty.setTastyContent(rs.getString(8));
                 tasty.setTastyCount(rs.getInt(9));
                 tasty.setTastyLikeCount(rs.getInt(10));
                 tasty.setTastyHour(rs.getString(11));
                 tasty.setTastyAvailable(rs.getInt(12));
                     return tasty;
                }
          } catch (Exception e) {
             e.printStackTrace();
          }
          return null; 
      }
      
      public TastyImage bestImage1() //레스토랑 베스트 이미지 썸네일
      {
        String SQL = "SELECT * FROM Tastyimage WHERE tastyid = (select tastyid from tasty where tastyCategory = 'Restaurant' ORDER BY tastyLikeCount DESC LIMIT 1)"; 
          try {
              PreparedStatement pstmt = conn.prepareStatement(SQL);
              rs = pstmt.executeQuery();
              if (rs.next())
              {
                     TastyImage tastyimage = new TastyImage();
                     tastyimage.setTastyID(rs.getInt(1));
                     tastyimage.setTiName(rs.getString(2));
                     tastyimage.setTiPath(rs.getString(3));	
                     return tastyimage;
                }
          } catch (Exception e) {
             e.printStackTrace();
          }
          return null; 
      }
      
      public Tasty best2() //펍  베스트게시글
      {
        String SQL = "SELECT * FROM Tasty WHERE tastyCategory = 'Pub' ORDER BY tastyLikeCount DESC LIMIT 1"; 
          try {
              PreparedStatement pstmt = conn.prepareStatement(SQL);
              rs = pstmt.executeQuery();
              if (rs.next())
              {
                     Tasty tasty = new Tasty();
                     tasty.setTastyID(rs.getInt(1));
                 tasty.setTastyTitle(rs.getString(2));
                 tasty.setTastyDate(rs.getString(3));
                 tasty.setTastyLocation(rs.getString(4));
                 tasty.setTastyCategory(rs.getString(5));
                 tasty.setUserID(rs.getString(6));
                 tasty.setTastyTel(rs.getString(7));
                 tasty.setTastyContent(rs.getString(8));
                 tasty.setTastyCount(rs.getInt(9));
                 tasty.setTastyLikeCount(rs.getInt(10));
                 tasty.setTastyHour(rs.getString(11));
                 tasty.setTastyAvailable(rs.getInt(12));
                     return tasty;
                }
          } catch (Exception e) {
             e.printStackTrace();
          }
          return null; 
      }
      
      public TastyImage bestImage2() //펍 베스트 이미지 썸네일
      {
        String SQL = "SELECT * FROM Tastyimage WHERE tastyid = (select tastyid from tasty where tastyCategory = 'Pub' ORDER BY tastyLikeCount DESC LIMIT 1)"; 
          try {
              PreparedStatement pstmt = conn.prepareStatement(SQL);
              rs = pstmt.executeQuery();
              if (rs.next())
              {
                     TastyImage tastyimage = new TastyImage();
                     tastyimage.setTastyID(rs.getInt(1));
                     tastyimage.setTiName(rs.getString(2));
                     tastyimage.setTiPath(rs.getString(3));
                     return tastyimage;
                }
          } catch (Exception e) {
             e.printStackTrace();
          }
          return null; 
      }
      
      public Tasty best3() // 카페 베스트 게시글
      {
        String SQL = "SELECT * FROM Tasty WHERE tastyCategory = 'Cafe' ORDER BY tastyLikeCount DESC LIMIT 1"; 
          try {
              PreparedStatement pstmt = conn.prepareStatement(SQL);
              rs = pstmt.executeQuery();
              if (rs.next())
              {
                     Tasty tasty = new Tasty();
                     tasty.setTastyID(rs.getInt(1));
                 tasty.setTastyTitle(rs.getString(2));
                 tasty.setTastyDate(rs.getString(3));
                 tasty.setTastyLocation(rs.getString(4));
                 tasty.setTastyCategory(rs.getString(5));
                 tasty.setUserID(rs.getString(6));
                 tasty.setTastyTel(rs.getString(7));
                 tasty.setTastyContent(rs.getString(8));
                 tasty.setTastyCount(rs.getInt(9));
                 tasty.setTastyLikeCount(rs.getInt(10));
                 tasty.setTastyHour(rs.getString(11));
                 tasty.setTastyAvailable(rs.getInt(12));
                     return tasty;
                }
          } catch (Exception e) {
             e.printStackTrace();
          }
          return null; 
      }
      
      public TastyImage bestImage3() //카페 베스트 이미지 썸네일
      {
        String SQL = "SELECT * FROM Tastyimage WHERE tastyid = (select tastyid from tasty where tastyCategory = 'Cafe' ORDER BY tastyLikeCount DESC LIMIT 1)"; 
          try {
              PreparedStatement pstmt = conn.prepareStatement(SQL);
              rs = pstmt.executeQuery();
              if (rs.next())
              {
                     TastyImage tastyimage = new TastyImage();
                     tastyimage.setTastyID(rs.getInt(1));
                     tastyimage.setTiName(rs.getString(2));
                     tastyimage.setTiPath(rs.getString(3));
                     return tastyimage;
                }
          } catch (Exception e) {
             e.printStackTrace();
          }
          return null; 
      }
   
}