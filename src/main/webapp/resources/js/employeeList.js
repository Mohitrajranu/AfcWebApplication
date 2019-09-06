/**
 * Nabin
 */
"use strict";
var contextRoot = "/" + window.location.pathname.split('/')[1];
(function(){
	
	$(document).ready(function(){
		console.log("ready");
		//toggleactive(1);
	});
	

	
})();
var toggleactive=function(id) {
	console.log("click");
		$.ajax({
				type : 'GET',
				url : contextRoot +'/employee/toggleActive',
				dataType : "json", // Accepts
				data : 'employeeId='+id, // sending form data into json
				contentType : 'application/json', // Sends
				
				success:function(result){
					//alert("success");
					console.log(result.msg);
					 	$("#status"+id).html(result.msg);
						if(result.msg=="Active"){
							 $("#togglebutton"+id).html('<input type="button"  value="MakeInActive" name="view"  onclick="toggleactive('+id+')"/>');
							 
						}
						else{
							 $("#togglebutton"+	id).html('<input type="button"  value="MakeActive" name="view"  onclick="toggleactive('+id+')"/>');
							 
						}
					
				},
			error:function(XMLHttpRequest, textStatus){
				alert("error");
		           alert("abc"+errorObject.message);
				}
	});
};

var viewDetailClick= function(id){
	window.location=contextRoot+"/employee/showProfile/"+id;
};


