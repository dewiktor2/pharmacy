<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>  

	<table border="1">
		<form:form commandName="product">
		
			<tr>
				<th>Nazwa:</th>
				<td>
					<form:input path="name"/>
					<form:errors path="name" cssStyle="color:red"/>
				</td>
			</tr>
			<tr>
				<th>Cena:</th>
				<td>
					<form:input path="price"/>
					<form:errors path="price" cssStyle="color:red"/>
				</td>
			</tr>
			<tr>
				<th>firma:</th>
				<td>
					<form:input path="factory"/>
					<form:errors path="factory" cssStyle="color:red"/>
				</td>
			</tr>
			<tr>
				<th>Data Produkcji:</th>
				<td>
					<form:input path="productionDate"/>
					<form:errors path="productionDate" cssStyle="color:red"/>
				</td>
			</tr>
			
			<tr>
				<th>Typ Produktu:</th>
				<td>
					<form:select path="type.id" items="${productType}" itemLabel="name" itemValue="id"/>
				</td>
			</tr>
			<tr><td colspan="2"><input type="submit" value="Wyslij"></td></tr>
		</form:form>
	</table>	
	
<a href="productList.html">Wstecz</a>
</body>
</html>