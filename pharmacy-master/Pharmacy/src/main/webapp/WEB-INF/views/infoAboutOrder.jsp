<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="header.jsp"></jsp:include>
<body>



<div class="container">

<jsp:include page="succes.jsp"></jsp:include>

<div class="page-header">
    <h1>Detale <small>zamówienia</small></h1>
</div>

<div class="panel panel-primary">
    <div class="panel-heading">Info</div>
    <div class="panel-body">
        <p></p>
    </div>

    <div class="table-responsive">
        <table class="table ">
            <thead>
              		<tr>	  
		               
			            <th>Ilosc</th>
			<th>Id_zamowienia</th>
			<th>Nazwa produktu</th>
			<th>Cena</th>
			
				</tr>
            </thead>
            <tbody>
          	<c:forEach items="${info}" var="info">
			<tr>
				
				<td>${info.quantity}</td>
				
				<td>${info.customerOrder.orderID}</td>
				
				<td>${info.product.name}</td>
			
				<td>${info.product.price}</td>
				
			</tr>
			
		</c:forEach> 
           
        </tbody>
    </table>
            
        
    </div>
  
    
</div>

      
       </div>         


<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>