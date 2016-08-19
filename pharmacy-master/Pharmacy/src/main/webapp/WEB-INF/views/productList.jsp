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

		
		<div class="page-header">

			<c:if test="${!empty recepta}">
				<h1>
					Lista <small>produktów na receptę</small>

				</h1>

				<div class="alert alert-info" style="width: 300px">
					<strong>Produkty na receptę po zrealizowanym zamówienia
						podlegają odbiorze tylko i wyłączanie za okazaniem orginału
						recepty od lekarza.</strong> </br> Odział nfz potrzebny do zrealizowania
					zamówienia uzepełniamy w profilu użytkownika !!!! W przypadku złych
					danych farmaceuta może nie wydać leku.
					
				</div>
				<h4>
					Opcja zamów tylko <small>dla zalogowanych !!!</small>
				</h4>
			</c:if>

			<c:if test="${empty recepta}">
				<h1>
					Lista <small>produktów</small>
				</h1>
<div class="alert alert-info" style="width: 300px">
					<strong>Aby zobaczyć recenzje dane produktu
					    kliknij w jego nazwe !</strong> </br> 
						Możesz oceniać produkty ze swoich zamówień w  profilu.
					
					
				</div>

			</c:if>




		</div>
		
	<div class="col-md-12 col-sm-12 col-lg-12 ">
	
			
		
				<form method="get" action="<spring:url value="/search" />">
					<div class="small-3 columns">
						<input type="text" id="txt" name="searchString">
					</div>

					<div class="small-5 columns end " style="padding-top: 5px">
						<button id="button-id" type="submit">
							<h5>
								Wyszukaj <small> produkt</small>
							</h5>
						</button>
					</div>


				</form>
				
				
					<c:choose>
			<c:when test="${ not empty info}">
				<div class="alert alert-success" style="width: 300px">
					<strong>Sukces!</strong> Znaleziono podany produkt.
				</div>

			</c:when>
			<c:when test="${ not empty error}">
				<div class="alert alert-danger" style="width: 300px">
					<strong>Błąd!</strong> Nie znaleziono podanego produktu
				</div>


			</c:when>

		</c:choose>
	
	</div>



			<div class="row2">
			<div class="col-md-12 col-sm-12 col-lg-10">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Produkty</h3>
					</div>
					<div class="panel-body">

						<input type="text" class="form-control" id="dev-table-filter"
							data-action="filter" data-filters="#dev-table"
							placeholder="Filtruj po Nazwie ,Cenie " />
					</div>
				<div class="table-responsive">
					<table class="table table-hover" id="dev-table">
						<thead>
							<tr>
								<th>Zdjecie</th>
								<th>Nazwa</th>
								<th>Cena</th>
								<th>Dostepnosc</th>
								<th>Opcje</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${productList}" var="product">
								<tr>
									<td><img src="${product.id}/image"
										style="max-width: 150px; max-height: 150px;" /></td>
									<td><a
										href="<spring:url value="/productList/?id=${product.id} " />">
											${product.name}</a></td>





									<td><fmt:formatNumber type="CURRENCY"
											value="${product.price}" currencySymbol="ZŁ" /></td>


									<td><c:if test="${product.quantity>1}">
			               Dostepny 
			        </c:if>
			        	<c:if test="${product.quantity==1}">
			               X
			        </c:if>
			        </td>

									<td>
										<div class="produkty">
											<c:choose>
												<c:when test="${not empty logInSessionAdmin}">
													<a
														href="<spring:url value="/productList?did=${product.id}"  />"
														class="btn">Usun</a>
													<a
														href="<spring:url value="/productForm.html?id=${product.id}  " />"
														class="btn">Edytuj</a>
												</c:when>
											</c:choose>




											<c:choose>
												<c:when
													test="${ empty logInSession || not empty logInSession}">
													<c:if test="${product.quantity>1}">

														<c:if
															test="${!empty recepta&&user.email!='' && not empty logInSession }">
															<a
																href="<spring:url value="/order.html?id=${product.id}" />"
																class="btn"> Zamow </a>
														</c:if>
														<c:if test="${empty recepta }">
															<a
																href="<spring:url value="/order.html?id=${product.id}" />"
																class="btn"> Zamow </a>
														</c:if>
														<c:if test="${!empty recepta}">

														</c:if>

													</c:if>
													<c:if test="${product.quantity==1}">
			         Brak!!
					</c:if>
												</c:when>
											</c:choose>





										</div>
									</td>


								</tr>
							</c:forEach>
						</tbody>
					</table>
					
			
				</div>
						<c:choose>
				<c:when test="${not empty logInSessionAdmin}">


					
					<div class="span1" style="float:left; margin-top:10px;">
					
					<a href="<spring:url value="/productForm.html"  />" class="btn btn-default"> 
					<i class="icon-pencil icon-white"></i>
																<span><strong>Dodaj produkt</strong></span> 
																
																
																</a>
   
</div> 
				</c:when>
				</c:choose>
					
				</div>
			</div>
			
		
			
			</div>
			
			



		</div>







	<c:if test="${empty recepta}">
		<c:if test="${pages!=null && pages>1}">
			<div
				style="display: inline-block; text-align: center; padding-left: 45%;">
				<nav>
					<ul class="pagination">
						<c:forEach begin="${pages-(pages-1)}" end="${pages}" var="i">
							<li><c:if test="${currentPage==i}">
									<a style="color: magenta;"
										href="<spring:url value="/productList/${i}"/>"> ${i} </a>
								</c:if> <c:if test="${currentPage!=i}">
									<a style="color: grey;"
										href="<spring:url value="/productList/${i}"/>"> ${i} </a>
								</c:if></li>

						</c:forEach>

					</ul>
				</nav>
			</div>
		</c:if>
	</c:if>

	<c:if test="${!empty recepta}">
		<c:if test="${pages!=null && pages>1}">
			<div
				style="display: inline-block; text-align: center; padding-left: 45%;">
				<nav>
					<ul class="pagination">
						<c:forEach begin="${pages-(pages-1)}" end="${pages}" var="i">
							<li><c:if test="${currentPage==i}">
									<a style="color: magenta;"
										href="<spring:url value="/productList/${i}"/>"> ${i} </a>
								</c:if> <c:if test="${currentPage!=i}">
									<a style="color: grey;"
										href="<spring:url value="/productList/${i}"/>"> ${i} </a>
								</c:if></li>
						</c:forEach>

					</ul>
				</nav>
			</div>
		</c:if>


	

	</c:if>








	<jsp:include page="footer.jsp"></jsp:include>






</body>