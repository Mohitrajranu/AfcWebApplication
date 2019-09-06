/**
 * 
 */
var contextRoot = "/" + window.location.pathname.split('/')[1];

function checkinCall(id) {
	$.ajax({
		type : 'GET',
		url : contextRoot + '/checkin',
		dataType : "json", // Accepts
		data : 'id=' + id, // sending form data into json
		contentType : 'application/json', // Sends
		success : function(result) {
			$("#checkinId").prop("disabled", true);
			$("#checkoutId").prop("disabled", false);
			alert("Checkin successfully");

		},

		error : function(XMLHttpRequest, textStatus) {

			alert("abc" + errorObject.message);
		}

	});
}
function checkoutCall(id) {
	$.ajax({
		type : 'GET',
		url : contextRoot + '/checkout',
		dataType : "json", // Accepts
		data : 'id=' + id, // sending form data into json
		contentType : 'application/json', // Sends
		success : function(result) {
			$("#checkinId").prop("disabled", true);
			$("#checkoutId").prop("disabled", true);
			alert("Checkout Successfully");

		},

		error : function(XMLHttpRequest, textStatus) {

			alert("abc" + errorObject.message);
		}

	});
}