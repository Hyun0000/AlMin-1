<!-- 웹폰트: Noto Sans Korean -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알바의 민족 전체회원조회</title>
<style>
 /* reset */
 * {
       margin: 0;
       padding: 0;
 }
 @font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
  body{
        font-family: 'GmarketSansMedium';
  }
  table {
  text-align: center;
  }
</style>
</head>
<body>
<h1 id="gmarket">회원리스트<h1>
<c:if test="${memberview != null || ''}">
<table>
<tr>
<th>아이디</th> 
<th>회원타입</th>
<th>이름</th>
</tr>
<!--ArrayList니까 for문 돌리기!! -->
<c:forEach items="${memberview}" var = "list">
<tr>
<td>${list.memberId}</td><!-- 대소문자 틀리면 출력안됨. -->
<c:if test="${list.memberType == 0}">
<td>관리자</td>
</c:if>
<c:if test="${list.memberType == 1}">
<td>개인</td>
</c:if>
<c:if test="${list.memberType == 2}">
<td>기업</td>
</c:if>
<td>${list.memberName}</td>
</tr>
</c:forEach>
</table>
</c:if>
</body>
</html>