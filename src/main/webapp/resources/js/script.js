"use strict";
var contextRoot = "/" + window.location.pathname.split('/')[1];
var app = angular.module("app", [ "ngRoute" ]);

app.config([ '$routeProvider','$locationProvider', function($routeProvider,$locationProvider) {
	$locationProvider.html5Mode(true);
	 $locationProvider.hashPrefix('');

	$routeProvider.when(contextRoot+'/home', {
		templateUrl : contextRoot+'/home'
	});

	$routeProvider.when(contextRoot+'/academy', {
		templateUrl : contextRoot+'/academy',
		controller : 'academyCtrl'
	});
	$routeProvider.when(contextRoot+'/schedule', {
		templateUrl : contextRoot+'/schedule',
		controller : 'scheduleCtrl'
	});
	$routeProvider.when(contextRoot+'/group', {
		templateUrl : contextRoot+'/group',
		controller : 'groupCtrl'
	});
	$routeProvider.when(contextRoot+'/coach', {
		templateUrl : contextRoot+'/coach',
		controller : 'coachCtrl'
	});
	$routeProvider.when(contextRoot+'/athlete', {
		templateUrl : contextRoot+'/athlete',
		controller : 'athleteCtrl'
	});
	$routeProvider.otherwise({
		redirectTo : contextRoot+'/home'
	});
} ]);

function Coach(id){
	this.coach_id = id;
};

function Academy(id){
	this.id = id;
};
function Group(id){
	this.id = id;
};

// academy controller

app.controller("academyCtrl", function($scope, $http) {

	// fetchAcademy -> getAll
	$scope.fetchAcademy = function() {
		$http({
			method : 'GET',
			url : contextRoot +'/academy/getAll'
		}).success(function(data, status) {
			console.log(data);
			$scope.status = status;
			$scope.academies = data;
		}).error(function(data, status) {
			$scope.status = status;
			$scope.data = "Request failed";
		});
	};
	$scope.fd = function(crd){
		var v1 = new Date(crd);
		return v1.toLocaleDateString();
	}
	// saveAcademy -> add
	$scope.saveAcademy = function() {
		if(Object.keys($scope.academy).length < 3 || $scope.academy == null){
			alert("Fields cant be left empty");
			return;
		}
		var v = new Date().getTime();
		$scope.academy.created = new Date($scope.academy.created).getTime();
		if(v < $scope.academy.created){
			alert("Created Date cant Exceed the current Date");
			return;
		}
		console.log($scope.academy.created);
		$scope.academy.upStringd = new Date($scope.academy.updated).getTime();
		if(v < $scope.academy.created){
			alert("Updated Date cant Exceed the current Date");
			return;
		}

		console.log($scope.academy.upStringd);
		$http({
			method : 'POST',
			url : contextRoot +'/academy/add',
			headers: { 'Content-Type': 'application/json' },
			data:$scope.academy
		}).success(function(data, status) {
			console.log(data);
			$scope.fetchAcademy();
			$scope.academies = data;
		}).error(function(data, status) {
			$scope.status = status;
			$scope.data = "Request failed";
		});
	};
	
	// deleteAcademy -> delete
	$scope.deleteAcademy = function(academy) {
		console.log(academy);
		return;
		$http({
			method : 'POST',
			url : contextRoot +'/academy/delete',
			headers: { 'Content-Type': 'application/json' },
			data:academy
		}).success(function(data, status) {
			console.log(data);
			$scope.fetchAcademy();
			$scope.academies = data;
		}).error(function(data, status) {
			$scope.status = status;
			$scope.data = "Request failed";
		});
	};
	
	// updateAcademy -> update
	$scope.updateAcademy = function(academy, cr, up) {
		if(Object.keys(academy).length < 3 || academy == null){
			alert("Fields cant be left empty");
			return;
		}
		var v = new Date().getTime();
		academy.created = new Date(cr).getTime();
		if(v < academy.created){
			alert("Created Date cant Exceed the current Date");
			return;
		}
		
		academy.upStringd = new Date(up).getTime();
		if(v < academy.upStringd){
			alert("Updated Date cant Exceed the current Date");
			return;
		}
		academy.created = new Date(cr).getTime();
		academy.upStringd = new Date(up).getTime();
		$http({
			method : 'POST',
			url : contextRoot +'/academy/update',
			headers: { 'Content-Type': 'application/json' },
			data:academy
		}).success(function(data, status) {
			console.log(data);
			$scope.fetchAcademy();
			$scope.academies = data;
		}).error(function(data, status) {
			$scope.status = status;
			$scope.data = "Request failed";
		});
	};

});

/* // DONT TOUCH
app.controller("scheduleCtrl", function($scope, $http) {
	//Creating validations and functions
	
	//Validation if the fields are empty or not
	var addScheduleValidate = function(scheduleObject){
		Object.keys(scheduleObject).forEach(function(key){
			if(scheduleObject[key] == ""){
				return false;
			}
			return true;
		});
	};

	
	//Linking to HTML
	//Add Schedule
	$scope.addSchedule = function(newSchedule){
		var checkIfOkay = addScheduleValidate(newSchedule);
		//Check if selected date is greater than current date date
		var date = new Date();
		if(newSchedule.date < date){
			$scope.dateMessage = "Selected Date should be greater than current date";
			checkIfOkay = false;
		}
		if(checkIfOkay){
			$http({
				method : 'POST',
				url : 'http://localhost:8080/schedule/add',
				headers: { 'Content-Type': 'application/json' },
				data:newSchedule
			}).success(function(data, status) {
				console.log(data);
				$scope.message = "Sucessfully Added. You are good to go";
			}).error(function(data, status) {
				$scope.status = status;
				$scope.data = "Request failed";
			});
		}else{
			$scope.message = "Fields were left empty. Please fill in the requires Details";
		}
		
	};

});

*/

// group controller
app.controller("groupCtrl", function($scope, $http) {
	
	// addGroup -> addGroup
	$scope.addGroup = function (academy,coach) {
		$scope.group.coach = [coach];
		$scope.group.academy = academy;

		$http({
			method : 'POST',
			url : contextRoot +'/group/addGroup',
			data : $scope.group
		}).success(function(data, status) {
			alert("Group added");
		}).error(function(data, status) {
			$scope.status = status;
		});
	};
	
	// getAllGroups -> getGroups
	$scope.getAllGroups = function() {
		$http({
			method : 'GET',
			url : contextRoot +'/group/getGroups'
		}).success(function(data, status) {
			$scope.groups = data;
			
		}).error(function(data, status) {
			$scope.status = status;
		});
	};
	
	// deleteGroup -> deleteGroup
	$scope.deleteGroup = function(grp) {
		$http({
			method : 'POST',
			url : contextRoot +'/group/deleteGroup',
			data : grp
		}).success(function(data, status) {
			alert("Group deleted");
			$scope.getAllGroups();
		}).error(function(data, status) {
			$scope.status = status;
		});
	};
	
	// fetchGroup -> getAGroup
	$scope.fetchGroup = function() {
		$http({
			method : 'POST',
			url : contextRoot +'/group/getAGroup',
			data : $scope.groupData
		}).success(function(data, status) {
			$scope.groupData = data;
		}).error(function(data, status) {
			$scope.status = status;
		});
	};
	
	// updateGroup -> updateGroup
	$scope.updateGroup = function(grp) {
		$http({
			method : 'POST',
			url : contextRoot +'/group/updateGroup',
			data : grp
		}).success(function(data, status) {
			alert("updated");
		}).error(function(data, status) {
			$scope.status = status;
		});
	};
	$scope.getAllCoachID = function(){
		$http({
			method : 'GET',
			url : contextRoot +'/group/allCoachID',
		}).success(function(data, status) {
			console.log(data);
			$scope.allCoach = data;
		}).error(function(data, status) {
			$scope.status = status;
		});
	};
	$scope.fetchAid = function(){
		$http({
			method : 'GET',
			url : contextRoot +'/schedule/getAcademyID',
			headers: { 'Content-Type': 'application/json' },
		}).success(function(data, status) {
			$scope.aid = data;
			//console.log($scope.academyID);
			$scope.enableGroup = true;
		}).error(function(data, status) {
			$scope.status = status;
			$scope.deleteMessage = "Request failed";
		});
	};
	$scope.fetchAid = function(){
		$http({
			method : 'GET',
			url : contextRoot +'/schedule/getAcademyID',
			headers: { 'Content-Type': 'application/json' },
		}).success(function(data, status) {
			$scope.aid = data;
			//console.log($scope.academyID);
		}).error(function(data, status) {
			$scope.status = status;
			$scope.deleteMessage = "Request failed";
		});
	};
	$scope.fetchGid = function(s){
		$http({
			method : 'GET',
			url : contextRoot +'/schedule/getGroupID?id=' + s,
			headers: { 'Content-Type': 'application/json' },
		}).success(function(data, status) {
			//console.log(s);
			//console.log(data);
			$scope.gid = data;
		}).error(function(data, status) {
			$scope.status = status;
			$scope.deleteMessage = "Request failed";
		});
	};
	$scope.addCoach = function(acg, nc){
		acg.coach = [nc];
		console.log(acg);
		$http({
			method : 'POST',
			url : contextRoot +'/group/addCoach',
			data : acg
		}).success(function(data, status) {
			alert("Coach added");
		}).error(function(data, status) {
			$scope.status = status;
		});
	};
});
//Coach Controller
app.controller("coachCtrl", function($scope, $http){
	$scope.addCoach = function(ch){
		if(ch == null || Object.keys(ch).length < 3){
			alert("Fields cannot be left blank");
			return;
		};

		$http({
			method : 'POST',
			url : contextRoot +'/coach/create',
			data : ch
		}).success(function(data, status) {
			alert("Sucessful Operation");
			$scope.fetchAllCoaches();
			return data;
		}).error(function(data, status) {
			alert("Request Failed");
			$scope.status = status;
		});
	};

	$scope.fetchAllCoaches = function(){
		$http({
			method : 'GET',
			url : contextRoot +'/coach/all',
		}).success(function(data, status) {
			$scope.allCoach = data;
		}).error(function(data, status) {
			alert("Request Failed");
			$scope.status = status;
		});
	};
	$scope.updateCoach = function(ch){
		var ret = ch;
		$http({
			method : 'POST',
			url : contextRoot +'/coach/create',
			data : ch
		}).success(function(data, status) {
			alert("Sucessful Operation");
			console.log(data);
			$scope.fetchAllCoaches();
			ret=data;
		}).error(function(data, status) {
			alert("Request Failed");
			$scope.status = status;
		});
		
		return ret;
	};

	$scope.deleteCoach = function(ch){
		$http({
			method : 'POST',
			url : contextRoot +'/coach/delete',
			headers: { 'Content-Type': 'application/json' },
			data:ch
		}).success(function(data, status) {
			//console.log(data);
			alert("Successfully Deleted");
			$scope.fetchAllCoaches();
			$scope.deleteMessage = "Sucessfully Deleted";
		}).error(function(data, status) {
			$scope.status = status;
			$scope.deleteMessage = "Request failed";
		});
	};


});

app.controller("athleteCtrl", function($scope, $http){


	$scope.addAthlete = function(ath, c){
		var mnth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
		if(c.yy%400==0||c.yy%100!=0&&c.yy%4==0){
			if(c.mm == 2 && c.dd > 29){
				alert("Date of Birth Invalid");
				return;
			}else{
				if(mnth[c.mm-1] < c.dd && c.mm != 2){
					alert("Date of Birth Invalid");
					return;
				}
			}
		}else{
			if(c.mm == 2 && c.dd > 28){
				alert("Date of Birth Invalid");
				return;
			}else{
				if(mnth[c.mm-1] < c.dd && c.mm != 2){
					alert("Date of Birth Invalid");
					return;
				}
			}
		}
		
		if(ath == null || ath == undefined){
			alert("Fields cannot be left empty");
			return;
		}
		if(Object.keys(ath).length < 19){
			alert("Fields cannot be left blank");
			return;
		}
		var v = new Date(c.yy,c.mm-1,c.dd,0,0,0,0);
		var date=new Date()
		if(v > date){
			$scope.dateMessage = "Date of Birth should be less than current date";

			//console.log("error");
			alert("Date of Birth should be less than current date");
			return false;
		}
		ath.dob = v.getTime();
		var ageDifMs = Date.now() - v.getTime();
    	var ageDate = new Date(ageDifMs); // miliseconds from epoch
		ath.age =  Math.abs(ageDate.getUTCFullYear() - 1970);
		$http({
			method : 'POST',
			url : contextRoot +'/athlete/addAthlete',
			headers: { 'Content-Type': 'application/json' },
			data: ath
		}).success(function(data, status) {
			alert("Success");
			console.log(data);
		}).error(function(data, status) {
			$scope.status = status;
			$scope.deleteMessage = "Request failed";
		});
	};
	$scope.fetchAid = function(){
		$http({
			method : 'GET',
			url : contextRoot +'/schedule/getAcademyID',
			headers: { 'Content-Type': 'application/json' },
		}).success(function(data, status) {
			$scope.aid = data;
			//console.log($scope.academyID);
			$scope.enableGroup = true;
		}).error(function(data, status) {
			$scope.status = status;
			$scope.deleteMessage = "Request failed";
		});
	};
	$scope.fetchGid = function(s){
		$http({
			method : 'GET',
			url : contextRoot +'/schedule/getGroupID?id=' + s,
			headers: { 'Content-Type': 'application/json' },
		}).success(function(data, status) {
			//console.log(s);
			//console.log(data);
			$scope.gid = data;
		}).error(function(data, status) {
			$scope.status = status;
			$scope.deleteMessage = "Request failed";
		});
	};
	$scope.fetchCid = function(g){
		
		$http({
			method : 'GET',
			url : contextRoot +'/athlete/coachByGroupID?group_id=' + g, 
			headers: { 'Content-Type': 'application/json' },
		}).success(function(data, status) {
			$scope.cid = data;
			//console.log($scope.academyID);
			$scope.enableGroup = true;
		}).error(function(data, status) {
			$scope.status = status;
			$scope.deleteMessage = "Request failed";
		});
	};
	$scope.fetchAth = function(athid){
		$http({
			method : 'GET',
			url : contextRoot +'/athlete/athleteByID?id=' + athid, 
			headers: { 'Content-Type': 'application/json' },
		}).success(function(data, status) {
			var v = new Date(data.dob);
			$scope.dd = v.getDate();
			$scope.mm = v.getMonth()+1;
			$scope.yy = v.getFullYear();
			//console.log($scope.academyID);
			$scope.ath = data;
		}).error(function(data, status) {
			$scope.status = status;
			$scope.deleteMessage = "Request failed";
		});
	};
	$scope.deleteAth = function(ath){
		$http({
			method : 'POST',
			url : contextRoot +'/athlete/deleteAthlete', 
			headers: { 'Content-Type': 'application/json' },
			data:ath
		}).success(function(data, status) {
			$scope.ath = data;
			$scope.viewAth = false;
			alert("Delete Success");
			//console.log($scope.academyID);
		}).error(function(data, status) {
			console.log(data);
			$scope.status = status;
			$scope.viewAth = false;
			alert("Request failed");
		});
	};
	$scope.updtAth = function(ath, d, m, y){
		
		var c = function(d,m,y){
			this.dd = d;
			this.mm = m;
			this.yy = y;
		};
		var v = new c(d,m,y);
		$scope.addAthlete(ath,new c(d,m,y));
		$scope.enableEdit = false;
		$scope.fetchAth(ath.id);
	};
});


// schedule controller { DONT TOUCH }
app.controller("scheduleCtrl", function($scope, $http) {
	
	// init
	$scope.init =function(){
		//console.log("Init");
		var date = new Date();
		$scope.currentDate = formatDate(date);
		//console.log($scope.currentDate);
		$scope.range4=[];
		for (var i = 1; i <= 12; i++) {
			$scope.range4.push(i);
		}
		$scope.fetchAllAcademyID();
		$scope.editAllowed = true;
	};

	//Creating validations and functions
	var mnth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
	
	//Linking to HTML
	//Add Schedule -> schedule/add
	$scope.addSchedule = function(newSchedule, c, u){
		var ch = addScheduleA(newSchedule,c,u);
		if(ch){
			alert("Added successfully");
		}
	};
	var addScheduleA = function(newSchedule,c,u){
		if (newSchedule == null) {
			alert("Fields cant be left empty");
			return false;
		}
		
		if(Object.keys(newSchedule).length < 4){
			alert("Fields should not be left blank");
			return false;
		}

		if(c == undefined || Object.keys(c).length < 5){
			alert("Current date should not be left blank");
			return false;
		}
		if(u == undefined || Object.keys(u).length < 5){
			alert("Updated date should not be left blank");
			return false;
		}
		if(c.yy%400==0||c.yy%100!=0&&c.yy%4==0){
			if(c.mm == 2 && c.dd > 29){
				alert("Invalid Number of days for Feburary. (Scheduled)");
				return;
			}else{
				if(mnth[c.mm-1] < c.dd && c.mm != 2){
					alert("Invalid Number of days (Scheduled)");
					return;
				}
			}
		}else{
			if(c.mm == 2 && c.dd > 28){
				alert("Invalid Number of days for Feburary. (Scheduled)");
				return;
			}else{
				if(mnth[c.mm-1] < c.dd && c.mm != 2){
					alert("Invalid Number of days (Scheduled)");
					return;
				}
			}
		}
		if(c.yy%400==0||c.yy%100!=0&&c.yy%4==0){
			if(u.mm == 2 && u.dd > 29){
				alert("Invalid Number of days for Feburary. (Updated)");
				return;
			}else{
				if(mnth[u.mm-1] < u.dd && c.mm != 2){
					alert("Invalid Number of days (Updated)");
					return;
				}
			}
		}else{
			if(u.mm == 2 && u.dd > 28){
				alert("Invalid Number of days for Feburary. (Updated)");
				return;
			}else{
				if(mnth[u.mm-1] < u.dd && c.mm != 2){
					alert("Invalid Number of days (Updated)");
					return;
				}
			}
		}
		//Check if selected date is greater than current date date
		var v = new Date(c.yy,c.mm-1,c.dd,c.hrs,c.min,0,0);
		var date = new Date()
		console.log(v);
		var v1 = new Date(u.yy,u.mm-1,u.dd,u.hrs,u.min,0,0);
		if(v < date){
			$scope.dateMessage = "Selected Date should be greater than current date";
			//console.log("error");
			alert("Selected Date should be greater than current date");
			return false;
		}
		if(v1 < date){
			$scope.dateMessage = "Updated Date should be greater than current date";
			//console.log("error");
			alert("Updated Date should be greater than current date");
			return false;
		}
		newSchedule.date_time = v.getTime();
		newSchedule.updated_time = v1.getTime();
		//console.log(newSchedule);
		
			
		$http({
			method : 'POST',
			url : contextRoot +'/schedule/add',
			headers: { 'Content-Type': 'application/json' },
			data:newSchedule
		}).success(function(data, status) {
			//console.log(data);
			$scope.getAll();
			alert("Sucessful Operation");
			return data;
		}).error(function(data, status) {
			$scope.status = status;
			$scope.data = "Request failed";
			return false;
		});
		
	};
	//Update Schedule
	$scope.updateSchedule = function(Schedule, sc, su) {
		var ch = addScheduleA(Schedule, sc, su);
		
		if(ch){
			alert("Updated successfully");
		}
		return ch;
	};


	//Delete Schedule
	$scope.deleteSchedule = function(Schedule){
		$http({
			method : 'POST',
			url : contextRoot +'/schedule/delete',
			headers: { 'Content-Type': 'application/json' },
			data:Schedule
		}).success(function(data, status) {
			//console.log(data);
			alert("Successfully Deleted");
			$scope.getAll();
			$scope.deleteMessage = "Sucessfully Deleted";
		}).error(function(data, status) {
			$scope.status = status;
			$scope.deleteMessage = "Request failed";
		});
	};

	//Get All Schedules
	
	$scope.getAll = function(){
		//console.log("Trigger");
		$http({
			method : 'GET',
			url : contextRoot +'/schedule/getAll',
			headers: { 'Content-Type': 'application/json' },
		}).success(function(data, status) {
			$scope.allSchedules = data;
			//console.log($scope.allSchedules);
		}).error(function(data, status) {
			$scope.status = status;
			$scope.message = "Request failed";
		});
	};

	//Additional Methods for processing
	$scope.fetchAllAcademyID = function(){
		$http({
			method : 'GET',
			url : contextRoot +'/schedule/getAcademyID',
			headers: { 'Content-Type': 'application/json' },
		}).success(function(data, status) {
			$scope.academyID = data;
			//console.log($scope.academyID);
			$scope.enableGroup = true;
		}).error(function(data, status) {
			$scope.status = status;
			$scope.deleteMessage = "Request failed";
		});
	};
	$scope.formatDate1 = function(milli){
		var fdate = new Date(milli);
		$scope.day = fdate.getDate();
		$scope.month = fdate.getMonth()+1;
		$scope.year = fdate.getFullYear();
	};

	$scope.fetchAllGroupID = function(s){
		$http({
			method : 'GET',
			url : contextRoot +'/schedule/getGroupID?id=' + s,
			headers: { 'Content-Type': 'application/json' },
		}).success(function(data, status) {
			//console.log(s);
			//console.log(data);
			$scope.groupID = data;
		}).error(function(data, status) {
			$scope.status = status;
			$scope.deleteMessage = "Request failed";
		});
	};

	$scope.resetForm = function(){
		$scope.user = angular.copy($scope.initial);
	};

	$scope.cpy = function(){
		if($scope.cpyDate){
			$scope.u = $scope.c;
		}else{
			$scope.u = null;
		}
	};

	$scope.dispDate = function(date) {
		var d = new Date(date);
		var obj = {
			dd : d.getDate(),
			mm : d.getMonth()+1,
			yy : d.getFullYear(),
			hrs: d.getHours(),
			min : d.getMinutes()
		};
		return obj;
	};
});

function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return [year, month, day].join('-');
}