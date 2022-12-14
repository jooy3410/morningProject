<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="poly.dto.ImgDTO"%>
    <%@page import="java.util.List"%>
    <%@ page import="java.util.ArrayList" %>
    <%
    	String SS_USER_AUTH = (String)session.getAttribute("SS_USER_AUTH");
    	String SS_USER_NAME = (String)session.getAttribute("SS_USER_NAME");
    	String SS_USER_NO = (String)session.getAttribute("SS_USER_NO");
    %>
    
    <%
	List<ImgDTO> rList = (List<ImgDTO>)request.getAttribute("rList");
    
    if (rList == null) {
        rList = new ArrayList<ImgDTO>();
    }

%>
<!DOCTYPE html>
<html>
<head>


<META HTTP-EQUIV="Page-Enter" CONTENT="BlendTrans(Duration=0.5)">
<META HTTP-EQUIV="Page-exit" CONTENT="BlendTrans(Duration=0.5)">


<meta charset="UTF-8">
<title>Insert title here</title>

 <title>Snipp - Free Bootstrap 4 Template by Colorlib</title>
 
 
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:100,200,300,400,700,800" rel="stylesheet">

    <link rel="stylesheet" href="../mainboot/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="../mainboot/css/animate.css">
    
    <link rel="stylesheet" href="../mainboot/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../mainboot/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../mainboot/css/magnific-popup.css">

    <link rel="stylesheet" href="../mainboot/css/aos.css">

    <link rel="stylesheet" href="../mainboot/css/ionicons.min.css">

    <link rel="stylesheet" href="../mainboot/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../mainboot/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="../mainboot/css/flaticon.css">
    <link rel="stylesheet" href="../mainboot/css/icomoon.css">
    <link rel="stylesheet" href="../mainboot/css/style.css">




<script src="/js/jquery-3.2.1.min.js"></script>




<script type="text/javascript">
	$(document).ready(function() {
		var user_no = <%=SS_USER_NO%>;
		console.log("????????? ?????? ?????? : " + user_no);
		
		$.ajax({
			url: "/getMyImg.do",
			type: "post",
			dataType: "JSON",
			success: function(json) {
				
				var resHTML = "";
				
				resHTML += '<div class="container"><div class="row">';
				
				console.log("????????? rList : " + json + typeof json);
				
			for (var i=0; i<json.length; i++) {
				console.log("????????? rList ?????? : " + json[i].user_no);
				console.log("????????? rList ????????? : " + json[i].save_folder_name);
				
				resHTML += '<div class="col-md-4 ftco-animate fadeInUp ftco-animated">'
				resHTML += '<div class="blog-entry">'
				
				resHTML += '<a href="javascript:doDetail(' + json[i].seq + ')"><img src="/resource/images/' + json[i].save_folder_name + '/' + json[i].save_file_name + '" style="width: 384px; height: 302px; "/></a>';
				
				resHTML += '</div>'
				resHTML += '</div>'
			}
			
				resHTML += '</div></div>';
			//id=myimg??? ???????????? ????????????????????? ???????????? ???????????? ??????
			
			$("#myImg").html(resHTML);
			
			
			}
			
		})
		
	})
	
	function doDetail(seq) {
		console.log("????????? ????????? ?????? : " + seq);
		//get???????????? no??? ????????????. ??????????????? get???????????? ????????????
		location.href = "/img/imgDetail.do?no=" + seq;
	}

</script>





</head>
<body>


 
    <div class="row" style="
    margin: 20px;"></div>
    
    <div class="row">
	<div class="col-3" style="display:block; margin: 0 auto;"><a href="/logOut.do"><img class="toCenter" src="../mainboot/images/door_icon.png" style="width: 32px;"></a></div>
	<div class="col-6" ></div>
	<div class="col-3" style="display:block; margin: 0 auto;"><img class="toCenter" src="../mainboot/images/speaker_icon.png" style="width: 32px;"></div>
    </div>
    
    <br><br>
    
    <div class="row">
    <div class="col-5"></div>
    <div class="col-2">
    img</div>
    <div class="col-5"></div>
    </div>
    
    <hr>
	
    <div style="margin: 100px;"> <a href="/routine/routineList.do"> ?????? ????????? ????????? ?????????</a></div>
    
     <hr>
    
    <!-- ??????, ?????? ?????? -->
    <div class="row" style= "margin: 35px;"> 
    
    		<div class="col-5">
    				<div class="blog-entry" style="width: 102px;height: 102px;">
					<a href="/weather/Weather_view.do"><img class="toCenter" src="../mainboot/images/weather_icon.png" style="width: 62px;"></a>
					</div>
			</div>
	
			<div class="col-2"></div>
	
	
    		<div class="col-5">
    				<div class="blog-entry" style="width: 102px;height: 102px;">
					<a href="/calendar/Calendar_view.do"><img class="toCenter" src="../mainboot/images/calendar_icon.png" style="width: 62px;"></a>
					</div>
			</div>
	</div>
	
	<!-- ??????, ?????? ??? -->
	<hr>
	<div class="row">
	
	<div class="col-4" style="display:block; margin: 0 auto;">
	<h6 >?????????</h6>
	</div>
	
	<div class="col-4"></div>
	
	<div class="col-4">
	
	 <h6><a href="/img/ImageFileUpload.do">  ???????????? </a> </h6>
	
	</div>
	
	</div>
	
	
<!-- ????????? ????????? ?????? -->
	<br>
	<div id="myImg"></div>
	
	<!-- ????????? ????????? ??? -->
	
     
      
      
  <!--  </section>  --> 
    

    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

<style>
.toCenter {
 display:block; 
 margin: 0 auto;
 margin-top: 20px;
 }
</style>
<script src="/js/jquery-3.2.1.min.js"></script>
  <script src="../mainboot/js/jquery.min.js"></script>
  <script src="../mainboot/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="../mainboot/js/popper.min.js"></script>
  <script src="../mainboot/js/bootstrap.min.js"></script>
  <script src="../mainboot/js/jquery.easing.1.3.js"></script>
  <script src="../mainboot/js/jquery.waypoints.min.js"></script>
  <script src="../mainboot/js/jquery.stellar.min.js"></script>
  <script src="../mainboot/js/owl.carousel.min.js"></script>
  <script src="../mainboot/js/jquery.magnific-popup.min.js"></script>
  <script src="../mainboot/js/aos.js"></script>
  <script src="../mainboot/js/jquery.animateNumber.min.js"></script>
  <script src="../mainboot/js/bootstrap-datepicker.js"></script>
  <script src="../mainboot/js/jquery.timepicker.min.js"></script>
  <script src="../mainboot/js/particles.min.js"></script>
  <script src="../mainboot/js/particle.js"></script>
  <script src="../mainboot/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="../mainboot/js/google-map.js"></script>
  <script src="../mainboot/js/main.js"></script>

</body>
</html>