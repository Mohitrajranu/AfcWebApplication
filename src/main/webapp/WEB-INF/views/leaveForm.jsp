<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- Isolated Version of Bootstrap, not needed if your site already uses Bootstrap -->
<link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

<!-- Bootstrap Date-Picker Plugin -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>


<html>
<head>
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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript"
	src="<spring:url value="/resource/js/leave.js"/>"></script>
<script>
	$(function() {
		$("#leaveFromDateId").datepicker({
			format : 'yyyy-mm-dd'
		});
		$("#leaveToDateId").datepicker({
			format : 'yyyy-mm-dd'
		});
	});
</script>
</head>
<body>

	<form:form modelAttribute="leave" action="leave">
		<fieldset>
			<legend>Apply Leave</legend>
			<div>
				<div class="col-lg-10">
					<label for ="FromDate"><spring:message code="FromDate"/></label>
					<form:input id="leaveFromDateId" path="leaveFromDate" type="text"
						class="form:input-large" />
						<form:errors path="leaveFromDate"></form:errors>
				</div>
			</div>

			<div>
				<div class="col-lg-10">
					<label for ="ToDate"><spring:message code="ToDate"/></label>
					<form:input id="leaveToDateId" path="leaveToDate" type="text"
						class="form:input-large" />
						<form:errors path="leaveToDate"></form:errors>
				</div>
			</div>
			<div>

				<div class="col-lg-10">
					
					<label for ="Description"><spring:message code="Description"/></label>
					<form:textarea id="description" path="description" type="text"
						class="form:input-large" />
						<form:errors path="description"></form:errors>
				</div>
			</div>
			<div>
				<div class="col-lg-offset-2 col-lg-10">
					<input type="submit" id="applyleaveId" class="btn btn-primary"
						value="Apply Leave" />
				</div>
			</div>
		</fieldset>
	</form:form>
	
	
</body>
</html>