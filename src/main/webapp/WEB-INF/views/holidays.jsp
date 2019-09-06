<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- Isolated Version of Bootstrap, not needed if your site already uses Bootstrap -->
<link rel="stylesheet"
	href="https://formden.com/static/cdn/bootstrap-iso.css" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />
<script>
	$(function() {
		$("#holidayDateId").datepicker({
			format : "yyyy-mm-dd"
		});
	});
</script>
</head>
<body>
	<form:form modelAttribute="holidays">
		<fieldset>
			<legend>Add Holiday</legend>
			<div class="form-group">

				<div class="col-lg-10">
					Date:
					<form:input id="holidayDateId" path="holidayDate" type="text"
						class="form:input-large" />
				</div>
			</div>
			<div class="form-group">

				<div class="col-lg-10">
					Reasons:
					<form:textarea id="reasonId" path="reason" type="text"
						class="form:input-large" />
				</div>
			</div>
			<div class="col-lg-offset-2 col-lg-10">
				<button>
					<a href="<spring:url value="/holidays"/>">Add holiday</a>
				</button>
				<a href="<spring:url value="/holidaysList"/>">View Holidays</a>


			</div>
		</fieldset>
	</form:form>
</body>
</html>