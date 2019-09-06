<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<html>

<body>
	  
	<p> <security:authorize access="isAuthenticated()">
	Welcome  ${SpecialBlurb}
			</security:authorize>
			<form:form action="logout" method="POST">
			<input type="submit" value="Log Out">
			</form:form>

 
 </body>
</html>