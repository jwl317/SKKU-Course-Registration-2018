<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    <script>
    	$(".deletebutton").click ( function() {
    	})
    </script>
  </head>
  <body>
  <table id="courselist">
  	<tr>
  		<th></th>
  		<th></th>
  		<th>학수번호/분반</th>
  		<th>교과목명</th>
  		<th>학점</th>
  		<th>신청/정원(1~2학기)</th>
  		<th>신청/정원(3~4학기)</th>
  		<th>신청/정원(5~6학기)</th>
  		<th>신청/정원(7~8학기)</th>
  		<th>교강사</th>
  		<th>수업시간/강의실</th>
  		<th>신청상태</th>
  	</tr>
  	<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/courseregistration?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false", "root", "Okey102938!" );
		Statement stmt = conn.createStatement();
		Statement stmt2 = conn.createStatement();
		
		String sqls = "SELECT * FROM course ORDER BY CNum asc";
		ResultSet rset = stmt.executeQuery(sqls);
		
		int num = 0;
		
		while (rset.next()) {
	        String date1 = rset.getString("Date1");
	        String time1 = rset.getString("StartTime1");
	        String date2 = rset.getString("Date2");
	        String time2 = rset.getString("StartTime2");
	        String date3 = rset.getString("Date3");
	        String time3 = rset.getString("StartTime3");
	        String date4 = rset.getString("Date4");
	        String time4 = rset.getString("StartTime4");
	        String professor = rset.getString("Professor");
	        int to = rset.getInt("Freshmen");
	        int credit = rset.getInt("Credit");
	        String date = date1 + " " + time1 + "<br>" + date2 + " " + time2;
	        if (date3 != null) {
	          date += "<br>" + date3 + " " + time3;
	          if (date4 != null) {
	            date += "<br>" + date4 + " " + time4;
	          }
	        }
	%>
	<tr id="row<%= num %>">
		<td><a href="coursedelete.jsp?CNum=<%= rset.getString("CNum")%>" onclick="window.open(this.href, '_blank', 'width=300, height=200, scrollbar=yes'); return false"><button>삭제</button></a></td>
		<td><a href="courseupdate.jsp?CNum=<%= rset.getString("CNum")%>" onclick="window.open(this.href, '_blank', 'width=1400, height=250, scrollbar=yes'); return false"><button>수정</button></a></td>
		<td><%=rset.getString("CNum") %></td>
		<td><%=rset.getString("CName") %></td>
		<td><%=rset.getString("Credit") %></td>
		<td><%=rset.getString("Freshmen") %></td>
		<td><%=rset.getString("Sophomore") %></td>
		<td><%=rset.getString("Junior") %></td>
		<td><%=rset.getString("Senior") %></td>
		<td><%=rset.getString("Professor") %></td>
		<td><%=date %><br>[<%=rset.getString("ClassNum") %>]</td>
		<td><%=rset.getString("Status") %></td>
	</tr>
	<%
			num++;
		}
	}
  	catch (Exception e) {
  		out.println(e.getMessage());
  	}
  	%>
  </table>
  </body>
</html>