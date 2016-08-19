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
	<legend>Dodawanie nowej kategorii</legend>
	

					
		<form:form class="form-horizontal"  method="post" commandName="category" >
		
		
			<div class="control-group">
			<label class="control-label">	 <h4>Nazwa <small> kategorii</small></h4> </label>
				
				<div class="controls">
	             	<form:input path="name"/>
					<form:errors path="name" cssStyle="color:red"/>
					</div>
			
			</div>
			
			
				
			

	
			
			</br>
			<div class="form-actions">
						<button type="submit" class="btn btn-success">Submit</button>
						<button type="submit" class="btn .btn-default">
						
						<span class="backBtn"><a  style="text-decoration: none; color:#FFFFFF;" href="categoryList.html">Wstecz</a> </span>
						
						</button>
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