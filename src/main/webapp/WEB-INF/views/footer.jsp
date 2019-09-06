<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!-- <html lang="en"> -->
<%-- <head>
   <!-- Basic -->
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <!-- Mobile Metas -->
   <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
   <!-- Site Metas -->
  <!--  <title>AFC Force</title> -->
   <meta name="keywords" content="">
   <meta name="description" content="">
   <meta name="author" content="">
   <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.min.css">
   <!-- Site CSS -->
   <link rel="stylesheet" href="${contextPath}/resources/css/style.css">
   <!-- Colors CSS 
   <link rel="stylesheet" href="css/colors.css">-->
   <!-- ALL VERSION CSS 
   <link rel="stylesheet" href="css/versions.css">-->	
   <!-- Responsive CSS -->
   <link rel="stylesheet" href="${contextPath}/resources/css/responsive.css">
   <!-- Custom CSS -->
   <link rel="stylesheet" href="${contextPath}/resources/css/custom.css">
   <!-- font family -->
   <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
   <!-- end font family -->
   <link rel="stylesheet" href="${contextPath}/resources/css/3dslider.css" />
   <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
   <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
   <script src="${contextPath}/resources/js/3dslider.js"></script>
 </head> --%>
  <!--  <body class="game_info" data-spy="scroll" data-target=".header"> -->
      <!-- LOADER -->
      <%-- <div id="preloader">
         <img class="preloader" src="${contextPath}/resources/images/loading-img.gif" alt="">
      </div> --%>
      <!-- END LOADER -->
      
      <footer id="footer" class="footer">
<!--       <div class="row"> -->
        <!--  <div class="container">
            <div class="row"> -->
               <div class="col-md-3">
                  <!-- <div class="full"> -->
                     <div class="footer-widget">
                        <div class="footer-logo">
                           <%-- <a href="#"><img src="${contextPath}/resources/images/footer-logo.png" alt="#" /></a> --%>
                           
                              <a href="${contextPath}/index"><img src="${contextPath}/resources/images/logo_transparent.jpg" alt="#" /></a>
                         
                        </div>
                        <p>Most of our events have hard and easy route choices as we are always keen to encourage new talents.</p>
                        <ul class="social-icons style-4 pull-left">
                           <li><a class="facebook" href="http://www.facebook.com/"><i class="fa fa-facebook"></i></a></li>
                              <li><a class="twitter" href="http://www.twitter.com/"><i class="fa fa-twitter"></i></a></li>
                              <li><a class="youtube" href="http://www.youtube.com/"><i class="fa fa-youtube-play"></i></a></li>
                              <li><a class="pinterest" href="http://www.pinterest.com/"><i class="fa fa-pinterest-p"></i></a></li>
							  <li><a class="instagram" href="http://www.instagram.com/"><i class="fa fa-instagram"></i></a></li>
                        </ul>
                     </div>
                 <!--  </div> -->
               </div>
               <div class="col-md-2">
                  <!-- <div class="full"> -->
                     <div class="footer-widget">
                        <h3>Menu</h3>
                        <ul class="footer-menu">
                           <li><a href="${contextPath}/about">About Us</a></li>
                           <li><a href="${contextPath}/team">Our Team</a></li>
                           <li><a href="${contextPath}/news">Latest News</a></li>
                          <%--  <li><a href="${contextPath}/blog" href="matche.html">Recent Matchs</a></li> --%>
                           <li><a href="${contextPath}/blog">Our Blog</a></li>
                           <li><a href="${contextPath}/contact">Contact Us</a></li>
                        </ul>
                     </div>
                <!--   </div> -->
               </div>
               <div class="col-md-3">
                <!--   <div class="full"> -->
                     <div class="footer-widget">
                        <h3>Contact us</h3>
                        <ul class="address-list">
                           <li><i class="fa fa-map-marker"></i> Lorem Ipsum is simply dummy text of the printing..</li>
                           <li><i class="fa fa-phone"></i> 123 456 7890</li>
                           <li><i style="font-size:20px;top:5px;" class="fa fa-envelope"></i> demo@gmail.com</li>
                        </ul>
                     </div>
                <!--   </div> -->
               </div>
               <div class="col-md-3">
                 <!--  <div class="full"> -->
                     <div class="contact-footer">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d120615.72236587871!2d73.07890527988283!3d19.140910987164396!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1527759905404" width="600" height="350" frameborder="0" style="border:0" allowfullscreen></iframe>
                     </div>
                <!--   </div> -->
               </div>
         <!--   </div> -->
         <div class="footer-bottom">
            <div class="container">
               <p>Copyright © 2018 Distributed by <a href="https://afcforce.com/" target="_blank">AFC Force</a></p>
            </div>
         </div>
         
      </footer>
      <a href="#home" data-scroll class="dmtop global-radius"><i class="fa fa-angle-up"></i></a>
      <!-- ALL JS FILES -->
      <script src="${contextPath}/resources/js/all.js"></script>
      <!-- ALL PLUGINS -->
      <script src="${contextPath}/resources/js/custom.js"></script>
   </body>
</html>