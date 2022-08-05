<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%@page import="poly.dto.RoutineDTO"%>
    <%@page import="java.util.List"%>
    <%@ page import="java.util.ArrayList" %>
    <%
    	String SS_USER_AUTH = (String)session.getAttribute("SS_USER_AUTH");
    	String SS_USER_NAME = (String)session.getAttribute("SS_USER_NAME");
    	String SS_USER_NO = (String)session.getAttribute("SS_USER_NO");
    %>
    
    <%
	List<RoutineDTO> rList = (List<RoutineDTO>)request.getAttribute("rList");
    
    if (rList == null) {
        rList = new ArrayList<RoutineDTO>();
    }

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

function doDetail(seq) {
	console.log("가져온 게시글 번호 : " + seq);
	//get방식으로 no를 가져온다. 주소에다가 get방식으로 호출할때
	location.href = "/routine/routineDetail.do?no=" + seq;
}

	$(document).ready(function() {
		var user_no = <%=SS_USER_NO%>;
		console.log("가져온 회원 번호 : " + user_no);
		
		$.ajax({
			url: "/getMyRoutine.do",
			type: "post",
			dataType: "JSON",
			success: function(json) {
				
				var resHTML = "";
				
				
				console.log("받아온 rList : " + json + typeof json);
				
				
				resHTML += '<div class="row">'
				resHTML += '<div class="col-3">시간</div>'
				resHTML += '<div class="col-9">내용</div>'
				resHTML += '</div>'
				if(json.length == 0){
					resHTML += '<div class="row">'
						resHTML += '<div class="col-3">-</div>'
						resHTML += '<div class="col-9">-</div>'
						resHTML += '</div>'
				}else{
			for (var i=0; i<json.length; i++) {
				console.log("받아온 rList 값들 : " + json[i].user_no);
				console.log("받아온 rList 시간 : " + json[i].time);
				console.log("받아온 rList 내용 : " + json[i].content);
				resHTML += '<div class="row">'
					resHTML += '<a href="javascript:doDetail(' + json[i].seq + ')"><div class="col-3">'+ json[i].time+'</div></a>'
					resHTML += '<a href="javascript:doDetail(' + json[i].seq + ')"><div class="col-9">'+ json[i].content+'</div></a>'
					resHTML += '</div>'
						console.log(resHTML);
			}
				}
			
				
			//id=myimg에 결과값을 넣어주기위해서 결과값을 넣어주는 변수
			
			$("#myRoutine").html(resHTML);
			
			
			}
			
		})
		
	})
</script>


</head>
<body>

<div id="myRoutine"></div>

</body>
</html>