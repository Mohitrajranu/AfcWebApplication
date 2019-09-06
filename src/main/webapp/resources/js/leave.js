var contextRoot = "/" + window.location.pathname.split('/')[1];

function approveCall(id) {
	alert(contextRoot+"/updateLeave" +id)
	$.ajax({
		type : 'GET',
		url : contextRoot + '/updateLeave',
		dataType : "json", // Accepts
		data : 'id=' + id, // sending form data into json
		contentType : 'application/json', // Sends

		success : function(result) {

			$("#approveId" + id).prop("disabled", true);
			$("#rejectId" + id).prop("disabled", true);
			alert("SuccessFully Updated");

		},
		error : function(XMLHttpRequest, textStatus) {

			alert("abc" + errorObject.message);
		}
	});
}
//function approveCall(id) {
//	$.ajax({
//		type : 'GET',
//		url : contextRoot + '/updateLeave',
//		dataType : "json", // Accepts
//		data : 'id=' + id, // sending form data into json
//		contentType : 'application/json', // Sends
//
//		success : function(result) {
//
//			$("#approveId" + id).prop("disabled", true);
//			$("#rejectId" + id).prop("disabled", true);
//			$("#forwardId" + id).prop("disabled", true);
//			alert("SuccessFully Updated");
//
//		},
//		error : function(XMLHttpRequest, textStatus) {
//
//			alert("abc" + errorObject.message);
//		}
//	});
//}

function rejectCall(id) {
	alert("Reject SuccessFul");
	$("#rejectId" + id).prop("disabled", true);
}

