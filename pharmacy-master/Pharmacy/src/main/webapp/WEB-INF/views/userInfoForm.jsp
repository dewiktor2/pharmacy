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
	<legend>Edycja</legend>
	

					
		<form:form class="form-horizontal"  method="post" commandName="user">
		
			
			
			<div class="form-group">
			<label class="col-xs-3 control-label" >	<h4>Twoje  <small>imię*</small></h4>  </label> 
				
				<div class="col-xs-5" >
	             	<form:input path="name" required="required"  style="margin-top:19px;"/>
					<form:errors path="name" cssStyle="color:red"/>
					</div>
			
			</div>
			
			<div class="form-group">
			
		<label class="col-xs-3 control-label">		<h4>Twoje  <small>nazwisko*</small></h4>  </label> 
				
				<div class="col-xs-5" >
	             	<form:input path="surname"  name="surname" required="required" style="margin-top:19px;"/>
					<form:errors path="surname" cssStyle="color:red"/>
				</div>
				
			
			</div>
			
			<div class="form-group">
			
			
		<label class="col-xs-3 control-label">		<h4>Twój  <small>@email</small></h4>  </label> 
				
				<div class="col-xs-5" ">
				<form:input type="email" name="email" path="email" required="required" style="margin-top:19px;" />
					<form:errors path="email" cssStyle="color:red"/>
					</div>
				
					</div>
					
					
				<div class="form-group">
			
			
		<label class="col-xs-3 control-label">		<h4>Oddzial  <small>NFZ*</small></h4>  </label> 
				
				<div class="col-xs-5" ">
				<form:select path="userNfzDetails.id" items="${userDetail}" itemLabel="name" itemValue="id" style="margin-top:19px;"/>
					</div>
				
					</div>
			
						

			
					
					
					
			<div class="form-group">
			
			<label class="control-label">	 </label>
				
				<div class="controls">
				<form:hidden path="password" />
				
					</div>
					
				</div>		
					
					<div class="control-group">
			
			<label class="control-label">	 </label>
			
				<div class="controls">
					<form:hidden path="username" />
			
					</div>
					
						</div>
			

			
			
<!-- 			<div class="form-group"> -->
			
			
<!-- 		<label class="col-xs-3 control-label">		Odział NFZ:   </label> -->
				
<!-- 				<div class="col-xs-5"> -->
<%-- 				<form:select path="type.id" items="${unitType}" itemLabel="unit" itemValue="id"/> --%>
<!-- 					</div> -->
				
<!-- 					</div> -->
					
					
			
<!-- 				<div class="form-group"> -->
			
			
<!-- 		<label class="col-xs-3 control-label">		Refundacja:   </label> -->
				
<!-- 				<div class="col-xs-5"> -->
<%-- 				<form:select path="refund.id" items="${refundType}" itemLabel="refund" itemValue="id"/> --%>
<!-- 					</div> -->
				
<!-- 					</div> -->
			
			</br>
			  <div class="form-group">
        <div class="col-xs-9 col-xs-offset-3">
            <button type="submit" class="btn btn-primary" name="Edit" value="Edytuj">Edytuj</button>
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