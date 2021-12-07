<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
<% 
session.removeAttribute("loginInfo");//자체 로그아웃
session.removeAttribute("state");//네이버 로그아웃
session.invalidate();//모든 세션 제거(사실 이 코드 하나만 있어도 된다.)
response.sendRedirect("main");//메인.jsp로 이동
%>
</body>
</html>