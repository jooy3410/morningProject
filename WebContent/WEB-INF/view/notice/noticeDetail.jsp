<%@page import="poly.dto.BoardDTO"%>
<%@page import="static poly.util.CmmUtil.nvl" %>
<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
    BoardDTO rDTO = (BoardDTO)request.getAttribute("rDTO");
    
    String val = CmmUtil.nvl((String)request.getAttribute("val"));
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=nvl(rDTO.getPost_title()) %></title>




<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700"
	rel="stylesheet">


<link rel="stylesheet" href="../css/style.css">

<script src="https://kit.fontawesome.com/54d6336788.js"
	crossorigin="anonymous"></script>




</head>
<body>




<!-- 빈공간 -->
<div class="main" style="margin-top: 100px;"></div>


<div style="width: 60%; margin: auto;">


	<h4><%=nvl(rDTO.getPost_title()) %></h4>
	
	<hr>
	<div style="text-align:right;">작성자 : <%=nvl(rDTO.getReg_id()) %></div>
	<div>
		<p><%=nvl(rDTO.getPost_content()) %></p>
	</div>
	<hr>
	<div style="float:left;">
		<button onclick="location.href=' /notice/noticeList.do'">뒤로</button>
	</div>
	
	<%if(session.getAttribute("SS_USER_NUM") != null) {%>
                  <%if(session.getAttribute("SS_USER_NUM").equals("0")) {%>
	<div style="float:right;">
		<button onclick="confirmDelete();">삭제</button>
	</div>
	<div style="float:right;">
		<button onclick="location.href=' /notice/editPost.do?no=<%=rDTO.getPost_no()%>'">편집</button>
	
	
	</div>
	<%} %>
             <%} %>

	<script type="text/javascript">
	function confirmDelete(){
	if(confirm("삭제하시겠습니까?")){
		location.href = "/board/deletePost.do?no=<%=rDTO.getPost_no()%>";
	}
	}
	</script>
	
	
	</div>
	
	
	<!-- 빈공간 -->
<div class="main" style="margin-top: 150px;"></div>


<!-- 빈공간 -->
<div class="main" style="margin-top: 150px;"></div>



	

</body>
</html>