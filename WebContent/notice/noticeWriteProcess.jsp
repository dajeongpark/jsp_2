<%@page import="com.dajeong.notice.NoticeDAO"%>
<%@page import="com.dajeong.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	NoticeDTO ndto = new NoticeDTO();
	ndto.setTitle(request.getParameter("title"));
	ndto.setContents(request.getParameter("contents"));
	ndto.setWriter(request.getParameter("writer"));
	NoticeDAO ndao = new NoticeDAO();
	int result = ndao.insert(ndto);
	String r = "Add Fail";
	if(result>0){
		r="Add Success";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var m = '<%= r %>';
	alert(m);
	location.href="./noticeList.jsp";
</script>
</head>
<body>

</body>
</html>