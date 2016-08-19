
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="header.jsp"></jsp:include>
<body>


	<div class="container" style="height: 100%;">

		<h1>
			Detale <small>produktu</small>
		</h1>
		<img src="${product.id}/image"
			style="max-width: 150px; max-height: 150px;" /><br /> <br /> <br>
		<div class="row">
			<c:if test="${empty product.reviews}">

				<div class="col-md-6   ">
					<a href="#" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-2"
						class="nav-tabs-dropdown btn btn-block btn-primary">Rozwin</a>
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-2">
						<ul class="nav nav-tabs">

							<li class="active"><a href="#htab1" data-toggle="tab">Opis</a></li>
							<li><a href="#htab2" data-toggle="tab">Recenzje</a></li>


						</ul>
					</div>
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane fade in active" id="htab1">
							<h3>
								Opis <small>produktu</small>
							</h3>
							Nazwa: <small>${product.name}</small><br /> Firma: <small>${product.factory}</small><br />
							Cena: <small>${product.price}</small><br />
							<fmt:formatDate var="fmtDate" value="${product.productionDate}"
								pattern="dd-MM-yyyy hh:mm" />
							Data produkcji: <small>${fmtDate}</small><br /> Kategoria: <small>${product.category.name}</small><br />
							Typ: <small>${product.type.name}</small><br />
						</div>
						<div role="tabpanel" class="tab-pane fade" id="htab2">
							<h3>
								Lista recenzji <small> pusta !!! </small>
							</h3>


						</div>

					</div>
				</div>
		</div>


		</c:if>



		<c:if test="${!empty product.reviews}">

			<div class="col-md-8  col-sm-8 col-lg-9">


				<a href="#" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-2"
					class="nav-tabs-dropdown btn btn-block btn-primary">Rozwin</a>
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-2">
					<ul class="nav nav-tabs">

						<li class="active"><a href="#htab1" data-toggle="tab">Opis</a></li>
						<li><a href="#htab2" data-toggle="tab">Recenzje</a></li>


					</ul>
				</div>
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane fade in active" id="htab1">
						<h3>
							Opis <small>produktu</small>
						</h3>


						Nazwa: <small>${product.name}</small><br /> Firma: <small>${product.factory}</small><br />
						Cena: <small>${product.price}</small><br />
						<fmt:formatDate var="fmtDate" value="${product.productionDate}"
							pattern="dd-MM-yyyy hh:mm" />
						Data produkcji: <small>${fmtDate}</small><br /> Kategoria: <small>${product.category.name}</small><br />
						Typ: <small>${product.type.name}</small><br />
					</div>
					<div role="tabpanel" class="tab-pane fade" id="htab2">
						<h3>
							Lista <small> recenzji </small>
						</h3>
						<h3>
							Recenzje <small> produktu</small>
						</h3>

						<div class="table-responsive">
							<table class="table ">
								<thead>
									<tr>
										<th>Recenzja</th>
										<th>Login uzytkownika</th>
										<th>Data</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${reviews}" var="review">
										<tr>
											<td>
												<h4>
													<small> ${review.review}</small>
												</h4>
											</td>

											<td>
												<h4>
													<small> ${review.user.username}</small>
												</h4>
											</td>

											<td><fmt:formatDate var="fmtDate"
													value="${review.createDate}" pattern="dd-MM-yyyy hh:mm" />
												<input path="review.createDate" name="review.createDate"
												value="${fmtDate}" disabled="true"
												style="margin-top: 4px; width: 120px;" /></td>

										</tr>
									</c:forEach>

								</tbody>

							</table>


						</div>
						<div class="col-md-5 ">

							<c:if test="${pages!=null && pages>1}">
								<div
									style="display: inline-block; text-align: center; padding-left: 45%;">
									<nav>
									<ul class="pagination">
										<c:forEach begin="${pages-(pages-1)}" end="${pages}" var="i">
											<li><c:if test="${currentPage==i}">
													<a style="color: magenta;"
														href="<spring:url value="/productList/${i}?id=${product.id}"/>">
														${i} </a>
												</c:if> <c:if test="${currentPage!=i}">
													<a style="color: grey;"
														href="<spring:url value="/productList/${i}?id=${product.id}"/>">
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
			</div>


		</c:if>



	</div>





	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>