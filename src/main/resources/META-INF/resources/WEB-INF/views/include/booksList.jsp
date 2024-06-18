<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
  <div class="row">
    <c:forEach var="dto" items="${booksList}">
	    <div class="col border border-dark m-4 w-80">
	      <a href=""> 
			<img src="images/bookimage/${dto.book_image}" width="200">
		  </a>
	       <div class="mt-4 fs-6">${dto.book_idx}</div>
	       <div class="mt-4 fs-6">${dto.book_name}</div>
	       <div class="mt-4 fs-6">${dto.book_author}</div>
	       <div class="mt-4 fs-6">${dto.book_pub}</div>
	       <div class="mt-2 fs-6">${dto.book_year}</div>
	    </div>
    </c:forEach>
  </div>
</div>