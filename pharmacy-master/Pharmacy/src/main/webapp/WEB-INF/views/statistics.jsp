<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>


<jsp:include page="header.jsp"></jsp:include>


<body>



	<div class="container">

		<h1>
			Statystyki <small>apteki</small>
		</h1>


		<div class="page-header"></div>
		<div class="row">

			<h4>
				Statystyki <small>produkty/użytkownicy</small>
			</h4>
			<br/>
			<div class="col-md-5 ">


				<div class="row">
					<div class="col-sm-12">

						<a href="#" data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-3"
							class="nav-tabs-dropdown btn btn-block btn-primary">Rozwin</a>
						<div class="collapse navbar-collapse"
							id="bs-example-navbar-collapse-3">
							<ul class="nav nav-tabs">

								<li class="active"><a href="#htab1" data-toggle="tab">Produkty</a></li>
								<li><a href="#htab2" data-toggle="tab">Użytkownicy</a></li>


							</ul>
						</div>
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade in active" id="htab1">

								<br />
								<h4>
									Produkt z najwiekszą dostępną ilością <small> <a
										href="<spring:url value="/productList/?id=${max.id} " />">
											${max.name}</a></small> : ${max.quantity }
								</h4>
								<c:choose>
									<c:when test="${ empty sessionScope.mostPupular}">
										<a
											href="<spring:url value="/admin/users/statistics/product" />">Uzyskaj
											więcej danych</a>
									</c:when>
									<c:otherwise>
										<h4>
											Najpopularniejszy produkt to <small> <a
												href="<spring:url value="/productList/?id=${sessionScope.mostPupular.id} " />">
													${sessionScope.mostPupular.name}</a> ilość zamówień:
											</small> ${mostPupularMax}
										</h4>
									</c:otherwise>
								</c:choose>
							</div>

							<div role="tabpanel" class="tab-pane fade" id="htab2">
								<br />

								<c:if test="${ empty count}">
									<a href="<spring:url value="/admin/users/statistics/user" />">
										Uzyskaj Statystyki</a>
								</c:if>

								<c:if test="${not empty count}">

									<h4>
										Liczba <small> wszystkich użytkowników :</small> ${count}
									</h4>
									<c:if test="${not empty sessionScope.helper2}">
										<h4>
											Najwiekszą ilość zamówień złożył <small> użytkownik <a
												href="<spring:url value="/user/profile/userInfoFormAdmin?id=${sessionScope.helper2.user.user_id} "/>"
												class="btn" style="margin-bottom: 5px;">
													${sessionScope.helper2.user.username } </a>
											</small>
										</h4>
									</c:if>

								</c:if>

							</div>

						</div>
					</div>
				</div>




















				<div class="span9">
					<fieldset>
						<c:if test="${empty productList}">
							<h2>
								Lista produktów <small> jest pusta </small>
							</h2>
						</c:if>

						<c:if test="${!empty productList}">
							<h2>
								Produkty <small> ,których ilość się kończy </small>
							</h2>
							<div class="table-responsive">
								<table class="table table-hover">
									<thead>
										<tr>

											<th>Produkt</th>
											</c:if>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="it" items="${productList}">

											<tr>
												<td>
													<h4>
														<small> <a
															href="<spring:url value="/productList/?id=${it.id} " />">
																${it.name}</a></small>
													</h4>
												</td>
											<tr>
										</c:forEach>
									</tbody>


								</table>


							</div>
					</fieldset>
				</div>

				<c:if test="${pages!=null && pages>1}">
					<div
						style="display: inline-block; text-align: center; padding-left: 45%;">
						<nav>
							<ul class="pagination">
								<c:forEach begin="${pages-(pages-1)}" end="${pages}" var="i">
									<li><c:if test="${currentPage==i}">
											<a style="color: magenta;"
												href="<spring:url value="/admin/users/statistics/${i}"/>">
												${i} </a>
										</c:if> <c:if test="${currentPage!=i}">
											<a style="color: grey;"
												href="<spring:url value="/admin/users/statistics/${i}"/>">
												${i} </a>
										</c:if></li>

								</c:forEach>

							</ul>
						</nav>
					</div>

				</c:if>

			</div>





		</div>




	</div>




	<jsp:include page="footer.jsp"></jsp:include>






</body>