<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%
try {
	int snum = Integer.parseInt(request.getParameter("snum"));
	String major = request.getParameter("major");
	String pw = request.getParameter("password");
	String sname = request.getParameter("sname");
	int grade = Integer.parseInt(request.getParameter("grade"));
	int credit = Integer.parseInt(request.getParameter("credit"));

    Class.forName("com.mysql.jdbc.Driver");

    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/courseregistration?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false", "root", "Okey102938!");
    PreparedStatement stmt = conn.prepareStatement("INSERT INTO student VALUES (?,?,?,?,?,?)");
    
    stmt.setInt(1, snum);
    stmt.setString(2, major);
    stmt.setString(3, pw);
    stmt.setString(4, sname);
    stmt.setInt(5, grade);
    stmt.setInt(6, credit);
    
    int result = stmt.executeUpdate();
    
    stmt.close();
    conn.close();
    
    if (result > 0) {
    	out.println("등록에 성공하였습니다");
    }
    else {
%>
    	  <script>
    	    alert("학생 등록에 실패하였습니다");
    	    history.back();
    	  </script>
<%
    }
}
catch (Exception e) {
	out.println(e.getMessage());
}
%>
</body>
</html>