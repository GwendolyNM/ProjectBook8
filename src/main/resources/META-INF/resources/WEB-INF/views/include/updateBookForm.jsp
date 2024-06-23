<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
<script src="webjars/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="js/bookForm.js"></script>

<div class="TodoApp">
    <div class="container">
        <form:form method="post" modelAttribute="booksDTO" action="updateBook" enctype="multipart/form-data" class="addBookForm flex-sa">
            <div class="book-image-box flex-sb">
                <div class="addImage" id="image-show">
                    <!-- 이미지 띄울 공간 -->
                </div>
                <input type="file" accept="image/*" onchange="loadFile(this)" name="book_image" id="book_image" style="display: none;">
                <label for="book_image" class="custom-file-upload btn btn-dark">
                    이미지 업로드
                </label>
            </div>
            <div class="book-text-box flex-sb">
                <div class="input-box">
                    <input type="text" name="book_idx" id="book_idx" class="form-control" value="${bookInfo.book_idx}" readonly/>
                    <form:errors path="book_idx" cssClass="text-warning" />
                </div>
                <div class="input-box">
                    <form:input type="text" path="book_name" id="book_name" class="form-control" value="${bookInfo.book_name}" placeholder="도서명을 입력하세요" />
                    <form:errors path="book_name" cssClass="text-warning" />
                </div>
                <div class="input-box">
                    <form:input type="text" path="book_author" id="book_author" class="form-control" value="${bookInfo.book_author}" placeholder="저자명을 입력하세요" />
                    <form:errors path="book_author" cssClass="text-warning" />
                </div>
                <div class="input-box">
                    <form:input type="text" path="book_pub" id="book_pub" class="form-control" value="${bookInfo.book_pub}" placeholder="출판사를 입력하세요" />
                    <form:errors path="book_pub" cssClass="text-warning" />
                </div>
                <div class="input-box">
                    <form:input type="text" path="book_year" id="book_year" class="form-control" value="${bookInfo.book_year}" placeholder="발행년도를 입력하세요 ex>2024" maxlength="4" />
                    <form:errors path="book_year" cssClass="text-warning" />
                </div>
                <div class="input-box">
                    <form:input type="text" path="book_ISBN" id="book_ISBN" class="form-control" value="${bookInfo.book_ISBN}" placeholder="ISBN을 입력하세요 ex)9791234819348" maxlength="13" />
                    <form:errors path="book_ISBN" cssClass="text-warning" />
                </div>
                <div class="input-box">
                    <form:select path="book_genre_idx" class="form-control" id="book_genre_idx">
                        <form:option value="1">철학</form:option>
                        <form:option value="2">종교</form:option>
                        <form:option value="3">사회과학</form:option>
                        <form:option value="4">순수과학</form:option>
                        <form:option value="5">기술과학</form:option>
                        <form:option value="6">예술과학</form:option>
                        <form:option value="7">언어</form:option>
                        <form:option value="8">문학</form:option>
                        <form:option value="9">역사</form:option>
                    </form:select>
                </div>
                <div class="input-box flex-sb">
                    <button type="submit" name="addBook" class="btn btn-dark btn-submit">도서 수정</button>
                    <a href="books" class="btn btn-dark btn-submit">취소</a>
                </div>
            </div>
        </form:form>
    </div>
</div>
