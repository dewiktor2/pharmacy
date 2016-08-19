<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
 <link href="<c:url value="/resources/myTh/css/moje.css" />"
	rel="stylesheet">
		 <link href="<c:url value="/resources/myTh/css/bootstrap.css" />"
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
       <a href="cart.html">Koszyk</a>
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



<div id="new_div">
	   <section id="main_section">
<c:if test="${empty usersList}">
	Nie ma uzytkownikow
</c:if>

<c:if test="${not empty usersList}">

	
		
		
			<c:set var="boundMin" value="${25}"/>
	<c:set var="boundMax" value="${40}"/>
	
<div class="container-fluid">
		<div class="row-fluid">
			<div class="span9">
				<fieldset>
				<legend>Uzytkownicy</legend>
				    <table style="width:100%" class="table table-striped">
				<tr>	
		    <th style="width:30%">Detale</th>
			<th style="width:30%">Nazwa</th>
			<th style="width:30%" >Haslo</th>
			<th style="width:30%">Id</th>
			<th style="width:30%"> Opcje</th>
		</tr>
		<c:forEach items="${usersList}" var="user">
			<tr>
				<td>
					<a href="delete.html?id=${user.id}" class="btn" > ${user.username}</a>
				</td>
				
   			
				<td>${user.username}</td>
				<td>${user.password}</td>
				<td>${user.id}</td>
				<td>
					<a href="<spring:url value="/admin/users/removeuser/${user.id}"/>" class="btn">
                    Usun
                </a>
					<a href="productForm.html?id=${product.id} "class="btn" >Edytuj</a>
					
				</td>
				
				
			</tr>
			
		</c:forEach>
		
	</table>
		</fieldset>
			</div>
		</div>
	</div>	
</c:if>

<a href="<spring:url value="/admin/users/glowna.html"/>" class="btn">
                    Powrot do Strony Głownej
                </a>
                
	<a href="<spring:url value="/admin/users/controlOrders.html"/>" class="btn">
                   Kontrola Zamowien
                </a>
                </br>
                </br>
</section>
</div>
             
 <footer id="footer">
			
    
    
       <p class="footerp">@Apteczka Domowa 2015 &nbsp;&nbsp;|&nbsp;
       <a href="info.html" class="menupage">Kontakt </a> </p>
       <p class="footerp1">Made by Spring </p>
        
    
    

      
    

    
	   </footer>  
</div>
</body>



