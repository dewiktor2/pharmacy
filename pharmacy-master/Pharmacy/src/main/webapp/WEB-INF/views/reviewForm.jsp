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
		<c:choose>
	
			<c:when test="${ not empty error}">
				<div class="alert alert-danger" style="width: 300px">
					<strong>Powrócono do kroku 1!</strong> błąd w polu opinia
				</div>


			</c:when>

<c:when test="${ not empty errorLista}">
				<div class="alert alert-danger" style="width: 300px">
					<strong>Powrócono do kroku 1!</strong> Nie wybrano produktu z zamówienia
				</div>


			</c:when>


		</c:choose>
		
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
	<legend><h3>Opiniowanie<small>  krok 1.</small></h3></legend>
	

		
					
		<form:form class="form-horizontal"  method="post" commandName="reviewViewModel">
		
	
			
				
			<div class="form-group">
			
			<label class="col-xs-2 control-label">		  </label> 
				
				<div class="col-xs-5" >
					<div class="alert alert-info" style="width: 300px ; margin-left: -40px; ">
					<strong>Wypełninij formularz opinii na temat produktu.</strong>
					</div>
					</div>
				
					</div>
					<div class="form-group">
				
					
			<label class="col-xs-2 control-label">		<h4>Opiniowany<small>  produkt</small></h4>  </label> 
				<div class="col-xs-6" ">	
			<form:select class="select1" path="product.name"  style="margin-top:18.5px;" >
 <form:option value="NONE" label="--- Wybierz produkt z listy ---" />
   <form:options items="${reviewViewModel.product.orderitems}"  itemValue="itemID"  itemLabel="product.name"   />
   <form:errors path="product.name" cssStyle="color:red"/>
</form:select>
			</div>
			
				</div>
				
					
			<div class="form-group">
			
			<label class="col-xs-2 control-label">		<h4 style="margin-top:42px;">Twoja<small>  opinia</small></h4 >  </label> 
				
				<div class="col-xs-5" >
				<form:textarea rows="5" cols="30" path="review.review" style="margin-top:15px;"/>
				<form:errors path="review.review" cssStyle="color:red"/>
					</div>
				
					</div>
			
		
			  <div class="form-group">
        <div class="col-xs-9 col-xs-offset-3">
            <button type="submit" class="btn btn-primary" name="Edit" value="Edytuj">Opiniuj</button>
        </div>
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