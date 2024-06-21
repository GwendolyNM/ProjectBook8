<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<header>
	<div class="header-box">
		<nav class="navbar navbar-expand-lg">
			<div class="collapse navbar-collapse">
				<ul class="navbar-nav">
					<li class="nav-item "><a class="nav-link logo text-dark fs-2"
						href="home">BookProject</a></li>
					<li class="nav-item"><a class="nav-link text-dark"
						href="books">Books</a></li>
				</ul>
			</div>
			<ul class="navbar-nav">
				<!--  인증이 안된 사용자 -->
				<sec:authorize access="isAnonymous()">
					<li class="nav-item">
						<i class="fas fa-user fa-2xs"></i> 
						<a class="nav-link text-dark" href="login">login</a>
					</li>
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
					<li class="nav-item">
						<i class="fas fa-user fa-2xs"></i>
						<a class="nav-link text-dark" href="signup">signup</a>
					</li>
				</sec:authorize>

				<!--  인증이 된 사용자 -->
				<sec:authorize access="isAuthenticated()">
					<li class="nav-item">
						<i class="fas fa-user fa-2xs"></i>
						<a class="nav-link text-dark" href="logout">logout</a>
					</li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li class="nav-item">
						<i class="fas fa-user fa-2xs"></i> 
						<a class="nav-link text-dark" href="mypage">mypage</a>
					</li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li class="nav-item">
						<i class="fas fa-user fa-2xs"></i> 
						<a class="nav-link text-dark" href="memberList">members</a>
					</li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li class="nav-item">
						<i class="fas fa-book fa-3xs"></i> 
						<a class="nav-link text-dark" href="addBook">books</a>
					</li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li class="nav-item">
						<i class="fas fa-book fa-3xs"></i> 
						<a class="nav-link text-dark" href="myBooks">MyBooks</a>
					</li>
				</sec:authorize>
			</ul>
		</nav>
	</div>
</header>
