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
	<c:choose>
				<c:when test="${ not empty edit}">
				<div class="alert alert-success" style="width:300px">
  <strong>Sukces!</strong> operacja zakończona
</div>

					
		
					
				</c:when>
				
			
				
				
				</c:choose>
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
								<legend>Dane Kategorii</legend>



							</fieldset>
						</div>
					</div>
				</div>
			</section>
			<table class="table table-hover">
				<tbody>

					<td>Nazwa <b>${category.name}</b>
			



				</tbody>
			</table>
		</div>


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
								<legend>Produkty</legend>



							</fieldset>
						</div>
					</div>
				</div>
			</section>

<c:if test="${ empty products}">
					
							<div class="alert alert-info" style="width:300px">
  <strong>Kategoria ta </strong> nie ma przypisanych produktów
</div>
					
					</c:if>



	<c:if test="${ not empty products}">


			<div class="panel panel-primary">
    <div class="panel-heading">Produkty</div>
    <div class="panel-body">
        <p></p>
    </div>



	
					

    <div class="table-responsive">
        <table class="table ">
            <thead>
                <tr>
                <th>Zdjecie</th>
                <th>Nazwa</th>
                <th>Firma</th>
                <th>Cena</th>
                <th>Kategoria</th>
                <th>Dostepnosc</th>
				<th>Opcje </th>
                </tr>
            </thead>
            <tbody>

			
		
					

				
			
		
            <c:forEach items="${products}" var="product">
                   <tr>
             <td>
            
               
         <img src="${product.id}/image" height="100px"/>
            </td>
               <td> <a
										href="<spring:url value="/productList/?id=${product.id} " />">
											${product.name}</a></td>
			           
					<td>  ${product.factory}</td>
					
			     
	
			      <td>       <fmt:formatNumber type="CURRENCY" value="${product.price}"  currencySymbol="ZŁ"/></td>
			      
			      <td>
			               ${product.type.name}
			      
			      </td>
			    
			    <td>
						<c:if test="${product.quantity>0}">
			               Dostepny 
			        </c:if>
						
					</td>	
					
					<td>
					
					<c:choose>
				<c:when test="${ empty logInSession || not empty logInSession}">
				<c:if test="${product.quantity>1}">
					<a href="order.html?id=${product.id}" class="btn"> Zamow </a>
					</c:if>
					<c:if test="${product.quantity==1}">
			         Brak!!
					</c:if>
					</c:when>
				</c:choose>	
					
					</td>
						
            </tr>
           </c:forEach> 
           
        </tbody>
    </table>
            
        
    </div>
  </c:if>
    
</div>






		


	</div>
	</div>


	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>