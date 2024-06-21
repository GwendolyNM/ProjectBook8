<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="booklist-search-box">
	<form action="/app/books" method="get" class="booklist-search">
		<input type="text" id="keyword" name="keyword">
		<button type="submit" class="btn btn-secondary btn-sm btn-dark">검색</button>
	</form>
</div>
<div class="container">
	<c:forEach var="dto" items="${booksList}">
		<div class="bookcard">
			<div class="bookcard_img">
				<img src="images/bookimage/${dto.book_image}" alt="">
			</div>
			<div class="bookcard_text" style="border: 1px;">
				<table class="bookcard_info">
					<tr>
						<td>등록번호</td>
						<td>${dto.book_idx}</td>
					</tr>
					<tr>
						<td>도서명</td>
						<td>${dto.book_name}</td>
					</tr>
					<tr>
						<td>저자</td>
						<td>${dto.book_author}</td>
					</tr>
					<tr>
						<td>출판사</td>
						<td>${dto.book_pub}</td>
					</tr>
					<tr>
						<td>발행년도</td>
						<td>${dto.book_year}</td>
					</tr>
					<tr>
						<td>주제명</td>
						<td>${dto.book_genre }</td>
					</tr>
				</table>
				<div class="bookcard_button">
					<form method="post" action="rent">
						<!-- 숨겨진 필드로 등록번호를 전송 -->
						<input type="hidden" name="book_idx" value="${dto.book_idx}">
						<button type="submit" class="btn btn-secondary btn-sm btn-dark fw-bold">대여하기</button>
					</form>
				</div>
			</div>
		</div>
	</c:forEach>
</div>