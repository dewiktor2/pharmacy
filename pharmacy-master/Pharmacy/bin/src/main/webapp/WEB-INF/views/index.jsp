<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>paypal</title>
<link href="<c:url value="/resources/myTh/css/moje.css" />"
	rel="stylesheet">
</head>

<body>

<form method="post" action="${initparam['posturl']}">

<input type="hidden" name="upload" value="1" />
<input type="hidden" name="return" value="${initParam['returnurl']}" />
<input type="hidden" name="cmd" value="_cart" />
<input type="hidden" name="business" value="${initParam['business']}" />


<input type="hidden" name="item_name_1" value="Product 1" />
<input type="hidden" name="item_number1" value="p1" />
<input type="hidden" name="amount_1" value="2" />
<input type="hidden" name="quantity_1" value="3" />

<input type="hidden" name="item_name_2" value="Product 2" />
<input type="hidden" name="item_number2" value="p2" />
<input type="hidden" name="amount_2" value="3" />
<input type="hidden" name="quantity_2" value="4" />

<input type="hidden" name="item_name_3" value="Product 2" />
<input type="hidden" name="item_number3" value="p3" />
<input type="hidden" name="amount_3" value="3" />
<input type="hidden" name="quantity_3" value="2" />

  <input type="image"             src="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif">
</form>
</body>

</html>