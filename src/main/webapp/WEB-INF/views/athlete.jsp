<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>

<title>Athlete -- SportsPLus</title>

<!-- For-Mobile-Apps -->
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="Sportive a Responsive Web Template, Bootstrap Web Templates, Flat Web Templates, Android Compatible Web Template, Smartphone Compatible Web Template, Free Webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //For-Mobile-Apps -->

<!-- Custom-Stylesheet-Links -->
	<!-- Bootstrap-Core-CSS --> <link rel="stylesheet" href="${contextPath}/resources/viewcss/bootstrap.min.css" type="text/css" media="all" />
	<!-- Index-Page-CSS --> <link rel="stylesheet" href="${contextPath}/resources/viewcss/style.css" type="text/css" media="all" />
<!-- //Custom-Stylesheet-Links -->

<!-- Web-Fonts -->
	<link href='//fonts.googleapis.com/css?family=Carter+One' rel='stylesheet' type='text/css'>
	<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>
	<link href='//fonts.googleapis.com/css?family=Cabin:400,500,600,700' rel='stylesheet' type='text/css'>
<!-- //Web-Fonts -->
<base href="/">
</head>
<body>

	<!-- Header -->
	<div class="header">


		<!-- //Navbar -->

		<!-- Banner -->
		<div class="banner">
			<img src="${contextPath}/resources/viewimages/banner-2.jpg" alt="Sportive">
				<div class="caption">
					<h1>Athlete Control</h1>
				</div>
		</div>
		<!-- //Banner -->

	</div>
	<div class="container" ng-init="fg=true;fc=true;enableEdit=false;viewAth=false" style="margin-top: 50px;">
		<div class="row">
			<div class="col-sm-1"><img src="${contextPath}/resources/preview_img/watchos4-workout-indoor-outdoor-run-icon.png" width="75px" height="75px"></div>

		</div>
		<div class="container well" style="margin-top: 20px">
			<h3>Add Athlete</h3>
			<form>
				<table class="table" style="width: 500px;">
					<tr>
						<td>First Name</td>
						<td>
							<input type="text" class="form-control" placeholder="FIRST NAME" ng-model="newAthlete.firstName" />
						</td>
					</tr>
					<tr>
						<td>
							Last Name
						</td>
						<td>
							<input type="text" class="form-control" placeholder="LAST NAME" ng-model="newAthlete.lastName" />
						</td>
					</tr>
					<tr>
						<td>Date of Birth</td>
						<td class="form-inline">
							<input type="number" class="form-control" ng-model="b.dd" style="width: 70px;" placeholder="DD" min="1" max="31">
							<input type="number" class="form-control" ng-model="b.mm" style="width: 70px;" placeholder="MM" min="1" max="12">
							<input type="number" class="form-control" ng-model="b.yy" style="width: 100px;" placeholder="YYYY">
						</td>
					</tr>
					<tr>
						<td>Gender</td>
						<td>
							<select class="form-control" ng-model="newAthlete.gender">
								<option ng-repeat="s in ['Male', 'Female']">{{s}}</option>
							</select>
						</td>
					</tr>

					<tr>
						<td>Phone Number</td>
						<td>
							<input type="number" class="form-control" placeholder="Phone Number" ng-model="newAthlete.contactNo"/>
						</td>
					</tr>
					<tr>
						<td>Address</td>
						<td>
							<textarea placeholder="Address" rows="5" class="form-control" ng-model="newAthlete.address"></textarea>
						</td>
					</tr>
					<tr>
						<td>City</td>
						<td>
							<input type="text" class="form-control" placeholder="City" ng-model="newAthlete.city" />
						</td>
					</tr>
					<tr>
						<td>Pin Code</td>
						<td>
							<input type="number" class="form-control" placeholder="Pin Code" ng-model="newAthlete.pincode"/>
						</td>
					</tr>
					<tr>
						<td>Parent's Name</td>
						<td>
							<input type="text" class="form-control" placeholder="Parent Name" ng-model="newAthlete.parentFullName" />
						</td>
					</tr>
					<tr>
						<td>Parent's Address</td>
						<td>
							<textarea placeholder="Address" rows="5" class="form-control" ng-model="newAthlete.parentAddress"></textarea>
						</td>
					</tr>
					<tr>
						<td>Phone Number</td>
						<td>
							<input type="number" class="form-control" placeholder="Phone Number" ng-model="newAthlete.parentContact"/>
						</td>
					</tr>
					<tr>
						<td>Primary Sport</td>
						<td>
							<input type="text" class="form-control" placeholder="Primary Sports" ng-model="newAthlete.primarySport"/>
						</td>
					</tr>
					<tr>
						<td>College</td>
						<td>
							<input type="text" class="form-control" placeholder="College" ng-model="newAthlete.college"/>
						</td>
					</tr>
					<tr>
						<td>Player Level</td>
						<td>
							<select class="form-control" ng-model="newAthlete.level" class="form-control">
								<option ng-repeat="s in ['Regular','Elite']">{{s}}</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>Training Base</td>
						<td>
							<select class="form-control" ng-init="fetchAid()" ng-model="newAthlete.trainingBase" ng-change="fetchGid(newAthlete.trainingBase);fg=false">
								<option ng-repeat="s in aid">{{s}}</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>Group ID</td>
						<td>
							<select class="form-control" ng-model="newAthlete.groupid" ng-change="fetchCid(newAthlete.groupid); fc=false" ng-disabled="fg">
								<option ng-repeat="s in gid">{{s}}</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>Coach ID</td>
						<td>
							<select class="form-control" ng-model="newAthlete.coachId" ng-disabled="fc">
								<option ng-repeat="s in cid">{{s}}</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>Residential Status</td>
						<td>
							<select class="form-control" ng-model="newAthlete.residentStatus">
								<option ng-repeat="s in ['Residential','Non-residential']">{{s}}</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>Athlete Status</td>
						<td>
							<select ng-model="newAthlete.athleteStatus" class="form-control">
								<option ng-repeat="s in ['Training (Pre-Season)', 'Training (Season)', 'Competition', 'Post-Competition', 'Injured', 'Rehabilitation']">{{s}}</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>Blood Group</td>
						<td>
							<select ng-model="newAthlete.bloodGroup" class="form-control">
								<option ng-repeat="s in ['O+','A+','B+','AB+','O-','A-','B-','AB-']">{{s}}</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<button type="submit" class="btn btn-success" ng-click="addAthlete(newAthlete, b);ath.id=null"><span class="glyphicon glyphicon-plus"></span> Add Athlete</button>
						</td>
					</tr>
			</form>
			</table>
		</div>
		<div class="container well">
			<h3>View, Update and Delete</h3>
			<div class="form-inline">
				<input type="number" placeholder="ATHLETE ID" ng-model="ath.id" class="form-control" ng-disabled="viewAth">
				<button class="btn btn-primary" ng-click="fetchAth(ath.id);viewAth=!viewAth;enableEdit=false"><span class="glyphicon glyphicon-menu-right"></span> Show</button>
			</div>
			<p style="height: 10px;"></p>
			<form>
				<table class="table" style="width: 500px;" ng-show="viewAth">
					<tr>
						<td>First Name</td>
						<td>
							<input type="text" class="form-control" placeholder="FIRST NAME" ng-model="ath.firstName" ng-disabled="!enableEdit"/>
						</td>
					</tr>
					<tr>
						<td>
							Last Name
						</td>
						<td>
							<input type="text" class="form-control" placeholder="LAST NAME" ng-model="ath.lastName" ng-disabled="!enableEdit"/>
						</td>
					</tr>
					<tr>
						<td>Date of Birth</td>
						<td class="form-inline">
							<input type="number" class="form-control" ng-model="dd" style="width: 70px;" placeholder="DD" min="1" max="31" ng-disabled="!enableEdit">
							<input type="number" class="form-control" ng-model="mm" style="width: 70px;" placeholder="MM" min="1" max="12" ng-disabled="!enableEdit">
							<input type="number" class="form-control" ng-model="yy" style="width: 100px;" placeholder="YYYY" ng-disabled="!enableEdit">
						</td>
					</tr>
					<tr>
						<td>Gender</td>
						<td>
							<select class="form-control" ng-model="ath.gender" ng-disabled="!enableEdit">
								<option ng-repeat="s in ['Male', 'Female']">{{s}}</option>
							</select>
						</td>
					</tr>

					<tr>
						<td>Phone Number</td>
						<td>
							<input type="number" class="form-control" placeholder="Phone Number" ng-model="ath.contactNo" ng-disabled="!enableEdit"/>
						</td>
					</tr>
					<tr>
						<td>Address</td>
						<td>
							<textarea placeholder="Address" rows="5" class="form-control" ng-model="ath.address" ng-disabled="!enableEdit"></textarea>
						</td>
					</tr>
					<tr>
						<td>City</td>
						<td>
							<input type="text" class="form-control" placeholder="City" ng-model="ath.city" ng-disabled="!enableEdit"/>
						</td>
					</tr>
					<tr>
						<td>Pin Code</td>
						<td>
							<input type="number" class="form-control" placeholder="Pin Code" ng-model="ath.pincode" ng-disabled="!enableEdit"/>
						</td>
					</tr>
					<tr>
						<td>Parent's Name</td>
						<td>
							<input type="text" class="form-control" placeholder="Parent Name" ng-model="ath.parentFullName" ng-disabled="!enableEdit"/>
						</td>
					</tr>
					<tr>
						<td>Parent's Address</td>
						<td>
							<textarea placeholder="Address" rows="5" class="form-control" ng-model="ath.parentAddress" ng-disabled="!enableEdit"></textarea>
						</td>
					</tr>
					<tr>
						<td>Phone Number</td>
						<td>
							<input type="number" class="form-control" placeholder="Phone Number" ng-model="ath.parentContact" ng-disabled="!enableEdit"/>
						</td>
					</tr>
					<tr>
						<td>Primary Sport</td>
						<td>
							<input type="text" class="form-control" placeholder="Primary Sports" ng-model="ath.primarySport" ng-disabled="!enableEdit"/>
						</td>
					</tr>
					<tr>
						<td>College</td>
						<td>
							<input type="text" class="form-control" placeholder="College" ng-model="ath.college" ng-disabled="!enableEdit"/>
						</td>
					</tr>
					<tr>
						<td>Player Level</td>
						<td>
							<select class="form-control" ng-model="ath.level" class="form-control" ng-disabled="!enableEdit">
								<option ng-repeat="s in ['Regular','Elite']">{{s}}</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>Training Base</td>
						<td>
							<input type="text" ng-class="form-control" ng-model="ath.trainingBase" disabled ng-show="!enableEdit" class="form-control">
							<select class="form-control" ng-init="fetchAid()" ng-model="ath.trainingBase" ng-change="fetchGid(ath.trainingBase);fg=false" ng-show="enableEdit">
								<option ng-repeat="s in aid">{{s}}</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>Group ID</td>
						<td>
							<input type="text" ng-class="form-control" ng-model="ath.groupid" disabled ng-show="!enableEdit" class="form-control">
							<select class="form-control" ng-model="ath.groupid" ng-change="fetchCid(ath.groupid); fc=false" ng-disabled="fg" ng-show="enableEdit">
								<option ng-repeat="s in gid">{{s}}</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>Coach ID</td>
						<td>
							<input type="text" ng-class="form-control" ng-model="ath.coachId" disabled ng-show="!enableEdit" class="form-control">
							<select class="form-control" ng-model="ath.coachId" ng-disabled="fc" ng-show="enableEdit" ng-show="enableEdit">
								<option ng-repeat="s in cid">{{s}}</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>Residential Status</td>
						<td>
							<select class="form-control" ng-model="ath.residentStatus" ng-disabled="!enableEdit">
								<option ng-repeat="s in ['Residential','Non-residential']">{{s}}</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>Athlete Status</td>
						<td>
							<select ng-model="ath.athleteStatus" class="form-control" ng-disabled="!enableEdit">
								<option ng-repeat="s in ['Training (Pre-Season)', 'Training (Season)', 'Competition', 'Post-Competition', 'Injured', 'Rehabilitation']">{{s}}</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>Blood Group</td>
						<td>
							<select ng-model="ath.bloodGroup" class="form-control" ng-disabled="!enableEdit">
								<option ng-repeat="s in ['O+','A+','B+','AB+','O-','A-','B-','AB-']">{{s}}</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="form-inline">
							<button class="btn btn-primary" ng-click="enableEdit=!enableEdit"><span class="glyphicon glyphicon-edit"></span> Edit</button>
							<button  class="btn btn-success" ng-click="updtAth(ath, dd, mm, yy)" ng-show="enableEdit"><span class="glyphicon glyphicon-pencil"></span> Update</button>
							<button  class="btn btn-danger" ng-click="deleteAth(ath)"><span class="glyphicon glyphicon-remove"></span> Delete</button>
						</td>
					</tr>
			</form>
			</table>
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
					<p>&copy; 2018 AFC Force. All Rights Reserved | Design by Mohit Raj</p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>

	</div>
	</div>
</body>
</html>



<!-- All Images are for reference and illustration puropse only. -->
<!-- Unsplash-Link
	Images were taken from the website UNSPLASH - https://unsplash.com/
-->
<!-- Flaticon-Link:
	Icons were taken from the website FLATICON "http://www.flaticon.com" made by "http://www.freepik.com" is licensed by "http://creativecommons.org/licenses/by/3.0/" CC 3.0. BY
-->