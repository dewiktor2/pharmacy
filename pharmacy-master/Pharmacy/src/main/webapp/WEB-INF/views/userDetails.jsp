<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<html>

		<jsp:include page="header.jsp"></jsp:include>  
<body>  

<div class="container">
	  
		 <div id="new_div">
	   <section id="main_section">
				<header>
				<hgroup>
				</hgroup>
				</header>
					<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<fieldset>
	<h1>Dodaj<small> swoj adres</small></h1>
	

					
		<form:form class="form-horizontal"  method="POST"   commandName="detal" >
		
		
			
			<div class="control-group">
			
		<label class="control-label">		kod pocztowy: </label>
				
				<div class="controls">
	             	<form:input path="postcode"/>
					<form:errors path="postcode" cssStyle="color:red"/>
				</div>
				
			
			</div>
			
			<div class="control-group">
			
			
		<label class="control-label">		miasto:   </label>
				
				<div class="controls">
				<form:input path="city"/>
					<form:errors path="city" cssStyle="color:red"/>
					</div>
				
					</div>
					
			<div class="control-group">
			
			<label class="control-label">	adres1:  </label>
				
				<div class="controls">
				<form:input path="adres1"/>
					<form:errors path="adres1" cssStyle="color:red"/>
					</div>
					
				</div>		
					
					<div class="control-group">
			
			<label class="control-label">	adres2: </label>
			
				<div class="controls">
					<form:input path="adres2"/>
					<form:errors path="adres2" cssStyle="color:red"/>
					</div>
					
						</div>
			
	
			
			</br>
			<div class="form-actions">
						<button type="submit" class="btn btn-success">Zapisz</button>
						  <a href="<spring:url value="/user/profile "/>" class="btn">
                   Wstecz
                </a> 
					</div>
					
				</form:form>
				</fieldset>
			</div>
		</div>
	</div>		
					
				
			
			
				
		
			
				
		
			
				
	
	   </section>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>  
</body>


</html>