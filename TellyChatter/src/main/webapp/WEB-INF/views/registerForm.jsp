<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<ul class="links">
					<li><a href="#">
							<h3>Lorem ipsum</h3>
							<p>Feugiat tempus veroeros dolor</p>
					</a></li>
					<li><a href="#">
							<h3>Dolor sit amet</h3>
							<p>Sed vitae justo condimentum</p>
					</a></li>
					<li><a href="#">
							<h3>Feugiat veroeros</h3>
							<p>Phasellus sed ultricies mi congue</p>
					</a></li>
					<li><a href="#">
							<h3>Etiam sed consequat</h3>
							<p>Porta lectus amet ultricies</p>
					</a></li>
				</ul>
			</section>

			<!-- Actions -->
			<section>
				<ul class="actions stacked">
					<li><a href="#" class="button large fit">Log In</a></li>
				</ul>
			</section>

		</section>

		<!-- Main -->
		<div class="form">

			<ul class="tab-group">
				<li class="tab active"><a href="#signup">Sign Up</a></li>
				<li class="tab"><a href="#login">Log In</a></li>
			</ul>

			<div class="tab-content">
				<div id="signup">
					<h1>Sign Up for Free</h1>

					<form action="/" method="post">

						<div class="top-row">
							<div class="field-wrap">
								<label> First Name<span class="req">*</span>
								</label> <input type="text" required autocomplete="off" />
							</div>

							<div class="field-wrap">
								<label> Last Name<span class="req">*</span>
								</label> <input type="text" required autocomplete="off" />
							</div>
						</div>

						<div class="field-wrap">
							<label> Email Address<span class="req">*</span>
							</label> <input type="email" required autocomplete="off" />
						</div>

						<div class="field-wrap">
							<label> Set A Password<span class="req">*</span>
							</label> <input type="password" required autocomplete="off" />
						</div>

						<button type="submit" class="button button-block" >
						Get Started
						</button>

					</form>

				</div>

				<div id="login">
					<h1>Welcome Back!</h1>

					<form action="/" method="post">

						<div class="field-wrap">
							<label> Email Address<span class="req">*</span>
							</label> <input type="email" required autocomplete="off" />
						</div>

						<div class="field-wrap">
							<label> Password<span class="req">*</span>
							</label> <input type="password" required autocomplete="off" />
						</div>

						<p class="forgot">
							<a href="#">Forgot Password?</a>
						</p>

						<button class="button button-block">
						Log In
						</button>

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

</body>
</html>