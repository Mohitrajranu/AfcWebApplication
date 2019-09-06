/**
 * nabin
 */
"use strict";
var contextRoot = "/" + window.location.pathname.split('/')[1];
(function(){
	$(document).ready(function(){
		datePickerInitialize();
		intialloadSuperviseBy();
		$("#departmentDDl").change(function(){
			var id = $("#departmentDDl").val();
			
			loadSupervisedBy(id);
		});
	});
	var intialloadSuperviseBy=function(){
		console.log("intialloadSuperviseBy id=")
		var id = $("#departmentDDl").val();
		
		loadSupervisedBy(id);
	};
	
	var datePickerInitialize= function(){
		console.log("inside datepickerInitialize")
			$("#dateOfBirth").datepicker({			
				format:'yyyy-mm-dd'
			});
			$("#joinedDate").datepicker({			
				format:'yyyy-mm-dd'
			});
			$("#contractDate").datepicker({			
				format:'yyyy-mm-dd'
			});
	};
	
	var loadSupervisedBy= function(departmentId){
		$.ajax({
			type : 'GET',
			url : contextRoot +'/employee/loadSuperVisor',
			dataType : "json", // Accepts
			data : 'departmentId='+departmentId, // sending form data into json
			
			success:function(result){
				//alert("success");
				console.log("success");
				var selectList = $("#superviseByDDl");
				selectList.empty();
			    //don't forget error handling!
			    $.each(result, function(i,item) {
			    	console.log("i="+i);
			    	console.log("id="+item.Id);
			    	console.log("name="+item.name);
			    	selectList.append($("<option />").val(item.Id).text(item.name));
			    });
				 	
				
			},
		error:function(XMLHttpRequest, textStatus){
			//alert("success");
	           //alert("abc"+textStatus.message);
			}
		});
	}
	
})();

