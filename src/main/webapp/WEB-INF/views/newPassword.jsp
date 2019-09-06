<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<form:form method="post" 
			modelAttribute="hb" class="form-signin">
        <h2 class="form-signin-heading">Enter New Password for ${emailid}</h2>
				<div class="form-group">
					<form:input type="password" path="password" class="form-control"
						placeholder="Password"></form:input>
				</div>

				<div class="form-group">
					<form:hidden path="hiddenMessage" value="${emailid}"></form:hidden>
				</div>
				<div class="form-group">
					<form:input type="password" path="passwordConfirm"
						class="form-control" placeholder="Confirm your password"></form:input>
				</div>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
		</form:form>
	</div>
</body>
</html>