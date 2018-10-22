<%@page import="com.dajeong.notice.NoticeDAO"%>
<%@page import="com.dajeong.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	NoticeDTO ndto = new NoticeDTO();
	ndto.setNum(Integer.parseInt(request.getParameter("num")));
	ndto.setTitle(request.getParameter("title"));
	ndto.setContents(request.getParameter("contents"));
	ndto.setWriter(request.getParameter("writer"));
	NoticeDAO ndao = new NoticeDAO();
	int result = ndao.update(ndto);
	String r = "Update Fail";
	if(result>0){
		r="Update Success";
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