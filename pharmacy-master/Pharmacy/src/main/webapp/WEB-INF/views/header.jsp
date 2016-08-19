<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>


<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">




<link href="<c:url value="/resources/myTh/css/style.css" />"
	rel="stylesheet">

<link href="<c:url value="/resources/myTh/css/shop-homepage.css" />"
	rel="stylesheet">

<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="<c:url value="/resources/myTh/css/myBoostrapStyle.min.css" />"
	rel="stylesheet">





<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>



<script
	src="http://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js"></script>
	
<link rel="stylesheet"
	href="http://cdn.datatables.net/1.10.9/css/jquery.dataTables.min.css">	
	

<spring:url value="/resources/myTh/js/styl.js" var="stylJS" />
<script src="<c:url value="/resources/myTh/js/styl.js" />"></script>

<script src="${stylJS}"></script>
</head>
<header>



	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">


		<div class="container">

			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">

					<span class="glyphicon glyphicon-align-justify"></span>
				</button>
				<a class="navbar-brand " href="<spring:url value="/glowna.html"/>">
					<img style="float: left; padding-bottom: 20px;"
					src="<c:url value="/resources/myTh/img/doctor9.png" />"></img>
					Apteka
				</a>



			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="navbar-collapse collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav ">

				<li><a href="<spring:url value="/info.html" />"> <span
							class="glyphicon glyphicon-info"></span> Info
					</a></li>

					<li class=" dropdown"><a href="#" class="dropdown-toggle "
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Produkty <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="<spring:url value="/productList/recipe" />">
									<span class=" glyphicon glyphicon-screenshot"></span> Na
									Recepte
							</a></li>
							<li><a href="<spring:url value="/productList" />"> <span
									class="glyphicon glyphicon-menu-hamburger"></span> Zwykłe
							</a></li>
						</ul></li>


					<li class=" dropdown"><a href="#" class="dropdown-toggle "
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Kategorie <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="<spring:url value="categoryList.html" />">
									<span class="glyphicon glyphicon-menu-hamburger"> </span>
									Wszystkie
							</a></li>
							<li><a href="<spring:url value="/categoryList.html?id=3" />">
									<span class="glyphicon "> <img
										style="float: left; width: 15px; height: 15px;"
										src="<c:url value="/resources/myTh/img/witaminy.png" />"></img>
								</span> Witaminy
							</a></li>


							<li><a href="<spring:url value="/categoryList.html?id=1" />">
									<span class="glyphicon "> <img
										style="float: left; width: 15px; height: 15px;"
										src="<c:url value="/resources/myTh/img/doctor9.png" />"></img>
								</span> Leki
							</a></li>

							<li><a
								href="<spring:url value="/categoryList.html?id=13" />"> <span
									class="glyphicon "> <img
										style="float: left; width: 15px; height: 15px;"
										src="<c:url value="/resources/myTh/img/suplement.png" />"></img></span>
									Suplementy
							</a></li>

							<li><a href="<spring:url value="/categoryList.html?id=5" />">
									<span class="glyphicon "> <img
										style="float: left; width: 15px; height: 15px;"
										src="<c:url value="/resources/myTh/img/baby.png" />"></img></span>
									Dziecko
							</a></li>

							<li><a
								href="<spring:url value="/categoryList.html?id=14" />"> <span
									class="glyphicon "><img
										style="float: left; width: 15px; height: 15px;"
										src="<c:url value="/resources/myTh/img/cosmo.jpg" />"></img></span>
									Kosmetyki
							</a></li>

							<li><a
								href="<spring:url value="/categoryList.html?id=15" />"> <span
									class="glyphicon "><img
										style="float: left; width: 15px; height: 15px;"
										src="<c:url value="/resources/myTh/img/icon.png" />"></img></span>
									Uzytkowe
							</a></li>

						</ul></li>

					<li><a href="<spring:url value="/info.html" />"> <span
							class="glyphicon glyphicon-earphone"></span> Kontakt
					</a></li>


				
					<c:choose>
						<c:when test="${not empty logInSessionAdmin}">
							<li><a href="<spring:url value="/admin/users"/>">
									Kontrola </a></li>

							<li><a href="<spring:url value="/logout.html"/>">
									Wyloguj </a></li>

						</c:when>

						<c:when test="${not empty logInSession}">
							<li><a href="<spring:url value="/cart.html"/>"> <span
									class="glyphicon glyphicon-shopping-cart"></span> Koszyk
							</a></li>

							<li><a href="<spring:url value="/user/profile"/>"> <span
									class="glyphicon glyphicon-user"></span> Profil
							</a></li>
							<li><a href="<spring:url value="/logout.html"/>"> <span
									class="glyphicon glyphicon-log-out"></span> Wyloguj
							</a></li>


						</c:when>

						<c:when test="${ empty logInSession}">
							<li><a href="<spring:url value="/logonForm.html" />"> <span
									class="glyphicon glyphicon-log-in"></span> Logowanie
							</a></li>
							<li><a href="<spring:url value="/registerForm.html" />">
									<span class="glyphicon glyphicon-registration-mark"> </span>
									Rejestruj
							</a></li>
						</c:when>
					</c:choose>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>





</header>



</html>
