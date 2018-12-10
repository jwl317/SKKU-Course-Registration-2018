<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <link rel="stylesheet" type="text/css" href="css/coursetable.css">
    <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    <script>
    	function course_search() {
    		var f = document.getElementById("search_form");
    		var t = f.searchtype.value;
    		var v = f.searchvalue.value;
    		
    		if (t == "Credit" && v != 1 && v != 2 && v != 3) {
    				alert("학점은 1~3학점까지 가능합니다");
    				return false;
    		}
    		if (t == "Grade" && v != 1 && v != 2 && v != 3 && v != 4) {
    			alert("학년은 1~4학년까지 가능합니다");
    			return false;
    		}
    		if (t == "Status" && v != 'O' && v != 'T' && v != 'X') {
    			alert("신청상태는 O(진행중), T(종료), X(폐강)만 가능합니다")
    			return false;
    		}
    		f.action = "courselist_admin.jsp?type=" + f.searchtype.value + "&value=" + v;
    		return true;
    	}
    </script>
  </head>
  <body>
  <form id="search_form" action="" target="_self" method="get" onsubmit="return course_search()">
  	<select name="searchtype" onChange="set_search_value(this.form, this.value)">
  		<option value="CNum" selected>학수번호</option>
  		<option value="CName">강의명</option>
  		<option value="Professor">강사명</option>
  		<option value="Credit">학점</option>
  		<option value="Grade">학년</option>
  		<option value="Status">신청상태</option>
  	</select>
  	<input type="text" name="searchvalue" required>
  	<input type="submit" value="검색">
  </form>
  <a href="courselist_admin.jsp" target="_self"><button>전체 목록 표시</button></a>
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
		
		String type = request.getParameter("searchtype");
		String value = request.getParameter("searchvalue");
		String sqls = "";
		

		
		if (type == "" || type == null) {
			sqls = "SELECT * FROM course ORDER BY CNum asc";
		}
		else if (type.equals("Grade")) {
			if (value.equals("1")) {
				sqls = "SELECT * FROM course WHERE Freshmen != 0 ORDER BY CNum asc";
			}
			else if (value.equals("2")) {
				sqls = "SELECT * FROM course WHERE Sophomore != 0 ORDER BY CNum asc";
			}
			else if (value.equals("3")) {
				sqls = "SELECT * FROM course WHERE Junior != 0 ORDER BY CNum asc";
			}
			else if (value.equals("4")) {
				sqls = "SELECT * FROM course WHERE Senior != 0 ORDER BY CNum asc";
			}
		}
		else {
			sqls = "SELECT * FROM course WHERE " + type + "='" + value + "' ORDER BY CNum asc";
		}
		ResultSet rset = stmt.executeQuery(sqls);
		
		int num = 0;
		
		while (rset.next()) {		
			int freshmen = 0;
			int sophomore = 0;
			int junior = 0;
			int senior = 0;
			Statement stmt2 = conn.createStatement();
			
			String cnum = rset.getString("CNum");
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
	        sqls = "SELECT grade, COUNT(*) FROM register WHERE RegCN='" + cnum + "' GROUP BY grade";
	        ResultSet rset2 = stmt2.executeQuery(sqls);
	        while (rset2.next()) {
	        	if (rset2.getInt("Grade") == 1) {
	        		freshmen = rset2.getInt("COUNT(*)");
	        	}
	        	else if (rset2.getInt("Grade") == 2) {
	        		sophomore = rset2.getInt("COUNT(*)");
	        	}
	        	else if (rset2.getInt("Grade") == 3) {
	        		junior = rset2.getInt("COUNT(*)");
	        	}
	        	else if (rset2.getInt("Grade") == 4) {
	        		senior = rset2.getInt("COUNT(*)");
	        	}
	        }
	%>
	<tr id="row<%= num %>">
		<td><a href="coursedelete.jsp?CNum=<%= rset.getString("CNum")%>" onclick="window.open(this.href, '_blank', 'width=300, height=200, scrollbar=yes'); return false"><button>삭제</button></a></td>
		<td><a href="courseupdate.jsp?CNum=<%= rset.getString("CNum")%>" onclick="window.open(this.href, '_blank', 'width=1400, height=250, scrollbar=yes'); return false"><button>수정</button></a></td>
		<td><%=rset.getString("CNum") %></td>
		<td><%=rset.getString("CName") %></td>
		<td><%=rset.getString("Credit") %></td>
		<td><%=freshmen%> / <%=rset.getString("Freshmen") %></td>
		<td><%=sophomore%> / <%=rset.getString("Sophomore") %></td>
		<td><%=junior%> / <%=rset.getString("Junior") %></td>
		<td><%=senior%> / <%=rset.getString("Senior") %></td>
		<td><%=rset.getString("Professor") %></td>
		<td><%=date %><br>[<%=rset.getString("ClassNum") %>]</td>
		<td><%=rset.getString("Status") %></td>
	</tr>
	<%
			num++;
			rset2.close();
			stmt2.close();
		}
		rset.close();
		stmt.close();
		conn.close();
	}
  	catch (Exception e) {
  		out.println(e.getMessage());
  	}
  	%>
  </table>
  </body>
</html>