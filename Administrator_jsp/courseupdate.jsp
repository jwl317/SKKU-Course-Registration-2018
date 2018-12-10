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
    		function form_check() {
    			var f = document.getElementById("update_form");
    		
    			var cnumregExp = /^[a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z]?\d\d\d\d-\d\d$/;
    			var classnumregExp = /^\d\d\d\d\d\d?$/;
    			var timeregExp = /^\d\d:\d\d ~ \d\d:\d\d$/;
    			var c = f.credit.value;
    		
    			if (f.cnum.value != <%=request.getParameter("CNum")%>) {
    				alert("학수번호는 수정할 수 없습니다");
    				return false;
    			}
    			if (!cnumregExp.test(f.cnum.value)) {
    				alert("올바른 학수번호를 입력하세요");
    				return false;
    			}
    			if (!classnumregExp.test(f.classnum.value)) {
    				alert("올바른 강의실 번호를 입력하세요");
    				return false;
    			}
    			if (c != 1 && c != 2 && c != 3 && c != 0) {
    				alert("학점은 0(T/F), 1~3학점까지 가능합니다");
    				return false;
    			}
    			if (!timeregExp.test(f.starttime1.value)) {
    				alert("수업시간은 09:00 ~ 10:15 의 형태로 입력하세요")
    				return false;
    			}
    			if (f.starttime2.value != "" && !timeregExp.test(f.starttime2.value)) {
    				alert("수업시간은 09:00 ~ 10:15 의 형태로 입력하세요")
    				return false;
    			}
    			if (f.starttime3.value != "" && !timeregExp.test(f.starttime3.value)) {
    				alert("수업시간은 09:00 ~ 10:15 의 형태로 입력하세요")
    				return false;
    			}
    			if (f.starttime4.value != "" && !timeregExp.test(f.starttime4.value)) {
    				alert("수업시간은 09:00 ~ 10:15 의 형태로 입력하세요")
    				return false;
    			}
    			return true;
    		}
    	</script>
    </head>
    <body>
    <%
		String cnum = request.getParameter("CNum");
    	
    	try {
			Class.forName("com.mysql.jdbc.Driver");

			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/courseregistration?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false", "root", "Okey102938!");
			PreparedStatement psmt = conn.prepareStatement("SELECT * FROM course WHERE CNum=?");
			
			psmt.setString(1, cnum);
			
			ResultSet rs = psmt.executeQuery();
			
			if (rs.next()) {
				String major = rs.getString("Major");
				String cname = rs.getString("CName");
				String date1 = rs.getString("Date1");
				String starttime1 = rs.getString("StartTime1");
				String date2 = rs.getString("Date2");
				String starttime2 = rs.getString("StartTime2");
				String date3 = rs.getString("Date3");
				String starttime3 = rs.getString("StartTime3");
				String date4 = rs.getString("Date4");
				String starttime4 = rs.getString("StartTime4");
				String professor = rs.getString("Professor");
				int freshmen = rs.getInt("Freshmen");
				int sophomore = rs.getInt("Sophomore");
				int junior = rs.getInt("Junior");
				int senior = rs.getInt("Senior");
				int classnum = rs.getInt("Classnum");
				int credit = rs.getInt("Credit");
				String status = rs.getString("Status");
				
				if (major == null) major = "";
				if (date2 == null) date2 = "";
				if (starttime2 == null) starttime2 = "";
				if (date3 == null) date3 = "";
				if (starttime3 == null) starttime3 = "";
				if (date4 == null) date4 = "";
				if (starttime4 == null) starttime4 = "";
	%>
			<form id="update_form" action="courseupdate_action.jsp" method="post" onsubmit="return form_check()">
			<table>
				<tr>
					<td>학수번호</td>
					<td><input type="text" name="cnum" value='<%= cnum %>' required></td>
					<td>전공</td>
					<td><input type="text" name="major" value='<%= major %>'></td>
					<td>과목명</td>
					<td><input type="text" name="cname" value='<%= cname %>'required></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>수업일1</td>
					<td><input type="text" name="date1" value='<%= date1 %>' required></td>
					<td>수업시간1</td>
					<td><input type="text" name="starttime1" value='<%= starttime1 %>' required></td>
					<td>수업일2</td>
					<td><input type="text" name="date2" value='<%= date2 %>'></td>
					<td>수업시간2</td>
					<td><input type="text" name="starttime2" value='<%= starttime2 %>'></td>
				</tr>
				<tr>
					<td>수업일3</td>
					<td><input type="text" name="date3" value='<%= date3 %>'></td>
					<td>수업시간3</td>
					<td><input type="text" name="starttime3" value='<%= starttime3 %>'></td>
					<td>수업일4</td>
					<td><input type="text" name="date4" value='<%= date4 %>'></td>
					<td>수업시간4</td>
					<td><input type="text" name="starttime4" value='<%= starttime4 %>'></td>
				</tr>
				<tr>
					<td>교강사</td>
					<td><input type="text" name="prof" value='<%= professor %>' required></td>
					<td>강의실</td>
					<td><input type="text" name="classnum" value='<%= classnum %>' required></td>
					<td>학점</td>
					<td><input type="text" name="credit" value='<%= credit %>' required></td>
					<td>신청상태(O=진행중, T=종료, X=폐강)</td>
					<td><input type="text" name="status" value='<%= status %>' required></td>
				</tr>
				<tr>
					<td>정원(1~2학기)</td>
					<td><input type="text" name="freshmen" value='<%= freshmen %>' required></td>
					<td>정원(3~4학기)</td>
					<td><input type="text" name="sophomore" value='<%= sophomore %>' required></td>
					<td>정원(5~6학기)</td>
					<td><input type="text" name="junior" value='<%= junior %>' required></td>
					<td>정원(7~8학기)</td>
					<td><input type="text" name="senior" value='<%= senior %>' required></td>
				</tr>
			</table>
			<input type="submit" value="수정">
			<input type="reset" value="초기화">
			</form>
	<%
			}
			
			rs.close();
			psmt.close();
			conn.close();
    	}
    	catch (Exception e) {
    		out.println(e.getMessage());
    	}
    %>
    </body>
</html>