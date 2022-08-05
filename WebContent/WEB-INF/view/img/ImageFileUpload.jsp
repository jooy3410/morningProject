<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="poly.dto.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="poly.util.CmmUtil"%>    
<%


String user_no = CmmUtil.nvl((String) request.getAttribute("user_no"));


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 업로드 페이지</title>
</head>
<body>
	<h2>하루를 등록해보세요</h2>
	<hr/>
	<form name="form1" method="post" enctype="multipart/form-data" action="/img/imgUpload.do">

    <div>
		<br/>
		이미지 파일 업로드 <br/><br/>
		<input type="file" name="fileUpload" />
		<br/>
		<br/>
		
		<div>
		<input type="text" name="note" style="width:50%;" placeholder="글을 남겨 주세요"/>
		</div>
		
		<br/>
		<br/>
		
	</div>
	<input type="submit" value="전송" />
	</form>
	
</body>
</html>