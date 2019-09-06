<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html ng-app="app">
	<head>

<title>Welcome to Afc Force </title>

<!-- For-Mobile-Apps -->
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="Sportive a Responsive Web Template, Bootstrap Web Templates, Flat Web Templates, Android Compatible Web Template, Smartphone Compatible Web Template, Free Webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //For-Mobile-Apps -->

<!-- Custom-Stylesheet-Links -->
	<!-- Bootstrap-Core-CSS --> <link rel="stylesheet" href="${contextPath}/resources/viewcss/bootstrap.min.css" type="text/css" media="all" />
	<!-- Index-Page-CSS --> <link rel="stylesheet" href="${contextPath}/resources/viewcss/style.css" type="text/css" media="all" />
	<!-- Owl-Carousel-Styling --> <link rel="stylesheet" href="${contextPath}/resources/viewcss/owl.carousel.css" type="text/css" media="all" />
<!-- //Custom-Stylesheet-Links -->

<!-- Web-Fonts -->
	<link href='//fonts.googleapis.com/css?family=Carter+One' rel='stylesheet' type='text/css'>
	<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>
	<link href='//fonts.googleapis.com/css?family=Cabin:400,500,600,700' rel='stylesheet' type='text/css'>
	
	 <script src="${contextPath}/resources/js/jquery-1.11.1.min.js"></script>
	 <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<!-- //Web-Fonts -->
		<link data-require="bootstrap@*" data-semver="3.3.5" rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
		<script data-require="bootstrap@*" data-semver="3.3.5" src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		<script data-require="angular.js@1.4.3" data-semver="1.4.3" src="https://code.angularjs.org/1.4.3/angular.js"></script>
		<script data-require="angular-route@*" data-semver="1.4.3" src="https://code.angularjs.org/1.4.3/angular-route.js"></script>
		<link rel="stylesheet" href="${contextPath}/resources/viewcss/style.css" />
		<!-- Custom-JavaScript-File-Links -->

	<%-- <!-- Supportive-JavaScript --> <script type="text/javascript" src="${contextPath}/resources/viewjs/jquery.min.js"></script>
	<!-- Necessary-JS-File-For-Bootstrap --> <script type="text/javascript" src="${contextPath}/resources/viewjs/bootstrap.min.js"></script>
		 --%>
		<style type="text/css">
.m-0 {
	margin: 0px;
}
		</style>
		<base href="/">
</head>
<body id="body" >

	<!-- Header -->


<div class="header" style="color: #5bc0de">

						<!-- <h3 class="m-0">
            Sales Order Processing Dashboard
          </h3> -->
					
				
		<!-- Navbar -->
		<nav class="navbar navbar-default">
			<div class="container-fluid">

				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					
					
					<%-- <a class="navbar-brand" href="${contextPath}/home">SportsPlus</a> --%>
					
					<c:if test="${pageContext.request.userPrincipal.name != null}">
							<form id="logoutForm" method="POST"
								action="${contextPath}/logout">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
							</form>
							<!-- Welcome ${pageContext.request.userPrincipal.name} | -->
							
								<a class="navbar-brand" onclick="document.forms['logoutForm'].submit()">Logout</a>
							

						</c:if>
				</div>

				<div class="navbar-collapse navbar-right collapse hover-effect">
					<span class="menu"> </span>
					<ul class="nav nav-tabs">
						<li data-toggle="tab"><a href="${contextPath}/home">Home</a></li>
						<li><a href="${contextPath}/academy" data-target="#" data-toggle="tab">Academy</a></li>
						<li><a href="${contextPath}/group" data-target="#" data-toggle="tab">Group</a></li>
						<li><a href="${contextPath}/coach" data-target="#" data-toggle="tab">Coach</a></li>
						<li><a href="${contextPath}/athlete" data-target="#" data-toggle="tab">Athlete</a></li>
						<li><a href="${contextPath}/schedule" data-target="#" data-toggle="tab">Schedule</a></li>
					</ul>
				</div>

			</div>
		</nav>
		<!-- //Navbar -->
	</div>

	<div id="centered" ng-view></div>


	<script src="${contextPath}/resources/js/script.js"></script>




	<!-- Skills-Number-Scroller-Effect-JavaScript -->
		<script type="text/javascript" src="${contextPath}/resources/viewjs/numscroller-1.0.js"></script>
	<!-- //Skills-Number-Scroller-Effect-JavaScript -->

	<!-- <a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 0;"> </span></a> -->
	<!-- //Slide-To-Top JavaScript -->

	<!-- Smooth-Scrolling-JavaScript -->
	<%-- <script type="text/javascript" src="${contextPath}/resources/viewjs/move-top.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/viewjs/easing.js"></script>
	<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll, .navbar li a, .footer li a").click(function(event){
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
				});
			});
	</script> --%>
	<!-- //Smooth-Scrolling-JavaScript -->

<!-- //Custom-JavaScript-File-Links -->

</body>
</html>


