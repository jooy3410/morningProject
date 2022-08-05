<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.RoutineDTO"%>
<%@page import="poly.dto.UserDTO"%>
<%@ page import="java.util.ArrayList" %>
   <%
   String SS_USER_AUTH = (String)session.getAttribute("SS_USER_AUTH");
   String SS_USER_NAME = (String)session.getAttribute("SS_USER_NAME");
	RoutineDTO rDTO = (RoutineDTO)request.getAttribute("rDTO");   
   String SS_USER_NO = CmmUtil.nvl((String) session.getAttribute("SS_USER_NO"));
   String user_no = CmmUtil.nvl((String) request.getAttribute("user_no"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="f" id="f" action="/routine/doRoutineUpdate.do" method="post">
     
      <p>
         <input type="time" id="time" name="time" value="<%=rDTO.getTime()%>"/>
      </p>

      
      <input type="hidden" name="seq" value="<%=rDTO.getSeq()%>"/>
      <input type="hidden" name="seq" value="<%=rDTO.getUser_no()%>"/>
      <input type="text" name="content" style="width:50%;" placeholder="글을 남겨 주세요" value="<%=rDTO.getContent()%>"/>
      
      <p><input type="submit" value="Submit"></p>
    </form>
</body>
</html>