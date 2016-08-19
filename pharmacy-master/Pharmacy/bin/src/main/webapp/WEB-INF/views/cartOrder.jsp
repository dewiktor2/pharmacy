<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/resources/myTh/css/moje.css" />"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="big_one">
		
				<header id="top_header">
		<nav>
    <div class="wrapper">
     <div class="logo"></div> 
     <p class="logotext"> Apteczka  Domowa   </p> 
    <ul>
        <a href="info.html">        <li class="menupage">Kontakt  </li> </a>
        <a href="productList.html"> <li class="menupage">Lista Produktow  </li> </a>
        <a href="logonForm.html">   <li class="menupage">Logowanie </li> </a>
        <a href="register.html">    <li class="menupage">Rejestracja   </li>    </a>
    
    </ul>

      
    </div>   

    </nav>
	             <c:choose>
<c:when test="${not empty logInSessionAdmin}">
<div id="ovoMenu">
  
    <div class="right">
       <span style="color:white">Jesteś zalogowany jako <b>${logInSessionAdmin.login}</b></span>
       <a href="<spring:url value="/admin/users"/>" >
                    Kontrola Strony
                </a>
    
<a href="logout.html">Wyloguj</a>
    </div>
    
</div>
       

</c:when>
<c:when test="${not empty logInSession}">
<div id="ovoMenu">
  
    <div class="right">
       <span style="color:white">Jesteś zalogowany jako <b>${logInSession.login}</b></span>
       <p class="logotext2"> Koszyk  </p> 
<a href="cart.html"><div class="logo2"></div> </a>
          <a href="<spring:url value="/user/profile"/>" >
                    Profil
                    
                </a>
<a href="logout.html">Wyloguj</a>
    </div>
    
</div>
       


</c:when>
<c:otherwise >
<div id="ovoMenu">
  
    <div class="right">
<span style="color:#330033">Nie jesteś zalogowany</span>

<a href="logonForm.html">Zaloguj</a>
  </div>
</div>
</c:otherwise>
</c:choose>



		</header>


 <div id="cart">


	

	
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span9">
				<fieldset>
				<legend>Karta </legend>
				    <table class="table table-striped">
				<tr>	  
			<th>nazwa</th>
			<th>firma</th>
			<th>cena</th>
			<th>ilosc</th>
			<th>calk cena</th>
				</tr>	   
				<c:set var="sum" value="0" > </c:set>
<c:forEach var="it" items="${sessionScope.cart}"> 
<c:set var="sum" value="${ sum + it.product.price * it.quantity} " > </c:set>
	<tr>
		
		<td>${it.product.name}</td>
		<td>${it.product.factory}</td>
		<td><b><fmt:formatNumber type="CURRENCY" value="${it.product.price}"
			currencySymbol="$" /></b> </td>
		<td>${it.quantity}</td>
		<td><b><fmt:formatNumber type="CURRENCY" value="${it.product.price * it.quantity }" currencySymbol="$" /></b> </td>
	<tr>
	
	</c:forEach>
	<tr>
		<td align="right"> Total Pay :  <td>
		 <b><fmt:formatNumber type="CURRENCY" value="${sum }" currencySymbol="$"/> </b>
	</tr>
	
</table>
</div>


    		
				</fieldset>
			</div>
		</div>
	</div>	
	
<a href="realize.html"
   			onclick="return confirm('Really ?')" ><h4 class="btn" align="left"> Zrealizuj </h4>  </a> 
   			  
<a href="glowna.html" ><h4 class="btn" align="left"> Powrot do glownej </h4>  </a>   
<footer id="footer">
			
    
    
       <p class="this">@Apteczka Domowa 2015 &nbsp;&nbsp;|&nbsp;
       <a href="info.html" class="menupage">Kontakt </a> </p>
       
        <p class="footerp1">Made by Spring </p>
    
    

    

    
	   </footer>
</div>



</body>
</html>