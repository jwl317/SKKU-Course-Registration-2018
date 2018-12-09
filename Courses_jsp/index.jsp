<%@ page import="java.util.*, java.lang.*"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ request.setCharacterEncoding("utf-8"); %>

<html>
<head>
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel = "stylesheet" type="text/css" href="css/main.css">
   <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <script>
	function form_check(){
		var input = document.getElementById("searchc_form");
		var cnumregExp = /^[a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z]?\d\d\d\d-\d\d$/;
		if (!cnumregExp.test(f.cnum.value)) {
    			alert("올바른 학수번호를 입력하세요");
    			return false;
    		}
		window.open('',f.target,'width=200,height=100,scrollbars=no');
		return true;
   </script>
</head>

<body>
	<h1>수업 검색</h1>
	<h3>검색합니다.</h3>
	
	<form id="searchc_form" method="post" target="sendWin" onsubmit="return form_check()" action="listc_action.html">
   	<i class="fa fa-search"><i>학수번호-분반 :
	<input type="text" id="search" placeholder="Search for courses.." title="Type in a course number" required>
   	<input type="submit" value="조회">
	</form>
</body>
</html>