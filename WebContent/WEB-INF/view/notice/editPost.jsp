<%@page import="poly.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   
	BoardDTO rDTO = (BoardDTO)request.getAttribute("rDTO");   
   
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<script src="/js/jquery-3.2.1.min.js"></script>

<title>글 편집</title>


    
<script>
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: '내용을 입력해 주세요',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	});
</script>    
    
</head>
<body>




<div class="main" style="margin-top: 100px;"></div>



<h2 style="text-align: center;">글 편집</h2><br><br><br>

<div style="width: 60%; margin: auto;">
	<form action="/board/dopost.do" method="post">
		<div><input type="text" name="post_title" style="width:100%;" value="<%=rDTO.getPost_title() %>" placeholder="제목"></div>
	
		<br>
		<textarea id="summernote" name="post_content"   >   <%=rDTO.getPost_content()%>   </textarea>
		<input name="post_no" value="<%=rDTO.getPost_no() %>" hidden="hidden">
		<div><input type="submit"></div>
	</form>
</div>









</body>
</html>