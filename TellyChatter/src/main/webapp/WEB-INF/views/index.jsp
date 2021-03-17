<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Telly Chatter</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
</head>
<body class="is-preload">

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
						<form id="search" method="get" action="searchAll">
							<input type="text" name="word" placeholder="Search" />
						</form></li>
					<li class="menu"><a class="fa-bars" href="#menu">Menu</a></li>
				</ul>
			</nav>
		</header>

		<!-- Menu -->
		<section id="menu">

			<!-- Search 
			<section>
				<form class="search" method="get" action="#">
					<input type="text" name="query" placeholder="Search" />
				</form>
			</section> -->

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

		<!-- Main -->
		<div id="main">

			<!-- 탑리뷰 3개 -->
				<h1>TOP3 REVIEWS</h1>
			<c:forEach items="${topReviews }" var="temp" varStatus="status"> 
			<article class="post">
				<header>
					<div class="title">
						<h2>
							<a href="viewReview?viewNum=${temp.num }">${temp.title }</a>
						</h2>
						<p>${temp.subtitle }</p>
					</div>
					<div class="meta">
						<time class="published" datetime="2015-11-01">${temp.writetime }</time>
						<a href="#" class="author"><span class="name">${topWriter[status.index].nickname}</span><img
							src="${pageContext.request.contextPath}/download?filename=${topWriter[status.index].profileImg}"/></a>
					</div>
				</header>
				<p>${temp.description }</p>
				<footer>
					<ul class="actions">
						<li><a href="viewReview?viewNum=${temp.num }" class="button large">Continue
								Reading</a></li>
					</ul>
					<ul class="stats">
						<li><a href="#">General</a></li>
						<li><a href="#" class="icon solid fa-heart">${temp.likes}</a></li>
						<li><a href="#" class="icon solid fa-comment">${cSize[status.index] }</a></li>
					</ul>
				</footer>
			</article>
				</c:forEach>




			<!-- Pagination -->
			<ul class="actions pagination">
				<li><a href="" class="disabled button large previous">Previous
						Page</a></li>
				<li><a href="#" class="button large next">Next Page</a></li>
			</ul>

		</div>

		<!-- Sidebar -->
		<section id="sidebar">

			<!-- Intro -->
			<section id="intro">
			<!-- class="logo" -->
				<a href="#" style="flow:left;"> <!--<c:set var="nowUser" value="${nowUser }"/>-->
					<img src="${pageContext.request.contextPath}/resources/assets/images/logo.png" >
				</a>
				<header>
					<h2>
						Telly <br />Chatter
					</h2>
					<p>
						영화나 드라마 시리즈에 관해 이야기를 나우어 보아요~</a>
					</p>
					
				</header>
			</section>

			<!-- 영화순위 -->
			 <section>
			 <!-- jstl if문으로 nowUser 체크 -->
					<c:if test="${user != null }">
						<p style="text-align:center;">${user.nickname }님안녕하세요~</p>
					</c:if>
				<!--<div class="mini-posts">

					 Mini Post 
					<article class="mini-post">
						<header>
							<h3>
								<a href="single.html">복수는 나의 것</a>
							</h3>
							<time class="published" datetime="2015-10-20">October 20,
								2015</time>
							<a href="#" class="author"><img
								src="${pageContext.request.contextPath}/resources/assets/images/avatar.jpg"
								alt="" /></a>
						</header>
						<a href="single.html" class="image"><img
							src="${pageContext.request.contextPath}/resources/assets/images/pic04.jpg"
							alt="" /></a>
					</article> 
				</div>-->
			</section>

			<!-- cgv에서 크롤링한 영화 랭킹 -->
			<section>
			<h2>실시간 예매순위 TOP5</h2>
				<ul class="posts">
				<c:forEach var="temp" items="${movieRanking }" >
					<li>
						<article>
							<header>
								<h3>
									<a href="single.html">${temp.title }</a>
								</h3>
								<time class="published" datetime="2015-10-20">${temp.info }</time>
								<a href="http://www.cgv.co.kr/${temp.detail }">상세보기</a>
							</header>
							<a href="single.html" class="image"><img
								src="${temp.img }"
								alt="" /></a>
						</article>
					</li>
				</c:forEach>
				</ul>
			</section>

			<!-- About -->
			<section class="blurb">
				<h2>About</h2>
				<p>TELLYCAHTTER는<br/>
				각종 ott 서비스의 사용자들이 모여 리뷰를 공유하고 상호 추천해주는 사이트입니다.<br/>
				당신도 가장 재미있었던 티비 시리즈를 추천해 보세요 </p>
				<ul class="actions">
					<li><a href="#" class="button">Learn More</a></li>
				</ul>
			</section>

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

		</section>

	</div>

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