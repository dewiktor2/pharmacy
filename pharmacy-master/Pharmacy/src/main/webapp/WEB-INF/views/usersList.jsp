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

		<c:choose>
			<c:when test="${ not empty logInSessionAdmin}">
				<div class="alert alert-success" style="width: 300px">
					<strong>Jesteś zalogowany</strong> jako admin
				</div>




			</c:when>


		</c:choose>

		<div id="new_div">
			<section id="main_section"> <header> <hgroup>
			</hgroup> </header>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<fieldset>
							<h1>
								Panel <small>kontrolny</small>
							</h1>



						</fieldset>
					</div>
				</div>
			</div>
			</section>



			<div style="float: left;">
				<a href="<spring:url value="/admin/users/controlOrders.html"/>"
					class="btn "> <i class="icon-pencil icon-white"></i> <span><strong>
							Kontrola Zamowien</strong></span>
				</a>
			</div>


			<div style="float: left;">
				<a href="<spring:url value="/admin/users/controlOpinions.html"/>"
					class="btn"> <i class="icon-pencil icon-white"></i> <span><strong>
							Kontrola Opinii</strong></span>
				</a>
			</div>

            <div style="float: left;">
				<a href="<spring:url value="/admin/users/statistics"/>"
					class="btn"> <i class="icon-pencil icon-white"></i> <span><strong>
							Statystyki</strong></span>
				</a>
			</div>




		</div>
		</br>

		<c:if test="${empty usersList}">

		</c:if>

		<c:if test="${not empty usersList}">


			<div class="page-header">
				<h1>
					Lista <small>użytkowników</small>
				</h1>
			</div>

			<div class="panel panel-primary">
				<div class="panel-heading">Użytkownicy</div>
				<div class="panel-body">
					<p></p>
				</div>

				<div class="table-responsive">
					<table class="table ">
						<thead>
							<tr>

								<th>Detale</th>
								<th>Nazwa</th>
								<th>Id</th>
								<th>Opcje</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach items="${usersList}" var="user">
								<tr>
									<td class="col-md-1"><a
										href="delete.html?id=${user.user_id}" class="btn">
											${user.username}</a></td>


									<td class="col-md-1">${user.username}</td>
									<td class="col-md-1">${user.user_id}</td>
									<td class="col-md-1">
										<div style="float: left;">
											<a
												href="<spring:url value="/admin/users/removeuser/${user.user_id}"/>"
												class="btn "> <i class="icon-pencil icon-white"></i> <span><strong>
														Usun</strong></span>
											</a>
										</div>
										<div style="float: left;">
											<a href="productForm.html?id=${product.id} " class="btn ">
												<i class="icon-pencil icon-white"></i> <span><strong>
														Edytuj</strong></span>
											</a>
										</div>

									</td>


							




								</tr>

							</c:forEach>


						</tbody>
					</table>


				</div>


			</div>


		</c:if>



	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>

