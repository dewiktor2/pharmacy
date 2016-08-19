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


 <link href="<c:url value="/resources/myTh/css/bootstrap.css" />"
	rel="stylesheet">
	 <link href="<c:url value="/resources/myTh/css/moje.css" />"
	rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
				<header>
				<hgroup>
				</hgroup>
				</header>
					<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<fieldset>
	<legend>Dodawanie nowego produktu</legend>
	
          
					
		<form:form class="form-horizontal"  method="post" commandName="product">
		
			<div class="control-group">
			<label class="control-label">	Nazwa: </label>
				
				<div class="controls">
	             	<form:input path="name"/>
					<form:errors path="name" cssStyle="color:red"/>
					</div>
			
			</div>
			
			<div class="control-group">
			
		<label class="control-label">		Cena: </label>
				
				<div class="controls">
	             	<form:input path="price"/>
					<form:errors path="price" cssStyle="color:red"/>
				</div>
				
			
			</div>
			
			<div class="control-group">
			
			
		<label class="control-label">		firma:   </label>
				
				<div class="controls">
				<form:input path="factory"/>
					<form:errors path="factory" cssStyle="color:red"/>
					</div>
				
					</div>
					
			<div class="control-group">
			
			<label class="control-label">	ilosc:  </label>
				
				<div class="controls">
				<form:input path="quantity"/>
					<form:errors path="quantity" cssStyle="color:red"/>
					</div>
					
				</div>		
					
					<div class="control-group">
			
			<label class="control-label">	Data Produkcji: </label>
			
				<div class="controls">
					<form:input path="productionDate"/>
					<form:errors path="productionDate" cssStyle="color:red"/>
					</div>
					
						</div>
			
			<div class="control-group">
			
	<label class="control-label">   Akcesoria:  </label>
	
	<div class="controls">
	<form:checkboxes items="${accessories}" path="accessories" itemValue="id" itemLabel="name" delimiter="<br>"/>
		<form:errors path="accessories" cssStyle="color:red"/>
		</div>

				</div>
				
		<div class="control-group">
		
			<label class="control-label">	Typ Product  </label>
			
				<div class="controls">
					<form:select path="type.id" items="${productType}" itemLabel="name" itemValue="id"/>
					</div>
			</div>
			
			</br>
			<div class="form-actions">
						<button type="submit" class="btn btn-success">Submit</button>
						<button type="button" class="btn"><a href="productList.html">Wstecz</a></button>
					</div>
					
				</form:form>
				</fieldset>
			</div>
		</div>
	</div>		
					
				
			
			
				
		
			
				
		
			
				
	
	   </section>
	</div>

<footer id="footer">
			
    
    
       <p class="this">@Apteczka Domowa 2015 &nbsp;&nbsp;|&nbsp;
       <a href="info.html" class="menupage">Kontakt </a> </p>
       
       <p class="footerp1">Made by Spring </p> 
    
    

      
    

    
	   </footer>
</body>

</div>
</html>