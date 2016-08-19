<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="<c:url value="/resources/myTh/css/moje.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/myTh/css/forms.css" />"
	rel="stylesheet">
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
		



<section id="main_section">
<H1> Formularz rejestracji </H1>

<div id="textbox" style='margin-top:25px;'>
		<form:form commandName="user">
		<table >
		
		<tr> <th><h3>Login</h3></th>
		
		
		
		<td>
			<form:input  class="textbox" type="text" path="username"/>
			<form:errors path="username" cssStyle="color:red;" />
		</td>
		</tr>
		
		<tr> <th><h3>Hasło</h3></th>
		<td>
			<form:input  class="textbox" type="password"  path="password" />
			<form:errors path="password" cssStyle="color:red;"/>	
		</td>
		
		
		
		
		</tr>
		
		<tr>
				
		
		
			<td>
			 <p> <a href="logonForm.html" >Powrót do logowania</a> </p>  
			 </td>
			 
			<td colspan="3"  >	 <input type="submit" class="shiny-button" value="Rejestracja">  </td> 	
			
		
				
		
			
		
		</tr>	
	
		
			
		 

			
		
			
		
		   
		
		</section>
		</table>	
		</form:form>
	
	
	</div>
	</div>
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
</html>