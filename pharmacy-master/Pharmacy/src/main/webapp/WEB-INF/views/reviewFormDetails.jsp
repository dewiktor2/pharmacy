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
	<legend><h3>Potwierdz<small>  krok 2.</small></h3></legend>
	

					
		<form:form class="form-horizontal"  method="post" commandName="reviewViewModel">
		
	
			
				
			<div class="form-group">
			
			<label class="col-xs-2 control-label">		  </label> 
				
				<div class="col-xs-5" >
					<div class="alert alert-info" style="width: 300px ; margin-left: -40px; ">
					<strong>Zatwierdz opiniie . Wybranie opcji anuluj powróci do poprzedniego widoku</strong>
					</div>
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
			
			
		<label class="col-xs-2 control-label">		<h4>Data<small>  Opinii</small></h4>  </label> 
				
				<div class="col-xs-6" ">
				  <fmt:formatDate var="fmtDate" value="${reviewViewModel.review.createDate}"  pattern="dd-MM-yyyy  hh:mm:ss"/>
			<form:input  path="review.createDate" name="review.createDate" value="${fmtDate}" disabled="true"  style="margin-top:18.5px;"/>   	
					</div>
				
					</div>
			
					
						<div class="form-group">
			
			
		<label class="col-xs-2 control-label">		<h4>Opiniowany<small>  produkt</small></h4>  </label> 
				
				<div class="col-xs-6" ">
				
				<div style="margin-top:18.5px;">  ${reviewViewModel.review.product.name}</div>
					<form:errors path="review.product" cssStyle="color:red"/>	
					</div>
				
					</div>
			
						<div class="form-group">
			
			
		<label class="col-xs-2 control-label">		 </label> 
				
				<div class="col-xs-6" ">
				
				 <form:input path="review.product.id" type="hidden"  style="margin-top:18.5px;" />
					<form:errors path="review.product" cssStyle="color:red"/>	
					</div>
				
					</div>
				
			
		
			  <div class="form-group">
        <div class="col-xs-9 col-xs-offset-3">
      
            <input type="submit" class="btn " name="save" value="Zapisz" />

				 <input type="submit" class="btn" name="cancel" value="Anuluj" />
            
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