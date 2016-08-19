<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="header.jsp"></jsp:include>
	  
<body>

		<jsp:include page="header.jsp"></jsp:include>
	  
	  <div class="container">


	<c:choose>
				<c:when test="${ not empty success}">
				<div class="alert alert-success" style="width:300px">
  <strong>Rejestracja</strong> zakonczona sukcesem !!
</div>

					
		
					
			</c:when>
	
				</c:choose>

		
	<h3>Zostales zarejestrowany jako  <b>${user.username}</b>  </h3>
	

</div>



<jsp:include page="footer.jsp"></jsp:include>
	  
</body>
</html>