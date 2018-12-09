<%@ page import="java.util.*, java.lang.*"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ request.setCharacterEncoding("utf-8"); %>

<html>
<head>
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
   <link rel = "stylesheet" type="text/css" href="css/main.css">
</head>
<%
String cn = request.getParameter("search");
	
if (search != null) {
%>
<hr>
<form id="showbag_form" method="post">
<table id="showbag_table" align=center>
  <tr class="header">
    <th class="item2" rowspan="2">학수번호-분반</th>
    <th class="item3" rowspan="2">교과목명</th>
    <th class="item4" rowspan="2">학점</th>
    <th class="item5" rowspan="2">수강대상</th>
    <th class="item6" colspan="4">신청가능인원</th>
    <th class="item7" rowspan="2">교강사</th>
    <th class="item8" rowspan="2">수업일자/시간</th>
    <th class="item9" rowspan="2">강의실</th>
    <th class="item10" rowspan="2">강의정보</th>
  </tr>
  <tr class="header">
    <th class="item6-1">1학년</th>
    <th class="item6-2">2학년</th>
    <th class="item6-3">3학년</th>
    <th class="item6-4">4학년</th>
  </tr>

<%
	//DB connection
	Class.forName("com.mysql.jdbc.Driver");

	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/courseregistration?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false", "root", "Okey102938!");

	Statement say = conn.createStatement();

	String sqlString = "SELECT * FROM Course ORDER BY CNum LIKE "
	sqlString += "'%" + cn +"%'";
	ResultSet rset = say.executeQuery(sqlString);

	while (rset.next()) {
	        int id = rset.getInt("id");
	        String date1 = rset.getString("Date1");
	        String time1 = rset.getString("StartTime1");
	        String date2 = rset.getString("Date2");
	        String time2 = rset.getString("StartTime2");
	        String date3 = rset.getString("Date3");
	        String time3 = rset.getString("StartTime3");
	        String date4 = rset.getString("Date4");
	        String time4 = rset.getString("StartTime4");
	        String date = date1 + " " + time1 + "<br>" + date2 + " " + time2;
	        if (date3 != null) {
	          date += "<br>" + date3 + " " + time3;
	          if (date4 != null) {
	            date += "<br>" + date4 + " " + time4;
	          }
	        }
%>
  <tr >
     <td><%=rset.getString("CNum") %></td>
     <td><%=rset.getString("CName") %></td>
     <td><%=rset.getString("Credit") %></td>
     <td><%=rset.getString("Major") %></td>
     <td><%=rset.getString("Freshman") %></td>
     <td><%=rset.getString("Sophomore") %></td>
     <td><%=rset.getString("Junior") %></td>
     <td><%=rset.getString("Senior") %></td>
     <td><%=rset.getString("Professor") %></td>
     <td><%=date %><br>[<%=rset.getString(ClassNum")%>]</td>
     <td><%=rset.getString("ClassNum") %></td>
     <td><%=rset.getString("Status") %></td>
   </tr>
<%
			}
   rset.close();
   say.close();
   conn.close();

   if (rset > 0) {
    	out.println("책가방 조회 성공했습니다.");
    }
    else {
%>
    	  <script>
    	    alert("책가방 조회 실패하였습니다");
    	    history.back();
    	  </script>
<%
    }
 }
%>
</table>
</body>
</html>
