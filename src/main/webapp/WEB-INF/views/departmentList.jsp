<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>

<body>
<div >
	<span><a href="../address/list">Address list</a></span>
	<span><a href="../post/list">post  list</a></span>
	<span><a href="../phone/list">Phone</a></span>
	</div><br>
	   Department list display 
	
 <c:forEach items="${departmentList}" var="department">
				<div>Id=${department.departmentId}   Name=${department.departmentName}</div>
			</c:forEach>
 </body>
</html>
</html>