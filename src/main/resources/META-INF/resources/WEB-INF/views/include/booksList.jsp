<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<div class="booklist-search-box">
	<form action="/app/books" method="get" class="booklist-search">
		<input type="text" id="keyword" name="keyword">
		<button type="submit" class="btn btn-secondary btn-sm btn-dark">검색</button>
	</form>
</div>
<div class="container scrollbar">
	<c:forEach var="dto" items="${booksList}">
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
				<sec:authorize access="hasRole('ROLE_USER') and !hasRole('ROLE_ADMIN')">
					<div class="bookcard_button">
					<form method="post" action="rent">
						<!-- 숨겨진 필드로 등록번호를 전송 -->
						<input type="hidden" name="book_idx" value="${dto.book_idx}">
						<button type="submit" class="btn btn-secondary btn-sm btn-dark fw-bold">예약하기</button>
					</form>
				</div>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<div class="bookcard_button">
					<form method="post" action="책수정페이지로이동">
						<!-- 숨겨진 필드로 등록번호를 전송 -->
						<input type="hidden" name="book_idx" value="${dto.book_idx}">
						<input type="hidden" name="book_name" value="${dto.book_name}">
						<input type="hidden" name="book_author" value="${dto.book_author}">
						<input type="hidden" name="book_pub" value="${dto.book_pub}">
						<input type="hidden" name="book_year" value="${dto.book_year}">
						<input type="hidden" name="book_genre" value="${dto.book_genre}">
						<button type="submit" class="btn btn-secondary btn-sm btn-dark fw-bold">수정하기</button>
					</form>
				</div>
				</sec:authorize>
			</div>
		</div>
	</c:forEach>
</div>