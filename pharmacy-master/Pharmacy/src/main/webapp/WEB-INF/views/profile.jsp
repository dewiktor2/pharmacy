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
	  <jsp:include page="succes.jsp"></jsp:include>
	  
	  
	  
	  	<div class="row">
			<div class="col-lg-10 col-sm-12 col-md-12  col-xs-12 ">
				<fieldset>
	<h2>Twój <small>profil</small></h2>
	
	    	 <c:choose>
				<c:when test="${ not empty logInSession}">
				<div class="alert alert-info" style="width:300px">
  <strong>Jesteś zalogowany</strong> jako ${user.username }  
</div>

					
		
					
			</c:when>

				
				</c:choose>
	  
	    <c:choose>
				<c:when test="${ not empty info}">
				<div class="alert alert-success" style="width:300px">
  <strong>Sukces!</strong> Edycja danych zakończona
</div>
				</c:when>
				</c:choose>
	 
	    <c:choose>
				<c:when test="${ not empty add}">
				<div class="alert alert-success" style="width:300px">
  <strong>Sukces!</strong> Edytowano adres zamieszkania!
</div>
				</c:when>
				</c:choose>
	 
	      <c:choose>
				<c:when test="${ not empty payment}">
				<div class="alert alert-success" style="width:300px">
  <strong>Sukces!</strong> Zapłaciłes za zamówienie!
</div>
				</c:when>
				</c:choose>
				
	  
	
			
				<fieldset>
	<h2>Twój <small>profil</small></h2>
	
	
	 
	
	</fieldset>
	

	
		
   			<a href="<spring:url value="/user/profile/customerOrderList?id=${user.user_id}"/>" class="btn">
                    Twoje zamówienia
                </a>
                
                
           		
   			 <a href="<spring:url value="/user/profile/userInfoForm?id=${user.user_id} "/>" class="btn">
                   Edytuj swoje dane 
                </a> 
                 <a href="<spring:url value="/user/profile/userDetails?id=${user.user_id}"/>" class="btn">
                   Dodaj swój adres
                </a> 
                
                  <a href="<spring:url value="/user/profile/actualAddress?id=${user.user_id} "/>" class="btn">
                   Wyswietl aktualny adres
                </a> 
                
	
	
	  
	  
	  
	  
	  
	
	<h2>Aktualne <small>dane</small></h2>
	

					
		<form:form modelAttribute="user"
action="userInfoForm"
method="get" class="form-horizontal">
	
		
			
			
			<div class="form-group">
			<label class="col-xs-3 control-label">	Imie: </label>
				
				<div class="col-xs-5" style="padding-left: 40px; padding-top: 6px; ">
	             	<form:input path="name" required="required"  readonly="true"  />
					<form:errors path="name" cssStyle="color:red"/>
					</div>
			
			</div>
			
			<div class="form-group" >
			
		<label class="col-xs-3 control-label"  >		Nazwisko: </label>
				
				<div class="col-xs-5" style="padding-left: 40px; padding-top: 6px; ">
	             	<form:input path="surname"  name="surname" required="required" readonly="true" />
					<form:errors path="surname" cssStyle="color:red"/>
				</div>
				
			
			</div>
			
			<div class="form-group">
			
			
		<label class="col-xs-3 control-label">		Email:   </label>
				
				<div class="col-xs-5" style="padding-left: 40px; padding-top: 6px; ">
				 <form:input type="email" name="email" path="email" required="required" readonly="true" />
					<form:errors path="email" cssStyle="color:red"/>
					</div>
				
					</div>
					
					
					
						<div class="form-group">
			
			
		<label class="col-xs-3 control-label">		Oddzial NFZ:   </label>
				
				<div class="col-xs-5" style="padding-left: 40px; padding-top: 6px; ">
				 <form:select path="userNfzDetails.id" items="${userDetail}" itemLabel="name" itemValue="id" readonly="true" disabled="true" />
					</div>
				
					</div>
					
	
	
					
				</form:form>
				</fieldset>
			</div>
	</div>
	</div>		
				
		
	

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>