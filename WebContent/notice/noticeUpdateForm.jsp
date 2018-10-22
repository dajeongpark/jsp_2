<%@page import="com.dajeong.notice.NoticeDTO"%>
<%@page import="com.dajeong.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	int num = Integer.parseInt(request.getParameter("num"));
	NoticeDAO ndao = new NoticeDAO();
	NoticeDTO ndto = ndao.selectOne(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="noticeUpdateProcess.jsp">
		<input type="hidden" name="num" value="<%= ndto.getNum() %>">
		<p>TITLE : <input type="text" name="title" value="<%= ndto.getTitle() %>"></p>
		<p>WRITER: <input type="text" name="writer" value="<%= ndto.getWriter() %>"></p>
		<p>CONTENTS : <input type="text" name="contents" value="<%= ndto.getContents() %>"></p>
		<button>UPDATE</button>
	</form>
</body>
</html>