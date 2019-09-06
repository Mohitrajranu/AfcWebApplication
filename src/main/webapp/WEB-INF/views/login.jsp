<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%-- <head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
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
<title>Log in with your account</title>
</head> --%>
<!-- <body> -->
<%@ include file="header.jsp" %>
 </header>
        </div>
         
      </section>

<!-- <div class="container">
<div class="row"> -->
    <!-- <div class="row">
		<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h2 class="panel-title">Log in</h2>
			 	</div> -->
			  	<!-- <div class="panel-body"> -->
			  	<div class="row">
		<div class="col-md-4 col-md-offset-4">
			  	<c:if test="${not empty error}">
					<div class="alert alert-danger">
						<spring:message code="AbstractUserDetailsAuthenticationProvider.badCredentials"/><br />
					</div>
				</c:if>
			    	<form action="<spring:url value="/postLogin"></spring:url>" method="post" class="form-signin">
			    	<!--  <h2 class="form-heading">Log in</h2>-->
                    <fieldset>
			    	  	<%-- <div class="form-group">
			    		    <strong class="form-heading" style="font-size: 34px;">Log in</strong>
    						<a class="btn" style="float: center;float: right;font-size: 16px;margin-top: 4%;" href="${contextPath}/registration">Create an account</a>
			    		</div> --%>
			    	  	<div class="form-group">
			    		    <input class="form-control" placeholder="User Name" name='username' type="text" onclick="this.select()" autofocus="true"/>
			    		</div>
			    		<div class="form-group">
			    			<input class="form-control" placeholder="Password" name='password'  type="password" value=""/>
			    		</div>
		    			<div class="form-group">
			    			<input type='checkbox' name="keepMe"/>Remember Me? 
			    			<a class="btn" style="float: right;" href="${contextPath}/forgotPassword">Forgot Password</a>	
			    		</div>
			    		<input class="btn btn-lg btn-success btn-mini" type="submit" value="Login">
			    		<%-- <a class="btn" style="float: center;" href="${contextPath}/registration">Create an account</a> --%>
			    		<%--  <h4 class="text-center"><a href="${contextPath}/registration">Create an account</a></h4> --%>
			    		<%--  <input type="button" value="Forgot Password" style="float: right;"><a href="${contextPath}/forgotPassword"></a></input> --%>
			    		 
			    	</fieldset>
			      	</form>
			     </div>
			      </div> 
     
			<!-- </div>
		</div>
	</div>
</div> -->
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
 <%@ include file="footer.jsp" %>
