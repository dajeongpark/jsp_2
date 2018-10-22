<%@page import="com.dajeong.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	NoticeDAO ndao = new NoticeDAO();
	int result = ndao.delete(num);
	String str = "Delete Fail";
	if(result>0){
		str = "Delete Success";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	<% if(result>0) { %>
		alert('Delete Success');
		location.href="./noticeList.jsp";
	<% }else { %>
		alert('Delete Fail');
		history.back();
	<% } %>
</script>
</head>
<body>

</body>
</html>