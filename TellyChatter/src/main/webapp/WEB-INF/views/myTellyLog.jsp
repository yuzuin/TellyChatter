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
			<div class="col-10 col-12-medium" style="padding-left:70px">
			<ul class="actions">
				<li><a href='javascript:mylikeReviewList()' class="button" style="font-size:14px">내가찜한 리뷰</a></li>
				<li><a href='javascript:myLikeShowList()' class="button" style="font-size:14px">내가 찜한 영화</a></li>
				<li><a href='javascript:myReviewList()' class="button" style="font-size:14px">내가 쓴 리뷰</a></li>
				<li><a href='javascript:myUploadShowList()' class="button" style="font-size:14px">내가 올린 영화</a></li>
				<li><a href='javascript:myOneLineShowList()' class="button" style="font-size:14px">내가 한줄평한 영화</a></li>
			</ul>
			</div>
			<!-- Post -->
			<article class="post">

				<div class="tab-content">


					<div id="likeReview">
						<h1 id="logTitle"></h1>

						<div class="table-wrapper">
							<div id="listArea">
								<table class="alt">
									<div>
										<table id="boardList" class="alt table-wrapper"></table>
									</div>
								</table>
							</div>
						</div>
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

		<script>
			var id = '${user.id}'; // 내 아이디

			function mylikeReviewList() {

				$
						.ajax({
							url : 'myLikeReview',
							type : 'get',
							data : {
								'id' : '${user.id}'
							},
							success : function(data) {
								var a = '<h1>내가 찜한 리뷰</h1>';
								var f = '<thead><tr><th>리뷰쓴이</th><th>제목</th><th style="text-align:center";>좋아요 수</th></tr></thead><tr>';
								$
										.each(
												data,
												function(key, value) {
													f += '<td>'
															+ value.writer
															+ '</td><td>'
															+ value.title
															+ '</td><td style="text-align:left;">'
															+ value.likes
															+ '</tr>';
												});
								$("#logTitle").html(a);
								$("#boardList").html(f);

							}
						});
			}

			$(document).ready(function() {
				mylikeReviewList(); //페이지 로딩시 내찜리뷰 출력
			});
		</script>
		<script>
			var id = '${user.id}'; // 내 아이디

			function myReviewList() {

				$
						.ajax({
							url : 'myReview',
							type : 'get',
							data : {
								'id' : '${user.id}'
							},
							success : function(data) {
								var a = '<h1>내가 쓴 리뷰</h1>';
								var f = '<thead><tr><th>날짜</th><th>제목</th><th style="text-align:center";>좋아요 수</th></tr></thead><tr>';
								$
										.each(
												data,
												function(key, value) {
													f += '<td>'
															+ value.writetime
															+ '</td><td>'
															+ value.title
															+ '</td><td style="text-align:left;">'
															+ value.likes
															+ '</tr>';
												});
								$("#logTitle").html(a);
								$("#boardList").html(f);

							}
						});
			}
		</script>
		<script>
			var id = '${user.id}'; // 내 아이디

			function myLikeShowList() {

				$
						.ajax({
							url : 'myLikeShow',
							type : 'get',
							data : {
								'id' : '${user.id}'
							},
							success : function(data) {
								var a = '<h1>내가 찜한 컨텐츠</h1>';
								var f = '<thead><tr><th>장르</th><th>제목</th><th style="text-align:center";>좋아요 수</th></tr></thead><tr>';
								$
										.each(
												data,
												function(key, value) {
													f += '<td>'
															+ value.genre
															+ '</td><td>'
															+ value.title
															+ '</td><td style="text-align:left;">'
															+ value.likes
															+ '</tr>';
												});
								$("#logTitle").html(a);
								$("#boardList").html(f);

							}
						});
			}
		</script>
		<script>
			var id = '${user.id}'; // 내 아이디

			function myUploadShowList() {

				$
						.ajax({
							url : 'myUploadShow',
							type : 'get',
							data : {
								'id' : '${user.id}'
							},
							success : function(data) {
								var a = '<h1>내가 업로드한 컨텐츠</h1>';
								var f = '<thead><tr><th>장르</th><th>제목</th><th style="text-align:center";>좋아요 수</th></tr></thead><tr>';
								$
										.each(
												data,
												function(key, value) {
													f += '<td>'
															+ value.genre
															+ '</td><td>'
															+ value.title
															+ '</td><td style="text-align:left;">'
															+ value.likes
															+ '</tr>';
												});
								$("#logTitle").html(a);
								$("#boardList").html(f);

							}
						});
			}
		</script>
		<script>
			var id = '${user.id}'; // 내 아이디

			function myOneLineShowList() {

				$
						.ajax({
							url : 'myOneLineShow',
							type : 'get',
							data : {
								'id' : '${user.id}'
							},
							success : function(data) {
								var a = '<h1>나의 한줄 평</h1>';
								var f = '<thead><tr><th>제목</th><th>내용</th><th style="text-align:center";>날짜</th></tr></thead><tr>';
								$
										.each(
												data,
												function(key, value) {
													f += '<td>'
															+ value.title
															+ '</td><td>'
															+ value.content
															+ '</td><td style="text-align:left;">'
															+ value.writetime
															+ '</tr>';
												});
								$("#logTitle").html(a);
								$("#boardList").html(f);

							}
						});
			}
		</script>
</body>
</html>