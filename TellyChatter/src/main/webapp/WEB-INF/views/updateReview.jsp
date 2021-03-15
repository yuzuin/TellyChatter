<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
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

			<!-- Post -->
			<h2>REVIEW 쓰기</h2>
			<form action = "UpdateReviewSubmit" method="post" class="post">
				<header>
					<div class="title">
					<input type="hidden" name="num" value="${review.num }"
							 />
						<input type="text" name="title" id="demo-name" value="${review.title }"
							 /> <br /> <input type="text"
							name="subtitle" id="demo-name" value="${review.subtitle }" />
					</div>
					<div class="meta">
						<h3>분류를 선택하세요</h3>
						<div class="col-6 col-12-small">
							<input type="checkbox" value="1" id="netflix" name="netflix">
							<label for="netflix" style="font-size: small;">넷플릭스</label>
							<input type="checkbox" value="1" id="watcha" name="watcha">
							<label for="watcha"  style="font-size: small;">왓챠</label>
							<input type="checkbox" value="1" id="wavve" name="wavve">
							<label for="watcha" style="font-size: small;">웨이브</label>
							<input type="checkbox" value="1" id="laftel" name="laftel">
							<label for="laftel" style="font-size: small;">라프텔</label>
							<input type="checkbox" value="1" id="kakao" name="kakao">
							<label for="kakao" style="font-size: small;">카카오TV</label>
							<input type="checkbox" value="1" id="coupang" name="coupang">
							<label for="coupang" style="font-size: small;">쿠팡플레이</label>
							<input type="checkbox" value="1" id="naver" name="naver">
							<label for="naver" style="font-size: small;">네이버 시리즈온</label>
						</div>
					</div>
				</header>



				<!-- 글쓰기 공간 -->
				<textarea class="form-control" name="description" id="description">${review.description }</textarea>
				<script>
					//id가 description인 태그에 ckeditor를 적용시킴
					//이미지 업로드 안됨
					CKEDITOR.replace("description", {
						filebrowserUploadUrl : "imageUpload.do",
						height:'400px'
					}); //이미지 업로드 기능을 추가하기위한 코드
				</script>
				
				<input type="submit" value="MODIFY REVIEW" class="button fit">
			</form>

		</div>

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