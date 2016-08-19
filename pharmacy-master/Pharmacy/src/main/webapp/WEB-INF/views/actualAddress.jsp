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

<div class="page-header">
<c:choose>
		<c:when test="${not empty logInSessionAdmin}">
		<h1>Adres <small>użytkownika</small></h1>
</c:when>
</c:choose>

<c:choose>
		<c:when test="${ empty logInSessionAdmin}">
		 <h1>Twój <small>adres</small></h1>
</c:when>
</c:choose>
  
</div>

<div class="panel panel-primary">
    <div class="panel-heading">Adres</div>
    <div class="panel-body">
        <p></p>
    </div>

    <div class="table-responsive">
        <table class="table ">
            <thead>
              		<tr>	  
		               
			            <th>Miasto</th>
			<th>Kod Pocztowy</th>
			<th>Ulica</th>
			<th>Nr domu/mieszkania</th>
			
				</tr>
            </thead>
            <tbody>
         <td> ${detail.city}</td>
         <td> ${detail.postcode}</td>
         <td> ${detail.adres1}</td>
         <td> ${detail.adres2}</td>
         
       
       
        </tbody>
    </table>
            
        
    </div>
  
    
</div>

      			<c:choose>
		<c:when test="${not empty logInSessionAdmin}">



<a href="<spring:url value="/admin/users/"/>" class="btn">
                   Kontrola
                </a>


						</c:when>
	</c:choose>
       </div>      
					
				
		
		
	</div>	
	
			

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>