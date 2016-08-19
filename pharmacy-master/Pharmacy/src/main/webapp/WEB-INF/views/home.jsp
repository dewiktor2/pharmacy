<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>


<jsp:include page="header.jsp"></jsp:include>

<body>


	<!--  /.page  -->
	<div class="container">

		<jsp:include page="succes.jsp"></jsp:include>
		<c:choose>
			<c:when test="${ not empty logout}">
				<div class="alert alert-danger" style="width: 300px">
					<strong>Wylogowałeś</strong> się !!!
				</div>




			</c:when>


		</c:choose>
		<div class="row">

			<div class="col-md-3">

				<p class="lead">Kategorie</p>
				<div class="list-group">
					<a href="categoryList.html?id=14" " class="list-group-item">Kosmetyki
						<img style="float: right; width: 30px; height: 30px;"
						src="<c:url value="/resources/myTh/img/cosmo.jpg" />"></img>
					</a> <a href="categoryList.html?id=13" class="list-group-item">Suplementy
						<img style="float: right; width: 30px; height: 30px;"
						src="<c:url value="/resources/myTh/img/suplement.png" />"></img>
					</a> <a href="categoryList.html?id=1" "
						class="list-group-item">
						Leki <img style="float: right; width: 30px; height: 30px;"
						src="<c:url value="/resources/myTh/img/doctor9.png" />"></img>
					</a> <a href="categoryList.html?id=5" class="list-group-item">Dziecko
						<img style="float: right; width: 30px; height: 30px;"
						src="<c:url value="/resources/myTh/img/baby.png" />"></img>
					</a> <a href="categoryList.html?id=3" class="list-group-item">Witaminy
						<img style="float: right; width: 30px; height: 30px;"
						src="<c:url value="/resources/myTh/img/witaminy.png" />"></img>
					</a> <a href="categoryList.html?id=15" class="list-group-item">Uzytkowe
						<img style="float: right; width: 30px; height: 30px;"
						src="<c:url value="/resources/myTh/img/icon.png" />"></img>
					</a>






				</div>

			</div>


			<div class="col-md-9">

				<div class="row carousel-holder">

					<div class="col-md-12">
						<div id="carousel-example-generic" class="carousel slide"
							data-ride="carousel">
							<div class="thumbnail">
								<img class="slide-image"
									src="<c:url value="/resources/myTh/img/rysunek.png" />"></img>
							</div>

						</div>
					</div>

				</div>


				

					<div class="row grid-divider">
						<div class="col-sm-4 col-md-4  col-lg-4">
							<div class="thumbnail">
								<img class="img-responsive" style="float: width: 250px; height: 150px;" 
									src="<c:url value="productList/16/image" />"></img>
								<div class="caption">
									<h4 class="pull-right">8 zł</h4>
									<h4>
										<a href="<spring:url value="productList/?id=16" />">
											Aspirina </a>
									</h4>
									<p>
										Super tabletki na ból głowy<a target="_blank" href="#"> </a>
									</p>
									<p>Nie zapomnij sprawdzić reszty naszych produktów</p>

								</div>
							</div>
						</div>
						<div class="col-sm-4 col-md-4  col-lg-4"">
							<div class="thumbnail">
								<img  class="img-responsive"style=" float: width: 250px; height: 150px;"
									src="<c:url value="productList/17/image" />"></img>
								<div class="caption">
									<h4 class="pull-right">25 zł</h4>
									<h4>
										<a href="<spring:url value="productList/?id=17" />">
											Pampersy </a>
									</h4>
									<p>Dobre dla dziecka</p>
									<p>Inne produkty z tej kategorii także w dobrych cenach :)</p>

								</div>
							</div>
						</div>
						<div class="col-sm-4 col-md-4  col-lg-4">
							<div class="thumbnail">
								<img class="img-responsive" style="float: width: 250px; height: 150px;"
									src="<c:url value="productList/18/image" />"></img>
								<div class="caption">
									<h4 class="pull-right">10 zł</h4>
									<h4>
										<a href="<spring:url value="productList/?id=18" />">
											Viagra </a>
									</h4>
									<p>
										Zamow teraz <a target="_blank" href="#">viagre </a>
									</p>
									<p>Nie zapomnij sprawdzić reszty naszych produktów</p>

								</div>
							</div>
						</div>
					</div>

				</div>

			</div>

		</div>
	</div>


	<jsp:include page="footer.jsp"></jsp:include>



</body>





</html>
