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
<title>Insert title here</title>


    <style>
      * {
        font-size: 16px;
        font-family: Consolas, sans-serif;
      }
    </style>
    
    
    
</head>
<body>
<h1>tmie</h1>
<br><br>
<form name="f" id="f" action="/routine/insertRoutineInfo.do" method="post">
     
      <p>
         <input type="time" id="time" name="time">
      </p>

      
      
      <div><textarea name="content" required style="width:500px;height:500px"></textarea></div>
      <p><input type="submit" value="Submit"></p>
    </form>
</body>
</html>