<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Non-Profit</title>
</head>
<body>
<h2>Non-Profit</h2>
	<form action="deleteNonprofit.do" method="POST">
	<input type="hidden" value="${nonprofit.id }" name="id">
    <button type="submit" name="deleteNonprofit" value="deleteNonprofit">Delete Non-Profit</button>
</form>
	<h4>${nonprofit.name} <p>${nonprofit.abbr}</p></h4>
	<p>Founded: ${nonprofit.yearFounded }</p>
	<p>${nonprofit.description }</p>
</body>
</html>