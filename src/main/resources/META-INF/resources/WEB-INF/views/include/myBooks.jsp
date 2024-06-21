<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<c:forEach var="dto" items="${myBooksList}">
		<div class="bookcard">
			<div class="bookcard_img">
				<img src="images/bookimage/${dto.book_image}" alt="">
			</div>
			<div class="bookcard_text">
				<table class="bookcard_info">
					<tr>
						<td>등록번호</td>
						<td>${dto.book_idx}</td>
					</tr>
				</table>
			</div>
		</div>
	</c:forEach>
</div>