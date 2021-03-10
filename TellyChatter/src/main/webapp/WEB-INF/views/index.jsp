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
				<a href="index.html">Telly Chatter</a>
			</h1>
			<nav class="links">
				<ul>
					<li><a href="#">추천 받기</a></li>
					<li><a href="#">REVIEW</a></li>
					<li><a href="#">COMMUNITY</a></li>
					<li><a href="#">POINT SHOP</a></li>
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
										src="${pageContext.request.contextPath}/download?filename=${userImg }" />
									</div>
									<div style="text-align:center; margin:5px;">
										<h3>${user.nickname } 님</h3>
										<p>${user.point } P</p>
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
							<li><a href="registerForm" class="button large fit">Log In</a></li>
						</ul>
					</c:otherwise>
				</c:choose>
			</section>

		</section>

		<!-- Main -->
		<div id="main">

			<!-- Post -->
			<article class="post">
				<header>
				<h1>TOP3 REVIEWS</h1>
					<div class="title">
						<h2>
							<a href="single.html">제목~</a>
						</h2>
						<p>부제목~</p>
					</div>
					<div class="meta">
						<time class="published" datetime="2015-11-01">November 1,
							2015</time>
						<a href="#" class="author"><span class="name">글쓴이~</span><img
							src="${pageContext.request.contextPath}/resources/assets/images/avatar.jpg"
							alt="" /></a>
					</div>
				</header>
				<a href="single.html" class="image featured"><img
					src="${pageContext.request.contextPath}/resources/assets/images/pic01.jpg"
					alt="" /></a>
				<p>내용 ~~~</p>
				<footer>
					<ul class="actions">
						<li><a href="single.html" class="button large">Continue
								Reading</a></li>
					</ul>
					<ul class="stats">
						<li><a href="#">General</a></li>
						<li><a href="#" class="icon solid fa-heart">28</a></li>
						<li><a href="#" class="icon solid fa-comment">128</a></li>
					</ul>
				</footer>
			</article>




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
				<a href="#" class="logo"> <!--<c:set var="nowUser" value="${nowUser }"/>-->
					<img src="${pageContext.request.contextPath}/resources/assets/images/logo.jpg" />
				</a>
				<header>
					<h2>
						Telly <br />Chatter
					</h2>
					<p>
						영화나 드라마 시리즈에 관해 이야기를 나우어 보아요~</a>
					</p>
					<!-- jstl if문으로 nowUser 체크 -->
					<c:if test="${user != null }">
						<p>${user.nickname }님안녕하세요~</p>
					</c:if>
				</header>
			</section>

			<!-- 영화순위 -->
			<section>
				<div class="mini-posts">

					<!-- Mini Post -->
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


				</div>
			</section>

			<!-- Posts List -->
			<section>
				<ul class="posts">
					<li>
						<article>
							<header>
								<h3>
									<a href="single.html">Lorem ipsum fermentum ut nisl vitae</a>
								</h3>
								<time class="published" datetime="2015-10-20">October 20,
									2015</time>
							</header>
							<a href="single.html" class="image"><img
								src="${pageContext.request.contextPath}/resources/assets/images/pic08.jpg"
								alt="" /></a>
						</article>
					</li>
					<li>
						<article>
							<header>
								<h3>
									<a href="single.html">Convallis maximus nisl mattis nunc id
										lorem</a>
								</h3>
								<time class="published" datetime="2015-10-15">October 15,
									2015</time>
							</header>
							<a href="single.html" class="image"><img
								src="${pageContext.request.contextPath}/resources/assets/images/pic09.jpg"
								alt="" /></a>
						</article>
					</li>
					<li>
						<article>
							<header>
								<h3>
									<a href="single.html">Euismod amet placerat vivamus
										porttitor</a>
								</h3>
								<time class="published" datetime="2015-10-10">October 10,
									2015</time>
							</header>
							<a href="single.html" class="image"><img
								src="${pageContext.request.contextPath}/resources/assets/images/pic10.jpg"
								alt="" /></a>
						</article>
					</li>
					<li>
						<article>
							<header>
								<h3>
									<a href="single.html">Magna enim accumsan tortor cursus
										ultricies</a>
								</h3>
								<time class="published" datetime="2015-10-08">October 8,
									2015</time>
							</header>
							<a href="single.html" class="image"><img
								src="${pageContext.request.contextPath}/resources/assets/images/pic11.jpg"
								alt="" /></a>
						</article>
					</li>
					<li>
						<article>
							<header>
								<h3>
									<a href="single.html">Congue ullam corper lorem ipsum dolor</a>
								</h3>
								<time class="published" datetime="2015-10-06">October 7,
									2015</time>
							</header>
							<a href="single.html" class="image"><img
								src="${pageContext.request.contextPath}/resources/assets/images/pic12.jpg"
								alt="" /></a>
						</article>
					</li>
				</ul>
			</section>

			<!-- About -->
			<section class="blurb">
				<h2>About</h2>
				<p>Mauris neque quam, fermentum ut nisl vitae, convallis maximus
					nisl. Sed mattis nunc id lorem euismod amet placerat. Vivamus
					porttitor magna enim, ac accumsan tortor cursus at phasellus sed
					ultricies.</p>
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