<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<link href="http://getbootstrap.com/dist/css/bootstrap.css"	rel="stylesheet">
<head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<spring:url var="postUrl" value="${contextPath }/employee/addewEmployee"/>
	<form:form>
	<div class="panel panel-default panel-collapse form-horizontal">
                <div class="panel-heading panel-title">
                   <span>Employee Details</span> 
                   <input type="button" value="Edit employee" class="btn-primary pull-right" onclick="window.location='${contextPath }/employee/editEmployee/${employee.employeeId}';"/>
                   <input type="button" value="delete employee" class="btn-danger pull-right" onclick="window.location='${contextPath }/employee/deleteEmployee/${employee.employeeId}';"/>
                </div>
	
	 <div class="panel-body" style="background-color:ActiveCaption; width:100%">
                    <table class="table" style="background-color: ActiveCaption;width:100%">
                        <tr >
                            <td class=" col-md-2">
                                <div >
                                    <h4>Full Name :</h4>
                                </div>

                            </td>
                            <td style="width:300px">
                                <div class=" col-md-2 form-control">
                                    <b>
                                        ${employee.firstName} ${employee.lastName}  
                                    </b>
                                        
                                </div>

                            </td>
                            <td rowspan="4" width="200" height="200">
                                <div id="imgage" class="img-thumbnail"style="align-content:center">
                                    <img width="150" height="150" style="align-self:center" src="/image" alt="No photo" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class=" col-md-2">
                             <div>
                                    <h4>Date of birth :</h4>
                                </div>
                            </td>
                            <td style="width:300px">
                                <div class=" col-md-2 form-control">
                                    <b>
                                   ${employee.dateOfBirth}
                                   </b>
                                    
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class=" col-md-2">
                                <div>
                                    <h4>Address :</h4>
                                </div>
                            </td>
                            <td style="width:250px">
                                <div class=" col-md-2 form-control">
                                    <b>
                                        ${employee.address.street} ${employee.address.city} ${employee.address.state}
                                    </b>
                                    
                                </div>
                            </td>
                        </tr>

                    </table>
       <div class="col-md-12">
      	<div class="col-md-2">
        	<h4>Gender:</h4>
    	</div>
    	<div class="col-md-3">
    	<label for="email" class="form-control">${employee.gender}</label>
    	</div>
    	<div class="col-md-2">
    	<h4>SSN:</h4>
          
    	</div>
    	<div class="col-md-3 ">
    	<label for="joined date" class="form-control">${employee.ssn}</label>
    	</div>
    </div>
    
        <div class="col-md-12">
      	<div class="col-md-2">
        	<h4>Email:</h4>
    	</div>
    	<div class="col-md-3">
    	<label for="email" class="form-control">${employee.address.email}</label>
    	</div>
    	<div class="col-md-2">
    	<h4>Phone:</h4>
          
    	</div>
    	<div class="col-md-3 ">
    	<label for="joined date" class="form-control">${employee.phone.prefix}-${employee.phone.areaCode	}-${employee.phone.number}</label>
    	</div>
    </div>       
      <div class="col-md-12">
      	<div class="col-md-2">
        	<h4>Department:</h4>
    	</div>
    	<div class="col-md-3">
    	<label for="email" class="form-control">${employee.department.departmentName}</label>
    	</div>
    	<div class="col-md-2">
    	<h4>Post:</h4>
          
    	</div>
    	<div class="col-md-3 ">
    	<label for="joined date" class="form-control">${employee.post.postName}</label>
    	</div>
    </div>
    <div class="col-md-12">
      	<div class="col-md-2">
        	<h4>Joined Date:</h4>
    	</div>
    	<div class="col-md-3 ">
    	<label for="joined date" class="form-control">${employee.joinedDate}</label>
    	</div>
    	
    	<div class="col-md-2">
    	<h4>Contract Date:</h4>
    	</div>
    	<div class="col-md-3">
    	<label for="email" class="form-control">${employee.contractDate}</label>
    	</div>
    </div>
    	
    </div>
                
    </div>
                
	</form:form>
</body>
</html>