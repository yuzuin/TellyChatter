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


		<!-- 영화 -->
		<div id="main" style="">
			<a href="single.html" class="image"
				style="height: 450px !important; left: 35%; margin: 0 0 60px;"><img
				src="${pageContext.request.contextPath}/download?filename=${show.poster }"
				height="500px" /></a>
			<article class="mini-post"
				style="width: 30%; position: relative !important; left: 34%;">
				<div>
					<h2 style="text-align: center;">
						<a href="single.html"> ${show.title }</a>
					</h2>

					<a href="#" class="author" style="font-size: large !important;">
						<time class="published" datetime="2015-10-20">${show.year }</time>
					</a>
				</div>

			</article>
		</div>
		<div id="main">
			<article class="post" style="text-align: center;">
				<h2>제작 연도 : ${show.year }</h2>
				<h2>출연진 : ${show.performer }</h2>
				<h2>장르 : ${show.genre }</h2>
				<h2>지원 플랫폼 : ${show.platform }</h2>
				<br />
				<p>
				<h3>${show.story }</h3>
				</p>
				<div style="text-align: right;">
					최초 작성자 : ${show.firstPer }<br /> 최근 수정자 : ${show.updatePer }
				</div>
			</article>
		</div>
		<button onclick="location.href='updateShowForm?snum=${show.showNum }'"
			class="button button-block">UPDATE!</button>

		<!-- 코멘트 영역  -->
		<article class="post">
			<div class="container">
				<label for="content">감상 코멘트</label>
				<form name="commentInsertForm">
					<div class="input-group">
						<input type="hidden" name="writer" value="${user.id}" /> <input
							type="hidden" name="showNum" value="${show.showNum}" /> <input
							type="text" class="form-control" id="content" name="content"
							placeholder="내용을 입력하세요."> <span class="input-group-btn">
							<button class="btn btn-default" type="button"
								name="commentInsertBtn">등록</button>
						</span>
					</div>
				</form>
			</div>

			<div class="container">
				<div class="commentList"></div>
			</div>
	</div>
	</article>

	<!--                     추가                         -->
	<%@ include file="commentS.jsp"%>

	<!-- Footer -->
	<section id="footer" style="clear: flex !important;">
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
		var bno = '${show.showNum}'; //게시글 번호

		$('[name=commentInsertBtn]').click(function() { //댓글 등록 버튼 클릭시 
			var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
			commentInsert(insertData); //Insert 함수호출(아래)
		});

		//댓글 목록 
		function commentList() {
			$
					.ajax({
						url : "selectShowComment",
						type : 'get',
						data : {
							'bno' : ${show.showNum}
						},
						success : function(data) {
							var a = '';
							$
									.each(
											data,
											function(key, value) {
												a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
												a += '<div class="commentInfo'+value.num+'">'
														+ '작성일시 : '
														+ value.writetime
														+ ' / 작성자 : '
														+ value.writer;
													
												
												if('${user.id}'==value.writer){
												a += 
													'<a onclick="commentUpdate('
														+ value.num
														+ ',\''
														+ value.content
														+ '\');"> 수정' +'</a>'; }
												
												if('${user.id}'==value.writer || '${user.id}'=='admin'){
												a += '<a onclick="commentDelete('
														+ value.num
														+ ');"> 삭제 </a>';}
												a+=' </div>';
												a += '<div class="commentContent'+value.num+'"> <p> 내용 : '
														+ value.content
														+ '</p>';
												a += '</div></div>';
											});

							$(".commentList").html(a);
						}
					});
		}

		//댓글 등록
		function commentInsert(insertData) {
			$.ajax({
				url : "insertShowComment",
				type : 'post',
				data : insertData,
				success : function(data) {
					if (data == 1) {
						commentList(); //댓글 작성 후 댓글 목록 reload
						$('[name=content]').val('');
					}else{
						commentList(); //댓글 작성 후 댓글 목록 reload
						$('[name=content]').val('');
					}
				}
			});
		}

		//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
		function commentUpdate(num, content) {
			var a = '';

			a += '<div class="input-group">';
			a += '<input type="text" class="form-control" name="content_'+num+'" value="'+content+'"/>';
			a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('
					+ num + ');">수정</button> </span>';
			a += '</div>';

			$('.commentContent' + num).html(a);

		}

		//댓글 수정
		function commentUpdateProc(num) {
			var updateContent = $('[name=content_' + num + ']').val();

			$.ajax({
				url : "updateShowComment",
				type : 'post',
				data : {
					'content' : updateContent,
					'num' : num
				},
				success : function(data) {
						commentList(bno); //댓글 수정후 목록 출력 
					//if (data == 1)
				}
			});
		}

		//댓글 삭제 
		function commentDelete(num) {
			$.ajax({
				url : "deleteShowComment/" + num,
				type : 'post',
				success : function(data) {
					if (data == 1)
						commentList(bno); //댓글 삭제후 목록 출력 
				}
			});
		}

		$(document).ready(function() {
			commentList(); //페이지 로딩시 댓글 목록 출력 
		});
	
	
	</script>

</body>
</html>