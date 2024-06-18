<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css"  rel="stylesheet" >
<link rel="stylesheet" type="text/css" href="/app/css/home.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="App">
		<!-- header 보여주기 -->
		<jsp:include page="include/header.jsp" />
		 
		<!-- content 보여주기 -->
		<jsp:include page="include/home.jsp" />
			
		<!-- footer 보여주기 -->
		<jsp:include page="include/footer.jsp" />
	</div>
</body>
</html>

