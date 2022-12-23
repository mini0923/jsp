<%@page import="board.Comment"%>
<%@page import="board.CommentDAO"%>
<%@ page import="board.LikeListDAO"%>
<%@ page import="board.LikeList"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.Board"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.BoardImage"%>
<%@ page import="javax.servlet.http.Cookie" %>
<%
   request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<!-- 자유게시판 상세페이지(글 보여주는 페이지)-->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>여기쩔더라</title>
<link rel="stylesheet" href="resources/css/index.css?after">
<link rel="stylesheet" href="resources/css/communityView.css">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
   crossorigin="anonymous">
   
</head>
<body>
 <%@include file ="header.jsp" %>   
<%
   int boardID = 0;
   
   if (request.getParameter("boardID") != null) {
      boardID = Integer.parseInt(request.getParameter("boardID"));
   }
   
   if (boardID == 0) {
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('유효하지 않은 글입니다')");
      script.println("location.href = 'community.jsp'");
      script.println("</script>");
   }
   
   Board board = new BoardDAO().getBoard(boardID);
   BoardImage boardimage = new BoardDAO().getUpload(boardID);
   
%>
  
   <div class="container">
      <h4 class="mb-3">게시판 글 보기</h4>
      <hr class="my-4">
      <div class="row">
         <div class="col">
            <p class="p1">제목</p>
            <div class="rad">
               <p><%=board.getBoardTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
               .replaceAll("\n", "<br>")%></p>
            </div>
         </div>
         <div class="col">
            <p class="p1">작성자</p>
            <div class="rad">
               <p><%=board.getUserID().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
               .replaceAll("\n", "<br>")%></p>
            </div>
         </div>
         <div class="col">
            <p class="p1">작성일</p>
            <div class="rad">
               <p><%=board.getBoardDate().substring(0, 11) + board.getBoardDate().substring(11, 13) + "시"
               + board.getBoardDate().substring(14, 16) + "분"%></p>
            </div>
         </div>
      </div>
      <hr>
      <div class="row">
      <%if(boardimage != null){ %>
      	<div class="col-5">
            	<input class="d-block w-100" type="image" src="boardImage/<%=boardimage.getBiName() %>" alt="..." />
            	</div>
            	<% } %>
         <div class="col"><p class="p1">내용</p>
            <div class="rad">
               <p> <%=board.getBoardContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
               .replaceAll("\n", "<br>")%></p>
            </div>
         </div>
        
      </div>

               <hr class="my-4">    
         <div class="container">
         
            <div class="row">
               <table class="table table-striped"
                  style="text-align: center; border: 1px solid #dddddd">
                  <tbody>
                     <tr>
                        <td align="left" bgcolor="skyblue">댓글</td>
                     </tr>
                     <tr>
                        <%
                           CommentDAO commentDAO = new CommentDAO();
                           ArrayList<Comment> list = commentDAO.getList(boardID);
                           for (int i = 0; i < list.size(); i++) {
                        %>
                        <div class="container">
                           <div class="row">
                              <table class="table table-striped"
                                 style="text-align: center; border: 1px solid #dddddd">
                                 <tbody>
                                    <tr>
                                       <td align="left"><%=list.get(i).getUserID()%></td>

                                       <td align="right"><%=list.get(i).getCommentDate().substring(0, 11) + 
                                       list.get(i).getCommentDate().substring(11, 13) + "시" + list.get(i).getCommentDate().substring(14, 16) + "분"%></td>
                                    </tr>
                        
                                    <tr>
                                       <td align="left"><%=list.get(i).getCommentContent()%></td>
                                       
                                       <%
                                       		if (list.get(i).getUserID().equals(userID)) { 
                                    	%>                                    	 
                                    	   
                                       <td align="right">
                                       <a href="commentUpdate.jsp?boardID=<%=boardID%>&commentID=<%=list.get(i).getCommentID()%>"
                                          class="btn btn-outline-dark">수정</a> 
                                       <a onclick="return confirm('정말로 삭제하시겠습니까?')" 
                                          href="board/commentDeleteAction.jsp?boardID=<%=boardID%>&commentID=<%=list.get(i).getCommentID()%>"
                                          class="btn btn-outline-dark">삭제</a>
                                       </td>
                                       <%
                                    	   
                                    	  }
                                       %>
                                       
                                    </tr>
                                 </tbody>
                              </table>
                           </div>
                        </div>
                        <%
                           }
                        %>
                        
                     </tr>
               </table>
            </div>
         </div>
         <br>
         <div class="container">
            <div class="row">
               <form method="post" action="board/commentAction.jsp?boardID=<%=boardID%>">
                  <table class="table table-bordered"
                     style="text-align: center; border: 1px solid #dddddd">
                     <tbody>
                        <tr>
                           <td align="left"><%=userID%></td>
                        </tr>
                        <tr>
                           <td><input type="text" class="form-control"
                              placeholder="댓글 쓰기" name="commentContent" maxlength="300"></td>
                        </tr>
                     </tbody>
                  </table>
                  <input type="submit" class="btn btn-secondary"
                     value="댓글 쓰기">
                     
               </form>
               
            </div>
            <hr class="my-4">
      <a href="community.jsp"class="btn btn-outline-secondary">목록</a>
      
   <%
      if (userID != null && userID.equals(board.getUserID())) {
   %>
         <a href="communityUpdate.jsp?boardID=<%=boardID%>" class="btn btn-secondary">수정</a>
         <a href="board/deleteAction.jsp?boardID=<%=boardID%>" class="btn btn-secondary">삭제</a>
   <%
      }
   %>
   
   </div>
         </div>
      

   <div class="container">
      <footer class="py-5">
         <div class="d-flex justify-content-between py-4 my-4 border-top">
            <p>© 2022 우당탕탕 남매들, Inc. All rights reserved.</p>
            <ul class="list-unstyled d-flex">
               <li class="ms-3"><a class="top" href="#">Back to Top</a></li>
            </ul>
         </div>
      </footer>
   </div>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
      integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
      crossorigin="anonymous"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
      integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
      crossorigin="anonymous"></script>
</body>
</html>