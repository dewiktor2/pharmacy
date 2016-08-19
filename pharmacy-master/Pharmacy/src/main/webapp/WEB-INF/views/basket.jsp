<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/resources/myTh/css/moje.css" />"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Koszyk</title>
</head>


<body>
	<h6 >Koszyk</h6>

	<div id="basket">

		<table>
			<f:form modelAttribute="cart" action="addCart" method="POST">

				<tr>
					<td>
						<h3>ID:</h3> <f:input class="textbox" path="ID" />
					</td>
				</tr>

				<tr>
					<td>
						<h3>name:</h3> <f:input class="textbox" path="name" />
					</td>
				</tr>
				<tr>
					<td>
						<h3>price:</h3> <f:input class="textbox" path="price" />
					</td>
				</tr>
				<tr>
					<td>
						<h3>quantity:</h3> <f:input class="textbox" path="quantity" />
					</td>
				</tr>



				<td><a href="cart.html" class="shiny-button"> Aktualna
						Zawartosc Koszyka </a> <input type="submit" class="shiny-button"
					value="Add to Cart" /></td>

				<th></th>



			</f:form>




		</table>

	</div>


</body>

</html>