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
		
		

<div id="new_div">
<div id="login" style='margin-top:30px;'>

	   <section id="main_section">
<H1><fmt:message key="logonForm.label"/></H1>
<div id="textbox" style='margin-top:25px;'>
	<form:form commandName="logonCommand">
	
		<table>

		<tr><th>Login</th>
			<td>
			
				<form:input class="textbox" type="text" path="login" />
				<form:errors path="login" cssStyle="color:green;"/>
				
			</td>
		</tr>
		
	
		<tr><th>Hasło</th>
			<td>
				<form:input  class="textbox" type="password"  path="password" />
				<form:errors path="password" cssStyle="color:green;"/>
			</td>
		</tr>
		
		
		
		<tr>	
		
			<td>
				<form:checkbox  class="checkbox"  id="check1" name="remember" path="remember" />
					&nbsp; <b><fmt:message key="logonForm.remember"/></b>
				
			</td>
			
			<td colspan="2"><input class="shiny-button"  type="submit" value="<fmt:message key="logonForm.submit"/>"></td>	
		
		
		</tr>	
		
		</div>	
		
		
	
		</section>
		</table>	
		 
	</form:form>	
	<div style='float:right; width:40%; margin-left:300px;margin-top:30px;margin-right:10px;margin-bottom:20px;padding:10px;'>
  

		
		<h3>Nie korzystasz z Apteki Internetowej?</h3>
                        
                        <p> <a href="register.html" >Zarejestruj się</a> </p>
                        <div class="konto"></div>
                        <h4 class="ico1">Szeroka gama leków oraz suplementów</h4>
                        <h4 class="ico3">Monitorujesz leki i status zamówienia</h4>
                     
                    </div>
	
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