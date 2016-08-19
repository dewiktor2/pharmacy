
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Apteka Internetiwa</title>
<link href="<c:url value="/resources/myTh/css/moje.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/myTh/css/forms.css" />"
	rel="stylesheet">
	<title>Home</title>
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
		
		
	  
	   
 <div id="new_div">
	   <section id="main_section">
			<article>
				<header>
				<hgroup>
					 <h1> Super Oferta</h1>
					<h3> <img style="display: inline;" src="http://img.nokaut.pl/p-05-31-053156464d69c3f3a3c972d8fd31d0ca500x500/braz.jpg" 
					width ="50" height="50" alt="logo" /> 
					Polopiryna tylko teraz 3,90 za opakowanie</h3>	
				</hgroup>
				</header>
					<h3><a href="promo.html">Sprawdz takze inne promocje</a> </p><h3>
				<footer>
				<p>-Wiktor</p>
				</footer>
			
			
				
			</article>
				<article>
				<header>
				<hgroup>
					 <h1> Super Oferta</h1>
					<h3> <img style="display: inline;" src="http://img.nokaut.pl/p-05-31-053156464d69c3f3a3c972d8fd31d0ca500x500/braz.jpg" 
					width ="50" height="50" alt="logo" /> 
					Polopiryna tylko teraz 3,90 za opakowanie</h3>	
				</hgroup>
				</header>
					<h3><a href="promo.html">Sprawdz takze inne promocje</a> </p><h3>
				<footer>
				<p>-Wiktor</p>
				</footer>
			
			
				
			</article>
			
				
			<article>
				<header>
				<hgroup>
					 <h1> Informacje o Sklepie </h1>
					 <h2> Ranking naszego sklepu </h2>
				</hgroup>
				</header>
					<h3>Nasz sklep zajmuje pierwsze miejsce w rankingu 
					sprzedazy 
					 i klientow</h3>
	</article>
	   </section>
	   
	   
			
	   <aside id="side_news">
		   <h4>News</h4>
		   Nowa filia apteki w Warszawie na ulicy Zamkowej 3
	   </aside>
	   
	   </div>
	   
	   <footer id="footer">
			
    
    
       <p class="footerp">@Apteczka Domowa 2015 &nbsp;&nbsp;|&nbsp;
       <a href="info.html" class="menupage">Kontakt </a> </p>
       <p class="footerp1">Made by Spring </p>
        
    
    

      
    

    
	   </footer>
	</div>






</body>
</html>
	