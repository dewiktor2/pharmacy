<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="header.jsp"></jsp:include>
<body>



	<div class="container">


	<c:if test="${ not empty msg}">

<div class="alert alert-danger" style="width: 350px">
					<strong>Błąd !!! Uzupełnij wszystkie dane adresowe</strong> </br> 
						<small> w swoim profilu oraz informacje (email, imie, nazwisko)</small>
					
					
				</div>

			</c:if>


		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-9 col-sm-12 col-md-10  col-xs-12 ">
					<fieldset>
						<c:if test="${empty sessionScope.cart}">
							<h2>
								Twoja karta <small> jest pusta </small>
							</h2>
						</c:if>

						<c:if test="${!empty sessionScope.cart}">
					
							<h2>
								Twoja <small> karta </small>
							</h2>
							<div class="table-responsive">
								
								<table class="table table-hover">
									<thead>
										<tr>

											<th>Opcje</th>
											<th>Zdjecie</th>
											<th>nazwa</th>
											<th>firma</th>
											<th>cena</th>
											<th>ilosc</th>
											</c:if>
										</tr>
									</thead>
									<tbody>
										<form:form var="it2" modelAttribute="${sessionScope.cart}" action="update" method="post" class="form-horizontal">
										<c:forEach var="it" items="${sessionScope.cart}">
											
											<tr>
												<td><a href="remove.html?id=${it.product.id}"
													class="btn" onclick="return confirm('Really ?')"> usun
												</a></td>
												<td><img src="productList/${it.product.id}/image"
													style="max-width: 150px; max-height: 150px;" /></td>
												<td>${it.product.name}</td>
												
												<td>${it.product.factory}</td>
												<td><b><fmt:formatNumber type="CURRENCY"
															value="${it.product.price}" currencySymbol="ZŁ" /></b></td>
												<td>
												     <input type="number" value="${it.quantity}" name="it2.quantity" />
												    
												            
												</td>
											<tr>
											
			
										</c:forEach>
														<div class="form-actions" style="float: left;">
														
						<button type="submit" class="btn btn-success"> Uaktualnij ilosc</button>
						</div>
										</form:form>
									</tbody>
											
		
								</table>
								<c:choose>
									<c:when test="${not  empty logInSession}">

										<div style="float: left; margin-left:4px;">
											<a href="<spring:url value="/checkout.html"/>"
												class="btn btn-default"> <i
												class="icon-pencil icon-white"></i> <span><strong>Kasa</strong></span>
											</a>
										</div>
									</c:when>

								</c:choose>



								<c:choose>
									<c:when test="${empty logInSession}">


										<div style="float: left; margin-left:5px;">
											<a href="<spring:url value="/logonForm.html"/>"
												class="btn btn-default"> <i
												class="icon-pencil icon-white"></i> <span><strong>Kasa</strong></span>
											</a>
										</div>


									</c:when>
								</c:choose>

								<div style="float: left; margin-left: 10px">
									<a href="<spring:url value="/productList.html"/>"
										class="btn btn-default"> <i class="icon-pencil icon-white"></i>
										<span><strong>Kontynuuj</strong></span>
									</a>
								</div>
							</div>
					</fieldset>
				</div>
			</div>
		</div>








	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>