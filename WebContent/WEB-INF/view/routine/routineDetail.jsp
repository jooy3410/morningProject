<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@page import="poly.dto.RoutineDTO"%>
    <%@page import="java.util.List"%>
    <%@ page import="java.util.ArrayList" %>
    <%@page import="poly.util.CmmUtil"%>
        <%
    	String SS_USER_NAME = (String)session.getAttribute("SS_USER_NAME");
    	String SS_USER_NO = (String)session.getAttribute("SS_USER_NO");
    %>
     <%
 	RoutineDTO rDTO = (RoutineDTO) request.getAttribute("rDTO");

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
루틴상세
<div class="row">
<div class="col-3"><%=CmmUtil.nvl(rDTO.getTime())%></div>
<div class="col-9"><%=CmmUtil.nvl(rDTO.getContent())%></div>
</div>

<div>
		<button onclick="location.href=' /routine/editRoutine.do?no=<%=CmmUtil.nvl(rDTO.getSeq())%>'">편집</button>
		<button onclick="location.href=' /routine/routineDelete.do?no=<%=CmmUtil.nvl(rDTO.getSeq())%>'">삭제</button>
	</div>

</body>
</html>