<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css"  rel="stylesheet" >
<link rel="stylesheet" type="text/css" href="/app/css/member.css">
<meta charset="UTF-8">
<title>Insert title here</title>
 
</head>
<body>
       <div class="App">
		    <!-- header 보여주기 -->
		 	<jsp:include page="include/header.jsp" />
		 	
		    <!-- content 보여주기 -->
		 	<jsp:include page="include/memberForm.jsp" />
		</div>
	
</body>
</html>