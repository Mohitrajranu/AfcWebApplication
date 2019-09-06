<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
  <!-- For-Mobile-Apps -->
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="keywords" content="Sportive a Responsive Web Template, Bootstrap Web Templates, Flat Web Templates, Android Compatible Web Template, Smartphone Compatible Web Template, Free Webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />
  <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
  <!-- //For-Mobile-Apps -->

  <!-- Custom-Stylesheet-Links -->
  <!-- Bootstrap-Core-CSS --> <link rel="stylesheet" href="${contextPath}/resources/viewcss/bootstrap.min.css" type="text/css" media="all" />
  <!-- Index-Page-CSS --> <link rel="stylesheet" href="${contextPath}/resources/viewcss/style.css" type="text/css" media="all" />
  <!-- //Custom-Stylesheet-Links -->

  <!-- Web-Fonts -->
  <link href='//fonts.googleapis.com/css?family=Carter+One' rel='stylesheet' type='text/css'>
  <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>
  <link href='//fonts.googleapis.com/css?family=Cabin:400,500,600,700' rel='stylesheet' type='text/css'>
  	<style type="text/css">
.m-0 {
	margin: 0px;
}
</style>
  <!-- //Web-Fonts -->
  <base href="/">
</head>
<body>
<div class="row">

				
<div class="banner">

  <div class="slider">
    <ul class="rslides" id="slider">
      <li>
        <img src="${contextPath}/resources/viewimages/slide-1.jpg" alt="Sportive">
      </li>
      <li>
        <img src="${contextPath}/resources/viewimages/slide-2.jpg" alt="Sportive">
      </li>
      <li>
        <img src="${contextPath}/resources/viewimages/slide-3.jpg" alt="Sportive">
      </li>
      <li>
        <img src="${contextPath}/resources/viewimages/slide-4.jpg" alt="Sportive">
      </li>
      <li>
        <img src="${contextPath}/resources/viewimages/slide-5.jpg" alt="Sportive">
      </li>
      <li>
        <img src="${contextPath}/resources/viewimages/slide-6.jpg" alt="Sportive">
      </li>
      <li>
        <img src="${contextPath}/resources/viewimages/slide-7.jpg" alt="Sportive">
      </li>
    </ul>
  </div>
</div>


<!-- //Slider -->

<!-- //Header -->

<!-- Numbers -->
<div id="numbers" class="numbers">
  <div class="container">

    <div class="number-grids">

      <div class="col-md-4 col-sm-4 number-grid">
        <nav class="numbers-effect">
          <a href="">1</a>
        </nav>
        <div class="numbers-info">
          <h3>Be Active</h3>
        </div>
        <div class="clearfix"></div>
      </div>

      <div class="col-md-4 col-sm-4 number-grid">
        <nav class="numbers-effect">
          <a href="">2</a>
        </nav>
        <div class="numbers-info">
          <h3>Be Playful</h3>
        </div>
        <div class="clearfix"></div>
      </div>

      <div class="col-md-4 col-sm-4 number-grid">
        <nav class="numbers-effect">
          <a href="">3</a>
        </nav>
        <div class="numbers-info">
          <h3>Be A Team Player</h3>
        </div>
        <div class="clearfix"></div>
      </div>

      <div class="clearfix"></div>
    </div>

  </div>
</div>
<!-- //Numbers -->


<!-- //Features -->

<!-- Stats -->
<div class="stats" id="stats">
  <div class="container">

    <h3>STATS</h3>

    <div class="stats-info">
      <div class="col-md-3 col-sm-3 stats-grid">
        <div class="stats-img">
          <img src="${contextPath}/resources/viewimages/stats-1.png" alt="Sportive">
        </div>
        <div class='numscroller numscroller-big-bottom' data-slno='1' data-min='0' data-max='85' data-delay='8' data-increment="1">85</div>
        <p>Style</p>
      </div>
      <div class="col-md-3 col-sm-3 stats-grid">
        <div class="stats-img">
          <img src="${contextPath}/resources/viewimages/stats-2.png" alt="Sportive">
        </div>
        <div class='numscroller numscroller-big-bottom' data-slno='1' data-min='0' data-max='95' data-delay='8' data-increment="1">95</div>
        <p>Fit</p>
      </div>
      <div class="col-md-3 col-sm-3 stats-grid">
        <div class="stats-img">
          <img src="${contextPath}/resources/viewimages/stats-3.png" alt="Sportive">
        </div>
        <div class='numscroller numscroller-big-bottom' data-slno='1' data-min='0' data-max='80' data-delay='8' data-increment="1">80</div>
        <p>Longevity</p>
      </div>
      <div class="col-md-3 col-sm-3 stats-grid">
        <div class="stats-img">
          <img src="${contextPath}/resources/viewimages/stats-4.png" alt="Sportive">
        </div>
        <div class='numscroller numscroller-big-bottom' data-slno='1' data-min='0' data-max='90' data-delay='8' data-increment="1">90</div>
        <p>Durability</p>
      </div>
      <div class="clearfix"></div>
    </div>
  </div>

</div>
<!-- //Stats -->
<div class="footer">
  <div class="container">

    <div class="footer-top">
      <div class="footer-grids">
        <div class="col-md-3 col-sm-3 address">
          		<h5>Address</h5>
					<ul>
						<li>Sector-6</li>
						<li>400708</li>
						<li>Xaviers Turf Ground, Airoli</li>
						<li>Maharashtra , INDIA</li>
						<li>www.stcet.org</li>
					</ul>
				</div>
				<div class="col-md-3 col-sm-3 contact">
					<h5>Contact</h5>
					<div class="phone">
						<p>033 456 7890</p>
						<p>033 789 3450</p>
					</div>

          <div class="mail">
            <form>
              <input type="text" placeholder="Email address" required="">
              <input type="submit" value="Subscribe">
            </form>
          </div>
          <div class="clearfix"></div>
        </div>
        <div class="col-md-6 col-sm-6 connect">
          <h5>Connect</h5>
          <div class="connect-social">
            <ul>
              <li><a href="#" class="facebook" title="Go to Our Facebook Page"></a></li>
              <li><a href="#" class="twitter" title="Go to Our Twitter Account"></a></li>
              <li><a href="#" class="googleplus" title="Go to Our Google Plus Account"></a></li>
              <li><a href="#" class="linkedin" title="Go to Our Linkedin Page"></a></li>
              <li><a href="#" class="blogger" title="Go to Our Blogger Account"></a></li>
              <li><a href="#" class="tumblr" title="Go to Our Tumblr Page"></a></li>
              <li><a href="#" class="rss" title="Go to Our RSS Feed"></a></li>
              <li><a href="#" class="youtube" title="Go to Our Youtube Channel"></a></li>
              <li><a href="#" class="vimeo" title="Go to Our Vimeo Channel"></a></li>
              <li><a href="#" class="deviantart" title="Go to Our Deviantart Page"></a></li>
            </ul>
          </div>
        </div>
        <div class="clearfix"></div>
      </div>

      <div class="copyright">
        <p>&copy; 2018 AFC Force. All Rights Reserved | Design by Mohit Raj</p>
      </div>
      <div class="clearfix"></div>
    </div>
  </div>

</div>
</div>
<!-- //Footer -->
<!-- Clients -->

</body></html>


