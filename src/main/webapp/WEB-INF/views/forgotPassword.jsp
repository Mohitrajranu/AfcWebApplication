<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ForgotPassword</title>
</head>
<body>
Enter your registered email address:
	<form action="resetPassword" method="post">
		<table>
			<tr>

				<td colspan="2"><input type="text" name="email"> </td>
			</tr>
			
			<tr>
				<td><input type="Submit" value="Reset Password">  </td>
				<td><input type="reset" value="Cancel">  </td>
			</tr>
			
		</table>
	</form>
</body>
</html>