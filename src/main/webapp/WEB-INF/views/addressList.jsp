<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>

<body>
	   Department list display 
 <c:forEach items="${addresslist}" var="address">
				<div>Id=${address.addressId}   Name=${address.city}</div>
			</c:forEach>
 </body>
</html>
</html>