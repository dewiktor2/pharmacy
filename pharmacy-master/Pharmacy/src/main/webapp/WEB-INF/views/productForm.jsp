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
	  	<c:if test="${!empty zdjecie}">
				<div class="alert alert-danger" style="width: 300px">
					<strong>Podaj zdjęcie w formacie jpg/png</strong> </br> 
					
				</div>
			</c:if>
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
			
	<h1>Dodawanie nowego <small>produktu</small></h1>
	

					
		<form:form class="form-horizontal"  method="post" commandName="product" enctype="multipart/form-data">
		
			<div class="control-group">
			<label class="control-label">	  <h4>Zdjecie <small> #JPG/PNG</small></h4>  </label> </label>
				
				<div class="controls">
				
				<form:label for="image" path="image"/>
	            <form:input path="image" type="file" />
	          	
	             	
	            
					
					</div>
			
			</div>
			
			<div class="control-group">
			<label class="control-label">	  <h4>Nazwa <small>  #5-30</small></h4>  </label> </label>
				
				<div class="controls">
	             	<form:input path="name"/>
					<form:errors path="name" cssStyle="color:red"/>
					</div>
			
			</div>
			
			<div class="control-group">
			
		<label class="control-label">		  <h4>Cena <small>jednostkowa*</small></h4>  </label> </label>
				
				<div class="controls">
	             	<form:input path="price"/>
					<form:errors path="price" cssStyle="color:red"/>
				</div>
				
			
			</div>
			
			<div class="control-group">
			
			
		<label class="control-label">	  <h4>Firma <small> #5-30 </small></h4>  </label>   </label>
				
				<div class="controls">
				<form:input path="factory"/>
					<form:errors path="factory" cssStyle="color:red"/>
					</div>
				
					</div>
					
			<div class="control-group">
			
			<label class="control-label">  <h4>Ilosc <small>produktu*</small></h4>  </label>  </label>
				
				<div class="controls">
				<form:input path="quantity"/>
					<form:errors path="quantity" cssStyle="color:red"/>
					</div>
					
				</div>		
					
					<div class="control-group">
			
			<label class="control-label">	  <h4>Data <small>produkcji  #RR-MM-DD</small></h4>  </label> </label>
			
				<div class="controls">
					<form:input path="productionDate"/>
					<form:errors path="productionDate" cssStyle="color:red"/>
					</div>
					
						</div>
			
	<div class="control-group">
		
			<label class="control-label">	  <h4>Typ <small>kategorii*</small></h4>  </label> </label>
			
				<div class="controls">
					<form:select path="category.id" items="${categoryType}" itemLabel="name" itemValue="id"/>
					</div>
			</div>
			
			
			
				<div class="control-group">
		
			<label class="control-label">	

    <h4>Typ <small>produktu*</small></h4>  </label>
			
				<div class="dropdown">
					<form:select path="type.id" items="${productType}" itemLabel="name" itemValue="id"/>
					</div>
			</div>
	
			<div class="control-group">
				<form:hidden path="fileName" />
				
					</div>
					
				</div>	
				
			
				
			
			<div class="form-actions">
						<button type="submit" class="btn btn-success"> Submit</button>
	
    <a href="productList.html" class="btn btn-default">
        <i class="icon-pencil icon-white"></i>
        <span><strong>Wstecz</strong></span>            
    </a>
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