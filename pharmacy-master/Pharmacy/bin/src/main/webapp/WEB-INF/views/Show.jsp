<%@ page language="java" contentType="text/html; charset=ISO-8859-2"
	pageEncoding="ISO-8859-2"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/resources/myTh/css/moje.css" />"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Apteka Internetowa</title>
</head>
<body>
<H2>
		<c:choose>
			<c:when test="${operationType eq 'edit'}">
			<h3>	Operacja edycji danych przebieg³a pomy¶lnie </h3>
			</c:when>
			<c:otherwise>
		<h3>		Operacja dodawania nowego elementu przebieg³a pomy¶lnie </h3>
			</c:otherwise>
		</c:choose>
	</H2>

	<H1>Dane zapisanego produktu</H1>
	Id:
	<b>${product.id}</b>
	<br /> nazwa:
	<b>${product.name}</b>
	<br /> firma:
	<b>${product.factory}</b>
	<br /> Cena:
	<b><fmt:formatNumber type="CURRENCY" value="${product.price}"
			currencySymbol="PLN" /></b>
	<br /> Data produkcji
	<b><fmt:formatDate value="${product.productionDate}" type="date"
			timeStyle="medium" /></b>





<a href="productList.html">Wstecz</a>
</body>
</html>