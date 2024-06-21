<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <h1>개인정보 페이지</h1>
    <div>
        <label for="member_id">아이디:</label>
        <span id="member_id">${member.member_id}</span>
    </div>
    <div>
        <label for="member_phone">전화번호:</label>
        <span id="member_phone">${member.member_phone}</span>
    </div>
    <div>
        <label for="member_name">이름:</label>
        <span id="member_name">${member.member_name}</span>
    </div>
    <div>
        <label for="member_address">주소:</label>
        <span id="member_address">${member.member_address}</span>
    </div>
