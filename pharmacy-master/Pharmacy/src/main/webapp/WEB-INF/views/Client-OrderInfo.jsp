<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="header.jsp"></jsp:include>  
<body>

		
		
		<div class="container">
	  
<jsp:include page="succes.jsp"></jsp:include>
<H4> <p>Twoje zamowienie zostalo przekazane do realizacji </p>

<p>Sprawdz detale  i   status zamowienia w swoim profilu </p>

</H4>

                
                
                <a href="<spring:url value="/user/profile"/>" class="shiny-button">
                    Profil
                </a>
                

</div>
 <jsp:include page="footer.jsp"></jsp:include>  
</body>
</html>