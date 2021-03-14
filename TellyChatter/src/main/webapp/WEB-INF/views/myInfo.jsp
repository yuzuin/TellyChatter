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
<title>Sign Up</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/register.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>
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
		<div class="form">

				
				<div id="signup">
					<h1>${user.nickname }님의 정보입니다.</h1>
					<img style="
						display:block;
						margin-left:auto;
						margin-right:auto;
						margin-bottom:25px;
						width:200px;
						height:auto;
						border-radius: 12px;
						-moz-border-radius: 12px;
						-khtml-border-radius: 12px;
						-webkit-border-radius: 12px;" 
						src="${pageContext.request.contextPath}/download?filename=${user.profileImg }" />
				</div>
					<form action="updateMyInfo" method="post" enctype="multipart/form-data">
						<input type="hidden" name="profileImg" value="${user.profileImg}" />
						<div class="top-row">
							<div class="field-wrap">
								<h3> ID<span class="req">*</span></h3>
								</label> <input type="text" name="id" required autocomplete="off" value="${user.id }" readonly/>
							</div>

							<div class="field-wrap">
								<h3> 비밀번호<span class="req">*</span></h3>
								</label> <input type="password" name="password" required autocomplete="off" value="${user.password }" readonly />
							</div>
						</div>
		
						<div class="field-wrap">
							<h3> E-mail<span class="req">*</span></h3>
							</label> <input type="email" name="email"  value="${user.email }" required autocomplete="off" />
						</div>
						<div class="top-row">
						<div class="field-wrap">
						<h3> 생년월일<span class="req">*</span></h3>
							<input type="text" name="birth"  value="${user.birth }" required autocomplete="off" />
						</div>
						<div class="field-wrap">
						<h3> 닉네임<span class="req">*</span></h3>
								</label> <input type="text"  value="${user.nickname }" name="nickname" required autocomplete="off" />
							</div>
						</div>

						<div class="field-wrap">
						<h3> 성별<span class="req">*</span></h3>
							<select name="gender">
						<c:choose>
							<c:when test="${user.gender }=='M'">
								<option value="M" selected="selected">남자</option>
								<option value="F" >여자</option>
							</c:when>
							<c:otherwise>
								<option value="M">남자</option>
								<option value="F" selected="selected">여자</option>
							</c:otherwise>
						</c:choose>
							</select>
						</div>
						
						<div class="field-wrap">
							<span>프로필 사진</span>
						<input type="file" id="file" name="file" value="프로필 사진 선택" >
						</div>
			
						<button type="submit" class="button button-block">내 정보 수정하기</button>

					</form>

				</div>

			</div>
			<!-- tab-content -->

		</div>
		<!-- /form -->
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
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/register.js"></script>
	<script>
		$(document).ready(function() {
			setDateBox();
		});

		// select box 연도 , 월 표시
		function setDateBox() {
			var dt = new Date();
			var year = "";
			var com_year = dt.getFullYear();

			// 발행 뿌려주기
			$("#year").append("<option value=''>년도</option>");

			// 올해 기준으로 -50년부터 +1년을 보여준다.
			for (var y = (com_year - 50); y <= (com_year + 1); y++) {
				$("#year").append(
						"<option value='" + y + "'>" + y + " 년" + "</option>");
			}

			// 월 뿌려주기(1월부터 12월)
			var month;
			$("#month").append("<option value=''>월</option>");
			for (var i = 1; i <= 12; i++) {
				$("#month").append(
						"<option value='" + i + "'>" + i + " 월" + "</option>");
			}

			// 일 뿌려주기(1일부터 31일)
			var day;
			$("#day").append("<option value=''>일</option>");
			for (var i = 1; i <= 31; i++) {
				$("#day").append(
						"<option value='" + i + "'>" + i + " 일" + "</option>");
			}

		}
	</script>

</body>
</html>