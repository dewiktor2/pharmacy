<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="header.jsp"></jsp:include>
<body>


	<div class="container">
		<c:if test="${empty customerOrder}">
			<h1>
				Lista <small>zamówien pusta</small>
			</h1>
		</c:if>

		<c:if test="${not empty customerOrder}">


			<c:set var="boundMin" value="${25}" />
			<c:set var="boundMax" value="${40}" />



			<h1>Lista <small>zamówien</small> </h1>



			<div class="page-header">
				<h1>
					
					<h4>Zamówienia <small>użytkowników</small></h4>
				</h1>
			</div>
	
			<div class="panel panel-primary">
			
				<div class="panel-heading">Zamówienia</div>
				<div class="panel-body">
					<p></p>
				</div>

				<div class="table-responsive">
					<table class="table ">
						<thead>
							<tr>
								<th>StatusZamowienia</th>
								<th>Data</th>
								<th>IdZamowienia</th>
								<th>IdUzytkownika</th>
								<th>Opcje</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${customerOrder}" var="customer">
								<tr>


									<td>${ customer.status}</td>
									<td>${ customer.orderDate}</td>
									<td><a
										href="<spring:url value="/admin/users/infoAboutOrder/${customer.orderID}"/>"
										class="btn"> ${customer.orderID} </a></td>
									<td>${ customer.getUser().username}</td>
									<td><a
										href="<spring:url value="/admin/users/removecustomer/${customer.orderID}"/>"
										class="btn"> Usun </a> <a
										href="<spring:url value="/admin/users/orderRealize/${customer.orderID}"/>"
										class="btn"> Edytuj Zamowienie </a> <a> <a
											href="<spring:url value="/admin/users/actualAddress?id=${customer.getUser().user_id} "/>"
											class="btn"> Adres </a></td>
								</tr>

							</c:forEach>

						</tbody>
					</table>


				</div>


			</div>

		</c:if>


		
				<div style="float: left;">
											<a href="/controllers/admin/users/" class="btn btn-default">
												<i class="icon-pencil icon-white"></i> <span><strong>
														Kontrola</strong></span>
											</a>
										</div>

	</div>


	<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>

