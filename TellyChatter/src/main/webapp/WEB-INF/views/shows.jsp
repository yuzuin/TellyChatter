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
				<a href="index">Telly Chatter</a>
			</h1>
			<nav class="links">
				<ul>
					<li><a href="shows">추천 받기</a></li>
					<li><a href="listReview">REVIEW</a></li>
				</ul>
			</nav>
			<nav class="main">
				<ul>
					<li class="search"><a class="fa-search" href="#search">Search</a>
						<form id="search" method="get" action="searchShow">
							<input type="text" name="word" placeholder="Search" />
						</form></li>
					<li class="menu"><a class="fa-bars" href="#menu">Menu</a></li>
				</ul>
			</nav>
		</header>
		</div>

		<!-- Menu -->
		<section id="menu">

			<!-- Search -->
			<section>
				<form class="search" method="get" action="searchShow">
					<input type="text" name="word" placeholder="Search" />
				</form>
			</section>

			<!-- Links -->
			<section>
				<!-- 로그인 했을 때 오른쪽 메뉴 -->
				<c:choose>
					<c:when test="${user ne null }">
						<ul class="links">
							<li><a href="#">
									<div style="width:100px; 
									height:100px; 
									margin: 0 auto;
									overflow:hidden;  
									border: 3px solid gold;
									border-radius : 12px;
									-moz-border-radius: 12px;
									-khtml-border-radius: 12px;
									-webkit-border-radius: 12px;" >
									<img style="
										width:100px;
										height:auto;
										border-radius: 12px;
										-moz-border-radius: 12px;
										-khtml-border-radius: 12px;
										-webkit-border-radius: 12px;" 
										object-fit: cover;
										overlow : hidden;
										src="${pageContext.request.contextPath}/download?filename=${user.profileImg }" />
									</div>
									<div style="text-align:center; margin:5px;">
										<h3>${user.nickname } 님</h3>
										<p>${user.point } P</p>
									</div>
							</a></li>
							<li><a href="myTellyLog">
									<h3>나의 감상장</h3>
									<p>My telly-log</p>
							</a></li>
							<li><a href="myInfo">
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
							<li><a href="registerForm" class="button large fit">Log In</a></li>
						</ul>
					</c:otherwise>
				</c:choose>
			</section>

		</section>

		<!-- 영화목록 -->
		<div id="main">
			<c:forEach var="temp" items="${show }">
				<article class="mini-post"
					style="width: 30%; float: left; margin: 0 19px 19px !important;">
					<header>
						<h2 style="text-align: center;">
							<a href="showDetail?snum=${temp.showNum }">　 ${temp.title }</a>
						</h2>

						<a href="showDetail?snum=${temp.showNum }" class="author" style="font-size: large !important;">
							<time class="published" datetime="2015-10-20">${temp.year }</time>
						</a>
						<h3>${temp.genre }</h3>
						<h4 style="text-align: center;">　 ${temp.platform }</h4>
					</header>
					<a href="showDetail?snum=${temp.showNum }" class="image"
						style="height: 450px !important;"><img
						src="${pageContext.request.contextPath}/download?filename=${temp.poster }" /></a>

				</article>
			</c:forEach>
		</div>

		<!-- Footer -->
		<section id="footer" style="clear: left !important;">
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
</body>
</html>