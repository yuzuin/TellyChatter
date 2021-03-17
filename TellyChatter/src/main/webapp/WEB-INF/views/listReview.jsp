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
<title>Telly Chatter</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/reviewList.css?ver=4" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/main.css?ver=4" />
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
						<form id="search" method="get" action="searchReview">
							<input type="text" name="word" placeholder="Search" />
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

			<!-- 탑리뷰 리스트 -->
			<h2>TOP REVIES</h2>
			<!-- One -->
			<div class="inner">
				<div class="grid-style">
					<c:forEach var="temp" items="${topReviews }" end="1">
						<div>
							<div class="box">
								<div class="image fit">
									<img src="images/pic02.jpg" alt="" />
								</div>
								<div class="content">
									<header class="align-center">
										<p>${temp.writer }</p>
										<h2 class="align-center">${temp.title }</h2>
									</header>
									<time class="published">${temp.subtitle }</time>
									<footer class="align-center">
										<a href="viewReview?viewNum=${temp.num }" class="button alt">Learn
											More</a>
									</footer>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>
			</div>
		</div>

		<!-- 최신글메인 -->
		<div id="main">

			<!-- 리뷰 리스트 -->
			<h2>LATEST REVIEWS</h2>
			<section>
				<div class="mini-posts">

					<!-- Mini Post -->
					<c:forEach var="temp" items="${postList }">
						<article class="mini-post">
							<header>
								<h3>
									<a href="viewReview?viewNum=${temp.num}">${temp. title}</a>
								</h3>
								<time class="published" datetime="2015-10-20">${temp.writetime }</time>
								<text class="published">${temp.writer }</text>
								<a href="searchReview?word=${temp.writer}" class="author"> <img
									src="${pageContext.request.contextPath}/download?filename=${temp.writerImg }"
									alt="" style="width:50px; height:50px"/></a>
							</header>
						</article>
					</c:forEach>
				</div>
			</section>
			<section>
				<!--  page number 표시 -->
				<table>
				<tr>
					<td colspan=5 align=center>
						<hr>
						<ul class="pageUL">
							<c:if test="${pageMaker.prev > 0 }">
								<a href='listReview?page=${pageMaker.prev}'> [ 이전 ] </a>
							</c:if>
							<c:forEach begin="${pageMaker.start }" end="${pageMaker.end}" var="idx">
								<!-- 			<li class='<c:out value="${idx == pageMaker.page?'current':''}"/>'>   -->
								<a href='listReview?page=${idx}'> 
								<c:choose>
										<c:when test="${pageMaker.page eq idx}">
											<b>[<font color=red size=3> ${idx} </font> ]</b>
										</c:when>
										<c:otherwise>[ ${idx} ] </c:otherwise>
									</c:choose>
								</a>
							</c:forEach>

							<c:if test="${pageMaker.next > 0 }">
								<a href='listReview?page=${pageMaker.next}'> [ 다음 ] </a>
							</c:if>

						</ul>
					</td>
				</tr>
				</table>
			</section>
			<section>
				<h3>임시</h3>
				<c:forEach items="${list}" var="tmp">
					<article class="mini-post">
						<header>
							<h3>
								<a href="single.html">${tmp. title}</a>
							</h3>
							<time class="published" datetime="2015-10-20">${tmp.writetime }</time>
							<text class="published">${tmp.writer }</text>
							<a href="#" class="author"> <img
								src="${pageContext.request.contextPath}/resources/assets/images/avatar.jpg"
								alt="" /></a>
						</header>
					</article>
					<div id="newList"></div>
					<h1 id="logTitle"></h1>
				</c:forEach>
				<a href='javascript:sshowMoreList()' class="button"
					style="font-size: 14px">더보기</a>
			</section>
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


	<script>
		var cntf = '10'; // 시작값

		function showMoreList() {

			$.ajax({
				url : "moreReview",
				type : 'get',
				data : {
					'cnt' : 10
				},
				success : function(dataa) {
					//var a = '<h1>더보기</h1>';
					$.each(dataa, function(key, value) {
					});
					$("#logTitle").text(f);

				}
			});
		}

		$(document).ready(function() {
			//mylikeReviewList(); //페이지 로딩시 내찜리뷰 출력
		});
	</script>
</body>
</html>