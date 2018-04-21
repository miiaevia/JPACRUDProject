<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Non-Profit</title>
</head>
<body>
	<h3>Company:</h3>
	<br>
	<table>
		 <tr>
			<td>Abbreviation:</td>
			<td>${nonprofit.abbr}</td>
		</tr>
		 <tr>
			<td>Name:</td>
			<td>${nonprofit.name}</td>
		</tr>
		 <tr>
			<td>Description:</td>
			<td>${nonprofit.description}</td>
		</tr>
		 <tr>
			<td>Cause:</td>
			<td>${nonprofit.cause}</td>
		</tr>
		 <tr>
			<td>Year Founded:</td>
			<td>${nonprofit.yearFounded}</td>
		</tr>
	</table>
	<br>
	<h3>Update Non-Profit:</h3>
	<form action="updateNonprofit.do" method="POST">
		<label for="abbr">Abbreviation</label>
		<input type="text" name="abbr"> <br>
		
		<label for="name">Name</label>
		<input type="text" name="name"> <br>
		
		<label for="description">Description</label>
		<input type="text" name="description"> <br>
		
		<label for="cause">Cause</label>
		<select name="cause">
			<option value="Humanitarian - Local">Humanitarian - Local</option>
			<option value="Humanitarian - International">Humanitarian - International</option>
			<option value="Animals">Animals</option>
			<option value="Environmental">Environmental</option>
			<option value="Scientific Research">Scientific Research</option>
		</select> <br>
		
		<label for="yearFounded">Year Founded</label>
		<input type="hidden" value="${nonprofit.id }" name="id">
		<input type="number" step="1" max="2018" name="yearFounded"> <br>
	<input type="submit" value="Update Non-Profit">
	</form>
	<form action="index.do" method="GET">
    <button type="submit" name="index.do" value="index.do">Return Home</button>
</form>
</body>
</html>