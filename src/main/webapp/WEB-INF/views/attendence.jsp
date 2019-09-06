<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8"
	src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.2.min.js"></script>
<script type="text/javascript"
	src="<spring:url value="/resource/js/attendence.js"/>"></script>
<body>
	<h2>Attendence here</h2>
	<div>
		<input type="button" id="checkinId" value="checkin" onclick="checkinCall(1);">

		<input type="button" id="checkoutId" value="check out" onclick="checkoutCall(1);">
	</div>

</body>
</html>