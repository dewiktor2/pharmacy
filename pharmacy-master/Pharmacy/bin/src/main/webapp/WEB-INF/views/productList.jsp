<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
 <link href="<c:url value="/resources/myTh/css/bootstrap.css" />"
	rel="stylesheet">
	<link href="<c:url value="/resources/myTh/css/moje.css" />"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
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
      <a href="<spring:url value="/info.html" />">        <li class="menupage">Kontakt  </li> </a>
        <a href="<spring:url value="/productList.html" />">  <li class="menupage">Lista Produktow  </li> </a>
        <a href="<spring:url value="/logonForm.html" />">    <li class="menupage">Logowanie </li> </a>
        <a href="<spring:url value="/register.html" />">    <li class="menupage">Rejestracja </li> </a>
       
    
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

<div id="productList">


</br>


<c:if test="${not empty productList}">
	
	
	<c:set var="boundMin" value="${25}"/>
	<c:set var="boundMax" value="${40}"/>
	

      	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span9">
				<fieldset>
				<legend>Lista Produktow</legend>
				    <table class="table table-striped">
				<tr>	  
			<th>Nazwa</th>
			<th>Firma</th>
			<th>Data produkcji</th>
			<th>Cena</th>
			<th>Ilosc</th>
			<th>Opinia</th>
			<th>Opcje</th>
				</tr>	   
					<c:forEach items="${productList}" var="product">
			<tr>
				<td>
					<a href="?id=${product.id}"  > ${product.name}</a>
				</td>
				<td>${product.factory}</td>
				<td><fmt:formatDate  value="${product.productionDate}"  type="date" timeStyle="medium"/></td>
				<td><fmt:formatNumber type="CURRENCY" value="${product.price}"  currencySymbol="$"/></td>
				<td><fmt:formatNumber type="number"  pattern="###.### " value="${product.quantity}"  /></td>
				<td>
					<c:choose>
						<c:when test="${product.price lt boundMin}">
							TANI
						</c:when>
						<c:when test="${product.price gt boundMax}">
							DROGI
						</c:when>						
						<c:otherwise>
							�REDNI
						</c:otherwise>
					</c:choose>
				</td>
				
				
				
				<td>
				<c:choose>
				<c:when test="${not empty logInSessionAdmin}">
					<a href="?did=${product.id}"  class="btn"  >Usun</a>
					<a href="productForm.html?id=${product.id}  " class="btn" >Edytuj</a>
				</c:when>
				</c:choose>
				
				<c:choose>
				<c:when test="${not empty logInSession}">
				<c:if test="${product.quantity>1}">
					<a href="order.html?id=${product.id}" class="btn"> Zamow </a>
					</c:if>
					<c:if test="${product.quantity==1}">
			         Brak!!
					</c:if>
					</c:when>
				</c:choose>	
				</td>
				
				
			</tr>
			
		</c:forEach> 		
    				</table>
				</fieldset>
			</div>
		</div>
	</div>	
	</br>
	</br>
	<c:choose>
				<c:when test="${not empty logInSession}">
					<a href="cart.html"  class="btn"  >Koszyk</a>
					</c:when>
				</c:choose>	
	 <a href="glowna.html" class="btn"  >Powrot do glownej</a>
	
</c:if>
<c:choose>
				<c:when test="${not empty logInSessionAdmin}">

					<a href="productForm.html"  >Dodaj Nowy</a>
				</c:when>
				</c:choose>
</div>
</br>
</br>
 <footer id="footer">
			
    
    
       <p class="footerp">@Apteczka Domowa 2015 &nbsp;&nbsp;|&nbsp;
       <a href="info.html" class="menupage">Kontakt </a> </p>
       <p class="footerp1">Made by Spring </p>
        
    
    

      
    

    
	   </footer>
</div>

</body>




