<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<body>

<H1>Dane zapisanego pojazdu</H1>
	Id:
	<b>${product.id}</b>
	<br /> nazwa:
	<b>${product.name}</b>
	<br /> firma:
	<b>${product.factory}</b>


	<br /> Typ:
	<b>${product.type.name}</b>
	<br />

<a href="productList.html">Wstecz</a>
</body>
</html>