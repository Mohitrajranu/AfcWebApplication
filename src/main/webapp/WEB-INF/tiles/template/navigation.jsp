<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<li><a href="<spring:url value="/department/list"/>">Department</a></li>
<li><a href="<spring:url value="/employee/list"/>">Employees</a></li>
<li><a href="<spring:url value="/login"/>">Login</a></li>

<li><a href="<spring:url value="/leave"/>">Apply Leave</a></li>
<li><a href="<spring:url value="/holidays"/>">Holidays</a></li>
<li><a href="<spring:url value="/attendence"/>">Attendance</a></li>
<li><security:authorize  access="hasRole('ROLE_ADMIN')"><a href="<spring:url value="/vacancy/vacancyList"/>">Vacancy</a></security:authorize></li>


