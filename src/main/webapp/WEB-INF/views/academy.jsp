<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<head>

<title>Academy</title>


<!-- //Web-Fonts -->
<base href="/">
</head>


	<!-- Header -->
	<div class="header">

		<!-- Navbar -->

		<!-- Banner -->
		<div class="banner">
			<img src="${contextPath}/resources/viewimages/banner-1.jpg" alt="Sportive">
				<div class="caption">
					<h1>Academy Controls</h1>
				</div>
		</div>
		<!-- //Banner -->

	</div>
	<!-- //Header -->

	<!-- About -->
	<div class="container" style="margin-top: 50px;">
		<div class="row">
			<div class="col-sm-1"><img src="${contextPath}/resources/preview_img/aca.png" width="100px" height="100px"></div>
			<div class="col-sm-11"><h1> &nbsp Academy Controls</h1></div>
		</div>
		<div class="well row" style="margin-top: 20px">

			<h3>Add Academy</h3>

			<form >
				Name:<br>
				<input type="text" ng-model="academy.name"  class="form-control" style="width: 200px;" placeholder="NAME">
				<br>
				Created Date:<br>
				<input type="text" ng-model="academy.created" class="form-control" style="width: 200px;" placeholder="MM/DD/YYYY">
				<br>
				Updated Date:<br>
				<input type="text" ng-model="academy.updated" class="form-control" style="width: 200px;" placeholder="MM/DD/YYY">
				<br>
				<tr>
					<td><button ng-click="saveAcademy()" class="btn btn-success">
						<span class="glyphicon glyphicon-plus"></span> Save Academy</button></td>
				</tr>

			</form>
		</div>
		<div class="well row">
			<h3>View, Update and Delete</h3>
			<div class="clearfix"></div>
			<table class="table table-strip table-hover" data-ng-init="fetchAcademy(); editAllowed=true">

				<tr>
					<td>ID</td>
					<th>Name</th>
					<th> Created Date</th>
					<th>Updated Date</th>
					<th>Operations</th>
				</tr>
				<tr ng-repeat="academy in academies" ng-init="fd(academy.created, academy.upStringd, cr, up)">
					<td>
						<input type="number" ng-model="academy.id" disabled class="form-control" >
					</td>
					<td>
						<input type="text" ng-model="academy.name" ng-disabled="editAllowed" class="form-control">
					</td>
					<td>
						<input type="text" ng-model="cr" class="form-control" style="width: 200px;" placeholder="MM/DD/YYYY" ng-disabled="editAllowed" ng-init="cr=fd(academy.created)">
					</td>
					<td>
						<input type="text" ng-model="up" class="form-control" style="width: 200px;" placeholder="MM/DD/YYY" ng-disabled="editAllowed" ng-init="up=fd(academy.upStringd)">
					</td class="form-inline">
					<td><button ng-click="editAllowed=!editAllowed" class="btn btn-primary"><span class="glyphicon glyphicon-edit"></span> Edit</button></td>
					<td><button class="btn btn-success" ng-click="updateAcademy(academy, cr, up)" ng-show="!editAllowed"><span class="glyphicon glyphicon-pencil"></span> Update</button></td>
					<td><button ng-click="deleteAcademy(academy)" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Delete</button></td>
				</tr>
			</table>
		</div>
	</div>
	</div>

<div class="footer">
	<div class="container">

		<div class="footer-top">
			<div class="footer-grids">
				<div class="col-md-3 col-sm-3 address">
					<h5>Address</h5>
					<ul>
						<li>Sector-6</li>
						<li>400708</li>
						<li>Xaviers Turf Ground, Airoli</li>
						<li>Maharashtra , INDIA</li>
						<li>www.stcet.org</li>
					</ul>
				</div>
				<div class="col-md-3 col-sm-3 contact">
					<h5>Contact</h5>
					<div class="phone">
						<p>033 456 7890</p>
						<p>033 789 3450</p>
					</div>

					<div class="mail">
						<form>
							<input type="text" placeholder="Email address" required="">
							<input type="submit" value="Subscribe">
						</form>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="col-md-6 col-sm-6 connect">
					<h5>Connect</h5>
					<div class="connect-social">
						<ul>
							<li><a href="#" class="facebook" title="Go to Our Facebook Page"></a></li>
							<li><a href="#" class="twitter" title="Go to Our Twitter Account"></a></li>
							<li><a href="#" class="googleplus" title="Go to Our Google Plus Account"></a></li>
							<li><a href="#" class="linkedin" title="Go to Our Linkedin Page"></a></li>
							<li><a href="#" class="blogger" title="Go to Our Blogger Account"></a></li>
							<li><a href="#" class="tumblr" title="Go to Our Tumblr Page"></a></li>
							<li><a href="#" class="rss" title="Go to Our RSS Feed"></a></li>
							<li><a href="#" class="youtube" title="Go to Our Youtube Channel"></a></li>
							<li><a href="#" class="vimeo" title="Go to Our Vimeo Channel"></a></li>
							<li><a href="#" class="deviantart" title="Go to Our Deviantart Page"></a></li>
						</ul>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>

			<div class="copyright">
			<!-- <p>Copyright � 2018 Distributed by <a href="https://afcforce.com/" target="_blank">AFC Force</a></p> -->
				<p>&copy; 2018 AFC Force. All Rights Reserved | Design by Mohit Raj</p>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>

</div>
</div>





