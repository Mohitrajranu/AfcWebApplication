<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8"
	src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.2.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
<script>
	$(function() {
		$("#holidayId").dataTable();
	})
</script>
<html>

<body>
	<h2>List of holidays</h2>

	<table id="holidayId" cellpadding="0" cellspacing="0" border="1">
		<thead>
			<tr>
				<th>Date</th>
				<th>Reason</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="listValue" items="${holidaysList}">
				<tr>
					<td>${listValue.holidayDate}</td>
					<td>${listValue.reason}</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>
</html>