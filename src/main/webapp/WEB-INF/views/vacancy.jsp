<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>

  
</script>
</head>
<body>
	<form:form modelAttribute="addVacancy" action="addVacancy">
		<fieldset>
			<legend>Add Vacancy</legend>
			<div class="form-group">
			<div class="col-lg-10">
				<label for ="Number of Employees">Number of Employees</label>
				
					<form:input id="noOfEmployees" path="numberOfEmployee" type="text"
						class="form:input-large" />
				</div>
			</div>
			<div class="form-group">
				
				<div class="col-lg-10">
				<label for ="Post">Post</label>

					<form:select path="post.postId" items="${posts}" itemValue="postId" itemLabel="postName" />
					
				</div>
			</div>
			<div class="form-group">
			<div class="col-lg-10">
				<label for ="Requirement"><spring:message code="requirement"/></label>
				
				<form:input path="requirement"></form:input>	
				</div>
			</div>
			<div class="form-group">
				
				<div class="col-lg-10">
				<label for ="Number To be Filled"><spring:message code="numberToBeFilled"/></label>
				<form:input path="numberOfFilledNumber"></form:input>	
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-lg-offset-2 col-lg-10">
					<input type="submit"  class="btn btn-primary"
						value="Submit" />
				</div>
			</div>
		</fieldset>
	</form:form>
</body>
</html>