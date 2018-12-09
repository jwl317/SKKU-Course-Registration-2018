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
    		var f = document.getElementById("register_form");
    		
    		var snumregExp = /^\d\d\d\d\d\d\d\d\d\d/;
    		var g = f.grade.value;
    		var c = f.credit.value;
    		
    		if (!snumregExp.test(f.snum.value)) {
    			alert("올바른 학번을 입력하세요");
    			return false;
    		}
    		if (g != 1 && g != 2 && g != 3 && g != 4) {
    			alert("학년은 1학년부터 4학년까지 가능합니다");
    			return false;
    		}
    		if (c < 0 || c > 20) {
    			alert("학점은 20학점까지 가능합니다");
    			return false;
    		}
    		window.open('',f.target,'width=200,height=100,scrollbars=no');
    		return true;
    	}
    </script>
</head>
<body>
	<form id="register_form" action="studentregister_action.jsp" target="sendWin" method="post" onsubmit="return form_check()">
	<table>
		<tr>
			<td>학번</td>
			<td><input type="text" name="snum" required></td>
			<td>전공</td>
			<td><input type="text" name="major" required></td>
			<td>비밀번호</td>
			<td><input type="text" name="password" required></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="sname" required></td>
			<td>학년</td>
			<td><input type="text" name="grade" required></td>
			<td>학점</td>
			<td><input type="text" name="credit" required></td>
		</tr>
	</table>
	<input type="submit" value="등록">
	<input type="reset" value="초기화">
	</form>
</body>
</html>