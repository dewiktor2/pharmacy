<%@ page language="java" contentType="text/html; charset=ISO-8859-2"
	pageEncoding="ISO-8859-2"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.jsp"></jsp:include>
<html>


<body>


<div class="container">


		<c:choose>
				<c:when test="${ not empty add}">
				<div class="alert alert-success" style="width:400px">
  <strong>Sukces!</strong> Operacja dodawania zosta³a zakoñczona
</div>
			<h1>Dane  <small>produktu</small></h1>
	Id:
	<b>${add.id}</b>
	<br /> nazwa:
	<b>${add.name}</b>
	<br /> firma:
	<b>${add.factory}</b>
	<br /> Cena:
	<b><fmt:formatNumber type="CURRENCY" value="${add.price}"
			currencySymbol="PLN" /></b>
	<br /> Data produkcji
	<b><fmt:formatDate value="${add.productionDate}" type="date"
			timeStyle="medium" /></b>
					</c:when>
		   	<c:when test="${ not empty edit}">
				<div class="alert alert-success" style="width:400px">
  <strong>Sukces!</strong> Operacja edycji zosta³a zakoñczona
</div>
					<h1>Dane  <small>produktu</small></h1>
	Id:
	<b>${edit.id}</b>
	<br /> nazwa:
	<b>${edit.name}</b>
	<br /> firma:
	<b>${edit.factory}</b>
	<br /> Cena:
	<b><fmt:formatNumber type="CURRENCY" value="${edit.price}"
			currencySymbol="PLN" /></b>
	<br /> Data produkcji
	<b><fmt:formatDate value="${edit.productionDate}" type="date"
			timeStyle="medium" /></b>
					
					</c:when>
		
				
				
				</c:choose>
	


	






</div>
<jsp:include page="footer.jsp"></jsp:include>
<body>

</html>