<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="<spring:url value="/resource/js/vacancy.js"/>"></script>
<script>
  $(function(){
	  $('#vacancyTable').dataTable();	
  })
 
  </script>


<html>
<li><a href="<spring:url value="/vacancy/addVacancy"/>">Add Vacancy</a></li>

<body>
	<h2>Vacancy List</h2>

	<table id="vacancyTable" cellpadding="0" cellspacing="0" border="1">
		<thead>
			<tr>
				<th>Number Of Employee</th>
				<th>Requirement</th>
				<th>Post</th>
				<th>Number To Be Filled</th>
				<th>Approval Status</th>
				<th>Reject</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vacancy" items="${vacancyList}">
				<tr>

					<td>${vacancy.numberOfEmployee}</td>
					<td>${vacancy.requirement}</td>
					<td>${vacancy.post.postName}</td>
					<td>${vacancy.numberOfFilledNumber}</td>


					<td><input type="button" id="approveId${vacancy.id}" value="approve"
						onclick="vacancyApproveCall(${vacancy.id});"></td>
					<td><input type="button" id="rejectId${vacancy.id}" value="reject"
						onclick="rejectCall(${vacancy.id});" class="btn-danger"></td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
