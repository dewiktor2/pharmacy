<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html>


<jsp:include page="header.jsp"></jsp:include>


<body> 


		
	  <div class="container">
	  
	  	<c:choose>
				<c:when test="${ not empty delete}">
				<div class="btn btn-danger" style="width:300px">
  <strong>Sukces!</strong> usunięto kategorie
</div>

		
					
				</c:when>
				
			
				
				
				</c:choose>
	  
	  
	  	<c:choose>
				<c:when test="${ not empty errorDelete}">
				<div class="btn btn-danger" style="width:300px">
  <strong>Błąd usuwania</strong> kategoria zawiera produkty 
</div>

				</c:when>
					</c:choose>
	  
	  
	  
	  
	  <h1>Lista <small>kategorii</small></h1>
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
	
	
	
	
	</fieldset>
	</div>
	</div>
	</div>
	</section>
	


<c:if test="${not empty categoryList}">
	
	<c:set var="boundMin" value="${25}"/>
	<c:set var="boundMax" value="${40}"/>
	

      	 <table class="table table-hover">
        <thead>
            <tr>
                <th>Nazwa</th>  
            </tr>
        </thead>
        <tbody>
		<c:forEach items="${categoryList}" var="category">
            <tr>
               <td> <a href="?id=${category.id}"  > ${category.name}</a> </td>
			         
			  
					
			       
	<td>
						
						<c:choose>
				<c:when test="${not empty logInSessionAdmin}">

					<div style="display:inline-block;">
						<div class="span1" style=" float: left;">
												<a href="?did=${category.id}" class="btn"> <i
													class="icon-trash icon-white"></i> <span><strong>Usun</strong></span>
												</a>
											</div>


						<div class="span1" style=" float: left;">
												<a href="categoryForm.html?id=${category.id}  "
													class="btn "> <i
													class="icon-edit icon-white"></i> <span><strong>Edytuj</strong></span>
												</a>
						</div>
					
					</div>
				</c:when>
				</c:choose>
				
				
			</td>	
			
						
						
            </tr>
           </c:forEach> 
           
        </tbody>
    </table>
      	
      	</div>
      	
      	
 
	
	
</c:if>
<c:choose>
				<c:when test="${not empty logInSessionAdmin}">


					
					<div class="span1">
    <a href="categoryForm.html" class="btn btn-default">
        <i class="icon-pencil icon-white"></i>
        <span><strong>Dodaj Kategorie</strong></span>            
    </a>
</div> 
				</c:when>
				</c:choose>

</div>
</div>


<jsp:include page="footer.jsp"></jsp:include>


</body>



