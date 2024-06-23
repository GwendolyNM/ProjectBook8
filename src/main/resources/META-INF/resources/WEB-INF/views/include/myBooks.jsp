<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<div class="mybooklist-box scrollbar">
		<table class="book_info">
			<tr class="table-column">
				<td width="130px" class="">표지</td>
				<td width="100px" class="">고유번호</td>
				<td>제목</td>
				<td width="100px" class="">저자</td>
				<td width="100px" class="">출판사</td>
				<td width="100px">대여일</td>
				<td width="100px" class="">반납일</td>
			</tr>
			<c:forEach var="dto" items="${myBooksList}">
				<tr class="table-row">
					<td class="flex-c">
						<img src="images/bookimage/${dto.book_image}" alt="">
					</td>
					<td class="text-c">${dto.book_idx}</td>
					<td class="text-c">${dto.book_name}</td>
					<td class="text-c">${dto.book_author}</td>
					<td class="text-c">${dto.book_pub}</td>
					<td class="text-c">${dto.rent_date}</td>
					<td class="text-c" >${dto.rent_return}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>