<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
	<head>
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	</head>
	<body>
	<%
		String cnum = request.getParameter("CNum");
	
		try {
			Class.forName("com.mysql.jdbc.Driver");

			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/courseregistration?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false", "root", "Okey102938!");
			PreparedStatement psmt = conn.prepareStatement("UPDATE course SET Status='X' WHERE CNum=?");
			
			psmt.setString(1, cnum);
			
			int result = psmt.executeUpdate();
			
			psmt.close();
			conn.close();
			
			if (result > 0) {
				out.println("삭제되었습니다");
			}
			else {
				out.println("삭제에 실패하였습니다");
			}
			response.sendRedirect("index.jsp");
		}
		catch (Exception e) {
			out.println(e.getMessage());
		}
	%>
	</body>