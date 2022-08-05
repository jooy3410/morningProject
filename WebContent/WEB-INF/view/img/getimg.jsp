<%@page import="poly.dto.ImgDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ImgDTO> rList = (List<ImgDTO>)request.getAttribute("rList");
	

	




%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>이미지 게시판 리스트</title>


<META HTTP-EQUIV="Page-Enter" CONTENT="BlendTrans(Duration=0.5)">
<META HTTP-EQUIV="Page-exit" CONTENT="BlendTrans(Duration=0.5)">

<script src="/js/jquery-3.2.1.min.js"></script>

</head>
<body>

<div>
<!-- 이미지 게시글 출력 코드였던 것 -->
</div>
<div>
<% for(ImgDTO rDTO : rList) { %>
	<a href="/img/imgDetail.do?no=<%=rDTO.getSeq()%>">
 	<img src="/resource/images/<%=rDTO.getSave_folder_name()%>/<%=rDTO.getSave_file_name()%>"  style="width:350px; height:300px;">
 	</a>
<% } %>
</div>
</body>
</html>