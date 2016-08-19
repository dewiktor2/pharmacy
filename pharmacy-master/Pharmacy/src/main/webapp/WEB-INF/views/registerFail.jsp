<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="header.jsp"></jsp:include>
<body>


<div class="container">

<c:choose>
		
				<h2> Proces Rejestracji </h2>
		
			<c:otherwise>
				<h3>Nie udalo sie  zarejestrowac jako <small> <b>${user.username}</small></b>  </h3>
			</c:otherwise>
		</c:choose>
	</H2>
</div>
	
<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>