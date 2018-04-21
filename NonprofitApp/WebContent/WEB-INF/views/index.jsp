<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Non-Profits</title>
</head>
<body>
	<h1>Non-Profit List</h1>
	<!-- <p>${message }</p> (unable to add non profit message)-->
	<!-- Put ADD Nonprofit button here -->
	<form action="addNonprofit.do" method="GET">
    <button type="submit" name="addNonprofit" value="addNonprofit">Add Non-Profit</button>
</form>
	<!-- This is to show list of Nonprofits -->
	<form action="index.do" method="GET">
		<c:choose>
			<c:when test="${! empty nonprofits}">
				<c:forEach var="np" items="${nonprofits }">
					<br>
					<a href="getNonprofit.do?npid=${np.id }">${np.name }</a>
					<br>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<p>Non-Profits list not found</p>
			</c:otherwise>
		</c:choose>
	</form>

</body>
</html>