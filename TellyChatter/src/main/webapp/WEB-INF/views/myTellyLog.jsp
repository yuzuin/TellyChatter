<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE HTML>
<!--
	Future Imperfect by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Single - Future Imperfect by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
</head>
<body class="single is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<h1>
				<a href="/">Future Imperfect</a>
			</h1>
			<nav class="links">
				<ul>
					<li><a href="#">Lorem</a></li>
					<li><a href="#">Ipsum</a></li>
					<li><a href="#">Feugiat</a></li>
					<li><a href="#">Tempus</a></li>
					<li><a href="#">Adipiscing</a></li>
				</ul>
			</nav>
			<nav class="main">
				<ul>
					<li class="search"><a class="fa-search" href="#search">Search</a>
						<form id="search" method="get" action="#">
							<input type="text" name="query" placeholder="Search" />
						</form></li>
					<li class="menu"><a class="fa-bars" href="#menu">Menu</a></li>
				</ul>
			</nav>
		</header>

		<!-- Menu -->
		<section id="menu">

			<!-- Search -->
			<section>
				<form class="search" method="get" action="#">
					<input type="text" name="query" placeholder="Search" />
				</form>
			</section>

			<!-- Links -->
			<section>
				<!-- 로그인 했을 때 오른쪽 메뉴 -->
				<c:choose>
					<c:when test="${user ne null }">
						<ul class="links">
							<li><a href="#">
									<div
										style="width: 100px; height: 100px; margin: 0 auto; overflow: hidden; border: 3px solid gold; border-radius: 12px; -moz-border-radius: 12px; -khtml-border-radius: 12px; -webkit-border-radius: 12px;">
										<img
											style="width: 100px; height: auto; border-radius: 12px; -moz-border-radius: 12px; -khtml-border-radius: 12px; -webkit-border-radius: 12px;"
											object-fit: cover;
										overlow :
											hidden;
										src="${pageContext.request.contextPath}/download?filename=${user.profileImg }" />
									</div>
									<div style="text-align: center; margin: 5px;">
										<h3>${user.nickname }님</h3>
										<p>${user.point }P</p>
									</div>
							</a></li>
							<li><a href="#">
									<h3>나의 문화 달력</h3>
									<p>My Calander</p>
							</a></li>
							<li><a href="#">
									<h3>나의 감상장</h3>
									<p>My telly-log</p>
							</a></li>
							<li><a href="#">
									<h3>내 정보</h3>
									<p>My info</p>
							</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<h3>로그인이 필요합니다.</h3>
						<p>로그인 하시고 TELLY CAHTTER의 커뮤니티 혜택을 누려보세요.</p>
					</c:otherwise>
				</c:choose>
			</section>

			<!-- Actions 로그인시 로그아웃이 뜨고, 미로그인시 로그인이 뜸 -->
			<section>
				<c:choose>
					<c:when test="${user ne null }">
						<ul class="actions stacked">
							<li><a href="logout" class="button large fit">Log Out</a></li>
						</ul>
					</c:when>

					<c:otherwise>
						<ul class="actions stacked">
							<li><a href="registerForm" class="button large fit">Log
									In</a></li>
						</ul>
					</c:otherwise>
				</c:choose>
			</section>

		</section>


		<!-- Main -->
		<div id="main">

			<ul class="tab-group">
				<li class="tab active"><a href="#likeReview">내가 찜한 리뷰</a></li>
				<li class="tab"><a href="#likeShow">내가 찜한 영화</a></li>
				<li class="tab"><a href="#myReview">내가 쓴 리뷰</a></li>
				<li class="tab"><a href="#myShow">내가 올린 영화</a></li>
				<li class="tab"><a href="#online">내가 한줄평한 영화</a></li>
			</ul>
			<!-- Post -->
			<article class="post">

			<div class="tab-content">
				

				<div id="likeReview">
					<h1>내가 찜한 리뷰</h1>
				</div>
				<div id="likeShow">
					<h1>내가 찜한 영화</h1>
				</div>
				<div id="myReview">
					<h1>내가 쓴 리뷰</h1>
				</div>
				<div id="myShow">
					<h1>내가 올린 영화</h1>
				</div>
				<div id="online">
					<h1>내가 한줄평한 영화</h1>
				</div>
				
				
		</div>
			</article>




		<!-- 코멘트 영역  -->
		<article class="post">
			<div class="container">
				<label for="content">comment</label>
			</div>

			<div class="container">
				<div class="commentList"></div>
			</div>
	</div>
	</article>

	<!--                     추가                         -->
	<%@ include file="commentS.jsp"%>

	<!-- Footer -->
	<section id="footer">
		<ul class="icons">
			<li><a href="#" class="icon brands fa-twitter"><span
					class="label">Twitter</span></a></li>
			<li><a href="#" class="icon brands fa-facebook-f"><span
					class="label">Facebook</span></a></li>
			<li><a href="#" class="icon brands fa-instagram"><span
					class="label">Instagram</span></a></li>
			<li><a href="#" class="icon solid fa-rss"><span
					class="label">RSS</span></a></li>
			<li><a href="#" class="icon solid fa-envelope"><span
					class="label">Email</span></a></li>
		</ul>
		<p class="copyright">
			&copy; Untitled. Design: <a href="http://html5up.net">HTML5 UP</a>.
			Images: <a href="http://unsplash.com">Unsplash</a>.
		</p>
	</section>


	<!-- Scripts -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/register.js"></script>


</body>
</html>