<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

</head>

<script src="/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
   $(window).on("load", function() {
      //페이지 로딩 완료 후 , 날씨 정보 api 실행
      weather();
      //페이지 로딩 완료 후 , 대기 정보 api 실행
      air();
   });
   //날씨정보 api
   function weather() {
      var weatherApiURL = "http://api.openweathermap.org/data/2.5/weather?q=seoul&appid=ddee8cc2c5200bcd83e14e7967de3af3";
      $.ajax({
         url : weatherApiURL,
         dataType : "json",
         type : "GET",
         success : function(resp) {
            console.log(resp);
            console.log("현재온도 : " + (Math.ceil(resp.main.temp - 273.15)));
            console.log("현재습도 : " + resp.main.humidity);
            console.log("날씨 : " + resp.weather[0].main);
            console.log("상세날씨설명 : " + resp.weather[0].description);
            console.log("날씨 이미지 : " + "http://openweathermap.org/img/w/" + resp.weather[0].icon + ".png");
            console.log("바람   : " + resp.wind.speed);
            console.log("나라   : " + resp.sys.country);
            console.log("도시이름  : " + resp.name);
            console.log("이미지  : " + resp.weather[0].icon);
            console.log("구름  : " + (resp.clouds.all) + "%");

            var temp = resp.main.temp - 273.15;
            $('#temp').html(Math.ceil(temp));
            $('#humi').html(resp.main.humidity);
            $('#weather').html(resp.weather[0].main);
            $('#wind').html(resp.wind.speed);
            $('#name').html(resp.name);
            $('#icon').html(resp.icon);

            var imgURL = "http://openweathermap.org/img/w/"
                  + resp.weather[0].icon + ".png";
            $('#icon').attr("src", imgURL);
         }
      })
   }
   
   //대기정보 api
   function air() {
      $.ajax({
        type: "GET",
        url: "http://openapi.seoul.go.kr:8088/6d4d776b466c656533356a4b4b5872/json/RealtimeCityAir/1/51",
        data: {},
        success: function(res){
            
            console.log("미세먼지 : " + res["RealtimeCityAir"]["row"][1]['PM10']);
            console.log("초미세먼지 : " + res["RealtimeCityAir"]["row"][1]['PM25']);
            console.log("오존 : " + res["RealtimeCityAir"]["row"][1]['O3']);   
            console.log("이산화 질소 : " + res["RealtimeCityAir"]["row"][1]['NO2']);
            console.log("일산화 탄소 : " + res["RealtimeCityAir"]["row"][1]['CO']);
            console.log("이산화 황 : " + res["RealtimeCityAir"]["row"][1]['SO2']);
            console.log("대기 : " + res["RealtimeCityAir"]["row"][1]['IDEX_NM']);
            
            $('#PM10').html(res["RealtimeCityAir"]["row"][1]['PM10']);
              $('#PM25').html(res["RealtimeCityAir"]["row"][1]['PM25']);
              $('#O3').html(res["RealtimeCityAir"]["row"][1]['O3']);
              $('#NO2').html(res["RealtimeCityAir"]["row"][1]['NO2']);
              $('#CO').html(res["RealtimeCityAir"]["row"][1]['CO']);
              $('#SO2').html(res["RealtimeCityAir"]["row"][1]['SO2']);
              $('#IDEX_NM').html(res["RealtimeCityAir"]["row"][1]['IDEX_NM']);
        }
      });
      
   }
</script>



<body>


<section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-5">
          <div class="col-md-6 text-center heading-section ftco-animate">
            <h2 class="mb-4">오늘의 날씨</h2>
          </div>
        </div>
        <div class="row mb-5">
          <div class="col-md-6 col-lg-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block text-center">
              <div class="d-flex justify-content-center"><div class="icon color-3 d-flex justify-content-center mb-3"><span class="align-self-center"><img id="icon"></span></div></div>
              <div class="media-body p-2 mt-3">
                <h3 class="heading"><div id="temp"></div></h3>
                
                <div class="row m-1 pt-1">
               			<div class="col-4 text-center"><b>날씨 </b></div>
                    	<div class="col-4 text-center"><b>지역</b></div>
                     	<div class="col-4 text-center"><b>습도</b></div>
               
                		<div class="col-4"><div id="weather"></div></div>
                     	<div class="col-4"><div id="name"></div></div>
                     	<div class="col-4"><div id="humi"></div></div>
                     
                     <br>
                     
                		<div class="col-4 text-center"><b>미세먼지 </b></div>
                     	<div class="col-4 text-center"><b>초미세먼지</b></div>
                     	<div class="col-4 text-center"><b>오존</b></div>
                     	
                     	<div class="col-4"><div id="PM10"></div></div>
                     	<div class="col-4"><div id="PM25"></div></div>
                     	<div class="col-4"><div id="O3"></div></div>
                
              </div>
            </div>      
          </div>
          </div>
          </div>
          </section>

   
   
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