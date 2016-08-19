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
			
	<h1>Opcje <small>dostawy</small></h1>
	
		<div class="alert alert-info" style="width: 300px">
					<strong>Całkowity koszt zamówienia wraz z kosztami wybranej przesyłki zostanie wysłany na adres email</strong> 
					
				</div>
					
			
		
		<form:form class="form-horizontal"  method="post" commandName="customerOrder">
		
			<div class="form-group">
		
			<label class="col-xs-3 control-label">	  <h4>Sposob dostawy <small>zamówienia*</small></h4>  </label> </label>
			
					<div class="col-xs-5" >
					<form:select path="deliver.id" items="${deliverOption}" itemLabel="name" itemValue="id" style="margin-top:19px;"/>
					</div>
			</div>
			
				
			<div class="form-group">
			<label class="col-xs-3 control-label" >	<h4>Koszt  <small>zamówienia bez przesylki*</small></h4>  </label> 
				
				<div class="col-xs-5" >
	             	<form:input path="totalCost" required="required"  style="margin-top:19px;"/>
					</div>
					
					
			
			</div>
				<div class="form-group">
			
			<label class="control-label">	 </label>
				
				<div class="controls">
				<form:hidden path="status" />
				
					</div>
					
				</div>		
			
					
					<div class="control-group">
			
			<label class="control-label">	 </label>
			
				<div class="controls">
					<form:hidden path="orderDate" />
			
					</div>
					
						</div>
			

				<div class="control-group">
			
			
			
				<div class="col-xs-5">
						<form:hidden path="user" />
			
					</div>
					
						</div>
						
							<div class="control-group">
			
			<label class="control-label">	 </label>
			
				<div class="controls">
					<form:hidden path="orderID" />
			
					</div>	
					
					
			
			
    		  <div class="form-group">
        <div class="col-xs-9 col-xs-offset-3">
           <input type="submit" class="btn " name="save" value="Zapisz" />

				 <input type="submit" class="btn" name="cancel" value="Anuluj" />
           
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