<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bookfinity - 회원가입</title>
<link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css"  rel="stylesheet" >
<link rel="stylesheet" type="text/css" href="/app/css/common.css">
<link rel="stylesheet" type="text/css" href="/app/css/memberForm.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src = "js/memberForm.js"></script>
</head>
<body>
	<div class="App">
		<jsp:include page="include/header.jsp" />
		
		<jsp:include page="include/memberForm.jsp" />
		
		<jsp:include page="include/footer.jsp" />
	</div>
	<script src="https://kit.fontawesome.com/383b0a4783.js" crossorigin="anonymous"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</body>
</html>