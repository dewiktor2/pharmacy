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
<c:if test="${empty opinions}">

<h1>
					Kontrola <small>opinii</small>
        Brak opinii!!!
				</h1>

</c:if>
			<c:if test="${!empty opinions}">
				<h1>
					Kontrola <small>opinii</small>

				</h1>

				<div class="alert alert-info" style="width: 300px">
					<strong>  Panel kontrolny  <br/>
					Opcje : (usun,   detale prodktu) </strong>
					
				</div>
			</c:if>

			




		</div>


	


<c:if test="${not empty opinions}">

			<h4>
					Opinie <small>użytkowników</small>

				</h4>


		<div class="panel panel-primary">
			<div class="panel-heading">Opinie</div>
			<div class="panel-body">
				<p></p>
			</div>

		


		<div class="table-responsive">
					<table class="table ">
				    <thead>
						<tr>
							<th>Recenzja</th>
							<th>Login uzytkownika</th>
							<th>Data</th>
							<th>Opiniowany produkt</th>
							<th>Opcje </th>
						</tr>
					</thead>
				<tbody>
						<c:forEach items="${opinions}" var="opinion">
				         <tr>
							<td> <h4> <small> ${opinion.review}</small></h4>  </td>
							
							<td> <h4><small> ${opinion.user.username}</small></h4>  </td>
							
							<td> 
							<fmt:formatDate var="fmtDate" value="${opinion.createDate}"  pattern="dd-MM-yyyy hh:mm"/>
							<input  path="opinion.createDate" name="opinion.createDate" value="${fmtDate}" disabled="true"  style="margin-top:4px; width: 140px;"/>   	
				</td>
							
					
					
					<td><a
									href="<spring:url value="/productList/?id=${opinion.product.id} " />">
										<h5> ${opinion.product.name}</h5></a></td>
					
					<td>
						<a href="<spring:url value="/admin/users/removeOpinion/${opinion.id}"/>" class="btn">
                    Usun
               	 </a>
                 
              <%--  	<a href="<spring:url value="/admin/users/editOpinion/${opinion.id}"/>" class="btn">
                    Edytuj
                </a>   --%>
               </td>
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