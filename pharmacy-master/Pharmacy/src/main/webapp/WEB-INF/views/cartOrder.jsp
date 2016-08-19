<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="header.jsp"></jsp:include>
<body>

		

<div class="container">




	

	
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span9">
				<fieldset>
				<legend>Karta </legend>
					  <div class="table-responsive">
				    <table class="table table-hover">
				    <thead>
				<tr>	  
			<th>nazwa</th>
			<th>firma</th>
			<th>cena</th>
			<th>ilosc</th>
			<th>cena za produkty</th>
				</tr>	   
				 </thead>
				 <tbody>
				<c:set var="sum" value="0" > </c:set>
<c:forEach var="it" items="${sessionScope.cart}"> 
<c:set var="sum" value="${ sum + it.product.price * it.quantity} " > </c:set>
	<tr>
		
		<td>${it.product.name}</td>
		<td>${it.product.factory}</td>
		<td><b><fmt:formatNumber type="CURRENCY" value="${it.product.price}"
			currencySymbol="ZŁ" /></b> </td>
		<td>${it.quantity}</td>
		<td><b><fmt:formatNumber type="CURRENCY" value="${it.product.price * it.quantity }" currencySymbol="ZŁ" /></b> </td>
	<tr>
	
	</c:forEach>
	<tr>
		<td align="right"> Suma do zapłaty :  <td>
		 <b><fmt:formatNumber type="CURRENCY" value="${sum }" currencySymbol="ZŁ"/> </b>
	</tr>
	</tbody>
</table>
</div>
</div>


    		
				</fieldset>
			</div>
		</div>
	

<div class="span1">
    <a  onclick="return confirm('Chcesz złożyć zamówienie  ?') "  href="<spring:url  value="realize.html"   /> " class="btn btn-default">
        <i class="icon-pencil icon-white"></i>
        <span><strong>Zrealizuj Zakupy</strong></span>            
    </a>
</div>		


</div>

</div>



<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>