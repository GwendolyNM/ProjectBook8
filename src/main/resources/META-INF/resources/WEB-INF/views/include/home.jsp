<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

  
<div class="back-image">
	<form action="/app/books" method="get" class="booklist-search">
		<input type="text" id="keyword" name="keyword">
		<button type="submit" class="btn btn-secondary btn-sm btn-dark">검색</button>
	</form>
</div>
