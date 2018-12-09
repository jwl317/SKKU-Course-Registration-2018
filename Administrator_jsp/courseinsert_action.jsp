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
	String cnum = request.getParameter("cnum");
	String major = request.getParameter("major");
	String cname = request.getParameter("cname");
	String date1 = request.getParameter("date1");
	String starttime1 = request.getParameter("starttime1");
	String date2 = request.getParameter("date2");
	String starttime2 = request.getParameter("starttime2");
	String date3 = request.getParameter("date3");
	String starttime3 = request.getParameter("starttime3");
	String date4 = request.getParameter("date4");
	String starttime4 = request.getParameter("starttime4");
	String professor = request.getParameter("prof");
	int freshmen = Integer.parseInt(request.getParameter("freshmen"));
	int sophomore = Integer.parseInt(request.getParameter("sophomore"));
	int junior = Integer.parseInt(request.getParameter("junior"));
	int senior = Integer.parseInt(request.getParameter("senior"));
	int classnum = Integer.parseInt(request.getParameter("classnum"));
	int credit = Integer.parseInt(request.getParameter("credit"));
	
	if (major == "") major = null;
	if (date2 == "") date2 = null;
	if (starttime2 == "") starttime2 = null;
	if (date3 == "") date3 = null;
	if (starttime3 == "") starttime3 = null;
	if (date4 == "") date4 = null;
	if (starttime4 == "") starttime4 = null;

    Class.forName("com.mysql.jdbc.Driver");

    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/courseregistration?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false", "root", "Okey102938!");
    PreparedStatement stmt = conn.prepareStatement("INSERT INTO course VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
    
    stmt.setString(1, cnum);
    if (major == "") { stmt.setString(2, null); } else { stmt.setString(2, major); }
    stmt.setString(3, cname);
    stmt.setString(4, date1);
    stmt.setString(5, starttime1);
    if (date2 == "") { stmt.setString(6, null); } else { stmt.setString(6, date2); }
    if (starttime2 == "") { stmt.setString(7, null); } else { stmt.setString(7, starttime2); }
    if (date3 == "") { stmt.setString(8, null); } else { stmt.setString(8, date3); }
    if (starttime3 == "") { stmt.setString(9, null); } else { stmt.setString(9, starttime3); }
    if (date4 == "") { stmt.setString(10, null); } else { stmt.setString(10, date4); }
    if (starttime4 == "") { stmt.setString(11, null); } else { stmt.setString(11, starttime4); }
    stmt.setString(12, professor);
    stmt.setInt(13, freshmen);
    stmt.setInt(14, sophomore);
    stmt.setInt(15, junior);
    stmt.setInt(16, senior);
    stmt.setString(17, "O");
    stmt.setInt(18, classnum);
    stmt.setInt(19, credit);
    
    int result = stmt.executeUpdate();
    
    stmt.close();
    conn.close();
    
    if (result > 0) {
    	out.println("등록에 성공하였습니다");
    }
    else {
%>
    	  <script>
    	    alert("수업 등록에 실패하였습니다");
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