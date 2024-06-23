<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
<script src="webjars/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src = "js/bookForm.js"></script>

<div class="TodoApp">
	<div class="container">
		<form:form method="post" modelAttribute="booksDTO" enctype="multipart/form-data" class="addBookForm flex-sa">
			<div class="book-image-box flex-sb">
				<div class="addImage" id="image-show">
					<!-- 이미지 띄울 공간 -->
				</div>
				<input type="file" accept="image/*" onchange="loadFile(this)" name="book_image" path="book_image" id="book_image" style="display: none;">
				<label for="book_image" class="custom-file-upload btn btn-dark">
						이미지 업로드
				</label>
			</div>
			<div class="book-text-box flex-sb">
				<div class="input-box">
					<form:input type="text" name="book_idx" path="book_idx"	id="book_idx" class="form-control" placeholder="등록번호 ex)AY000049241" maxlength="11"/>
					<form:errors path="book_idx" cssClass="text-warning" />
				</div>
				<div class="input-box">
					<form:input type="text" name="book_name" path="book_name" id="book_name" class="form-control" placeholder="도서명을 입력하세요" />
					<form:errors path="book_name" cssClass="text-warning" />
				</div>
				<div class="input-box">
					<form:input type="text" name="book_author" path="book_author" id="book_author" class="form-control" placeholder="저자명을 입력하세요" />
					<form:errors path="book_author" cssClass="text-warning" />
				</div>
				<div class="input-box">
					<form:input type="text" name="book_pub" path="book_pub"	id="book_pub" class="form-control" placeholder="출판사를 입력하세요" />
					<form:errors path="book_pub" cssClass="text-warning" />
				</div>
				<div class="input-box">
					<form:input type="text" name="book_year" path="book_year" id="book_year" class="form-control" placeholder="발행년도를 입력하세요 ex>2024" value="2024" maxlength="4" />
					<form:errors path="book_year" cssClass="text-warning" />
				</div>
				<div class="input-box">
					<form:input type="text" name="book_ISBN" path="book_ISBN" id="book_ISBN" class="form-control" placeholder="ISBN을 입력하세요 ex)9791234819348" maxlength="13" />
					<form:errors path="book_ISBN" cssClass="text-warning" />
				</div>
				<div class="input-box">
					<select name="book_genre_idx" class="form-control" id="book_genre_idx">
						<option value="1">철학</option>
						<option value="2">종교</option>
						<option value="3">사회과학</option>
						<option value="4">순수과학</option>
						<option value="5">기술과학</option>
						<option value="6">예술과학</option>
						<option value="7">언어</option>
						<option value="8">문학</option>
						<option value="9">역사</option>
					</select>
				</div>
				<div class="input-box flex-sb">
					<button type="submit" name="addBook" class="btn btn-dark btn-submit">도서 추가</button>
					<a href="books" class="btn btn-dark btn-submit">취소</a>
				</div>
			</div>
		</form:form>
	</div>
</div>
