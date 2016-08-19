<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<jsp:include page="header.jsp"></jsp:include>
	  
<body> 



	  

<div class="container">

<div class="page-header">
    <h1>Lista <small>opinii</small></h1>
</div>


<div class="panel panel-primary">
    <div class="panel-heading">Opinie</div>
    <div class="panel-body">
        <p></p>
    </div>

    <div class="table-responsive">
        <table class="table ">
            <thead>
              		<tr>	  
		               
			       <th>Opinia</th>
			<th>Data</th>
			<!-- <th>Zamowione</th> -->
			<th>Id Usera</th>
			<th>  Opcje</th>
			
				</tr>
            </thead>
            <tbody>
          <c:forEach items="${opinions}" var="opinion">
			<tr>
			
   			<td> ${ opinion.opinion}</td>
   			<td> ${ opinion.date}</td>
<%--    			<td> ${ opinion.orderitem}</td> --%>
   			
   			<td>
   			<a href="#">Edytuj </a>
   			<a href="#">Usun </a>
   			<%--  <a href="<spring:url value="/admin/users/removeOpinion/${opinion.Id}"/>" class="btn">
                    Usun
                </a>
                 
               	<a href="<spring:url value="/admin/users/editOpinion/${opinion.Id}"/>" class="btn">
                    Edytuj
                </a>  --%>
               </td>
			</tr>
			
		</c:forEach>
		
           
        </tbody>
    </table>
            
        
    </div>
  
    
</div>




<a href="<spring:url value="/admin/users/"/>" class="btn">
                   Kontrola
                </a>

             

</div>
<jsp:include page="footer.jsp"></jsp:include>  
</body>
</html>


