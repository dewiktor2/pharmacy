<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
			<div class="span12">
				<fieldset>
	<h3>Opiniowanie<small>  krok 1.</small></h3>
	
          
					
		<form:form class="form-horizontal"  method="post" commandName="product">
		
			<div class="control-group">
			<div class="alert alert-info" style="width: 300px">
					<strong>Wybierz produkt do opinii z tego zamówienia.
					
				</strong>
				</div>
				
	       
	 
			
			<label class="labelka">
			
			<form:select class="select1" path="name"  >
   <form:option value="NONE" label="--- Wybierz produkt z listy ---"/>
   <form:options items="${product.orderitems}"  itemValue="itemID"  itemLabel="product.name" />
</form:select>
			</label>
			</br>
			
	

			<br/>
			<div class="form-actions">
						<button type="submit" class="btn btn-success">Submit</button>
					</div>
					
				</form:form>
				</fieldset>
			</div>
		</div>
	</div>		
					
				

</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>