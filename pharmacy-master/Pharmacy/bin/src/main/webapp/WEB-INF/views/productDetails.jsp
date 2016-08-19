
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/resources/myTh/css/moje.css" />"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>


<H1>Dane Produktu</H1>
Id: <b>${product.id}</b><br/>
nazwa: <b>${product.name}</b><br/>
firma: <b>${product.factory}</b><br/>
Cena: <b>${product.price}</b><br/>
Data produkcji <b>${product.productionDate}</b><br/>
Typ: <b>${product.type.name}</b><br/>
Akcesoria: <br/>
<c:choose>
						<c:when test="${empty product.accessories}">
							Brak
						</c:when>
						<c:otherwise>
							<c:forEach items="${product.accessories}" var="Accessory" varStatus="stat">
								<c:if test="${stat.index != 0}">
									<br/>
								</c:if>
								${stat.index}. <b>${Accessory.name}</b>,
							</c:forEach>
						</c:otherwise>
					</c:choose>
							
<br/>
<a href="productList.html">Wstecz</a>
</body>
</html>