<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
<script src="webjars/jquery/3.6.0/jquery.min.js"></script>
<script>
	function loadFile(input) {
		let file = input.files[0]; // 선택파일 가져오기

		let newImage = document.createElement("img"); //새 이미지 태그 생성

		//이미지 source 가져오기
		newImage.src = URL.createObjectURL(file);
		newImage.style.width = "100%"; //div에 꽉차게 넣기
		newImage.style.height = "100%";
		newImage.style.objectFit = "cover"; // div에 넘치지 않게 설정

		//이미지를 image-show div 출력
		let container = document.getElementById('image-show');
		container.appendChild(newImage);
	}
</script>

<div class="TodoApp">
	<div class="container">
		<div class="addBook">
			<h1 class="addBookhead">도서 추가</h1>
			<div class="addBookForm">
				<form:form method="post" modelAttribute="booksDTO"
					enctype="multipart/form-data">
					<div>
						<label for="book_image">도서 이미지</label>
						<div class="addImage" id="image-show">
							<!-- 이미지 띄울 공간 -->
						</div>
						<input type="file" accept="image/*" onchange="loadFile(this)"
						name="book_image" path="book_image" id="book_image" >
					</div>
					<div>
						<label for="book_idx">등록번호</label>
						<form:input type="text" name="book_idx" path="book_idx"
							id="book_idx" class="form-control" placeholder="AY000049241" maxlength="11"/>
						<form:errors path="book_idx" cssClass="text-warning" />
					</div>
					<div>
						<label for="book_name">도서명</label>
						<form:input type="text" name="book_name" path="book_name"
							id="book_name" class="form-control" placeholder="도서명을 입력하세요" />
						<form:errors path="book_name" cssClass="text-warning" />
					</div>
					<div>
						<label for="book_author">저자명</label>
						<form:input type="text" name="book_author" path="book_author"
							id="book_author" class="form-control" placeholder="홍길동" />
						<form:errors path="book_author" cssClass="text-warning" />
					</div>
					<div>
						<label for="book_pub">출판사</label>
						<form:input type="text" name="book_pub" path="book_pub"
							id="book_pub" class="form-control" placeholder="출판사를 입력하세요" />
						<form:errors path="book_pub" cssClass="text-warning" />
					</div>
					<div>
						<label for="book_year">발행년도</label>
						<form:input type="text" name="book_year" path="book_year"
							id="book_year" class="form-control" placeholder="2024"
							maxlength="4" />
						<form:errors path="book_year" cssClass="text-warning" />
					</div>
					<div>
						<label for="book_ISBN">ISBN</label>
						<form:input type="text" name="book_ISBN" path="book_ISBN"
							id="book_ISBN" class="form-control" placeholder="9791234819348"
							maxlength="13" />
						<form:errors path="book_ISBN" cssClass="text-warning" />
					</div>
					<div>
						<label for="book_genre_idx">주제명</label> <select name="book_genre_idx"
							class="form-control" id="book_genre_idx">
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
					<div>
						<button type="submit" name="addBook" class="btn btn-success m-5">submit</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>
