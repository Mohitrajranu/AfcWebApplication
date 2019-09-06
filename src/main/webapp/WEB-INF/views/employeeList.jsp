<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css"/>
	<script type="text/javascript"
		src="<spring:url value="/resource/js/employeeList.js"/>"></script>
<head>
<body>
<div>
Employee List
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<form action="${contextPath }/employee/addNewEmployee" method="GET">
<input type="submit" value="Add new Employee"/>
</form>
</div>
  <table id="example">
    <thead>
      <tr>  <th>S.NO</th>
      <th>Name</th>
      <th>JoinedDate</th>
      <th>PhoneNum</th>
      <th>Status</th>
       <th>MakeInactive</th>
      <th>View Details</th>
      </tr>
    </thead>
    <tbody>
    <c:set var="count" value="0" scope="page" />
    <c:forEach items="${employeeList}" var="employee">
    <c:set var="count" value="${count + 1}" scope="page"/>
		 <tr>
		 <td>${count} ${employee.inActive}</td>
		  <td>${employee.firstName} ${employee.lastName}  </td>
		 <td>${employee.joinedDate}</td>
		 <td>${employee.phone.prefix}-${employee.phone.areaCode	}-${employee.phone.number}</td>
		 <td id="status${employee.employeeId}">
		  <c:choose>
		    <c:when test="${employee.inActive}">
		       Active
		    </c:when>    
		    <c:otherwise>
		        InActive
		    </c:otherwise>
		</c:choose>
		 </td>
		 <td id="togglebutton${employee.employeeId}">
		<c:choose>
		    <c:when test="${employee.inActive}">
		       <input type="button"  value="MakeInActive" name="view"  onclick="toggleactive(${employee.employeeId})"/>
		    </c:when>    
		    <c:otherwise>
		      <input type="button"  value="MakeActive" name="view"  onclick="toggleactive(${employee.employeeId})"/>
		    </c:otherwise>
		</c:choose>
		 </td>
		 <td><input type="button" value="view" name="view"  onclick="viewDetailClick(${employee.employeeId})" ></td>
		 </tr>
	</c:forEach>
     
    
    </tbody>
  </table>
  <script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.2.min.js"></script>
  <script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
  <script>
  $(function(){
    $("#example").dataTable();
  });
  </script>







</html>