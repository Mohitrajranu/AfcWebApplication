<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8"
	src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.2.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
<script>
  $(function(){
    $("#leaveId").dataTable();
  })
  </script>

<html>
<script type="text/javascript"
	src="<spring:url value="/resource/js/leave.js"/>"></script>
<body>
	<h2>List of Leaves</h2>
	<table id="leaveId"  border="1">
		<thead>
			<tr>
				<th>Applicant Name</th>
				<th>Applied Date</th>
				<th>leave from</th>
				<th>leave to</th>
				<th>description</th>
				<th>Approve</th>
				<th>Reject</th>
			</tr>
		</thead>
		<tbody>
		
			<c:forEach var="listValue" items="${leaveList}">
				<tr>
					<td>${listvalue.leaveid}</td>
					<td>${listValue.appliedDate}</td>
					<td>${listValue.leaveFromDate}</td>
					<td>${listValue.leaveToDate}</td>
					<td>${listValue.description}</td>
					<td><input type="button" id="approveId${listvalue.leaveid}"
						value="approve${listvalue.leaveid}" onclick="approveCall(${listvalue.leaveid});"></td>
					<td><input type="button" id="rejectId${istvalue.leaveid}"
						value="reject" onclick="rejectCall(${listvalue.leaveid});"></td>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>