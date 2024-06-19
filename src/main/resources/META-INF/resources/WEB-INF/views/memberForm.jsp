<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css"  rel="stylesheet" >
<link rel="stylesheet" type="text/css" href="/app/css/member.css">
</head>
<body>
       <div class="App">
		 	<jsp:include page="include/header.jsp" />
		 	
		 	<jsp:include page="include/memberForm.jsp" />
		 	
		 	<jsp:include page="include/footer.jsp" />
		</div>
	
</body>
</html>