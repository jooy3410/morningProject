<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="poly.dto.ImgDTO"%>
<%@page import="poly.dto.UserDTO"%>
<%@page import="java.util.List"%>
<%@ page import="java.util.ArrayList" %>
<%@page import="poly.util.CmmUtil"%>    
<%

String SS_USER_AUTH = (String)session.getAttribute("SS_USER_AUTH");
String SS_USER_NAME = (String)session.getAttribute("SS_USER_NAME");
String SS_USER_NO = (String)session.getAttribute("SS_USER_NO");
String user_no = CmmUtil.nvl((String) request.getAttribute("user_no"));
ImgDTO rDTO = (ImgDTO) request.getAttribute("rDTO");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 업로드 페이지</title>
</head>
<body>
	<h2>수정하기</h2>
	<hr/>
	<form name="form1" method="post" enctype="multipart/form-data" action="/img/updateImg.do">

    <div>
		<br/>
		이미지 파일 업로드 <br/><br/>
		<div><input type="file" name="fileUpload" value="img src="/resource/images/<%=rDTO.getSave_folder_name()%>/<%=rDTO.getSave_file_name()%>"  style="width:350px; height:300px;"/></div>
		
		</div>
		<br/>
		<br/>
		
		
		<div>
		<input type="text" name="note" style="width:50%;" placeholder="글을 남겨 주세요" value="<%=CmmUtil.nvl(rDTO.getNote())%>"/>
		<input type="hidden" name="seq" value='<%=rDTO.getSeq()%>'/>
		</div>
		
		<br/>
		<br/>
		
	</div>
	<input type="submit" value="전송" />
	</form>
	

</body>
</html>