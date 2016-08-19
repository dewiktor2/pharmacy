<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="header.jsp"></jsp:include>
<body> 


		
	  <div class="container">
	  
<div class="page-header">
    <h1>Lista <small>zamówien</small></h1>
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
		               
			            <th>Status</th>
			            <th>Data</th>
			            <th>IdZamowienia</th>
			            <th>Opcje</th>
			
				</tr>
            </thead>
            <tbody>
            <c:forEach items="${customerList}" var="customer">
                   <tr>
            	<td > ${ customer.status}</td>
   			<td > ${ customer.orderDate}</td>
		    <td >  <a href="<spring:url value="/user/profile/infoAboutOrder/${customer.orderID}"/>" 
	 class="btn">
                    	    ${customer.orderID}
                </a> 
                </td>
    
    
                <c:choose>
                <c:when test="${not empty logInSession}">
                <c:if test="${customer.status=='Oczekiwanie'}">
   			<td >  <a href="<spring:url value="/user/profile/payment/${customer.orderID}"/>" class="btn">
                    Zaplac
                    </c:if>
                    </c:when>
				</c:choose>	
                </a> 
		
      		
				</td>
				
				
				<td >
				
				<c:choose>
				<c:when test="${not empty logInSession}">
				<c:if test="${customer.status=='Zrealizowano'}">
					 <a href="<spring:url value="/user/review/reviewForm/?id=${customer.orderID}"/>" class="btn">
                   Opinia 
                </a> 
					</c:if>
				
					</c:when>
				</c:choose>	
				</td>
			</tr>
            
               
         
						
						
						
						
         
           </c:forEach> 
           
        </tbody>
    </table>
            
        
    </div>
  
    
</div>
    
    
	


		
   			<a href="<spring:url value="/user/profile"/>" class="btn">
                    Profil
                </a>

</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>


   </html>             