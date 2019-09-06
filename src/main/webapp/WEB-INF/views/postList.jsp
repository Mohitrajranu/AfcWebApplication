<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>

<body>
	   Post list display 
 <c:forEach items="${postList}" var="post">
				<div>Id=${post.postId}   Name=${post.postName}</div>
			</c:forEach>
 </body>
</html>