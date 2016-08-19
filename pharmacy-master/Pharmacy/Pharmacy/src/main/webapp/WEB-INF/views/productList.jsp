<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
 <link href="<c:url value="/resources/myTh/css/main.css" />" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body> 
<H1>Lista Produktów</H1>
<H3>Implementacja widoku z tagów JSTL(JSP Standard Tags Library)</H3>

<c:if test="${empty productList}">
	Lista produktow jest pusta
</c:if>

<c:if test="${not empty productList}">
	Lista zawiera ${fn:length(productList)} produktów
	
	<c:set var="boundMin" value="${25}"/>
	<c:set var="boundMax" value="${40}"/>
	
	<table border="1">
		<tr>
			<th>Nazwa</th>
			<th>Firma</th>
			<th>Data produkcji</th>
			<th>Cena</th>
			<th>Opinia</th>
			<th>Opcje</th>
		</tr>
		<c:forEach items="${productList}" var="product">
			<tr>
				<td>
					<a href="?id=${product.id}">${product.name}</a>
				</td>
				<td>${product.factory}</td>
				<td><fmt:formatDate  value="${product.productionDate}"  type="date" timeStyle="medium"/></td>
				<td><fmt:formatNumber type="CURRENCY" value="${product.price}"  currencySymbol="PLN"/></td>
				<td>
					<c:choose>
						<c:when test="${product.price lt boundMin}">
							TANI
						</c:when>
						<c:when test="${product.price gt boundMax}">
							DROGI
						</c:when>						
						<c:otherwise>
							ŚREDNI
						</c:otherwise>
					</c:choose>
				</td>
				<td>
					<a href="?did=${product.id}">Usuń</a>
					<a href="productForm.html?id=${product.id}">Edytuj</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	
</c:if>

<a href="productForm.html">Dodaj Nowy</a>
