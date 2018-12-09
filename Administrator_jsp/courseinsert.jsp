<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    <script>
    	function form_check() {
    		var f = document.getElementById("insertion_form");
    		
    		var cnumregExp = /^[a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z]?\d\d\d\d-\d\d$/;
    		var classnumregExp = /^\d\d\d\d\d\d?$/;
    		var timeregExp = /^\d\d:\d\d ~ \d\d:\d\d$/;
    		var c = f.credit.value;
    		
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
    		window.open('',f.target,'width=200,height=100,scrollbars=no');
    		return true;
    	}
    </script>
</head>
<body>
	<form id="insertion_form" action="courseinsert_action.jsp" target="sendWin" method="post" onsubmit="return form_check()">
	<table>
		<tr>
			<td>학수번호</td>
			<td><input type="text" name="cnum" required></td>
			<td>전공</td>
			<td><input type="text" name="major"></td>
			<td>과목명</td>
			<td><input type="text" name="cname" required></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>수업일1</td>
			<td><input type="text" name="date1" required></td>
			<td>수업시간1</td>
			<td><input type="text" name="starttime1" required></td>
			<td>수업일2</td>
			<td><input type="text" name="date2"></td>
			<td>수업시간2</td>
			<td><input type="text" name="starttime2"></td>
		</tr>
		<tr>
			<td>수업일3</td>
			<td><input type="text" name="date3"></td>
			<td>수업시간3</td>
			<td><input type="text" name="starttime3"></td>
			<td>수업일4</td>
			<td><input type="text" name="date4"></td>
			<td>수업시간4</td>
			<td><input type="text" name="starttime4"></td>
		</tr>
		<tr>
			<td>교강사</td>
			<td><input type="text" name="prof" required></td>
			<td>강의실</td>
			<td><input type="text" name="classnum" required></td>
			<td>학점</td>
			<td><input type="text" name="credit" required></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>정원(1~2학기)</td>
			<td><input type="text" name="freshmen" required></td>
			<td>정원(3~4학기)</td>
			<td><input type="text" name="sophomore" required></td>
			<td>정원(5~6학기)</td>
			<td><input type="text" name="junior" required></td>
			<td>정원(7~8학기)</td>
			<td><input type="text" name="senior" required></td>
		</tr>
	</table>
	<input type="submit" value="등록">
	<input type="reset" value="초기화">
	</form>
</body>
</html>