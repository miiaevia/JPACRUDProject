<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Non-Profit</title>
</head>
<body>
	
	<form action="addNonprofit.do" method="POST">
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
		<input type="number" step="1" max="2018" name="yearFounded"> <br>
	<input type="hidden" value="${nonprofit.id }" name="id">	
	<input type="submit" value="Add Non-Profit">
	</form>
	
</body>
</html>