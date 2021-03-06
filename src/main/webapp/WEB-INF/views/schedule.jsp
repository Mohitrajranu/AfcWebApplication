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

<div class="banner">
    <img src="${contextPath}/resources/viewimages/schedule.jpg" alt="Sportive">
    <div class="caption">
        <h1>Schedules</h1>
    </div>
</div>
<!-- //Banner -->
<div class="container-fluid" ng-init="init();fetchAllAcademyID(); enableGroup=true; updateAllow=false; enableGroupU=false;showData=false" style="margin-top: 40px;">
    <div class="row">
        <div class="col-sm-1"><img src="${contextPath}/resources/preview_img/schedule-icon-7.png" width="75px" height="75px"></div>
    </div>
    <div class="row" style="margin-top: 20px">
        <div class="well container">
            <h3>Add Schedule</h3>
            <form invalidate>
                <table class="table" style="width: 550px">
                    <tr>
                        <td>Academy ID:</td>
                        <td>
                            <select class="form-control" ng-model="newSch.academy_id" ng-change="enableGroup=false">
                                <option ng-repeat="aID in academyID">{{aID}}</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Group ID:</td>
                        <td>
                            <select class="form-control" ng-model="newSch.group_id" ng-disabled="enableGroup" ng-focus="fetchAllGroupID(newSch.academy_id);">
                                <option ng-repeat="gID in groupID">{{gID}}</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Description:</td>
                        <td>
                            <textarea ng-model="newSch.description" class="form-control" rows="5" placeholder="SCHEDULE DESCRIPTION"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>Schedule Date and Time</p>
                            <p>(DD-MM-YYYY: HRS: MINS)</p>
                        </td>
                        <td class="form-inline">
                            <input type="number" class="form-control" ng-model="c.dd" style="width: 70px;" placeholder="DD" min="1" max="31">
                            <input type="number" class="form-control" ng-model="c.mm" style="width: 70px;" placeholder="MM" min="1" max="12">
                            <input type="number" class="form-control" ng-model="c.yy" style="width: 100px;" placeholder="YYYY" min="1990">
                            <p></p>
                            <input type="number" class="form-control" ng-model="c.hrs" style="width: 70px;" placeholder="HRS" min="0" max="23">
                            <input type="number" class="form-control" ng-model="c.min" style="width: 70px;" placeholder="MIN" min="0" max="59">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>Schedule Status</p>
                        </td>
                        <td>
                            <select class="form-control" ng-model="newSch.status" name="STATUS">
                                <option ng-repeat="s in ['UPCOMING','COMPLETED','MISSED']">{{s}}</option>
                            </select>
                        </td>
                    <tr>
                        <td>
                            <p>Is Updated date same as Schedule date?</p>
                        </td>
                        <td>
                            <input type="checkbox" ng-model="cpyDate" ng-change="cpy()">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>Schedule Updated Date and Time</p>
                            <p>(DD-MM-YYYY: HRS: MINS)</p>
                        </td>
                        <td class="form-inline">
                            <input type="number" class="form-control" ng-model="u.dd" style="width: 70px;" placeholder="DD">
                            <input type="number" class="form-control" ng-model="u.mm" style="width: 70px;" placeholder="MM">
                            <input type="number" class="form-control" ng-model="u.yy" style="width: 100px;" placeholder="YYYY">
                            <p></p>
                            <input type="number" class="form-control" ng-model="u.hrs" style="width: 70px;" placeholder="HRS">
                            <input type="number" class="form-control" ng-model="u.min" style="width: 70px;" placeholder="MIN">
                        </td>
                    </tr>
                </table>
                <button class="btn btn-warning" ng-click="resetForm()" style="width: 250px; ">
                    <span class="glyphicon glyphicon-refresh"></span>
                    Reset</button>
                <button class="btn btn-success" ng-click="addSchedule(newSch,c,u);" style="width: 250px; margin-left: 40px;">
                    <span class="glyphicon glyphicon-plus"></span>
                    Add Schedule</button>
                <p>{{message}}</p>
            </form>
        </div>
    </div>
    <div class="row">
        <div class="well container">
            <h4>View, Update and Delete Control</h4>
            <button class="btn btn-primary" ng-click="getAll();showData=!showData">
                <span class="glyphicon glyphicon-list"></span> Show All
            </button>
            <p style="height: 20px;"></p>
            <table class="table" ng-show="showData">
                <tr>
                    <th>Schedule ID</th>
                    <th>Academy ID</th>
                    <th>Group ID</th>
                    <th>Description</th>
                    <th>Schedule Date and Time</th>
                    <th>Status</th>
                    <th>Updated Date and Time</th>
                    <th>Operations</th>
                </tr>
                <tr ng-repeat="sch in allSchedules">
                    <td>
                        <input type="number" class="form-control" disabled ng-model="sch.id" style="width: 50px;">
                    </td>
                    <td>
                        <input type="number" class="form-control" ng-show="!updateAllow" ng-model="sch.academy_id" style="width: 50px;" disabled>
                        <select class="form-control" ng-model="sch.academy_id" ng-change="enableGroupU=false" ng-show="updateAllow">
                            <option ng-repeat="aID in academyID">{{aID}}</option>
                        </select>
                    </td>
                    <td>
                        <input type="number" class="form-control" ng-show="!updateAllow" ng-model="sch.group_id" style="width: 50px;" disabled>
                        <select class="form-control" ng-model="newSch.group_id" ng-show="updateAllow" ng-disabled="enableGroupU" ng-focus="fetchAllGroupID(sch.academy_id);">
                            <option ng-repeat="gID in groupID">{{gID}}</option>
                        </select>
                    </td>
                    <td>
                        <textarea ng-model="sch.description" class="form-control" rows="5" placeholder="SCHEDULE DESCRIPTION" ng-disabled="!updateAllow"></textarea>
                    </td>
                    <td class="form-inline" ng-init="sc=dispDate(sch.date_time,sc)">
                        <input type="number" class="form-control" ng-model="sc.dd" style="width: 60px;" placeholder="DD" ng-disabled="!updateAllow">
                        <input type="number" class="form-control" ng-model="sc.mm" style="width: 60px;" placeholder="MM" ng-disabled="!updateAllow">
                        <p></p>
                        <input type="number" class="form-control" ng-model="sc.yy" style="width: 80px;" placeholder="YYYY" ng-disabled="!updateAllow">
                        <p></p>
                        <input type="number" class="form-control" ng-model="sc.hrs" style="width: 60px;" placeholder="HRS" ng-disabled="!updateAllow">
                        <input type="number" class="form-control" ng-model="sc.min" style="width: 60px;" placeholder="MIN" ng-disabled="!updateAllow">
                    </td>
                    <td>
                        <input type="text" ng-show="!updateAllow" ng-model="sch.status" class="form-control" disabled>
                        <select class="form-control" ng-model="sch.status" name="STATUS" ng-show="updateAllow">
                            <option ng-repeat="s in ['UPCOMING','COMPLETED','MISSED']">{{s}}</option>
                        </select>
                    </td>
                    <td class="form-inline" ng-init="su=dispDate(sch.updated_time, su)">
                        <input type="number" class="form-control" ng-model="su.dd" style="width: 60px;" placeholder="DD" ng-disabled="!updateAllow">
                        <input type="number" class="form-control" ng-model="su.mm" style="width: 60px;" placeholder="MM" ng-disabled="!updateAllow">
                        <p></p>
                        <input type="number" class="form-control" ng-model="su.yy" style="width: 80px;" placeholder="YYYY" ng-disabled="!updateAllow">
                        <p></p>
                        <input type="number" class="form-control" ng-model="su.hrs" style="width: 60px;" placeholder="HRS" ng-disabled="!updateAllow">
                        <input type="number" class="form-control" ng-model="su.min" style="width: 60px;" placeholder="MIN" ng-disabled="!updateAllow">
                    </td>
                    <td>
                        <button class="btn btn-primary" ng-click="updateAllow=!updateAllow">
                            <span class="glyphicon glyphicon-edit"></span> Edit
                        </button>
                        <p></p>
                        <button class="btn btn-success" ng-show="updateAllow" ng-click="sch=updateSchedule(sch,sc,su)">
                            <span class="glyphicon glyphicon-pencil"></span> Update
                        </button>
                        <p></p>
                        <button class="btn btn-danger" ng-click="deleteSchedule(sch);">
                            <span class="glyphicon glyphicon-remove"></span> Delete
                        </button>
                    </td>
                </tr>
            </table>
        </div>
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
                <p>&copy; 2018 AFC Force. All Rights Reserved | Design by Mohit Raj</p>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>

</div>
</html>