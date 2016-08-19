<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<html>
<jsp:include page="header.jsp"></jsp:include>
<body>

		
			
	  
		
		 <div class="container">

  	 <c:choose>
				<c:when test="${not empty error}">
				<div class="alert alert-danger" style="width:300px">
  <strong>Bląd </strong> podczas logowania! 
</div>

					
		
					
			</c:when>

				
				</c:choose>


	<form:form id="loginform" class="form-horizontal" commandName="logonCommand">
	 <fieldset>
			    <div id="legend">
			      <h1>Apteka  <small>logowanie</small></h1>
			    </div>
		<div class="form-group">

	
		 <label class="col-xs-3 control-label"  for="username">  <span class="glyphicon glyphicon-log-in"></span>	</label>
			      <div class="col-xs-5">
			        <form:input class="textbox" type="text" path="login"   />
			      </div>
			    </div>
		
	
		<div class="form-group">
			      <!-- Password-->
			      <label class="col-xs-3 control-label" for="password">  <span class="glyphicon glyphicon-lock"></span></label>
			      <div class="col-xs-5">
			       <form:input  class="textbox" type="password"  path="password"  />

			      </div>
			    </div>
	
			

	
		
			<div class="form-group">
			      <!-- Password-->
			      <label class="col-xs-3 control-label" for="password">  Zapamietaj  <small>hasło</small> </label>
			      <div class="col-xs-5">
			      
			      <form:checkbox  class="checkbox  checkbox-primary"  id="check1" name="remember" path="remember" />
			
			      </div>
			    </div>
		
		
                                    
                          
			
			
				
			
			  <div class="form-group">
			      <!-- Button -->
			      <div class="col-xs-5">
			        <input class="btn btn-success"  type="submit" value="<fmt:message key="logonForm.submit"/>">
			      </div>
			    </div>
			
		
		 </fieldset>
		 
			</form:form>
		
		
		 	</div>
	

<jsp:include page="footer.jsp"></jsp:include>

</body>

</html>